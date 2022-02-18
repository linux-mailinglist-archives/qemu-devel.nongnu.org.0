Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1604BC120
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 21:23:34 +0100 (CET)
Received: from localhost ([::1]:59288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nL9mv-0006Hw-4H
	for lists+qemu-devel@lfdr.de; Fri, 18 Feb 2022 15:23:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nL9l2-0005PI-8F; Fri, 18 Feb 2022 15:21:36 -0500
Received: from [2607:f8b0:4864:20::52e] (port=39763
 helo=mail-pg1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nL9l0-0005bN-42; Fri, 18 Feb 2022 15:21:35 -0500
Received: by mail-pg1-x52e.google.com with SMTP id 195so8793480pgc.6;
 Fri, 18 Feb 2022 12:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VtfZvAJfej58Lvp7TkjPVI0/I5RNN6MMM7YBFUORGWM=;
 b=GmlaqfZyZ/1GEOlosxY4qdM897FBJgCY3yxKPvq5/Q1jH3WkFTOpd0tDB/LQ+MJ+2x
 KJiEf+yprArTCxH03EaU+qt2Ww6fsNjnjauYyPsZlKcqUqBt85uJjKq9gNZNDp/IfcXk
 jCzmrc1Tu0if508X1ogRS7K9unLQBZZartnhn0XZwuDrd4ScSIvMJhbvFmlDrr5pH1Nv
 MN8YWcJEELkt940LECaO1HouuvweCLPjW0uBbqRNHnTNXmH0/SPb9FNb3G6GUJDXtLKK
 5UMDtjPzCwwaiVaVYi57gGLqOEWyqL7qvQbeLroidnPz6ddLIqyUBODgKEAI9y2pHUe8
 gKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VtfZvAJfej58Lvp7TkjPVI0/I5RNN6MMM7YBFUORGWM=;
 b=J7ouAe7LVC7tF5+K1HpD4tsrc+W0oYfLvVQeFRbzD9a5FS4Ou35ZBFvFRjuG4Sqg1I
 egCdYJlCm0lfSM/50yfNeHnbW0uMSdQN5MLW40QDPuLcACZl/iG/jrlR1icboXgPZpf4
 hG1UvRHLnkSNYoJ1W5F/HhdvrG+rvgi7uji1W9sJys+Bi0wpH+KJJe9m89SOMxAP2FBC
 /SwmepWv/JrpMnu1/vVnskBFzOXZ0zDQ2xPVcfciHSPfNdlQi51SvgQ0w4jibtV2AGhn
 E93jI1Audw2v8u0SqJReBcGD/r9eYtbTY26b5CiBhx+dhaYo6n7C1OfhQwLXpdXy4eMl
 30og==
X-Gm-Message-State: AOAM532a4T9xvhlMAFUQxNwIKO+iT3AMfDLWKO5qIXdfJmtfx9ZLMy/9
 jmkNAIXD9VnGLdQ8ZwD/eOg=
X-Google-Smtp-Source: ABdhPJwjctH9qM59dzry4h4h9e59UbwbOIfhv8QtsPkZhXCg4NB5YsTWBLMexfstPf5vV5KrGeJZUg==
X-Received: by 2002:a63:4c50:0:b0:373:2a90:dc04 with SMTP id
 m16-20020a634c50000000b003732a90dc04mr7638860pgl.350.1645215692385; 
 Fri, 18 Feb 2022 12:21:32 -0800 (PST)
Received: from [192.168.209.175] (65.red-88-28-24.dynamicip.rima-tde.net.
 [88.28.24.65])
 by smtp.gmail.com with ESMTPSA id x12sm11431024pgp.25.2022.02.18.12.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 12:21:31 -0800 (PST)
Message-ID: <a32bb6e3-f7ea-b736-f5c5-95fbbd067a4d@amsat.org>
Date: Fri, 18 Feb 2022 21:21:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH 1/2] ui/cocoa: add option to disable left-command
 forwarding to guest
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Carwyn Ellis <carwynellis@gmail.com>
Cc: qemu-trivial@nongnu.org, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20220102174153.70043-1-carwynellis@gmail.com>
 <20220102174153.70043-2-carwynellis@gmail.com>
 <CAFEAcA9VDAOJf22RkF5nkKKcvDXWoJ=YmEKY13N_GULkZAwb-Q@mail.gmail.com>
In-Reply-To: <CAFEAcA9VDAOJf22RkF5nkKKcvDXWoJ=YmEKY13N_GULkZAwb-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 18/2/22 19:55, Peter Maydell wrote:
> On Sun, 2 Jan 2022 at 17:42, Carwyn Ellis <carwynellis@gmail.com> wrote:
>>
>> When switching between guest and host on a Mac using command-tab the
>> command key is sent to the guest which can trigger functionality in the
>> guest OS. Specifying left-command-key=off disables forwarding this key
>> to the guest. Defaults to enabled.
>>
>> Also updated the cocoa display documentation to reference the new
>> left-command-key option along with the existing show-cursor option.
>>
>> Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
> 
> Ccing the QAPI folks for review on the QAPI parts of this.
> 
> -- PMM
> 
>> ---
>>   qapi/ui.json    | 17 +++++++++++++++++
>>   qemu-options.hx | 12 ++++++++++++
>>   ui/cocoa.m      |  8 +++++++-
>>   3 files changed, 36 insertions(+), 1 deletion(-)
>>
>> diff --git a/qapi/ui.json b/qapi/ui.json
>> index 2b4371da37..764480e145 100644
>> --- a/qapi/ui.json
>> +++ b/qapi/ui.json
>> @@ -1107,6 +1107,22 @@
>>     'data'    : { '*grab-on-hover' : 'bool',
>>                   '*zoom-to-fit'   : 'bool'  } }
>>
>> +##
>> +# @DisplayCocoa:
>> +#
>> +# Cocoa display options.
>> +#
>> +# @left-command-key: Enable/disable forwarding of left command key to
>> +#                    guest. Allows command-tab window switching on the
>> +#                    host without sending this key to the guest when
>> +#                    "off". Defaults to "on"
>> +#
>> +# Since: 6.2.50

