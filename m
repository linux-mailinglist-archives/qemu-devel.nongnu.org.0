Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 534222EFB9A
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 00:14:51 +0100 (CET)
Received: from localhost ([::1]:58090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky0y1-0007Vo-QN
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 18:14:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ky0wx-00074S-DP
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 18:13:43 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:33682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ky0wt-0000QU-Mt
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 18:13:42 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 74F867470F4;
 Sat,  9 Jan 2021 00:13:36 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 371C374646C; Sat,  9 Jan 2021 00:13:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 3588674645B;
 Sat,  9 Jan 2021 00:13:36 +0100 (CET)
Date: Sat, 9 Jan 2021 00:13:36 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Roman Bolshakov <r.bolshakov@yadro.com>
Subject: Re: [PATCH v2] ui/cocoa: Fix openFile: deprecation on Big Sur
In-Reply-To: <X/jJ7dTlBW8Pg65q@SPB-NB-133.local>
Message-ID: <e585d6ab-2dc8-4d1d-fbf7-96ecfdaa79@eik.bme.hu>
References: <20210102150718.47618-1-r.bolshakov@yadro.com>
 <CAFEAcA8GMYcTrfKJ-6E3rKyytDHSL4UeWPVuFVLtzWjDtCxMVw@mail.gmail.com>
 <CAFEAcA97hh-bC7yjpHLGyvOiBGMxRtOQaf0O-y5WG0xYYA8N7A@mail.gmail.com>
 <X/jJ7dTlBW8Pg65q@SPB-NB-133.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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

On Sat, 9 Jan 2021, Roman Bolshakov wrote:
> On Fri, Jan 08, 2021 at 03:00:07PM +0000, Peter Maydell wrote:
>> On Fri, 8 Jan 2021 at 13:50, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>
>>> On Sat, 2 Jan 2021 at 15:14, Roman Bolshakov <r.bolshakov@yadro.com> wrote:
>>>>
>>>> ui/cocoa.m:1188:44: warning: 'openFile:' is deprecated: first deprecated in macOS 11.0 - Use -[NSWorkspace openURL:] instead.
>>>>       [-Wdeprecated-declarations]
>>>>         if ([[NSWorkspace sharedWorkspace] openFile: full_file_path] == YES) {
>>>>                                            ^
>>>> /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/AppKit.framework/Headers/NSWorkspace.h:350:1: note:
>>>>       'openFile:' has been explicitly marked deprecated here
>>>> - (BOOL)openFile:(NSString *)fullPath API_DEPRECATED("Use -[NSWorkspace openURL:] instead.", macos(10.0, 11.0));
>>>> ^
>>>>
>>>> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
>>>> ---
>>>
>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>
>>
>> So I was just trying to test this patch, and I found that at least
>> for me the osx menu bar has stopped working in QEMU -- keyboard
>> shortcuts to it still work but none of the menu buttons respond
>> to the mouse. Does that happen for anybody else?
>>
>
> There's an old bug when QEMU menu bar is not responsive because it's not
> properly activated. If you click off qemu and click on the qemu dock
> icon then it "gets fixed" (cmd-tab works too). Do you hit the issue as
> described in the article [1]? The code in the article does exactly the
> same what I'm doing manually. I wanted to fix it but somehow it got
> postponed for like a whole year :) I might try to make a fix this but
> note, the issue is not related to the patch.

This does not sound like the best solution to the problem. There's some 
info on this here (and blog post linked from it):

https://stackoverflow.com/questions/7460092/nswindow-makekeyandorderfront-makes-window-appear-but-not-key-or-front

Maybe we call makeKeyAndOrderFront: too early before the app is active and 
that's causing the problem? Would it work better if that's moved after 
[NSApp run]? (Maybe we also need canBecomeKey: somewhere but I don't see 
why would that be needed for normal windows.)

Regards,
BALATON Zoltan

>> Also, the "bring up the docs" help option (which is what this
>> patch is changing) doesn't seem to work when QEMU is run from
>> the source tree and the docs haven't been installed to the
>> locations where it expects it might find them. Probably the
>> code needs updating to work with qemu_find_file() or some
>> variant on it.
>>
>
> If I add:
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index ea3b845b53..4772b7f981 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -1189,6 +1189,7 @@ - (void) openDocumentation: (NSString *) filename
>                           path_array[index], filename];
>         full_file_url = [NSURL fileURLWithPath: full_file_path
>                                    isDirectory: false];
> +        NSLog(@"%@", full_file_url);
>         if ([[NSWorkspace sharedWorkspace] openURL: full_file_url] == YES) {
>             return;
>         }
>
> And click "Help"->"QEMU Documentation". I get the following logs:
> 2021-01-08 23:14:15.288 qemu-system-x86_64[46165:12969383] file:///Users/roolebo/dev/qemu/apple-silicon/build/../share/doc/qemu/index.html
> 2021-01-08 23:14:15.288 qemu-system-x86_64[46165:12969383] file:///Users/roolebo/dev/qemu/apple-silicon/build/../doc/qemu/index.html
> 2021-01-08 23:14:15.288 qemu-system-x86_64[46165:12969383] file:///Users/roolebo/dev/qemu/apple-silicon/build/../docs/index.html
>
> In order to get documentation on macOS. sphinx-doc has to be installed
> from homebrew. The package is keg-only so sphinx-build has to be added
> to PATH.
>
> Then you can build with --enable-docs. Generated documentation resides
> in the build tree after the QEMU has been switched to meson:
>
> find . -name index.html
> ./build/meson-private/temp/sphinx/out/index.html
> ./build/docs/devel/index.html
> ./build/docs/tools/index.html
> ./build/docs/index.html
> ./build/docs/specs/index.html
> ./build/docs/interop/index.html
> ./build/docs/user/index.html
> ./build/docs/system/index.html
>
> The problem is that the paths above don't point to docs in build tree.
> The patch only fixes a warning and doesn't break existing path
> resolution. The fix for out-of-tree docs is trivial:
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index ea3b845b53..13fba8103e 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -1176,7 +1176,7 @@ - (void)toggleFullScreen:(id)sender
> - (void) openDocumentation: (NSString *) filename
> {
>     /* Where to look for local files */
> -    NSString *path_array[] = {@"../share/doc/qemu/", @"../doc/qemu/", @"../docs/"};
> +    NSString *path_array[] = {@"../share/doc/qemu/", @"../doc/qemu/", @"docs/"};
>     NSString *full_file_path;
>     NSURL *full_file_url;
>
> I'll add it as a separate patch to v2.
>
> 1. https://ar.al/2018/09/17/workaround-for-unclickable-app-menu-bug-with-window.makekeyandorderfront-and-nsapp.activate-on-macos/
>
> Regards,
> Roman
>
>

