Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2A648257A
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 18:58:08 +0100 (CET)
Received: from localhost ([::1]:47140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3MAJ-000504-J7
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 12:58:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1n3M8Q-0003gX-EW; Fri, 31 Dec 2021 12:56:11 -0500
Received: from [2607:f8b0:4864:20::735] (port=43634
 helo=mail-qk1-x735.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <orzechowski.alexander@gmail.com>)
 id 1n3M8O-0006zo-It; Fri, 31 Dec 2021 12:56:10 -0500
Received: by mail-qk1-x735.google.com with SMTP id f138so25579940qke.10;
 Fri, 31 Dec 2021 09:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:cc:from:in-reply-to:content-transfer-encoding;
 bh=2QE15AJXafmRhB6sdj+9lQkMrDAhajK8i8TV1r4Kd2U=;
 b=ajbHHGDAyFOADcAbBw60iVV+hwsMw/c61dzuIC2VUiWNQ8aHokPm+aXv9CRScJbpQm
 zATiuH9s1/ngq32l1ea0d1a4B0MMo23xkPfVaQh/HjRNuM9n2NV4TVxjaekjYQNJFDFb
 4kWhaABJmBXXOxA46RmCy2OnmWa3smNKDehJcvOviW4Q3VRuv4LiPfF5GQaZW3kCHJ5w
 fFxWK9s/YkTHwKuUyUuUlK95umzc75ntLZK7YYhLG8LrvtM/bVZJ+ecaU39n8GgUKb7c
 BtPSLPeiYVPy2yUZPhUL50HRD1PMDeoOVIWA9MbfpKx6AD4I5WZR1JxAxug1g2faQh9I
 ntuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=2QE15AJXafmRhB6sdj+9lQkMrDAhajK8i8TV1r4Kd2U=;
 b=FU0u4oUhEp1ZB6QM1klVK6n3BbLd+gKApAGMyI+vxkmjO1MbIwHp0gYK74QgiqbA+Z
 kAO4pUJpQ3/iRQOwY2255xSITN3FoTDoJbrsIIjheS6AidcfSzxlJxRwuKxLOpC/s75C
 HxNYUK0MdazHEjeyjEvwIc0n0KLziiyZWjenshrMHNW5KVDAthh5+i5pqaz9V6UOunUe
 EiOuVvp63Me5IpGUZOIa3R3ckTXuy4l8UVOwNQu6oncVrHstPEbBBHwc98GArGKTMW3T
 IYqfvIVlKtSiY6XDKSUpMz4dAi1QBUWjLJkEGxISSgIYX4vLRNqg4wiPo5LrETlT0tNr
 2Agw==
X-Gm-Message-State: AOAM530nlK5mrm/z/+e99nKDHUj0wb0hKJcN3JnfREK8+SKA5BsJzjEp
 0bf19pZT7a44UGeY5zan2B0=
X-Google-Smtp-Source: ABdhPJyNwDoIcztTf4DwabVRFc2RpB43glue7uhgEk1sYI3tYazRsR7CLxqYs7O6Gs6wq0//TkRGbw==
X-Received: by 2002:a05:620a:14c:: with SMTP id
 e12mr22441676qkn.503.1640973364715; 
 Fri, 31 Dec 2021 09:56:04 -0800 (PST)
Received: from [192.168.1.10]
 (cpebc4dfb42ca53-cmbc4dfb42ca50.cpe.net.cable.rogers.com. [99.251.122.96])
 by smtp.gmail.com with ESMTPSA id bp38sm21380898qkb.66.2021.12.31.09.56.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Dec 2021 09:56:04 -0800 (PST)
Message-ID: <d04fabe5-a8ac-621b-75ee-a8f17b1745cb@gmail.com>
Date: Fri, 31 Dec 2021 12:56:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 1/1] ui/cocoa: Add option to disable left command and hide
 cursor on click
Content-Language: en-US
To: Carwyn Ellis <carwynellis@gmail.com>
References: <20211231174210.82446-1-carwynellis@gmail.com>
 <20211231174210.82446-2-carwynellis@gmail.com>
