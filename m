Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDB84D04F7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 18:09:56 +0100 (CET)
Received: from localhost ([::1]:39136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGrr-0001Sm-B9
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 12:09:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>)
 id 1nRGim-0003qd-V0; Mon, 07 Mar 2022 12:00:35 -0500
Received: from [2a00:1450:4864:20::22f] (port=45709
 helo=mail-lj1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>)
 id 1nRGik-0001de-Gi; Mon, 07 Mar 2022 12:00:32 -0500
Received: by mail-lj1-x22f.google.com with SMTP id l12so21345151ljh.12;
 Mon, 07 Mar 2022 09:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dQCUaoDL7MIO2LQCE7FQPzXvThNM2LPPwLYt2xjAzq8=;
 b=GPqslmrb4a94FYf8BcTO/mE5cwzJRcdYRDPoCaOJsIoomwz8/wx24mjPGQIoJCKFvs
 L+ybXpDTDh/FNu0PP0CP+ekp6itUCvIW2W5SHRurgrhWIxRTpif9EyKr7lxDnesPUJhv
 KyHZTUKsiSWLuV3T64HEls0eFeQm1IIOZrrh/cRYxxtPwqVIktlAx5UiuuWXref/+i4M
 I9WR1F2XfWqEO18S52tXCQVbbPvOWP8cN8qtdam6vZwCbmWqCzujjWE7QChNrKphWkNr
 FO5h7Tne6WYqhS9JJQi0YSYPFmsvEjX3RJkh6myIvpk5TTxF1KGLIdKccKKftKhBrIkx
 5/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dQCUaoDL7MIO2LQCE7FQPzXvThNM2LPPwLYt2xjAzq8=;
 b=uqXlt8drU4gir2VvfTrZZHNAEPfeNFukWi3qFyYDIBIPvvYsFYJYeO46pYuCUkMB2r
 Z07hgNx9B0qpZ0hMnkln7yeVTBUiZV2klUUT3gkf2dvRbhijc+BsDoD2RYrXFrUapoX1
 Vg8/Lvo0rmFxFomCoaKPMCft3jkz6WGcA1JHCtz3Psc5V0cuK+NCpnGVzfbJFYN4frJK
 4WIA7KeJxfk0yTj5QDd+U5NhD9wb1IMpuLB2MO88PZG5E+lCarFN2tf/UeJz8xOYjbFK
 05U5T9xmq5PFPr9nKKFczi+aKOIGWDqOKlrue5EpU+FUMa562oB18Ez+ejNGyFBbAuai
 N4tg==
X-Gm-Message-State: AOAM531ogwKmEvWwVJF7K2lGNxPA3SwWESHb8LUoZTvLeBqFG1CGKREn
 82eAZnzY6E5r9Cha9792gM7qIxcEBfZhjEMpM1Q=
X-Google-Smtp-Source: ABdhPJzzfyDvo577IWnJYNMHJmYpgJzYApOsevyPbHCbB4HCUF0DC5BK2GkVbfS2NBibhvYgfQ4JKtZKGNI5Iv1sJXA=
X-Received: by 2002:a2e:960e:0:b0:247:ec4c:29d6 with SMTP id
 v14-20020a2e960e000000b00247ec4c29d6mr519285ljh.268.1646672425315; Mon, 07
 Mar 2022 09:00:25 -0800 (PST)
MIME-Version: 1.0
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
 <20220306231753.50277-22-philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220306231753.50277-22-philippe.mathieu.daude@gmail.com>
From: Will Cohen <wwcohen@gmail.com>
Date: Mon, 7 Mar 2022 12:00:13 -0500
Message-ID: <CAB26zV0GoW4gSVV2Vc1UAO-T0AhJf1P-WPVizWv1xa=BVcSt8Q@mail.gmail.com>
Subject: Re: [PATCH v7 21/22] ui/cocoa: add option to swap Option and Command
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000f8f05205d9a3cc83"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=wwcohen@gmail.com; helo=mail-lj1-x22f.google.com
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

