package com.example.tests;

import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;
import org.junit.*;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.Select;

public class 1 {
  private WebDriver driver;
  private String baseUrl;
  private boolean acceptNextAlert = true;
  private StringBuffer verificationErrors = new StringBuffer();

  @Before
  public void setUp() throws Exception {
    driver = new FirefoxDriver();
    baseUrl = "http://localhost:8080/";
    driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
  }

  @Test
  public void test1() throws Exception {
    driver.get(baseUrl + "/#/");
    driver.findElement(By.cssSelector("span > span.hidden-sm")).click();
    driver.findElement(By.xpath("//a[@id='login']/span[2]")).click();
    driver.findElement(By.id("username")).clear();
    driver.findElement(By.id("username")).sendKeys("admin");
    driver.findElement(By.id("password")).clear();
    driver.findElement(By.id("password")).sendKeys("admin");
    driver.findElement(By.cssSelector("button.btn.btn-primary")).click();
    driver.findElement(By.cssSelector("#account-menu > span > span.hidden-sm")).click();
    driver.findElement(By.xpath("//li[3]/ul/li/a/span[2]")).click();
    driver.findElement(By.id("account-menu")).click();
    driver.findElement(By.xpath("//li[2]/a/span[2]")).click();
    driver.findElement(By.cssSelector("#admin-menu > span > span.hidden-sm")).click();
    driver.findElement(By.xpath("//li[4]/ul/li/a/span[2]")).click();
    driver.findElement(By.cssSelector("#admin-menu > span > span.hidden-sm")).click();
    driver.findElement(By.linkText("Metrics")).click();
    driver.findElement(By.cssSelector("#admin-menu > span > span.hidden-sm")).click();
    driver.findElement(By.xpath("//li[4]/ul/li[3]/a/span[2]")).click();
    driver.findElement(By.cssSelector("#admin-menu > span > span.hidden-sm")).click();
    driver.findElement(By.xpath("//li[4]/ul/li[4]/a/span[2]")).click();
    driver.findElement(By.cssSelector("#admin-menu > span > span.hidden-sm")).click();
    driver.findElement(By.xpath("//li[5]/a/span[2]")).click();
    driver.findElement(By.cssSelector("#admin-menu > span > span.hidden-sm")).click();
    driver.findElement(By.xpath("//li[7]/a/span[2]")).click();
    driver.findElement(By.id("endpointListTogger_account-resource")).click();
    driver.findElement(By.linkText("get")).click();
  }

  @After
  public void tearDown() throws Exception {
    driver.quit();
    String verificationErrorString = verificationErrors.toString();
    if (!"".equals(verificationErrorString)) {
      fail(verificationErrorString);
    }
  }

  private boolean isElementPresent(By by) {
    try {
      driver.findElement(by);
      return true;
    } catch (NoSuchElementException e) {
      return false;
    }
  }

  private boolean isAlertPresent() {
    try {
      driver.switchTo().alert();
      return true;
    } catch (NoAlertPresentException e) {
      return false;
    }
  }

  private String closeAlertAndGetItsText() {
    try {
      Alert alert = driver.switchTo().alert();
      String alertText = alert.getText();
      if (acceptNextAlert) {
        alert.accept();
      } else {
        alert.dismiss();
      }
      return alertText;
    } finally {
      acceptNextAlert = true;
    }
  }
}
