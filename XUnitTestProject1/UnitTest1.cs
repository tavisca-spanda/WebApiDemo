using System;
using Xunit;
using WebApiDemo.Controllers;

namespace WebApiDemoTest
{
    public class UnitTest1
    {
        [Fact]
        public void Test1()
        {
            var valueController = new ValuesController();
            Assert.Equal("hello", valueController.Get("hi").Value);
        }
    }
}
