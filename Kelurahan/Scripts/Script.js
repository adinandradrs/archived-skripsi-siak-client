window.hr = (function () {
    var adjustedTabs = { 0: { docWidth: 0, docHeight: 0 }, 1: { docWidth: 0, docHeight: 0 }, 2: { docWidth: 0, docHeight: 0 }, 3: { docWidth: 0, docHeight: 0 }, 4: { docWidth: 0, docHeight: 0} };
    var detailsTabIndex = 3;
    var callbackPanelName = "TabBar_DetailsContainer_details_cpDetails";
    var LastVisibleActiveTabIndex = -1;
    var minDesktopLandscapeSize = 800;
    return {
        PostponedLoadingID: null,
        AdjustTabBar: function () {
            // TODO Modify this code to adjust the TabBar size
            TabBar.SetHeight(ASPxClientUtils.GetDocumentClientHeight());
        },
        Collapse: function () {
            // TODO Collapse the controls whose size prevents reducing the parent control size, if necessary 
            // Take a look at the TableViewPortrait_Collapse function as an example
            if (TabBar.GetActiveTabIndex() == 0 && !this.GetIsLandscapeOrientation())
                this.TableViewPortrait_Collapse();
        },
        Adjust: function () {
            var docWidth = ASPxClientUtils.GetDocumentClientWidth();
            var docHeight = ASPxClientUtils.GetDocumentClientHeight();

            // Nothing to do if the document size was not changed
            var adjustedTab = adjustedTabs[TabBar.GetActiveTabIndex()];
            if (adjustedTab.docWidth == docWidth && adjustedTab.docHeight == docHeight)
                return;

            // Some internal controls' sizes might prevent correct tab size calculation, so these controls should be collapsed
            this.Collapse();

            // The top parent element should be adjusted to the screen size first 
            this.AdjustTabBar();

            // Adjust controls inside the active tab page
            this.AdjustActiveTabPageContent();

            // Remember the current document size to skip further calculations using the same document size
            adjustedTab.docWidth = docWidth;
            adjustedTab.docHeight = docHeight;
        },
        GetIsLandscapeOrientation: function () {
            if (ASPxClientUtils.touchUI)
                return ASPxClientTouchUI.getIsLandscapeOrientation();
            else
                // Turn the application orientation to the portrait (even through on desktop), if the browser window is less than minDesktopLandscapeSize
                return ASPxClientUtils.GetDocumentClientWidth() > minDesktopLandscapeSize;
        },
        AdjustActiveTabPageContent: function () {
            var activeTabIndex = TabBar.GetActiveTabIndex();
            switch (activeTabIndex) {
                case 0: // Table View
                    if (this.GetIsLandscapeOrientation())
                        this.TableViewLandscape_Adjust();
                    else
                        this.TableViewPortrait_Adjust();
                    break;
                case 1: // Card View
                    this.CardView_Adjust();
                    break;
                case 2: // Gallery
                    this.Gallery_Adjust()
                    break;
                // TODO Call your page adjusting function here in the same manner as above  
            }
        },
        GetContentSize: function () {
            var element = TabBar.GetContentsCell();
            return { width: element.clientWidth, height: element.clientHeight };
        },

        CardView_Adjust: function () {
            // Return if the Card View is not visible or Card View content has not yet been received from the server (on a callback)
            if (TabBar.GetActiveTabIndex() != 1 || typeof (rp1) == "undefined") return;
            // Adjusting the right and left panels
            this.CardView_AdjustLPanel();
            this.CardView_AdjustRPanel();
        },
        CardView_AdjustLPanel: function () {
            // In the Card View, the left round panel is visible in the landscape orientation only
            var rp1Visible = this.GetIsLandscapeOrientation();
            if (rp1Visible)
                this.CardView_AdjustPanel(rp1, gvCardHomes, true);
        },
        CardView_AdjustRPanel: function () {
            var rp1Visible = this.GetIsLandscapeOrientation();
            this.CardView_AdjustPanel(rp2, cardGVHomesSpecial, rp1Visible);
        },
        CardView_AdjustPanel: function (panel, gridView, halfWidth) {
            var allCardViewVerticalPaddings = 71;
            var allCardViewHorizontalPaddings = 21;
            var singleRoundPanelHorizontalPaddings = 30;

            var contentSize = this.GetContentSize();
            // Adjust the gridViewHeight to the content height considering the paddings
            var gridViewHeight = contentSize.height - allCardViewVerticalPaddings;
            var gridViewWidth = contentSize.width;
            // If two panels are visible
            if (halfWidth) {
                // Halve the GridView width
                gridViewWidth = gridViewWidth / 2;
                // Consider the paddings
                gridViewWidth -= allCardViewHorizontalPaddings;
            } else
                gridViewWidth -= singleRoundPanelHorizontalPaddings;

            gridView.SetWidth(gridViewWidth);
            gridView.SetHeight(gridViewHeight);
        },

        TableViewLandscape_Adjust: function () {
            // If the gvTableSearchHomes client object exists
            if (window["gvTableSearchHomes"]) {
                var height = this.GetContentSize().height;
                // Adjust the gvTableSearchHomes to the content height
                gvTableSearchHomes.SetHeight(height);
                gvTableSearchHomes.AdjustControl();

                // Adjust the Details to the content height
                document.getElementById("DetailsWrapper").style.height = height + "px";
                // If a touch interface is supported
                if (ASPxClientUtils.touchUI)
                    // Enable adaptive scrolling
                    ASPxClientTouchUI.MakeScrollable("DetailsWrapper");
            }
        },

        Gallery_Adjust: function () {
            var height = this.GetContentSize().height;
            // Adjust the Gallery to the content height
            document.getElementById("galleryScroll").style.height = height + "px";
            // If a touch interface is supported
            if (ASPxClientUtils.touchUI)
                // Enable adaptive scrolling
                ASPxClientTouchUI.MakeScrollable("galleryScroll");
        },

        TableViewPortrait_Collapse: function () {
            // If the gvTableHomes client object already exists
            if (window["gvTableHomes"])
            // Hide the gvTableHomes control so that the parent control will be able to reduce its size, if necessary
                gvTableHomes.SetVisible(false);
        },
        TableViewPortrait_Adjust: function () {
            // If the gvTableHomes client object already exists
            if (window["gvTableHomes"]) {
                var allTableViewVerticalPaddings = 79;
                var allTableViewHorizontalPaddings = 30;
                var contentSize = this.GetContentSize();
                gvTableHomes.SetVisible(true);
                // Adjust the gvTableHomes to the content size considering the paddings
                gvTableHomes.SetWidth(contentSize.width - allTableViewHorizontalPaddings);
                gvTableHomes.SetHeight(contentSize.height - allTableViewVerticalPaddings);
            }
        },

        Back: function () {
            TabBar.SetActiveTabIndex(LastVisibleActiveTabIndex);
        },

        ShowDetailsPage: function (ID) {
            // If the Details tab is not active  
            if (TabBar.GetActiveTabIndex() != detailsTabIndex) {
                LastVisibleActiveTabIndex = TabBar.GetActiveTabIndex();
                this.PostponedLoadingID = ID;
                // Activate the Details tab
                TabBar.SetActiveTabIndex(detailsTabIndex);
                // Recursively call the ShowDetailsPage function after a timeout to perform a callback
                if (window[callbackPanelName])
                    window.setTimeout(function () { hr.ShowDetailsPage(hr.PostponedLoadingID); }, 0);
            } else {
                this.PostponedLoadingID = null;
                // Perform a callback to retrieve the details page content
                window[callbackPanelName].PerformCallback(ID);
            }
        },

        OnTabBarInit: function () {
            // Attach event handlers
            ASPxClientUtils.AttachEventToElement(window, "orientationchange", function () {
                ASPxClientTouchUI.ensureOrientationChanged(function () { hr.Adjust(); });
            }, false);
            if (!ASPxClientUtils.touchUI)
                ASPxClientUtils.AttachEventToElement(window, "resize", function () { hr.Adjust(); }, false);
            // Set the default active tab after initialization
            window.setTimeout(function () { TabBar.SetActiveTabIndex(0); }, 0);
        },
        OnActiveTabChanged: function () {
            hr.Adjust();
        },
        OnTabBarEndCallback: function () {
            // Get the Show Details page content after the details tab activation
            if (TabBar.GetActiveTabIndex() == detailsTabIndex && this.PostponedLoadingID != null && window[callbackPanelName])
                window.setTimeout(function () { hr.ShowDetailsPage(hr.PostponedLoadingID); }, 0);
        }
    };
})();

function OnTabBarInit() {
    hr.OnTabBarInit();
}
function OnActiveTabChanged() {
    hr.OnActiveTabChanged();
}
function OnTabBarEndCallback() {
    hr.OnTabBarEndCallback();
}
function ShowGVDetailsPage(gridView, visibleIndex) {
    var ID = gridView.GetRowKey(visibleIndex);
    hr.ShowDetailsPage(ID);
}
function ShowDetailsPage(ID) {
    hr.ShowDetailsPage(ID);
}
function OnGvTableSearchHomesSelectedChanged(s, e) {
    if (e.isSelected) {
        var id = gvTableSearchHomes.GetRowKey(e.visibleIndex);
        TabBar_TableViewLandscape_details_cpDetails.PerformCallback(id);
    }
}
function Buy() {
    alert("The purchasing functionality is not implemented in this demo application.");
}