-- TopAppBar - Model 1


module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (Attribute, Html, a, b, div, header, i, main_, p, section, span, text)
import Html.Attributes exposing (..)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Action =
    { name : String
    , href : String
    , glyph : String
    }


type alias Actions =
    List Action


type TextDecoration
    = Bold String
    | BoldItalic String
    | Italic String


type alias Model =
    { baseClass : String
    , bgColor : String
    , color : String
    , title : String
    , actions : Actions
    }


init : Model
init =
    { baseClass = "top-app-bar"
    , bgColor = "bg-darkblue"
    , color = "white"
    , title = "Materialistic Elm / TopAppBar / Standard"
    , actions =
        [ { name = "Download", href = "download", glyph = "file_download" }
        , { name = "Print this page", href = "print", glyph = "print" }
        , { name = "Bookmark this page", href = "bookmark", glyph = "bookmark" }
        ]
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


sectionEndEle : Actions -> List (Html msg)
sectionEndEle actions =
    List.map makeAnchor actions


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
                    (sectionEndEle model.actions)
                ]
            ]
        , main_
            []
            [ p
                [ class "darkblue" ]
                [ text "This is the standard "
                , decorate (Bold "Top App Bar")
                , text " model of "
                , decorate (Italic "materialistic-elm")
                ]
            , p
                []
                [ text "Notice: Lorem ipsum dolor sit amet, consectetur adipiscing elit, \n                sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut \n                enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut \n                aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in \n                voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \n                occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit \n                anim id est laborum." ]
            ]
        ]



-- HELPERS


decorate : TextDecoration -> Html msg
decorate style =
    case style of
        Bold string ->
            b [] [ text string ]

        BoldItalic string ->
            b [] [ i [] [ text string ] ]

        Italic string ->
            i [] [ text string ]


makeAnchor : Action -> Html msg
makeAnchor action =
    a
        [ href ("#" ++ action.href)
        , class "icon material-icons"
        , makeAttr "alt" action.name
        , makeAttr "aria-label" action.name
        , title action.name
        ]
        [ text action.glyph ]


makeAttr : String -> String -> Attribute msg
makeAttr name value =
    Html.Attributes.attribute name value
