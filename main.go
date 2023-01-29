package main

import (
	"net/http"

	"github.com/labstack/echo/v4"
)

func main() {
	e := echo.New()
	e.GET("/", func(c echo.Context) error {
		return c.JSON(http.StatusOK, `message:"OK"`)
	})

	e.GET("", func(c echo.Context) error { return c.String(http.StatusOK, "OK") })

	e.Logger.Fatal(e.Start(":1323"))
}
