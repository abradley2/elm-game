module Entities.Util exposing (getEntitiesByType)

import Array
import Types exposing (EntityType, Entities)


{- TODO
   Only one entity type right now. When more are added will need to add a "default"
   catch to this. Can't have it now because it errors out as redundant by the compiler
-}


getEntitiesByType entityType entities =
    Array.filter
        (\entity ->
            case entity.entityType of
                entityType ->
                    True
        )
        entities
