using System;
using System.Collections.Generic;
using System.Web;

public static class Utils {
    static string[] PropertyType = { "Single Family Home", "Condo/Townhouse", "Multi-Family Home" };
    const string priceFormat = "{0:C0}";
    public static string GetPrice(object str) {
        return string.Format(priceFormat, decimal.Parse((string)str));
    }
    public static string GetPriceForSqf(object strSize, object strPrice){
        return string.Format(priceFormat, decimal.Parse((string)strPrice) / decimal.Parse((string)strSize));
    }
    public static byte[] ConvertToByteArray(object str) {
        return Convert.FromBase64String(str.ToString());
    }
    public static string ExtractFirstRow(object strAdress){
        string adress = (string)strAdress;
        int separatorIndex = adress.IndexOf(",");
        return separatorIndex > -1 ? adress.Substring(0, separatorIndex) : adress;
    }
    public static string ExtractSecondRow(object strAdress){
        string adress = (string)strAdress;
        int separatorIndex = adress.IndexOf(",");
        return separatorIndex > -1 ? adress.Substring(separatorIndex + 1) : string.Empty;
    }
    public static string GetPropertyType(object index){
        return PropertyType[int.Parse((string)index)];
    }
    public static string GetImageSrc(object id){
        return string.Format("images/Homes/{0}.jpg", id);
    }
}