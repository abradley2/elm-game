module Render exposing (draw)

import Array
import Ports exposing (clear, updateEntity)


draw entities =
    ((clear "clear")
        :: (entities
                |> List.filter (\entity -> entity.active)
                |> List.foldr
                    (\entity sprites ->
                        let
                            indexedSprite =
                                if (not entity.active) then
                                    Nothing
                                else
                                    Array.get entity.activeSprite entity.sprites
                        in
                            case indexedSprite of
                                Just sprite ->
                                    ( entity, sprite ) :: sprites

                                Nothing ->
                                    sprites
                    )
                    []
                |> List.map
                    (\( e, s ) ->
                        updateEntity ( e.spriteSheet, s.xSrc, s.ySrc, s.width, s.height, e.xPos, e.yPos )
                    )
           )
    )
