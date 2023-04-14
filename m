Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 403C16E2A80
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 21:11:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnOo1-0007M5-TH; Fri, 14 Apr 2023 15:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pnOny-0007Lh-Lh
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 15:09:54 -0400
Received: from mailout06.t-online.de ([194.25.134.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pnOnv-00023i-PC
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 15:09:53 -0400
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
 by mailout06.t-online.de (Postfix) with SMTP id E7200EE39;
 Fri, 14 Apr 2023 21:09:47 +0200 (CEST)
Received: from [192.168.211.200] ([79.208.18.128]) by fwd73.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pnOnr-2rBXqj0; Fri, 14 Apr 2023 21:09:47 +0200
Content-Type: multipart/alternative;
 boundary="------------YnDdscQYx0MG2gxGb7W0XJJY"
Message-ID: <e1d85b75-9ae2-9a78-b07a-4017c919c1ec@t-online.de>
Date: Fri, 14 Apr 2023 21:09:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 0/3] SDL2 usability fixes
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>
References: <20230412203425.32566-1-shentey@gmail.com>
 <9e951bfd-a657-5968-5318-0cd276cd5b2d@t-online.de>
 <FF1C15C5-33A9-46FD-A491-3248CFE5167A@gmail.com>
 <071a249e-2168-0bdf-2088-7faaa4987df8@t-online.de>
Content-Language: en-US
In-Reply-To: <071a249e-2168-0bdf-2088-7faaa4987df8@t-online.de>
X-TOI-EXPURGATEID: 150726::1681499387-16092CF2-38F3A651/0/0 CLEAN NORMAL
X-TOI-MSGID: 97595ff6-d4fa-4ff8-bee5-8e01ccb04b27
Received-SPF: none client-ip=194.25.134.19; envelope-from=vr_qemu@t-online.de;
 helo=mailout06.t-online.de
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-2.282, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a multi-part message in MIME format.
--------------YnDdscQYx0MG2gxGb7W0XJJY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> Am 13.04.23 um 22:43 schrieb Bernhard Beschow:
>>
>> Am 13. April 2023 17:54:34 UTC schrieb "Volker Rümelin" 
>> <vr_qemu@t-online.de>:
>>>> I'm trying to use QEMU on Windows hosts for fun and for profit. 
>>>> While the GTK
>>>> GUI doesn't seem to support OpenGL under Windows the SDL2 GUI does. 
>>>> Hence I
>>>> used the SDL2 GUI where I ran into several issues of which three 
>>>> are fixed in
>>>> this series, which are:
>>>>
>>>> * Alt+Tab switches tasks on the host rather than in the guest in 
>>>> fullscreen mode
>>>> * Alt+F4 closes QEMU rather than a graphical task in the guest
>>>> * AltGr keyboard modifier isn't recognized by a Linux guest
>>>>
>>>> More information about each issue is provided in the patches.
>>>>
>>>> Bernhard Beschow (3):
>>>>     ui/sdl2: Grab Alt+Tab also in fullscreen mode
>>>>     ui/sdl2: Grab Alt+F4 also under Windows
>>>>     ui/sdl2-input: Fix AltGr modifier on Windows hosts
>>>>
>>>>    ui/sdl2-input.c | 13 +++++++++++++
>>>>    ui/sdl2.c       |  2 ++
>>>>    2 files changed, 15 insertions(+)
>>>>
>>> Hi Bernhard,
>> Hi Volker,
>>
>>> I don't think these patches are necessary. The AltGr key and the 
>>> keyboard grab was fixed in 2020 with commit 830473455f ("ui/sdl2: 
>>> fix handling of AltGr key on Windows") and a few commits before.
>> Indeed, this patch addresses the AltGr issue. What I noticed in my 
>> case is that the AltGr behavior is different, depending on whether 
>> the *guest* is in graphics mode or not. Pressing AltGr in graphics 
>> mode issues two key modifiers while only one is issued when the guest 
>> is in text mode. I'll recheck tomorrow when I have access to a 
>> Windows host.
>
> Hi Bernhard,
>
> the AltGr behavior depends on the keyboard grab. The AltGr key works 
> without keyboard grabbed and it doesn't with keyboard grabbed. That's 
> a bug.

Hi Bernhard,

this used to work before SDL2-2.0.16. There was no code for Windows in 
SDL2 to handle keyboard grabs. Version 2.0.16 introduced a Windows low 
level keyboard hook procedure to grab the keyboard. Windows calls this 
callback before the QEMU keyboard hook procedure. This explains the 
observed behavior.

The fix is to disable SDL_SetHint(SDL_HINT_GRAB_KEYBOARD, "1"); for 
Windows. This restores the QEMU keyboard grab for all Windows SDL2 
versions. Your first two patches are also necessary. But I think you 
will need a #ifdef SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED for older SDL2 
versions.

I'll write a patch similar to this one after more tests.

diff --git a/ui/sdl2.c b/ui/sdl2.c
index b011e8d759..9f6b959464 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -855,7 +855,9 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
  #ifdef SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR /* only available since SDL 2.0.8 */
      SDL_SetHint(SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR, "0");
  #endif
+#ifndef CONFIG_WIN32
      SDL_SetHint(SDL_HINT_GRAB_KEYBOARD, "1");
+#endif
  #ifdef SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED
      /* available since SDL 2.0.16 */
      SDL_SetHint(SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED, "0");
-- 
2.35.3

With best regards,
Volker

>
>>
>> What about the other two issues? My other two patches override SDL2 
>> defaults which aren't addressed yet in QEMU AFAICS. The Alt+Tab one 
>> isn't even Windows-specific.
>>
>>> Something broke in the last few weeks. At the moment my Linux guest 
>>> fails to start on Windows with -display sdl. QEMU locks up a short 
>>> time after the Linux kernel starts.
>> This doesn't happen for me with 8.0rc4 and latest msys2 environment. 
>> I'm running with `-accel whpx -vga none -device virtio-vga-gl 
>> -display sdl,gl=on` and I even get decent OpenGL accelleration when 
>> the Linux guest is in graphics mode, with wobbly windows etc. 
>> Sometimes QEMU aborts when it can't map some OpenGL stuff when the 
>> guest enters graphics mode but once that succeeds it runs absolutely 
>> stable.
>>
>>> I'll try to find the commit that caused this regression.
>
> I tested with QEMU 7.1 and sometimes it also locks up. This indicates 
> that the QEMU code doesn't have an issue.
>
> With best regards,
> Volker
>
>> Yes, this would be interesting.
>>
>> Best regards,
>> Bernhard
>>
>>> With best regards,
>>> Volker
>

--------------YnDdscQYx0MG2gxGb7W0XJJY
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <blockquote type="cite"
      cite="mid:071a249e-2168-0bdf-2088-7faaa4987df8@t-online.de">Am
      13.04.23 um 22:43 schrieb Bernhard Beschow: <br>
      <blockquote type="cite"> <br>
        Am 13. April 2023 17:54:34 UTC schrieb "Volker Rümelin" <a
          class="moz-txt-link-rfc2396E"
          href="mailto:vr_qemu@t-online.de">&lt;vr_qemu@t-online.de&gt;</a>:
        <br>
        <blockquote type="cite">
          <blockquote type="cite">I'm trying to use QEMU on Windows
            hosts for fun and for profit. While the GTK <br>
            GUI doesn't seem to support OpenGL under Windows the SDL2
            GUI does. Hence I <br>
            used the SDL2 GUI where I ran into several issues of which
            three are fixed in <br>
            this series, which are: <br>
            <br>
            * Alt+Tab switches tasks on the host rather than in the
            guest in fullscreen mode <br>
            * Alt+F4 closes QEMU rather than a graphical task in the
            guest <br>
            * AltGr keyboard modifier isn't recognized by a Linux guest
            <br>
            <br>
            More information about each issue is provided in the
            patches. <br>
            <br>
            Bernhard Beschow (3): <br>
                ui/sdl2: Grab Alt+Tab also in fullscreen mode <br>
                ui/sdl2: Grab Alt+F4 also under Windows <br>
                ui/sdl2-input: Fix AltGr modifier on Windows hosts <br>
            <br>
               ui/sdl2-input.c | 13 +++++++++++++ <br>
               ui/sdl2.c       |  2 ++ <br>
               2 files changed, 15 insertions(+) <br>
            <br>
          </blockquote>
          Hi Bernhard, <br>
        </blockquote>
        Hi Volker, <br>
        <br>
        <blockquote type="cite">I don't think these patches are
          necessary. The AltGr key and the keyboard grab was fixed in
          2020 with commit 830473455f ("ui/sdl2: fix handling of AltGr
          key on Windows") and a few commits before. <br>
        </blockquote>
        Indeed, this patch addresses the AltGr issue. What I noticed in
        my case is that the AltGr behavior is different, depending on
        whether the *guest* is in graphics mode or not. Pressing AltGr
        in graphics mode issues two key modifiers while only one is
        issued when the guest is in text mode. I'll recheck tomorrow
        when I have access to a Windows host. <br>
      </blockquote>
      <br>
      Hi Bernhard, <br>
      <br>
      the AltGr behavior depends on the keyboard grab. The AltGr key
      works without keyboard grabbed and it doesn't with keyboard
      grabbed. That's a bug. <br>
    </blockquote>
    <br>
    Hi Bernhard,<br>
    <br>
    this used to work before SDL2-2.0.16. There was no code for Windows
    in SDL2 to handle keyboard grabs. Version 2.0.16 introduced a
    Windows low level keyboard hook procedure to grab the keyboard.
    Windows calls this callback before the QEMU keyboard hook procedure.
    This explains the observed behavior.<br>
    <br>
    The fix is to disable SDL_SetHint(SDL_HINT_GRAB_KEYBOARD, "1"); for
    Windows. This restores the QEMU keyboard grab for all Windows SDL2
    versions. Your first two patches are also necessary. But I think you
    will need a #ifdef <span class="pl-en">SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED
    </span>for older SDL2 versions.<br>
    <br>
    I'll write a patch similar to this one after more tests.<br>
    <br>
    <pre>diff --git a/ui/sdl2.c b/ui/sdl2.c
index b011e8d759..9f6b959464 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -855,7 +855,9 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
 #ifdef SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR /* only available since SDL 2.0.8 */
     SDL_SetHint(SDL_HINT_VIDEO_X11_NET_WM_BYPASS_COMPOSITOR, "0");
 #endif
+#ifndef CONFIG_WIN32
     SDL_SetHint(SDL_HINT_GRAB_KEYBOARD, "1");
+#endif
 #ifdef SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED
     /* available since SDL 2.0.16 */
     SDL_SetHint(SDL_HINT_ALLOW_ALT_TAB_WHILE_GRABBED, "0");
-- 
2.35.3

</pre>
    With best regards,<br>
    Volker<br>
    <br>
    <blockquote type="cite"
      cite="mid:071a249e-2168-0bdf-2088-7faaa4987df8@t-online.de"> <br>
      <blockquote type="cite"> <br>
        What about the other two issues? My other two patches override
        SDL2 defaults which aren't addressed yet in QEMU AFAICS. The
        Alt+Tab one isn't even Windows-specific. <br>
        <br>
        <blockquote type="cite">Something broke in the last few weeks.
          At the moment my Linux guest fails to start on Windows with
          -display sdl. QEMU locks up a short time after the Linux
          kernel starts. <br>
        </blockquote>
        This doesn't happen for me with 8.0rc4 and latest msys2
        environment. I'm running with `-accel whpx -vga none -device
        virtio-vga-gl -display sdl,gl=on` and I even get decent OpenGL
        accelleration when the Linux guest is in graphics mode, with
        wobbly windows etc. Sometimes QEMU aborts when it can't map some
        OpenGL stuff when the guest enters graphics mode but once that
        succeeds it runs absolutely stable. <br>
        <br>
        <blockquote type="cite">I'll try to find the commit that caused
          this regression. <br>
        </blockquote>
      </blockquote>
      <br>
      I tested with QEMU 7.1 and sometimes it also locks up. This
      indicates that the QEMU code doesn't have an issue. <br>
      <br>
      With best regards, <br>
      Volker <br>
      <br>
      <blockquote type="cite">Yes, this would be interesting. <br>
        <br>
        Best regards, <br>
        Bernhard <br>
        <br>
        <blockquote type="cite">With best regards, <br>
          Volker <br>
        </blockquote>
      </blockquote>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------YnDdscQYx0MG2gxGb7W0XJJY--

