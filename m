Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C1F2F04D0
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 03:28:21 +0100 (CET)
Received: from localhost ([::1]:52002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyQSp-0006QY-RK
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 21:28:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kyQRl-0005wn-Te
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 21:27:13 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:34226 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kyQRj-0003x3-8G
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 21:27:13 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id B537741281;
 Sun, 10 Jan 2021 02:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1610245622;
 x=1612060023; bh=uK0s8U/YAAKND7kmY1lF63jPwrQjZp9PuAJ9SWfrHKY=; b=
 nclqExS+As489rDsrCwjYzm6jTq8z5PnfIDApDGRmwIpUnF1j3F+3ruuTBmEMozN
 wZMCotvoU3+XAKPZ930VqVybTtC9vmPeodAl9bEbNcB2mc4b1nUtw37dgPjsTLmP
 NV0r+jVVlNM6RxQlJJgJ6ABi+mDjIlOjSgzfCQ4VRTs=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MtQIUz_SX9gz; Sun, 10 Jan 2021 05:27:02 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id EDFA34127F;
 Sun, 10 Jan 2021 05:27:01 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Sun, 10
 Jan 2021 05:27:01 +0300
Date: Sun, 10 Jan 2021 05:27:25 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [PATCH v2] ui/cocoa: Fix openFile: deprecation on Big Sur
Message-ID: <X/pmDaGDOVu/pNA7@SPB-NB-133.local>
References: <20210102150718.47618-1-r.bolshakov@yadro.com>
 <CAFEAcA8GMYcTrfKJ-6E3rKyytDHSL4UeWPVuFVLtzWjDtCxMVw@mail.gmail.com>
 <CAFEAcA97hh-bC7yjpHLGyvOiBGMxRtOQaf0O-y5WG0xYYA8N7A@mail.gmail.com>
 <X/jJ7dTlBW8Pg65q@SPB-NB-133.local>
 <e585d6ab-2dc8-4d1d-fbf7-96ecfdaa79@eik.bme.hu>
 <X/pG4MVxih424H+a@SPB-NB-133.local>
 <93b453a8-a2af-48a-68fa-4f2d87beb7fe@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <93b453a8-a2af-48a-68fa-4f2d87beb7fe@eik.bme.hu>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jan 10, 2021 at 02:13:48AM +0100, BALATON Zoltan wrote:
> On Sun, 10 Jan 2021, Roman Bolshakov wrote:
> > On Sat, Jan 09, 2021 at 12:13:36AM +0100, BALATON Zoltan wrote:
> > > On Sat, 9 Jan 2021, Roman Bolshakov wrote:
> > > > On Fri, Jan 08, 2021 at 03:00:07PM +0000, Peter Maydell wrote:
> > > > > On Fri, 8 Jan 2021 at 13:50, Peter Maydell <peter.maydell@linaro.org> wrote:
> > > > > > 
> > > > > > On Sat, 2 Jan 2021 at 15:14, Roman Bolshakov <r.bolshakov@yadro.com> wrote:
> > > > > > > 
> > > > > > > ui/cocoa.m:1188:44: warning: 'openFile:' is deprecated: first deprecated in macOS 11.0 - Use -[NSWorkspace openURL:] instead.
> > > > > > >       [-Wdeprecated-declarations]
> > > > > > >         if ([[NSWorkspace sharedWorkspace] openFile: full_file_path] == YES) {
> > > > > > >                                            ^
> > > > > > > /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/AppKit.framework/Headers/NSWorkspace.h:350:1: note:
> > > > > > >       'openFile:' has been explicitly marked deprecated here
> > > > > > > - (BOOL)openFile:(NSString *)fullPath API_DEPRECATED("Use -[NSWorkspace openURL:] instead.", macos(10.0, 11.0));
> > > > > > > ^
> > > > > > > 
> > > > > > > Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> > > > > > > ---
> > > > > > 
> > > > > > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > > > > 
> > > > > 
> > > > > So I was just trying to test this patch, and I found that at least
> > > > > for me the osx menu bar has stopped working in QEMU -- keyboard
> > > > > shortcuts to it still work but none of the menu buttons respond
> > > > > to the mouse. Does that happen for anybody else?
> > > > > 
> > > > 
> > > > There's an old bug when QEMU menu bar is not responsive because it's not
> > > > properly activated. If you click off qemu and click on the qemu dock
> > > > icon then it "gets fixed" (cmd-tab works too). Do you hit the issue as
> > > > described in the article [1]? The code in the article does exactly the
> > > > same what I'm doing manually. I wanted to fix it but somehow it got
> > > > postponed for like a whole year :) I might try to make a fix this but
> > > > note, the issue is not related to the patch.
> > > 
> > > This does not sound like the best solution to the problem. There's some info
> > > on this here (and blog post linked from it):
> > > 
> > > https://stackoverflow.com/questions/7460092/nswindow-makekeyandorderfront-makes-window-appear-but-not-key-or-front
> > > 
> > > Maybe we call makeKeyAndOrderFront: too early before the app is active and
> > > that's causing the problem? Would it work better if that's moved after
> > > [NSApp run]? (Maybe we also need canBecomeKey: somewhere but I don't see why
> > > would that be needed for normal windows.)
> > > 
> > 
> > Hi Zoltan,
> > 
> > Thanks for the suggestions. I have tried to move it around but that
> > doesn't help. Note that minimal cococa app calls makeKeyAndOrderFront:
> > before [NSApp run] and doesn't experience the issue:
> > https://github.com/rgl/minimal-cocoa-app/blob/master/main.m
> 
> However this minimal app does call [NSApp activateIgnoringOtherApps:YES]
> before makeKeyAndOrderFront: and we don't seem to do that.

It's not really important. The minimal app is bundled and if you run it
outside of a bundle you'll get the very same issue we see with QEMU.

You can try it out if you apply the patch to the app (to avoid
references to the data in bundle's plist):
diff --git a/main.m b/main.m
index d5027a7..603c629 100644
--- a/main.m
+++ b/main.m
@@ -20,7 +20,7 @@ int main(void) {
     id appName = [bundleInfo objectForKey:@"CFBundleName"];
     id appVersion = [bundleInfo objectForKey:@"CFBundleVersion"];

-    id quitMenuItemTitle = [@"Quit " stringByAppendingString:appName];
+    id quitMenuItemTitle = @"Quit";
     id quitMenuItem = [[NSMenuItem alloc] autorelease];
     [quitMenuItem
         initWithTitle:quitMenuItemTitle
@@ -46,7 +46,7 @@ int main(void) {
         styleMask:NSTitledWindowMask
         backing:NSBackingStoreBuffered
         defer:NO];
-    [window setTitle:[[appName stringByAppendingString:@" v"] stringByAppendingString:appVersion]];
+    //[window setTitle:[[appName stringByAppendingString:@" v"] stringByAppendingString:appVersion]];
     [window center];
     [window makeKeyAndOrderFront:nil];

Compile and start it like:

  cc -framework Cocoa main.m
  ./a.out


Then move to the app bundle and it works! So it's a bug in Catalina at
least. We're not the only one who're hitting it:
  https://bugreports.qt.io/browse/QTBUG-89436

  Workaround is to build app as app bundle. Or manually deactivate and
  re-activate the app, like the JavaFX workaround does.

> We call
> activateIgnoringOtherApps: in cocoa_display_init() but only if fullscreen is
> set so maybe this should be done differently calling
> activateIgnoringOtherApps: in main unconditionally before calling
> qemu_main() (which creates cocoa_display that needs activated app to call
> toggleFullScreen:) but this has to be after autorelease pool and
> sharedApplication are created. In other words: does moving
> qemu_thread_create(&thread, "qemu_main"...; qemu_sem_wait(&display_init_sem)
> between [QemuApplication sharedApplication] and create_initial_menus() help?
> Or after create_initial_menus? That matches better what the minimal app does
> unless there are some other dependencies with other QEMU parts.
> 

I did try to add activateIgnoringOtherApps: before [NSApp run] and
inside applicationDidFinishLaunching. Neither helps.

> > The minimal program that experiences the issue of frozen menubar is:
> > /* cc -framework Cocoa menufreeze.m */
> > #import <Cocoa/Cocoa.h>
> > 
> > int main(void) {
> >    [NSApplication sharedApplication];
> >    [NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];
> > 
> >    dispatch_async(dispatch_get_main_queue(), ^{
> >        [NSApp activateIgnoringOtherApps:YES];
> >    });
> > 
> >    [NSApp run];
> > 
> >    return 0;
> > }
> 
> This program does not seem to have a menu bar defined so that may be a
> problem. In QEMU we do create a menu bar though.
> 

It still shows program name (which is part of the menu bar) but it's not
clickable. And even Apple logo/System menu is not responsible. But if
you try to run menufreeze.m on Big Sur menu bar doesn't freeze.  So,
it's quite a valid test case.

> > However if the program belongs to an app bundle it doesn't have the
> > issue. (Simply move a.out into
> > minimal-cocoa-app.app/Contents/MacOS/minimal-cocoa-app and use "open
> > minimal-cocoa-app.app" in shell)
> 
> That's interesting, I don't know what an app bundle has to do with this.
> 
> > Now if we apply the workaround mentioned in the article [1] that
> > switches focus to Dock and then back to the app we can resolve the issue
> > in QEMU:
> > 
> > diff --git a/ui/cocoa.m b/ui/cocoa.m
> > index f32adc3074..0986891ca0 100644
> > --- a/ui/cocoa.m
> > +++ b/ui/cocoa.m
> > @@ -1114,6 +1114,15 @@ QemuCocoaView *cocoaView;
> >     allow_events = true;
> >     /* Tell cocoa_display_init to proceed */
> >     qemu_sem_post(&app_started_sem);
> > +
> > +    /* Workaround unresponsive menu bar in macOS prior to Big Sur */
> > +    NSArray *docks = [NSRunningApplication runningApplicationsWithBundleIdentifier: @"com.apple.dock"];
> > +    if ([docks.firstObject activateWithOptions: NSApplicationActivateAllWindows]) {
> > +        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 200 * NSEC_PER_MSEC),
> > +                       dispatch_get_main_queue(), ^{
> > +            [NSApp activateIgnoringOtherApps:YES];
> > +        });
> > +    }
> > }
> > 
> > - (void)applicationWillTerminate:(NSNotification *)aNotification
> > 
> > Peter, does it help you? And what version of macOS do you use?
> > 
> > BTW, similar workaround was applied to javafx:
> > https://github.com/openjdk/jfx/pull/361
> 
> Waiting for a fixed amount of time seems fragile, I still think finding the
> right order of events to make it work would be better but if that's not
> possible I'm OK with whatever workaround others think acceptable.
> 

I'm happy to hear of other approaches but the workaround fixes the issue
on Catalina without changing user experience. An alternative workaround
is to pack QEMU into App bundle (it is less convenient IMO).

Thanks,
Roman

