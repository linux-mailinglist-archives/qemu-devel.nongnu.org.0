Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDE74D04F9
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 18:10:04 +0100 (CET)
Received: from localhost ([::1]:39908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGrz-0001xy-5F
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 12:10:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>)
 id 1nRGjs-0004Pw-0o; Mon, 07 Mar 2022 12:01:42 -0500
Received: from [2a00:1450:4864:20::233] (port=42943
 helo=mail-lj1-x233.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>)
 id 1nRGjp-0001qF-An; Mon, 07 Mar 2022 12:01:39 -0500
Received: by mail-lj1-x233.google.com with SMTP id v28so21386873ljv.9;
 Mon, 07 Mar 2022 09:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YZCkVZ078KcA9APlNzxNoIny7ObMfz/2YCKl1IT11Vs=;
 b=YwLHfYFGLYB/xejVbvyxD9hIF00j+QimPAohsRGzqpo5+FkHRZq6chPE/tzQEjL8hj
 F7xERpAgrZHj0stOY+u+AyQGO1vyB5HehyILMuvvSVMcv7lnM7a2Nc2N2IT5jIELhQl+
 Drnw5yXa0MsAn6J7WWzf81db9oVieuVnLqw0t5PvtrAIwxs8rwMLxTeIt0HGZt4XxE1+
 n81m6p6EDhbbpFiScS0w7pm9rZfdwhwsMuj3a+mslGSEz0aWDqCkq6cpQ+/Y/Q6DEyZN
 HzjKgCDGBoIIu3rEcPFslvjmbE35p0wiM4dvb84bawqto1tPTxAYkQWFZRQ/jfm6P9pT
 iZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YZCkVZ078KcA9APlNzxNoIny7ObMfz/2YCKl1IT11Vs=;
 b=pYovOTB0VfWTw+BV2taCSGRrAHakQflXiuE2khTgDl1wYvxNuDsATTHkXMdKClV3HP
 MQy9hr+2YQ6SG1ROLhxhFrfOjNhUGNAUznfIufS2NZ1PLxGF/EIKOndv8Yn3uea8wak2
 +e1ITWlogAVfPKDqBh1wEvyYD4keNQ+uFFU/touWyYANbkr5cYbtHSd2nP/xz9+mjdBW
 G8wRiN3g7PVaUYAXHk1wjcV61lU015sb62qxiU6hfDYkUp5RFKLv+cv/lRyoSTrqOQ5e
 mXRfa+UN/CyRTe9JPDlqdDsvDaX3ciKgApT4GmObSnMWjFJQULSrlaVnSLJuByrelMbh
 BKwA==
X-Gm-Message-State: AOAM532rnOHtd8Jv70Zg9Ce/U+SOoXXxjpGJo4C8VVCcHk5bzWKOopcW
 bE1JH+BK/Sbkrh+GY6B8J3yMr3SnFSdb8S3piGaXYDCBj33xvIVv
X-Google-Smtp-Source: ABdhPJwrWcbdMw4XSdc7WwPbcwuoVbJf7YERfjWW6fBVSdW/jet+zVTdz6LvMUPLn0QAcVZKi+adI8Z3l/UMnX3GjNo=
X-Received: by 2002:a2e:8495:0:b0:247:dca3:f7bc with SMTP id
 b21-20020a2e8495000000b00247dca3f7bcmr7228809ljh.12.1646672491924; Mon, 07
 Mar 2022 09:01:31 -0800 (PST)
MIME-Version: 1.0
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
 <20220306231753.50277-21-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220306231753.50277-21-philippe.mathieu.daude@gmail.com>
From: Will Cohen <wwcohen@gmail.com>
Date: Mon, 7 Mar 2022 12:01:20 -0500
Message-ID: <CAB26zV371f=Sb_mvJ_Hpzoc5CQo3FcRHxwtm8oGHCwWP=bTZEQ@mail.gmail.com>
Subject: Re: [PATCH v7 20/22] ui/cocoa: capture all keys and combos when mouse
 is grabbed
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000f1533305d9a3d092"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::233
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=wwcohen@gmail.com; helo=mail-lj1-x233.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, qemu Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Gustavo Noronha Silva <gustavo@noronha.dev.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f1533305d9a3d092
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 6, 2022 at 6:19 PM Philippe Mathieu-Daud=C3=A9 <
philippe.mathieu.daude@gmail.com> wrote:

