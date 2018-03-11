module Render exposing (draw)

import Array
import Ports exposing (clear, updateEntity)


draw entities =
    ((clear "clear")
        :: (entities
                |> Array.filter (\entity -> entity.active)
                |> Array.foldr
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
                                    Array.push ( entity, sprite ) sprites

                                Nothing ->
                                    sprites
                    )
                    Array.empty
                |> Array.toList
                |> List.map
                    (\( e, s ) ->
                        updateEntity ( e.spriteSheet, s.xSrc, s.ySrc, s.width, s.height, e.xPos, e.yPos )
                    )
           )
    )
