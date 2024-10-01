
newtype Config = C (Maybe String) deriving Show

instance Semigroup Config where
    (<>) :: Config -> Config -> Config
    C (Just a) <> _ = C (Just a)
    C Nothing <> C (Just a) = C (Just a)
    C Nothing <> C Nothing = C Nothing

instance Monoid Config where
    mempty :: Config
    mempty = C Nothing

defaultValue :: Config
defaultValue = C (Just "Default") 

configFile :: Config
configFile = C (Just "From File")

cmdParam :: Config
cmdParam = C (Just "CMD Param")

config :: Config
config = cmdParam <> configFile <> defaultValue