--000000000000f8f05205d9a3cc83
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 6, 2022 at 6:19 PM Philippe Mathieu-Daud=C3=A9 <
philippe.mathieu.daude@gmail.com> wrote:

> From: Gustavo Noronha Silva <gustavo@noronha.dev.br>
>
> On Mac OS X the Option key maps to Alt and Command to Super/Meta. This
> change
> swaps them around so that Alt is the key closer to the space bar and
> Meta/Super
> is between Control and Alt, like on non-Mac keyboards.
>
> It is a cocoa display option, disabled by default.
>
> Acked-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Gustavo Noronha Silva <gustavo@noronha.dev.br>
> Message-Id: <20210713213200.2547-3-gustavo@noronha.dev.br>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> Message-Id: <20220306121119.45631-3-akihiko.odaki@gmail.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  qapi/ui.json    |  7 ++++++-
>  qemu-options.hx |  2 +-
>  ui/cocoa.m      | 49 +++++++++++++++++++++++++++++++++++++++----------
>  3 files changed, 46 insertions(+), 12 deletions(-)
>
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 1d60d5fc78..664da9e462 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1275,12 +1275,17 @@
>  #             a global grab on key events. (default: off)
>  #             See
> https://support.apple.com/en-in/guide/mac-help/mh32356/mac
>  #
> +# @swap-opt-cmd: Swap the Option and Command keys so that their key code=
s
> match
> +#                their position on non-Mac keyboards and you can use
> Meta/Super
> +#                and Alt where you expect them. (default: off)
> +#
>  # Since: 7.0
>  ##
>  { 'struct': 'DisplayCocoa',
>    'data': {
>        '*left-command-key': 'bool',
> -      '*full-grab': 'bool'
> +      '*full-grab': 'bool',
> +      '*swap-opt-cmd': 'bool'
>    } }
>
>  ##
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 2e6d54db4f..f443b0f33a 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1917,7 +1917,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
>      "-display curses[,charset=3D<encoding>]\n"
>  #endif
>  #if defined(CONFIG_COCOA)
> -    "-display cocoa[,full_grab=3Don|off]\n"
> +    "-display cocoa[,full-grab=3Don|off][,swap-opt-cmd=3Don|off]\n"
>  #endif
>  #if defined(CONFIG_OPENGL)
>      "-display egl-headless[,rendernode=3D<file>]\n"
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index ca1cab1ae6..c0a948201d 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -96,6 +96,7 @@ static DisplayChangeListener dcl =3D {
>  static int last_buttons;
>  static int cursor_hide =3D 1;
>  static int left_command_key_enabled =3D 1;
> +static bool swap_opt_cmd;
>
>  static int gArgc;
>  static char **gArgv;
> @@ -854,12 +855,22 @@ static CGEventRef handleTapEvent(CGEventTapProxy
> proxy, CGEventType type, CGEven
>          qkbd_state_key_event(kbd, Q_KEY_CODE_CTRL_R, false);
>      }
>      if (!(modifiers & NSEventModifierFlagOption)) {
> -        qkbd_state_key_event(kbd, Q_KEY_CODE_ALT, false);
> -        qkbd_state_key_event(kbd, Q_KEY_CODE_ALT_R, false);
> +        if (swap_opt_cmd) {
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_META_L, false);
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_META_R, false);
> +        } else {
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_ALT, false);
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_ALT_R, false);
> +        }
>      }
>      if (!(modifiers & NSEventModifierFlagCommand)) {
> -        qkbd_state_key_event(kbd, Q_KEY_CODE_META_L, false);
> -        qkbd_state_key_event(kbd, Q_KEY_CODE_META_R, false);
> +        if (swap_opt_cmd) {
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_ALT, false);
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_ALT_R, false);
> +        } else {
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_META_L, false);
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_META_R, false);
> +        }
>      }
>
>      switch ([event type]) {
> @@ -891,29 +902,44 @@ static CGEventRef handleTapEvent(CGEventTapProxy
> proxy, CGEventType type, CGEven
>
>                  case kVK_Option:
>                      if (!!(modifiers & NSEventModifierFlagOption)) {
> -                        [self toggleKey:Q_KEY_CODE_ALT];
> +                        if (swap_opt_cmd) {
> +                            [self toggleKey:Q_KEY_CODE_META_L];
> +                        } else {
> +                            [self toggleKey:Q_KEY_CODE_ALT];
> +                        }
>                      }
>                      break;
>
>                  case kVK_RightOption:
>                      if (!!(modifiers & NSEventModifierFlagOption)) {
> -                        [self toggleKey:Q_KEY_CODE_ALT_R];
> +                        if (swap_opt_cmd) {
> +                            [self toggleKey:Q_KEY_CODE_META_R];
> +                        } else {
> +                            [self toggleKey:Q_KEY_CODE_ALT_R];
> +                        }
>                      }
>                      break;
>
>                  /* Don't pass command key changes to guest unless mouse
> is grabbed */
>                  case kVK_Command:
>                      if (isMouseGrabbed &&
> -                        !!(modifiers & NSEventModifierFlagCommand) &&
> -                        left_command_key_enabled) {
> -                        [self toggleKey:Q_KEY_CODE_META_L];
> +                        !!(modifiers & NSEventModifierFlagCommand)) {
> +                        if (swap_opt_cmd) {
> +                            [self toggleKey:Q_KEY_CODE_ALT];
> +                        } else {
> +                            [self toggleKey:Q_KEY_CODE_META_L];
> +                        }
>                      }
>                      break;
>
>                  case kVK_RightCommand:
>                      if (isMouseGrabbed &&
>                          !!(modifiers & NSEventModifierFlagCommand)) {
> -                        [self toggleKey:Q_KEY_CODE_META_R];
> +                        if (swap_opt_cmd) {
> +                            [self toggleKey:Q_KEY_CODE_ALT_R];
> +                        } else {
> +                            [self toggleKey:Q_KEY_CODE_META_R];
> +                        }
>                      }
>                      break;
>              }
> @@ -2134,6 +2160,9 @@ static void cocoa_display_init(DisplayState *ds,
> DisplayOptions *opts)
>      if (opts->has_show_cursor && opts->show_cursor) {
>          cursor_hide =3D 0;
>      }
> +    if (opts->u.cocoa.has_swap_opt_cmd) {
> +        swap_opt_cmd =3D opts->u.cocoa.swap_opt_cmd;
> +    }
>
>      if (opts->u.cocoa.has_left_command_key &&
> !opts->u.cocoa.left_command_key) {
>          left_command_key_enabled =3D 0;
> --
> 2.34.1
>
> Reviewed-by: Will Cohen <wwcohen@gmail.com>

--000000000000f8f05205d9a3cc83
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
On Mac OS X the Option key maps to Alt and Command to Super/Meta. This chan=
ge<br>
swaps them around so that Alt is the key closer to the space bar and Meta/S=
uper<br>
is between Control and Alt, like on non-Mac keyboards.<br>
<br>
It is a cocoa display option, disabled by default.<br>
<br>
Acked-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" target=
=3D"_blank">armbru@redhat.com</a>&gt;<br>
Signed-off-by: Gustavo Noronha Silva &lt;<a href=3D"mailto:gustavo@noronha.=
dev.br" target=3D"_blank">gustavo@noronha.dev.br</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20210713213200.2547-3-gustavo@noronha.dev=
.br" target=3D"_blank">20210713213200.2547-3-gustavo@noronha.dev.br</a>&gt;=
<br>
Signed-off-by: Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com"=
 target=3D"_blank">akihiko.odaki@gmail.com</a>&gt;<br>
Message-Id: &lt;<a href=3D"mailto:20220306121119.45631-3-akihiko.odaki@gmai=
l.com" target=3D"_blank">20220306121119.45631-3-akihiko.odaki@gmail.com</a>=
&gt;<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
---<br>
=C2=A0qapi/ui.json=C2=A0 =C2=A0 |=C2=A0 7 ++++++-<br>
=C2=A0qemu-options.hx |=C2=A0 2 +-<br>
=C2=A0ui/cocoa.m=C2=A0 =C2=A0 =C2=A0 | 49 +++++++++++++++++++++++++++++++++=
++++++----------<br>
=C2=A03 files changed, 46 insertions(+), 12 deletions(-)<br>
<br>
diff --git a/qapi/ui.json b/qapi/ui.json<br>
index 1d60d5fc78..664da9e462 100644<br>
--- a/qapi/ui.json<br>
+++ b/qapi/ui.json<br>
@@ -1275,12 +1275,17 @@<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a global grab on key=
 events. (default: off)<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0See <a href=3D"https=
://support.apple.com/en-in/guide/mac-help/mh32356/mac" rel=3D"noreferrer" t=
arget=3D"_blank">https://support.apple.com/en-in/guide/mac-help/mh32356/mac=
</a><br>
=C2=A0#<br>
+# @swap-opt-cmd: Swap the Option and Command keys so that their key codes =
match<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 their position on=
 non-Mac keyboards and you can use Meta/Super<br>
+#=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and Alt where you=
 expect them. (default: off)<br>
+#<br>
=C2=A0# Since: 7.0<br>
=C2=A0##<br>
=C2=A0{ &#39;struct&#39;: &#39;DisplayCocoa&#39;,<br>
=C2=A0 =C2=A0&#39;data&#39;: {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*left-command-key&#39;: &#39;bool&#39;,<br>
-=C2=A0 =C2=A0 =C2=A0 &#39;*full-grab&#39;: &#39;bool&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 &#39;*full-grab&#39;: &#39;bool&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 &#39;*swap-opt-cmd&#39;: &#39;bool&#39;<br>
=C2=A0 =C2=A0} }<br>
<br>
=C2=A0##<br>
diff --git a/qemu-options.hx b/qemu-options.hx<br>
index 2e6d54db4f..f443b0f33a 100644<br>
--- a/qemu-options.hx<br>
+++ b/qemu-options.hx<br>
@@ -1917,7 +1917,7 @@ DEF(&quot;display&quot;, HAS_ARG, QEMU_OPTION_display=
,<br>
=C2=A0 =C2=A0 =C2=A0&quot;-display curses[,charset=3D&lt;encoding&gt;]\n&qu=
ot;<br>
=C2=A0#endif<br>
=C2=A0#if defined(CONFIG_COCOA)<br>
-=C2=A0 =C2=A0 &quot;-display cocoa[,full_grab=3Don|off]\n&quot;<br>
+=C2=A0 =C2=A0 &quot;-display cocoa[,full-grab=3Don|off][,swap-opt-cmd=3Don=
|off]\n&quot;<br>
=C2=A0#endif<br>
=C2=A0#if defined(CONFIG_OPENGL)<br>
=C2=A0 =C2=A0 =C2=A0&quot;-display egl-headless[,rendernode=3D&lt;file&gt;]=
\n&quot;<br>
diff --git a/ui/cocoa.m b/ui/cocoa.m<br>
index ca1cab1ae6..c0a948201d 100644<br>
--- a/ui/cocoa.m<br>
+++ b/ui/cocoa.m<br>
@@ -96,6 +96,7 @@ static DisplayChangeListener dcl =3D {<br>
=C2=A0static int last_buttons;<br>
=C2=A0static int cursor_hide =3D 1;<br>
=C2=A0static int left_command_key_enabled =3D 1;<br>
+static bool swap_opt_cmd;<br>
<br>
=C2=A0static int gArgc;<br>
=C2=A0static char **gArgv;<br>
@@ -854,12 +855,22 @@ static CGEventRef handleTapEvent(CGEventTapProxy prox=
y, CGEventType type, CGEven<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qkbd_state_key_event(kbd, Q_KEY_CODE_CTRL=
_R, false);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (!(modifiers &amp; NSEventModifierFlagOption)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qkbd_state_key_event(kbd, Q_KEY_CODE_ALT, fals=
e);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qkbd_state_key_event(kbd, Q_KEY_CODE_ALT_R, fa=
lse);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (swap_opt_cmd) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qkbd_state_key_event(kbd, Q_KEY_=
CODE_META_L, false);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qkbd_state_key_event(kbd, Q_KEY_=
CODE_META_R, false);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qkbd_state_key_event(kbd, Q_KEY_=
CODE_ALT, false);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qkbd_state_key_event(kbd, Q_KEY_=
CODE_ALT_R, false);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0if (!(modifiers &amp; NSEventModifierFlagCommand)) {<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qkbd_state_key_event(kbd, Q_KEY_CODE_META_L, f=
alse);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qkbd_state_key_event(kbd, Q_KEY_CODE_META_R, f=
alse);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (swap_opt_cmd) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qkbd_state_key_event(kbd, Q_KEY_=
CODE_ALT, false);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qkbd_state_key_event(kbd, Q_KEY_=
CODE_ALT_R, false);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qkbd_state_key_event(kbd, Q_KEY_=
CODE_META_L, false);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qkbd_state_key_event(kbd, Q_KEY_=
CODE_META_R, false);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0switch ([event type]) {<br>
@@ -891,29 +902,44 @@ static CGEventRef handleTapEvent(CGEventTapProxy prox=
y, CGEventType type, CGEven<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case kVK_Opti=
on:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (!!(modifiers &amp; NSEventModifierFlagOption)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 [self toggleKey:Q_KEY_CODE_ALT];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (swap_opt_cmd) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 [self toggleKey:Q_KEY_CODE_META_L];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 [self toggleKey:Q_KEY_CODE_ALT];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case kVK_Righ=
tOption:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (!!(modifiers &amp; NSEventModifierFlagOption)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 [self toggleKey:Q_KEY_CODE_ALT_R];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (swap_opt_cmd) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 [self toggleKey:Q_KEY_CODE_META_R];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 [self toggleKey:Q_KEY_CODE_ALT_R];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Don&#39;t =
pass command key changes to guest unless mouse is grabbed */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case kVK_Comm=
and:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (isMouseGrabbed &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 !!(modifiers &amp; NSEventModifierFlagCommand) &amp;&amp;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 left_command_key_enabled) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 [self toggleKey:Q_KEY_CODE_META_L];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 !!(modifiers &amp; NSEventModifierFlagCommand)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (swap_opt_cmd) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 [self toggleKey:Q_KEY_CODE_ALT];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 [self toggleKey:Q_KEY_CODE_META_L];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case kVK_Righ=
tCommand:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0if (isMouseGrabbed &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0!!(modifiers &amp; NSEventModifierFlagCommand)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 [self toggleKey:Q_KEY_CODE_META_R];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (swap_opt_cmd) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 [self toggleKey:Q_KEY_CODE_ALT_R];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 [self toggleKey:Q_KEY_CODE_META_R];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
@@ -2134,6 +2160,9 @@ static void cocoa_display_init(DisplayState *ds, Disp=
layOptions *opts)<br>
=C2=A0 =C2=A0 =C2=A0if (opts-&gt;has_show_cursor &amp;&amp; opts-&gt;show_c=
ursor) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cursor_hide =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 if (opts-&gt;u.cocoa.has_swap_opt_cmd) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 swap_opt_cmd =3D opts-&gt;u.cocoa.swap_opt_cmd=
;<br>
+=C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0if (opts-&gt;u.cocoa.has_left_command_key &amp;&amp; !o=
pts-&gt;u.cocoa.left_command_key) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0left_command_key_enabled =3D 0;<br>
-- <br>
2.34.1<br>
<br></blockquote><div><span class=3D"gmail-il">Reviewed</span>-<span class=
=3D"gmail-il">by</span>: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com=
">wwcohen@gmail.com</a>&gt; <br></div></div></div>

--000000000000f8f05205d9a3cc83--