Not a QAPI folk, but LGTM using 7.0 here instead of 6.2.50 (this the
number of the *released* QEMU version which contains this new type).

>> +#
>> +##
>> +{ 'struct'  : 'DisplayCocoa',
>> +  'data'    : { '*left-command-key' : 'bool' } }
>> +
>>   ##
>>   # @DisplayEGLHeadless:
>>   #
>> @@ -1254,6 +1270,7 @@
>>     'discriminator' : 'type',
>>     'data'    : {
>>         'gtk': { 'type': 'DisplayGTK', 'if': 'CONFIG_GTK' },
>> +      'cocoa': { 'type': 'DisplayCocoa', 'if': 'CONFIG_COCOA' },
>>         'curses': { 'type': 'DisplayCurses', 'if': 'CONFIG_CURSES' },
>>         'egl-headless': { 'type': 'DisplayEGLHeadless',
>>                           'if': { 'all': ['CONFIG_OPENGL', 'CONFIG_GBM'] } },
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index fd1f8135fb..6fa9c38c83 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -1912,6 +1912,9 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
>>   #if defined(CONFIG_DBUS_DISPLAY)
>>       "-display dbus[,addr=<dbusaddr>]\n"
>>       "             [,gl=on|core|es|off][,rendernode=<file>]\n"
>> +#endif
>> +#if defined(CONFIG_COCOA)
>> +    "-display cocoa[,show-cursor=on|off][,left-command-key=on|off]\n"
>>   #endif
>>       "-display none\n"
>>       "                select display backend type\n"
>> @@ -1999,6 +2002,15 @@ SRST
>>           ``charset=CP850`` for IBM CP850 encoding. The default is
>>           ``CP437``.
>>
>> +    ``cocoa``
>> +        Display video output in a Cocoa window. Mac only. This interface
>> +        provides drop-down menus and other UI elements to configure and
>> +        control the VM during runtime. Valid parameters are:
>> +
>> +        ``show-cursor=on|off`` :  Force showing the mouse cursor
>> +
>> +        ``left-command-key=on|off`` : Disable forwarding left command key to host
>> +
>>       ``egl-headless[,rendernode=<file>]``
>>           Offload all OpenGL operations to a local DRI device. For any
>>           graphical display, this display needs to be paired with either
>> diff --git a/ui/cocoa.m b/ui/cocoa.m
>> index 69745c483b..01045d6698 100644
>> --- a/ui/cocoa.m
>> +++ b/ui/cocoa.m
>> @@ -95,6 +95,7 @@ static DisplayChangeListener dcl = {
>>   };
>>   static int last_buttons;
>>   static int cursor_hide = 1;
>> +static int left_command_key_enabled = 1;
>>
>>   static int gArgc;
>>   static char **gArgv;
>> @@ -834,7 +835,8 @@ QemuCocoaView *cocoaView;
>>                   /* Don't pass command key changes to guest unless mouse is grabbed */
>>                   case kVK_Command:
>>                       if (isMouseGrabbed &&
>> -                        !!(modifiers & NSEventModifierFlagCommand)) {
>> +                        !!(modifiers & NSEventModifierFlagCommand) &&
>> +                        left_command_key_enabled) {
>>                           [self toggleKey:Q_KEY_CODE_META_L];
>>                       }
>>                       break;
>> @@ -2054,6 +2056,10 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
>>           cursor_hide = 0;
>>       }
>>
>> +    if (opts->u.cocoa.has_left_command_key && !opts->u.cocoa.left_command_key) {
>> +        left_command_key_enabled = 0;
>> +    }
>> +
>>       // register vga output callbacks
>>       register_displaychangelistener(&dcl);
> 


