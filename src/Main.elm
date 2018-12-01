-- TopAppBar - Model 1


module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (Attribute, Html, a, b, div, header, i, main_, p, section, span, text)
import Html.Attributes exposing (..)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { baseClass : String
    , bgColor : String
    , color : String
    , title : String
    }


init : Model
init =
    { baseClass = "top-app-bar"
    , bgColor = "bg-darkblue"
    , color = "white"
    , title = "Materialistic Elm / TopAppBar / Standard"
    }



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model



-- VIEW


headerClassList : Model -> Attribute msg
headerClassList model =
    classList
        [ ( model.baseClass, True )
        , ( model.bgColor, True )
        , ( model.color, True )
        ]


sectionStartAttr : Attribute msg
sectionStartAttr =
    class "flx-jus-con-str flx-ord-nil"


sectionStartEle : String -> List (Html msg)
sectionStartEle titleText =
    [ a
        [ href "#/nav"
        , class "icon material-icons"
        , makeAttr "alt" "Navigation menu"
        , makeAttr "aria-label" "Navigation menu"
        , title "Navigation"
        ]
        [ text "menu" ]
    , span
        [ class "title" ]
        [ text titleText ]
    ]


sectionEndAttr : Attribute msg
sectionEndAttr =
    class "flx-jus-con-end flx-ord-one"


sectionEndEle : List (Html msg)
sectionEndEle =
    -- TODO map over a collection
    [ a
        [ href "#download"
        , class "icon material-icons"
        , makeAttr "alt" "Download"
        , makeAttr "aria-label" "Download"
        , title "Download"
        ]
        [ text "file_download" ]
    , a
        [ href "#print"
        , class "icon material-icons"
        , makeAttr "alt" "Print this page"
        , makeAttr "aria-label" "Print this page"
        , title "Print this page"
        ]
        [ text "print" ]
    , a
        [ href "#bookmark"
        , class "icon material-icons"
        , makeAttr "alt" "Bookmark this page"
        , makeAttr "aria-label" "Boomark this page"
        , title "Bookmark this page"
        ]
        [ text "bookmark" ]
    ]


view : Model -> Html Msg
view model =
    div
        []
        [ header
            [ headerClassList model ]
            [ div
                [ class "row" ]
                [ section
                    [ sectionStartAttr ]
                    (sectionStartEle model.title)
                , section
                    [ sectionEndAttr ]
                    sectionEndEle
                ]
            ]
        , main_
            []
            [ p
                [ class "darkblue" ]
                -- inline style by syring manipulation. A better way?
                [ text "This is the standard "
                , b [] [ text "Top App Bar" ]
                , text " model of "
                , i [] [ text "materialistic-elm" ]
                ]
            , p
                []
                [ text "Lorem ipsum dolor sit amet, consectetur adipiscing elit, \n                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut \n                enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut \n                aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in \n                voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \n                occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit \n                anim id est laborum." ]
            ]
        ]


makeAttr : String -> String -> Attribute msg
makeAttr name value =
    Html.Attributes.attribute name value
