# ColllectionView
##看下配置文件
***夜间模式的集成***
You can call nightFalling or dawnComing to switch current theme version to `DKThemeVersionNight` or `DKThemeVersionNormal`.
```
[self.dk_manager dawnComing];
[self.dk_manager nightFalling];
Modify themeVersion property to directly switch theme version.

self.dk_manager.themeVersion = DKThemeVersionNormal;
self.dk_manager.themeVersion = DKThemeVersionNight;
// if there is a RED column in DKColorTable.txt (default) or in 
// other `file` if you customize `file` property for `DKColorTable`
self.dk_manager.themeVersion = @"RED"; 
```
`Post Notification`

Every time the current theme version changes, `DKNightVersionManager` will post a `DKNightVersionThemeChangingNotification`. If you wanna to do some customization, you can observe this notification and react with proper actions.
  