From: Alexander Orzechowski <orzechowski.alexander@gmail.com>
In-Reply-To: <20211231174210.82446-2-carwynellis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::735
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=orzechowski.alexander@gmail.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-3.024, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu trivial <qemu-trivial@nongnu.org>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 12/31/21 12:42, Carwyn Ellis wrote:
> When switching between guest and host on a Mac using command-tab the
> command key is sent to the guest which can trigger functionality in the
> guest OS. Specifying left-command-key=off disables forwarding this key
> to the guest. Defaults to enabled.
>
> When switching between guest and host on a Mac with a fullscreen guest
> the host pointer will occasionally persist despite the ui code
> requesting that it be hidden. Added cursor hide calls on left and right
> mouse click to hide the cursor when the mouse is clicked.
>
> Also updated the cocoa display documentation to reference the new
> left-command-key option along with the existing show-cursor option.
> ---
>   qapi/ui.json    | 17 +++++++++++++++++
>   qemu-options.hx | 12 ++++++++++++
>   ui/cocoa.m      | 33 +++++++++++++++++++++++++--------
>   3 files changed, 54 insertions(+), 8 deletions(-)
>
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 2b4371da37..764480e145 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1107,6 +1107,22 @@
>     'data'    : { '*grab-on-hover' : 'bool',
>                   '*zoom-to-fit'   : 'bool'  } }
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
>   ##
>   # @DisplayEGLHeadless:
>   #
> @@ -1254,6 +1270,7 @@
>     'discriminator' : 'type',
>     'data'    : {
>         'gtk': { 'type': 'DisplayGTK', 'if': 'CONFIG_GTK' },
> +      'cocoa': { 'type': 'DisplayCocoa', 'if': 'CONFIG_COCOA' },
>         'curses': { 'type': 'DisplayCurses', 'if': 'CONFIG_CURSES' },
>         'egl-headless': { 'type': 'DisplayEGLHeadless',
>                           'if': { 'all': ['CONFIG_OPENGL', 'CONFIG_GBM'] } },
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 7d47510947..5214457676 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1869,6 +1869,9 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
>   #if defined(CONFIG_DBUS_DISPLAY)
>       "-display dbus[,addr=<dbusaddr>]\n"
>       "             [,gl=on|core|es|off][,rendernode=<file>]\n"
> +#endif
> +#if defined(CONFIG_COCOA)
> +    "-display cocoa[,show-cursor=on|off][,left-command-key=on|off]\n"
>   #endif
>       "-display none\n"
>       "                select display backend type\n"
> @@ -1956,6 +1959,15 @@ SRST
>           ``charset=CP850`` for IBM CP850 encoding. The default is
>           ``CP437``.
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
>       ``egl-headless[,rendernode=<file>]``
>           Offload all OpenGL operations to a local DRI device. For any
>           graphical display, this display needs to be paired with either
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 69745c483b..10e492538a 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -95,6 +95,8 @@ static DisplayChangeListener dcl = {
>   };
>   static int last_buttons;
>   static int cursor_hide = 1;
> +static bool cursor_visible = 1;
> +static int left_command_key_enabled = 1;
>   
>   static int gArgc;
>   static char **gArgv;
> @@ -411,18 +413,18 @@ QemuCocoaView *cocoaView;
>   
>   - (void) hideCursor
>   {
> -    if (!cursor_hide) {
> -        return;
> +    if (cursor_hide && cursor_visible) {
> +        cursor_visible = 0;
> +        [NSCursor hide];
>       }
> -    [NSCursor hide];
>   }
>   
>   - (void) unhideCursor
>   {
> -    if (!cursor_hide) {
> -        return;
> +    if (cursor_hide && !cursor_visible) {
> +        cursor_visible = 1;
> +        [NSCursor unhide];
>       }
> -    [NSCursor unhide];
>   }
>   
>   - (void) drawRect:(NSRect) rect
> @@ -831,10 +833,14 @@ QemuCocoaView *cocoaView;
>                       }
>                       break;
>   
> -                /* Don't pass command key changes to guest unless mouse is grabbed */
> +                /*
> +                    Don't pass command key changes to guest unless mouse is grabbed
> +                    or the key is explicitly disabled using the left-command-key option
> +                */
>                   case kVK_Command:
>                       if (isMouseGrabbed &&
> -                        !!(modifiers & NSEventModifierFlagCommand)) {
> +                        !!(modifiers & NSEventModifierFlagCommand) &&
> +                        left_command_key_enabled) {
>                           [self toggleKey:Q_KEY_CODE_META_L];
>                       }
>                       break;
> @@ -923,10 +929,16 @@ QemuCocoaView *cocoaView;
>           case NSEventTypeLeftMouseDown:
>               buttons |= MOUSE_EVENT_LBUTTON;
>               mouse_event = true;
> +            if (isFullscreen) {
> +                [self hideCursor];
> +            }
>               break;
>           case NSEventTypeRightMouseDown:
>               buttons |= MOUSE_EVENT_RBUTTON;
>               mouse_event = true;
> +            if (isFullscreen) {
> +                [self hideCursor];
> +            }
>               break;
>           case NSEventTypeOtherMouseDown:
>               buttons |= MOUSE_EVENT_MBUTTON;
> @@ -2050,10 +2062,15 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
>               [(QemuCocoaAppController *)[[NSApplication sharedApplication] delegate] toggleFullScreen: nil];
>           });
>       }
> +
>       if (opts->has_show_cursor && opts->show_cursor) {
>           cursor_hide = 0;
>       }
>   
> +    if (opts->u.cocoa.has_left_command_key && !opts->u.cocoa.left_command_key) {
> +        left_command_key_enabled = 0;
> +    }
> +
>       // register vga output callbacks
>       register_displaychangelistener(&dcl);
>   

You also forgot about the sign off. git commit with a -s switch will 
append the appropriate sign off message.

All patches need to be signed off so we know you are okay with them 
going upstream.


