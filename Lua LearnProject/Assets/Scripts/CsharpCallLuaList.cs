using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using XLua;

public static class CsharpCallLuaList
{
    [CSharpCallLua]
    public static List<Type> csharpCallLuaList = new List<Type>(){
        typeof(UnityAction<bool>) //需要加 using UnityEngine.Events
    };
}
