Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E76A4BC007
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 19:57:19 +0100 (CET)
Received: from localhost ([::1]:40446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL8RS-0006A6-3S
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 13:57:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL8QL-0005JG-6h
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 13:56:09 -0500
Received: from [2607:f8b0:4864:20::b30] (port=40512
 helo=mail-yb1-xb30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL8QH-0001GH-48
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 13:56:08 -0500
Received: by mail-yb1-xb30.google.com with SMTP id u12so7345690ybd.7
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 10:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1K+XLeay82X1idSFmEf9t+nTAUwrbKwX8aXnKH4/rUA=;
 b=GubIrwVvusDFrZkSixtv56rXEK9POQbPBUh9RTQshFLYWzVGmwzlA0F1GlnY0v+iN1
 lNLCRoF1NOUzVikMCzgRPb/BpgVawdTlrFsGR+RDnhAlubXU7y/nU106M6xtoU1L9e1P
 9V+LShrPYNoTKKD4LIsrp1BNdj05GGjdP/bTGwW6eMlLxNufNfyhFXutrn9V0hjGFpmU
 +jbaJn9VUAgac8BvLEZeD3pw1Z6DxYeP1wbaFtugwDJf/oHRp/uWqDgHq5S4mKqrrrkP
 tywPQM/E1HM3GCzdlHoxBgFzkAWAg5iegLU4I5CF6EydgWpd8aqTYU40H1FnKg2ulLLX
 QEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1K+XLeay82X1idSFmEf9t+nTAUwrbKwX8aXnKH4/rUA=;
 b=EBrN+5IwcwWV7WIZfkgFJscFXaDMV9Pel8tRO9Z+ymsrcK0xkpfplvvJYsR9Nb9O6I
 LybL/lkoozt73X2NunC81sOF29ybkRtO+BpiWiaV1eLy1u2ECmo/3a2P5fRiIYs54epf
 qs4vVse25+lNeBlV3E/WpasYZC40NTZROg8EIMbZFpJpGwCXuVJF2uHPkwXbg3ycsUfJ
 Cw7e/xT5RC/BSH0FtnH9B2gqZbI+Vje9UcHJaPUwMQpot7yUJ76AFCy7YEMFDNZ5PMhI
 mTIDjeZ2gZsoAZTO6gHUUshZCzCY5iYbXzT9SUWX/KoVqyzenxhdH13E1pd6N68/bgzu
 6cOw==
X-Gm-Message-State: AOAM530Y2VG3H78YbLI9rfJDD+gDzq45RjNcNayXpGo69v6hvDdRQ3oP
 nu3pkQtX5DjYcEcVgcdFELvdF7XKj57+nBF1+/h21w==
X-Google-Smtp-Source: ABdhPJxoprCggt4dJgu3lv4056k42LaKixki/CuAAdBukXYvKcNu3SssenwifeWumUeS/rvAeE8tvzE2B+1f2xS+c3s=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr8761724ybq.479.1645210551345; Fri, 18
 Feb 2022 10:55:51 -0800 (PST)
MIME-Version: 1.0
References: <20220102174153.70043-1-carwynellis@gmail.com>
 <20220102174153.70043-2-carwynellis@gmail.com>
In-Reply-To: <20220102174153.70043-2-carwynellis@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Feb 2022 18:55:40 +0000
Message-ID: <CAFEAcA9VDAOJf22RkF5nkKKcvDXWoJ=YmEKY13N_GULkZAwb-Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] ui/cocoa: add option to disable left-command
 forwarding to guest
To: Carwyn Ellis <carwynellis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b30
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-trivial@nongnu.org, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 2 Jan 2022 at 17:42, Carwyn Ellis <carwynellis@gmail.com> wrote:
>
> When switching between guest and host on a Mac using command-tab the
> command key is sent to the guest which can trigger functionality in the
> guest OS. Specifying left-command-key=off disables forwarding this key
> to the guest. Defaults to enabled.
>
> Also updated the cocoa display documentation to reference the new
> left-command-key option along with the existing show-cursor option.
>
> Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>

Ccing the QAPI folks for review on the QAPI parts of this.

-- PMM

> ---
>  qapi/ui.json    | 17 +++++++++++++++++
>  qemu-options.hx | 12 ++++++++++++
>  ui/cocoa.m      |  8 +++++++-
>  3 files changed, 36 insertions(+), 1 deletion(-)
>
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 2b4371da37..764480e145 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1107,6 +1107,22 @@
>    'data'    : { '*grab-on-hover' : 'bool',
>                  '*zoom-to-fit'   : 'bool'  } }
>
> +##
> +# @DisplayCocoa:
> +#
> +# Cocoa display options.
> +#
> +# @left-command-key: Enable/disable forwarding of left command key to
> +#                    guest. Allows command-tab window switching on the
> +#                    host without sending this key to the guest when
> +#                    "off". Defaults to "on"
> +#
> +# Since: 6.2.50
> +#
> +##
> +{ 'struct'  : 'DisplayCocoa',
> +  'data'    : { '*left-command-key' : 'bool' } }
> +
>  ##
>  # @DisplayEGLHeadless:
>  #
> @@ -1254,6 +1270,7 @@
>    'discriminator' : 'type',
>    'data'    : {
>        'gtk': { 'type': 'DisplayGTK', 'if': 'CONFIG_GTK' },
> +      'cocoa': { 'type': 'DisplayCocoa', 'if': 'CONFIG_COCOA' },
>        'curses': { 'type': 'DisplayCurses', 'if': 'CONFIG_CURSES' },
>        'egl-headless': { 'type': 'DisplayEGLHeadless',
>                          'if': { 'all': ['CONFIG_OPENGL', 'CONFIG_GBM'] } },
> diff --git a/qemu-options.hx b/qemu-options.hx
> index fd1f8135fb..6fa9c38c83 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1912,6 +1912,9 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
>  #if defined(CONFIG_DBUS_DISPLAY)
>      "-display dbus[,addr=<dbusaddr>]\n"
>      "             [,gl=on|core|es|off][,rendernode=<file>]\n"
> +#endif
> +#if defined(CONFIG_COCOA)
> +    "-display cocoa[,show-cursor=on|off][,left-command-key=on|off]\n"
>  #endif
>      "-display none\n"
>      "                select display backend type\n"
> @@ -1999,6 +2002,15 @@ SRST
>          ``charset=CP850`` for IBM CP850 encoding. The default is
>          ``CP437``.
>
> +    ``cocoa``
> +        Display video output in a Cocoa window. Mac only. This interface
> +        provides drop-down menus and other UI elements to configure and
> +        control the VM during runtime. Valid parameters are:
> +
> +        ``show-cursor=on|off`` :  Force showing the mouse cursor
> +
> +        ``left-command-key=on|off`` : Disable forwarding left command key to host
> +
>      ``egl-headless[,rendernode=<file>]``
>          Offload all OpenGL operations to a local DRI device. For any
>          graphical display, this display needs to be paired with either
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 69745c483b..01045d6698 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -95,6 +95,7 @@ static DisplayChangeListener dcl = {
>  };
>  static int last_buttons;
>  static int cursor_hide = 1;
> +static int left_command_key_enabled = 1;
>
>  static int gArgc;
>  static char **gArgv;
> @@ -834,7 +835,8 @@ QemuCocoaView *cocoaView;
>                  /* Don't pass command key changes to guest unless mouse is grabbed */
>                  case kVK_Command:
>                      if (isMouseGrabbed &&
> -                        !!(modifiers & NSEventModifierFlagCommand)) {
> +                        !!(modifiers & NSEventModifierFlagCommand) &&
> +                        left_command_key_enabled) {
>                          [self toggleKey:Q_KEY_CODE_META_L];
>                      }
>                      break;
> @@ -2054,6 +2056,10 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
>          cursor_hide = 0;
>      }
>
> +    if (opts->u.cocoa.has_left_command_key && !opts->u.cocoa.left_command_key) {
> +        left_command_key_enabled = 0;
> +    }
> +
>      // register vga output callbacks
>      register_displaychangelistener(&dcl);

