Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BAA2F04AC
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 02:15:57 +0100 (CET)
Received: from localhost ([::1]:33800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyPKl-0008Nd-Tb
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 20:15:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kyPIq-0007ZP-BZ
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 20:13:56 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:14549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kyPIm-00048s-JR
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 20:13:55 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id CF70D74645F;
 Sun, 10 Jan 2021 02:13:48 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 922DF7470E6; Sun, 10 Jan 2021 02:13:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 9059F74645B;
 Sun, 10 Jan 2021 02:13:48 +0100 (CET)
Date: Sun, 10 Jan 2021 02:13:48 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Roman Bolshakov <r.bolshakov@yadro.com>
Subject: Re: [PATCH v2] ui/cocoa: Fix openFile: deprecation on Big Sur
In-Reply-To: <X/pG4MVxih424H+a@SPB-NB-133.local>
Message-ID: <93b453a8-a2af-48a-68fa-4f2d87beb7fe@eik.bme.hu>
References: <20210102150718.47618-1-r.bolshakov@yadro.com>
 <CAFEAcA8GMYcTrfKJ-6E3rKyytDHSL4UeWPVuFVLtzWjDtCxMVw@mail.gmail.com>
 <CAFEAcA97hh-bC7yjpHLGyvOiBGMxRtOQaf0O-y5WG0xYYA8N7A@mail.gmail.com>
 <X/jJ7dTlBW8Pg65q@SPB-NB-133.local>
 <e585d6ab-2dc8-4d1d-fbf7-96ecfdaa79@eik.bme.hu>
 <X/pG4MVxih424H+a@SPB-NB-133.local>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sun, 10 Jan 2021, Roman Bolshakov wrote:
> On Sat, Jan 09, 2021 at 12:13:36AM +0100, BALATON Zoltan wrote:
>> On Sat, 9 Jan 2021, Roman Bolshakov wrote:
>>> On Fri, Jan 08, 2021 at 03:00:07PM +0000, Peter Maydell wrote:
>>>> On Fri, 8 Jan 2021 at 13:50, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>>>
>>>>> On Sat, 2 Jan 2021 at 15:14, Roman Bolshakov <r.bolshakov@yadro.com> wrote:
>>>>>>
>>>>>> ui/cocoa.m:1188:44: warning: 'openFile:' is deprecated: first deprecated in macOS 11.0 - Use -[NSWorkspace openURL:] instead.
>>>>>>       [-Wdeprecated-declarations]
>>>>>>         if ([[NSWorkspace sharedWorkspace] openFile: full_file_path] == YES) {
>>>>>>                                            ^
>>>>>> /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/AppKit.framework/Headers/NSWorkspace.h:350:1: note:
>>>>>>       'openFile:' has been explicitly marked deprecated here
>>>>>> - (BOOL)openFile:(NSString *)fullPath API_DEPRECATED("Use -[NSWorkspace openURL:] instead.", macos(10.0, 11.0));
>>>>>> ^
>>>>>>
>>>>>> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
>>>>>> ---
>>>>>
>>>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>>>
>>>>
>>>> So I was just trying to test this patch, and I found that at least
>>>> for me the osx menu bar has stopped working in QEMU -- keyboard
>>>> shortcuts to it still work but none of the menu buttons respond
>>>> to the mouse. Does that happen for anybody else?
>>>>
>>>
>>> There's an old bug when QEMU menu bar is not responsive because it's not
>>> properly activated. If you click off qemu and click on the qemu dock
>>> icon then it "gets fixed" (cmd-tab works too). Do you hit the issue as
>>> described in the article [1]? The code in the article does exactly the
>>> same what I'm doing manually. I wanted to fix it but somehow it got
>>> postponed for like a whole year :) I might try to make a fix this but
>>> note, the issue is not related to the patch.
>>
>> This does not sound like the best solution to the problem. There's some info
>> on this here (and blog post linked from it):
>>
>> https://stackoverflow.com/questions/7460092/nswindow-makekeyandorderfront-makes-window-appear-but-not-key-or-front
>>
>> Maybe we call makeKeyAndOrderFront: too early before the app is active and
>> that's causing the problem? Would it work better if that's moved after
>> [NSApp run]? (Maybe we also need canBecomeKey: somewhere but I don't see why
>> would that be needed for normal windows.)
>>
>
> Hi Zoltan,
>
> Thanks for the suggestions. I have tried to move it around but that
> doesn't help. Note that minimal cococa app calls makeKeyAndOrderFront:
> before [NSApp run] and doesn't experience the issue:
> https://github.com/rgl/minimal-cocoa-app/blob/master/main.m

However this minimal app does call [NSApp activateIgnoringOtherApps:YES] 
before makeKeyAndOrderFront: and we don't seem to do that. We call 
activateIgnoringOtherApps: in cocoa_display_init() but only if fullscreen 
is set so maybe this should be done differently calling 
activateIgnoringOtherApps: in main unconditionally before calling 
qemu_main() (which creates cocoa_display that needs activated app to call 
toggleFullScreen:) but this has to be after autorelease pool and 
sharedApplication are created. In other words: does moving 
qemu_thread_create(&thread, "qemu_main"...; 
qemu_sem_wait(&display_init_sem) between [QemuApplication 
sharedApplication] and create_initial_menus() help? Or after 
create_initial_menus? That matches better what the minimal app does unless 
there are some other dependencies with other QEMU parts.

> The minimal program that experiences the issue of frozen menubar is:
> /* cc -framework Cocoa menufreeze.m */
> #import <Cocoa/Cocoa.h>
>
> int main(void) {
>    [NSApplication sharedApplication];
>    [NSApp setActivationPolicy:NSApplicationActivationPolicyRegular];
>
>    dispatch_async(dispatch_get_main_queue(), ^{
>        [NSApp activateIgnoringOtherApps:YES];
>    });
>
>    [NSApp run];
>
>    return 0;
> }

This program does not seem to have a menu bar defined so that may be a 
problem. In QEMU we do create a menu bar though.

> However if the program belongs to an app bundle it doesn't have the
> issue. (Simply move a.out into
> minimal-cocoa-app.app/Contents/MacOS/minimal-cocoa-app and use "open
> minimal-cocoa-app.app" in shell)

That's interesting, I don't know what an app bundle has to do with this.

> Now if we apply the workaround mentioned in the article [1] that
> switches focus to Dock and then back to the app we can resolve the issue
> in QEMU:
>
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index f32adc3074..0986891ca0 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -1114,6 +1114,15 @@ QemuCocoaView *cocoaView;
>     allow_events = true;
>     /* Tell cocoa_display_init to proceed */
>     qemu_sem_post(&app_started_sem);
> +
> +    /* Workaround unresponsive menu bar in macOS prior to Big Sur */
> +    NSArray *docks = [NSRunningApplication runningApplicationsWithBundleIdentifier: @"com.apple.dock"];
> +    if ([docks.firstObject activateWithOptions: NSApplicationActivateAllWindows]) {
> +        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 200 * NSEC_PER_MSEC),
> +                       dispatch_get_main_queue(), ^{
> +            [NSApp activateIgnoringOtherApps:YES];
> +        });
> +    }
> }
>
> - (void)applicationWillTerminate:(NSNotification *)aNotification
>
> Peter, does it help you? And what version of macOS do you use?
>
> BTW, similar workaround was applied to javafx:
> https://github.com/openjdk/jfx/pull/361

Waiting for a fixed amount of time seems fragile, I still think finding 
the right order of events to make it work would be better but if that's 
not possible I'm OK with whatever workaround others think acceptable.

Regards,
BALAON Zoltan

