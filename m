Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2174A4BBF8D
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 19:35:03 +0100 (CET)
Received: from localhost ([::1]:57054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL85t-0005nb-V4
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 13:35:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nL84G-0004u9-3j; Fri, 18 Feb 2022 13:33:20 -0500
Received: from [2607:f8b0:4864:20::52e] (port=45644
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nL84E-0006KQ-3o; Fri, 18 Feb 2022 13:33:19 -0500
Received: by mail-pg1-x52e.google.com with SMTP id z4so8560274pgh.12;
 Fri, 18 Feb 2022 10:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pbbiBvn6kil08TXi/MGW9scynOKVTYU3GkakDxTPbU4=;
 b=kHMjbpLTAFCWdKo28fuDPTHNboIPBy1H4PLp2AuvEzbpPdChQdFAnE6AV+yVA7CKxl
 asIlj3XEGWNESFgLfM8XHmUa2uB6AuSf69IILZjUqpP8npMpLt9fHRY/kjqjYSvDkY+P
 JNA8ROdP5H7sdfy5XFjSDwXP98EMBQx2FSL2XMQdZr9w0f60s3DDFGufu+7TGksG65ch
 fuveNSY2iASuOyfCXq/TIQqJiagUX1uolLADGXSmQOjrPB5qdPg7Sdn4WqFDdqjem+Ef
 fNl4II7Sws8ebLt7rnPX/yRokSRB1OavkU+kSG5cm89oqD4KjEeAlnDOsjBQXbe/mc85
 EuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pbbiBvn6kil08TXi/MGW9scynOKVTYU3GkakDxTPbU4=;
 b=kc7NXCIZKdQCNVMYpYIDXlwb82+SdLxJmJQnTL/YVK5obvHPNWRx43K5B6VSpy20Q4
 V5oNZY/KNtYSYjTWsKiWvLMmN2YQDd0juarj+1pLd4CjpkLle2+PSkJNIdxUCcbQnO1h
 sAnT/rDqdk5S15qVr7BrEk+jegsD4XsAft7gtn+X/8mvtl4t0KHQ+DnVZTQ205fw77IU
 SVOpO2kPQpe0OJcWIUBxf9eJclcZZ9pxV0Kv6928gWW6sTffMC32olU3/ZxKqhlXZI5r
 L/evFHX2oFFsidYPMSH2tEkuvB4+kAGKz2711EPByJcBmGUZOJbVaEAClplAOyF6pvMk
 LlVw==
X-Gm-Message-State: AOAM533KsMHxsXN5vHkDuMSYsiS8Td4lxikj91C2CVSH693B5e5+YUCO
 +Gjsl2XdVcnTOyO/USgHgZI=
X-Google-Smtp-Source: ABdhPJzBNiaBHRu/fcokU2uuCufhnV5MQ8DK5wdBqba6VsFCluSl/RUSK/2URAjj8CmM7hxW+vRkAA==
X-Received: by 2002:a63:c47:0:b0:371:3a2e:32d8 with SMTP id
 7-20020a630c47000000b003713a2e32d8mr7206796pgm.281.1645209196042; 
 Fri, 18 Feb 2022 10:33:16 -0800 (PST)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 x126sm3506175pfb.117.2022.02.18.10.33.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 10:33:15 -0800 (PST)
Message-ID: <7bd27c84-6649-68ff-7063-cc3468b877e7@gmail.com>
Date: Sat, 19 Feb 2022 03:33:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] ui/cocoa: add option to disable left-command
 forwarding to guest
Content-Language: en-US
To: Carwyn Ellis <carwynellis@gmail.com>, qemu-devel@nongnu.org
References: <20220102174153.70043-1-carwynellis@gmail.com>
 <20220102174153.70043-2-carwynellis@gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220102174153.70043-2-carwynellis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>

On 2022/01/03 2:41, Carwyn Ellis wrote:
> When switching between guest and host on a Mac using command-tab the
> command key is sent to the guest which can trigger functionality in the
> guest OS. Specifying left-command-key=off disables forwarding this key
> to the guest. Defaults to enabled.
> 
> Also updated the cocoa display documentation to reference the new
> left-command-key option along with the existing show-cursor option.
> 
> Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
> ---
>   qapi/ui.json    | 17 +++++++++++++++++
>   qemu-options.hx | 12 ++++++++++++
>   ui/cocoa.m      |  8 +++++++-
>   3 files changed, 36 insertions(+), 1 deletion(-)
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
> index fd1f8135fb..6fa9c38c83 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1912,6 +1912,9 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
>   #if defined(CONFIG_DBUS_DISPLAY)
>       "-display dbus[,addr=<dbusaddr>]\n"
>       "             [,gl=on|core|es|off][,rendernode=<file>]\n"
> +#endif
> +#if defined(CONFIG_COCOA)
> +    "-display cocoa[,show-cursor=on|off][,left-command-key=on|off]\n"
>   #endif
>       "-display none\n"
>       "                select display backend type\n"
> @@ -1999,6 +2002,15 @@ SRST
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
> index 69745c483b..01045d6698 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -95,6 +95,7 @@ static DisplayChangeListener dcl = {
>   };
>   static int last_buttons;
>   static int cursor_hide = 1;
> +static int left_command_key_enabled = 1;
>   
>   static int gArgc;
>   static char **gArgv;
> @@ -834,7 +835,8 @@ QemuCocoaView *cocoaView;
>                   /* Don't pass command key changes to guest unless mouse is grabbed */
>                   case kVK_Command:
>                       if (isMouseGrabbed &&
> -                        !!(modifiers & NSEventModifierFlagCommand)) {
> +                        !!(modifiers & NSEventModifierFlagCommand) &&
> +                        left_command_key_enabled) {
>                           [self toggleKey:Q_KEY_CODE_META_L];
>                       }
>                       break;
> @@ -2054,6 +2056,10 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
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