> From: Gustavo Noronha Silva <gustavo@noronha.dev.br>
>
> Applications such as Gnome may use Alt-Tab and Super-Tab for different
> purposes, some use Ctrl-arrows so we want to allow qemu to handle
> everything when it captures the mouse/keyboard.
>
> However, Mac OS handles some combos like Command-Tab and Ctrl-arrows
> at an earlier part of the event handling chain, not letting qemu see it.
>
> We add a global Event Tap that allows qemu to see all events when the
> mouse is grabbed. Note that this requires additional permissions.
>
> See:
>
>
> https://developer.apple.com/documentation/coregraphics/1454426-cgeventtap=
create?language=3Dobjc#discussion
> https://support.apple.com/en-in/guide/mac-help/mh32356/mac
>
> Acked-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Gustavo Noronha Silva <gustavo@noronha.dev.br>
> Message-Id: <20210713213200.2547-2-gustavo@noronha.dev.br>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Message-Id: <20220306121119.45631-2-akihiko.odaki@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  qapi/ui.json    |  8 +++++-
>  qemu-options.hx |  3 +++
>  ui/cocoa.m      | 65 ++++++++++++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 74 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 4dea35a819..1d60d5fc78 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1270,11 +1270,17 @@
>  #                    host without sending this key to the guest when
>  #                    "off". Defaults to "on"
>  #
> +# @full-grab: Capture all key presses, including system combos. This
> +#             requires accessibility permissions, since it performs
> +#             a global grab on key events. (default: off)
> +#             See
> https://support.apple.com/en-in/guide/mac-help/mh32356/mac
> +#
>  # Since: 7.0
>  ##
>  { 'struct': 'DisplayCocoa',
>    'data': {
> -      '*left-command-key': 'bool'
> +      '*left-command-key': 'bool',
> +      '*full-grab': 'bool'
>    } }
>
>  ##
> diff --git a/qemu-options.hx b/qemu-options.hx
> index ffaeab61ed..2e6d54db4f 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1916,6 +1916,9 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
>  #if defined(CONFIG_CURSES)
>      "-display curses[,charset=3D<encoding>]\n"
>  #endif
> +#if defined(CONFIG_COCOA)
> +    "-display cocoa[,full_grab=3Don|off]\n"
> +#endif
>  #if defined(CONFIG_OPENGL)
>      "-display egl-headless[,rendernode=3D<file>]\n"
>  #endif
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 31f0846c30..ca1cab1ae6 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -309,11 +309,13 @@ static void handleAnyDeviceErrors(Error * err)
>      BOOL isMouseGrabbed;
>      BOOL isFullscreen;
>      BOOL isAbsoluteEnabled;
> +    CFMachPortRef eventsTap;
>  }
>  - (void) switchSurface:(pixman_image_t *)image;
>  - (void) grabMouse;
>  - (void) ungrabMouse;
>  - (void) toggleFullScreen:(id)sender;
> +- (void) setFullGrab:(id)sender;
>  - (void) handleMonitorInput:(NSEvent *)event;
>  - (bool) handleEvent:(NSEvent *)event;
>  - (bool) handleEventLocked:(NSEvent *)event;
> @@ -336,6 +338,19 @@ static void handleAnyDeviceErrors(Error * err)
>
>  QemuCocoaView *cocoaView;
>
> +static CGEventRef handleTapEvent(CGEventTapProxy proxy, CGEventType type=
,
> CGEventRef cgEvent, void *userInfo)
> +{
> +    QemuCocoaView *cocoaView =3D userInfo;
> +    NSEvent *event =3D [NSEvent eventWithCGEvent:cgEvent];
> +    if ([cocoaView isMouseGrabbed] && [cocoaView handleEvent:event]) {
> +        COCOA_DEBUG("Global events tap: qemu handled the event,
> capturing!\n");
> +        return NULL;
> +    }
> +    COCOA_DEBUG("Global events tap: qemu did not handle the event,
> letting it through...\n");
> +
> +    return cgEvent;
> +}
> +
>  @implementation QemuCocoaView
>  - (id)initWithFrame:(NSRect)frameRect
>  {
> @@ -361,6 +376,11 @@ QemuCocoaView *cocoaView;
>      }
>
>      qkbd_state_free(kbd);
> +
> +    if (eventsTap) {
> +        CFRelease(eventsTap);
> +    }
> +
>      [super dealloc];
>  }
>
> @@ -655,6 +675,36 @@ QemuCocoaView *cocoaView;
>      }
>  }
>
> +- (void) setFullGrab:(id)sender
> +{
> +    COCOA_DEBUG("QemuCocoaView: setFullGrab\n");
> +
> +    CGEventMask mask =3D CGEventMaskBit(kCGEventKeyDown) |
> CGEventMaskBit(kCGEventKeyUp) | CGEventMaskBit(kCGEventFlagsChanged);
> +    eventsTap =3D CGEventTapCreate(kCGHIDEventTap, kCGHeadInsertEventTap=
,
> kCGEventTapOptionDefault,
> +                                 mask, handleTapEvent, self);
> +    if (!eventsTap) {
> +        warn_report("Could not create event tap, system key combos will
> not be captured.\n");
> +        return;
> +    } else {
> +        COCOA_DEBUG("Global events tap created! Will capture system key
> combos.\n");
> +    }
> +
> +    CFRunLoopRef runLoop =3D CFRunLoopGetCurrent();
> +    if (!runLoop) {
> +        warn_report("Could not obtain current CF RunLoop, system key
> combos will not be captured.\n");
> +        return;
> +    }
> +
> +    CFRunLoopSourceRef tapEventsSrc =3D
> CFMachPortCreateRunLoopSource(kCFAllocatorDefault, eventsTap, 0);
> +    if (!tapEventsSrc ) {
> +        warn_report("Could not obtain current CF RunLoop, system key
> combos will not be captured.\n");
> +        return;
> +    }
> +
> +    CFRunLoopAddSource(runLoop, tapEventsSrc, kCFRunLoopDefaultMode);
> +    CFRelease(tapEventsSrc);
> +}
> +
>  - (void) toggleKey: (int)keycode {
>      qkbd_state_key_event(kbd, keycode, !qkbd_state_key_get(kbd, keycode)=
);
>  }
> @@ -1284,6 +1334,13 @@ QemuCocoaView *cocoaView;
>      [cocoaView toggleFullScreen:sender];
>  }
>
> +- (void) setFullGrab:(id)sender
> +{
> +    COCOA_DEBUG("QemuCocoaAppController: setFullGrab\n");
> +
> +    [cocoaView setFullGrab:sender];
> +}
> +
>  /* Tries to find then open the specified filename */
>  - (void) openDocumentation: (NSString *) filename
>  {
> @@ -2060,11 +2117,17 @@ static void cocoa_display_init(DisplayState *ds,
> DisplayOptions *opts)
>      qemu_sem_wait(&app_started_sem);
>      COCOA_DEBUG("cocoa_display_init: app start completed\n");
>
> +    QemuCocoaAppController *controller =3D (QemuCocoaAppController
> *)[[NSApplication sharedApplication] delegate];
>      /* if fullscreen mode is to be used */
>      if (opts->has_full_screen && opts->full_screen) {
>          dispatch_async(dispatch_get_main_queue(), ^{
>              [NSApp activateIgnoringOtherApps: YES];
> -            [(QemuCocoaAppController *)[[NSApplication sharedApplication=
]
> delegate] toggleFullScreen: nil];
> +            [controller toggleFullScreen: nil];
> +        });
> +    }
> +    if (opts->u.cocoa.has_full_grab && opts->u.cocoa.full_grab) {
> +        dispatch_async(dispatch_get_main_queue(), ^{
> +            [controller setFullGrab: nil];
>          });
>      }
>
> --
> 2.34.1
>
> Reviewed-by: Will Cohen <wwcohen@gmail.com>

--000000000000f1533305d9a3d092
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, Mar 6, 2022 at 6:19 PM Philippe M=
athieu-Daud=C3=A9 &lt;<a href=3D"mailto:philippe.mathieu.daude@gmail.com">p=
hilippe.mathieu.daude@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Gustavo Nor=
onha Silva &lt;<a href=3D"mailto:gustavo@noronha.dev.br" target=3D"_blank">=
gustavo@noronha.dev.br</a>&gt;<br>
<br>
Applications such as Gnome may use Alt-Tab and Super-Tab for different<br>
purposes, some use Ctrl-arrows so we want to allow qemu to handle<br>
everything when it captures the mouse/keyboard.<br>
<br>
However, Mac OS handles some combos like Command-Tab and Ctrl-arrows<br>
at an earlier part of the event handling chain, not letting qemu see it.<br=
>
<br>
We add a global Event Tap that allows qemu to see all events when the<br>
mouse is grabbed. Note that this requires additional permissions.<br>
<br>
See:<br>
<br>
<a href=3D"https://developer.apple.com/documentation/coregraphics/1454426-c=
geventtapcreate?language=3Dobjc#discussion" rel=3D"noreferrer" target=3D"_b=
lank">https://developer.apple.com/documentation/coregraphics/1454426-cgeven=
ttapcreate?language=3Dobjc#discussion</a><br>
<a href=3D"https://support.apple.com/en-in/guide/mac-help/mh32356/mac" rel=
=3D"noreferrer" target=3D"_blank">https://support.apple.com/en-in/guide/mac=
-help/mh32356/mac</a><br>
<br>
Acked-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=
=3D"_blank">armbru@redhat.com</a>&gt;<br>
Signed-off-by: Gustavo Noronha Silva &lt;<a href=3D"mailto:gustavo@noronha.=
dev.br" target=3D"_blank">gustavo@noronha.dev.br</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20210713213200.2547-2-gustavo@noronha.dev=
.br" target=3D"_blank">20210713213200.2547-2-gustavo@noronha.dev.br</a>&gt;=
<br>
Signed-off-by: Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com"=
 target=3D"_blank">akihiko.odaki@gmail.com</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20220306121119.45631-2-akihiko.odaki@gmai=
l.com" target=3D"_blank">20220306121119.45631-2-akihiko.odaki@gmail.com</a>=
&gt;<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0qapi/ui.json=C2=A0 =C2=A0 |=C2=A0 8 +++++-<br>
=C2=A0qemu-options.hx |=C2=A0 3 +++<br>
=C2=A0ui/cocoa.m=C2=A0 =C2=A0 =C2=A0 | 65 +++++++++++++++++++++++++++++++++=
+++++++++++++++-<br>
=C2=A03 files changed, 74 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/qapi/ui.json b/qapi/ui.json<br>
index 4dea35a819..1d60d5fc78 100644<br>
--- a/qapi/ui.json<br>
+++ b/qapi/ui.json<br>
@@ -1270,11 +1270,17 @@<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 host without sending this key to the guest when<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;off&quot;. Defaults to &quot;on&quot;<br>
=C2=A0#<br>
+# @full-grab: Capture all key presses, including system combos. This<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0requires accessibility pe=
rmissions, since it performs<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a global grab on key even=
ts. (default: off)<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0See <a href=3D"https://su=
pport.apple.com/en-in/guide/mac-help/mh32356/mac" rel=3D"noreferrer" target=
=3D"_blank">https://support.apple.com/en-in/guide/mac-help/mh32356/mac</a><=
br>
+#<br>
=C2=A0# Since: 7.0<br>
=C2=A0##<br>
=C2=A0{ &#39;struct&#39;: &#39;DisplayCocoa&#39;,<br>
=C2=A0 =C2=A0&#39;data&#39;: {<br>
-=C2=A0 =C2=A0 =C2=A0 &#39;*left-command-key&#39;: &#39;bool&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 &#39;*left-command-key&#39;: &#39;bool&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 &#39;*full-grab&#39;: &#39;bool&#39;<br>
=C2=A0 =C2=A0} }<br>
<br>
=C2=A0##<br>
diff --git a/qemu-options.hx b/qemu-options.hx<br>
index ffaeab61ed..2e6d54db4f 100644<br>
--- a/qemu-options.hx<br>
+++ b/qemu-options.hx<br>
@@ -1916,6 +1916,9 @@ DEF(&quot;display&quot;, HAS_ARG, QEMU_OPTION_display=
,<br>
=C2=A0#if defined(CONFIG_CURSES)<br>
=C2=A0 =C2=A0 =C2=A0&quot;-display curses[,charset=3D&lt;encoding&gt;]\n&qu=
ot;<br>
=C2=A0#endif<br>
+#if defined(CONFIG_COCOA)<br>
+=C2=A0 =C2=A0 &quot;-display cocoa[,full_grab=3Don|off]\n&quot;<br>
+#endif<br>
=C2=A0#if defined(CONFIG_OPENGL)<br>
=C2=A0 =C2=A0 =C2=A0&quot;-display egl-headless[,rendernode=3D&lt;file&gt;]=
\n&quot;<br>
=C2=A0#endif<br>
diff --git a/ui/cocoa.m b/ui/cocoa.m<br>
index 31f0846c30..ca1cab1ae6 100644<br>
--- a/ui/cocoa.m<br>
+++ b/ui/cocoa.m<br>
@@ -309,11 +309,13 @@ static void handleAnyDeviceErrors(Error * err)<br>
=C2=A0 =C2=A0 =C2=A0BOOL isMouseGrabbed;<br>
=C2=A0 =C2=A0 =C2=A0BOOL isFullscreen;<br>
=C2=A0 =C2=A0 =C2=A0BOOL isAbsoluteEnabled;<br>
+=C2=A0 =C2=A0 CFMachPortRef eventsTap;<br>
=C2=A0}<br>
=C2=A0- (void) switchSurface:(pixman_image_t *)image;<br>
=C2=A0- (void) grabMouse;<br>
=C2=A0- (void) ungrabMouse;<br>
=C2=A0- (void) toggleFullScreen:(id)sender;<br>
+- (void) setFullGrab:(id)sender;<br>
=C2=A0- (void) handleMonitorInput:(NSEvent *)event;<br>
=C2=A0- (bool) handleEvent:(NSEvent *)event;<br>
=C2=A0- (bool) handleEventLocked:(NSEvent *)event;<br>
@@ -336,6 +338,19 @@ static void handleAnyDeviceErrors(Error * err)<br>
<br>
=C2=A0QemuCocoaView *cocoaView;<br>
<br>
+static CGEventRef handleTapEvent(CGEventTapProxy proxy, CGEventType type, =
CGEventRef cgEvent, void *userInfo)<br>
+{<br>
+=C2=A0 =C2=A0 QemuCocoaView *cocoaView =3D userInfo;<br>
+=C2=A0 =C2=A0 NSEvent *event =3D [NSEvent eventWithCGEvent:cgEvent];<br>
+=C2=A0 =C2=A0 if ([cocoaView isMouseGrabbed] &amp;&amp; [cocoaView handleE=
vent:event]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 COCOA_DEBUG(&quot;Global events tap: qemu hand=
led the event, capturing!\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 COCOA_DEBUG(&quot;Global events tap: qemu did not handle the=
 event, letting it through...\n&quot;);<br>
+<br>
+=C2=A0 =C2=A0 return cgEvent;<br>
+}<br>
+<br>
=C2=A0@implementation QemuCocoaView<br>
=C2=A0- (id)initWithFrame:(NSRect)frameRect<br>
=C2=A0{<br>
@@ -361,6 +376,11 @@ QemuCocoaView *cocoaView;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0qkbd_state_free(kbd);<br>
+<br>
+=C2=A0 =C2=A0 if (eventsTap) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 CFRelease(eventsTap);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
=C2=A0 =C2=A0 =C2=A0[super dealloc];<br>
=C2=A0}<br>
<br>
@@ -655,6 +675,36 @@ QemuCocoaView *cocoaView;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
+- (void) setFullGrab:(id)sender<br>
+{<br>
+=C2=A0 =C2=A0 COCOA_DEBUG(&quot;QemuCocoaView: setFullGrab\n&quot;);<br>
+<br>
+=C2=A0 =C2=A0 CGEventMask mask =3D CGEventMaskBit(kCGEventKeyDown) | CGEve=
ntMaskBit(kCGEventKeyUp) | CGEventMaskBit(kCGEventFlagsChanged);<br>
+=C2=A0 =C2=A0 eventsTap =3D CGEventTapCreate(kCGHIDEventTap, kCGHeadInsert=
EventTap, kCGEventTapOptionDefault,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mask, handleTapEvent, self);<b=
r>
+=C2=A0 =C2=A0 if (!eventsTap) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;Could not create event tap, =
system key combos will not be captured.\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 COCOA_DEBUG(&quot;Global events tap created! W=
ill capture system key combos.\n&quot;);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 CFRunLoopRef runLoop =3D CFRunLoopGetCurrent();<br>
+=C2=A0 =C2=A0 if (!runLoop) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;Could not obtain current CF =
RunLoop, system key combos will not be captured.\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 CFRunLoopSourceRef tapEventsSrc =3D CFMachPortCreateRunLoopS=
ource(kCFAllocatorDefault, eventsTap, 0);<br>
+=C2=A0 =C2=A0 if (!tapEventsSrc ) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;Could not obtain current CF =
RunLoop, system key combos will not be captured.\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 CFRunLoopAddSource(runLoop, tapEventsSrc, kCFRunLoopDefaultM=
ode);<br>
+=C2=A0 =C2=A0 CFRelease(tapEventsSrc);<br>
+}<br>
+<br>
=C2=A0- (void) toggleKey: (int)keycode {<br>
=C2=A0 =C2=A0 =C2=A0qkbd_state_key_event(kbd, keycode, !qkbd_state_key_get(=
kbd, keycode));<br>
=C2=A0}<br>
@@ -1284,6 +1334,13 @@ QemuCocoaView *cocoaView;<br>
=C2=A0 =C2=A0 =C2=A0[cocoaView toggleFullScreen:sender];<br>
=C2=A0}<br>
<br>
+- (void) setFullGrab:(id)sender<br>
+{<br>
+=C2=A0 =C2=A0 COCOA_DEBUG(&quot;QemuCocoaAppController: setFullGrab\n&quot=
;);<br>
+<br>
+=C2=A0 =C2=A0 [cocoaView setFullGrab:sender];<br>
+}<br>
+<br>
=C2=A0/* Tries to find then open the specified filename */<br>
=C2=A0- (void) openDocumentation: (NSString *) filename<br>
=C2=A0{<br>
@@ -2060,11 +2117,17 @@ static void cocoa_display_init(DisplayState *ds, Di=
splayOptions *opts)<br>
=C2=A0 =C2=A0 =C2=A0qemu_sem_wait(&amp;app_started_sem);<br>
=C2=A0 =C2=A0 =C2=A0COCOA_DEBUG(&quot;cocoa_display_init: app start complet=
ed\n&quot;);<br>
<br>
+=C2=A0 =C2=A0 QemuCocoaAppController *controller =3D (QemuCocoaAppControll=
er *)[[NSApplication sharedApplication] delegate];<br>
=C2=A0 =C2=A0 =C2=A0/* if fullscreen mode is to be used */<br>
=C2=A0 =C2=A0 =C2=A0if (opts-&gt;has_full_screen &amp;&amp; opts-&gt;full_s=
creen) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dispatch_async(dispatch_get_main_queue(),=
 ^{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[NSApp activateIgnoringOthe=
rApps: YES];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [(QemuCocoaAppController *)[[NSA=
pplication sharedApplication] delegate] toggleFullScreen: nil];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [controller toggleFullScreen: ni=
l];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 });<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (opts-&gt;u.cocoa.has_full_grab &amp;&amp; opts-&gt;u.coc=
oa.full_grab) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dispatch_async(dispatch_get_main_queue(), ^{<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [controller setFullGrab: nil];<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0});<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-- <br>
2.34.1<br>
<br></blockquote><div><span class=3D"gmail-il">Reviewed</span>-<span class=
=3D"gmail-il">by</span>: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com=
">wwcohen@gmail.com</a>&gt; <br></div></div></div>

--000000000000f1533305d9a3d092--

