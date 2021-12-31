Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C655348257B
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 18:59:00 +0100 (CET)
Received: from localhost ([::1]:49400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3MB9-0006T7-Ue
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 12:58:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n3M9m-0005Ah-Dc; Fri, 31 Dec 2021 12:57:37 -0500
Received: from [2a00:1450:4864:20::433] (port=42707
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n3M9k-0007DX-JK; Fri, 31 Dec 2021 12:57:34 -0500
Received: by mail-wr1-x433.google.com with SMTP id w20so48080115wra.9;
 Fri, 31 Dec 2021 09:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=TzO2Ewgbpo1AJycJs/9RoIRu41NSl8PQOCvyCTEEqaE=;
 b=iuF27G2giGErRYA7SxVsA9S0aptbmYaHl1dmnP8PD1W0HBwhs2l+cHzeSmp6vDTsy6
 VZ0gCJC0/N1sdh0kjJnu+3gBsLsjegxH/WxSsOTqFWplxxZfLNo5QPrlTZA07NXglwAp
 E4AcCq5mPunpOOT41ia1BGNf+JSqYJSFYoiZ+SqhSP04cuh3dBAh04XabMTyBgUdkOhf
 zj9WtLnLaIhNTC/7/ZJCjcvKM3rACqOF+ZCESBc3ZzQQy12VE3z4ZcWMC8y5idOYCFo4
 B7oqGBU1FDM8QMe7U4Livbg+ZaAs1A9jFeNlQj+BQjzuWEAJD5/+bY0Z8ZC56CHSjIaQ
 OQpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=TzO2Ewgbpo1AJycJs/9RoIRu41NSl8PQOCvyCTEEqaE=;
 b=nzZEw++nlj+eq/KNi/3IGovK8qBwDNWIN6ge9rpraprwree+x23nIpV9EhCY7qJz0F
 opcGAM80u5aVe17tPKZwhPdun3vYWPMgwNUlElhjHLIZXqidfGy6bBI7UV+M6t1pPbWb
 f03DgpFyYZp10fUjhps74u8GteAGKxuRjMNpFbAe4ifgkKGp7mjYth4FAdX6Sfh4/t1t
 blG3oFWocYBwwgAQ9i2+GrH5QJMxGRzFW/KbEHNUNHp1UGMik5vHk9FY2EYIAewSKUDl
 LVj1O1ZwShVCEam1hb3XwtCZqEtlv1+Hxg6KQW9euD1sFp22YcNjzOqdEi3OKQ2MR6uN
 q9sw==
X-Gm-Message-State: AOAM533NFCLh7oZkMIFW0F9aCWEK9JBr+oCqBWKec0iygg3tOdDN7IkY
 fcwA+7gNnJynOu/M3j6VTOs=
X-Google-Smtp-Source: ABdhPJxMbKP2+fSfyV0mOZuf3secrGp4Uv0p0hPefr/0keN78Hace6pxQWkuSbUWOXM9v8/lwM9G/A==
X-Received: by 2002:adf:f94e:: with SMTP id q14mr6661724wrr.526.1640973450832; 
 Fri, 31 Dec 2021 09:57:30 -0800 (PST)
Received: from smtpclient.apple (201.11.75.194.dyn.plus.net. [194.75.11.201])
 by smtp.gmail.com with ESMTPSA id
 n4sm27822306wrc.1.2021.12.31.09.57.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 31 Dec 2021 09:57:30 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH 1/1] ui/cocoa: Add option to disable left command and hide
 cursor on click
From: Carwyn Ellis <carwynellis@gmail.com>
In-Reply-To: <d04fabe5-a8ac-621b-75ee-a8f17b1745cb@gmail.com>
Date: Fri, 31 Dec 2021 17:57:29 +0000
Content-Transfer-Encoding: quoted-printable
Message-Id: <10E9A0FC-A111-4E74-90AD-FAD82BB177E5@gmail.com>
References: <20211231174210.82446-1-carwynellis@gmail.com>
 <20211231174210.82446-2-carwynellis@gmail.com>
 <d04fabe5-a8ac-621b-75ee-a8f17b1745cb@gmail.com>
To: Alexander Orzechowski <orzechowski.alexander@gmail.com>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=carwynellis@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



> On 31 Dec 2021, at 17:56, Alexander Orzechowski =
<orzechowski.alexander@gmail.com> wrote:
>=20
>=20
> On 12/31/21 12:42, Carwyn Ellis wrote:
>> When switching between guest and host on a Mac using command-tab the
>> command key is sent to the guest which can trigger functionality in =
the
>> guest OS. Specifying left-command-key=3Doff disables forwarding this =
key
>> to the guest. Defaults to enabled.
>>=20
>> When switching between guest and host on a Mac with a fullscreen =
guest
>> the host pointer will occasionally persist despite the ui code
>> requesting that it be hidden. Added cursor hide calls on left and =
right
>> mouse click to hide the cursor when the mouse is clicked.
>>=20
>> Also updated the cocoa display documentation to reference the new
>> left-command-key option along with the existing show-cursor option.
>> ---
>>  qapi/ui.json    | 17 +++++++++++++++++
>>  qemu-options.hx | 12 ++++++++++++
>>  ui/cocoa.m      | 33 +++++++++++++++++++++++++--------
>>  3 files changed, 54 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/qapi/ui.json b/qapi/ui.json
>> index 2b4371da37..764480e145 100644
>> --- a/qapi/ui.json
>> +++ b/qapi/ui.json
>> @@ -1107,6 +1107,22 @@
>>    'data'    : { '*grab-on-hover' : 'bool',
>>                  '*zoom-to-fit'   : 'bool'  } }
>>  +##
>> +# @DisplayCocoa:
>> +#
>> +# Cocoa display options.
>> +#
>> +# @left-command-key: Enable/disable forwarding of left command key =
to
>> +#                    guest. Allows command-tab window switching on =
the
>> +#                    host without sending this key to the guest when
>> +#                    "off". Defaults to "on"
>> +#
>> +# Since: 6.2.50
>> +#
>> +##
>> +{ 'struct'  : 'DisplayCocoa',
>> +  'data'    : { '*left-command-key' : 'bool' } }
>> +
>>  ##
>>  # @DisplayEGLHeadless:
>>  #
>> @@ -1254,6 +1270,7 @@
>>    'discriminator' : 'type',
>>    'data'    : {
>>        'gtk': { 'type': 'DisplayGTK', 'if': 'CONFIG_GTK' },
>> +      'cocoa': { 'type': 'DisplayCocoa', 'if': 'CONFIG_COCOA' },
>>        'curses': { 'type': 'DisplayCurses', 'if': 'CONFIG_CURSES' },
>>        'egl-headless': { 'type': 'DisplayEGLHeadless',
>>                          'if': { 'all': ['CONFIG_OPENGL', =
'CONFIG_GBM'] } },
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 7d47510947..5214457676 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -1869,6 +1869,9 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
>>  #if defined(CONFIG_DBUS_DISPLAY)
>>      "-display dbus[,addr=3D<dbusaddr>]\n"
>>      "             [,gl=3Don|core|es|off][,rendernode=3D<file>]\n"
>> +#endif
>> +#if defined(CONFIG_COCOA)
>> +    "-display =
cocoa[,show-cursor=3Don|off][,left-command-key=3Don|off]\n"
>>  #endif
>>      "-display none\n"
>>      "                select display backend type\n"
>> @@ -1956,6 +1959,15 @@ SRST
>>          ``charset=3DCP850`` for IBM CP850 encoding. The default is
>>          ``CP437``.
>>  +    ``cocoa``
>> +        Display video output in a Cocoa window. Mac only. This =
interface
>> +        provides drop-down menus and other UI elements to configure =
and
>> +        control the VM during runtime. Valid parameters are:
>> +
>> +        ``show-cursor=3Don|off`` :  Force showing the mouse cursor
>> +
>> +        ``left-command-key=3Don|off`` : Disable forwarding left =
command key to host
>> +
>>      ``egl-headless[,rendernode=3D<file>]``
>>          Offload all OpenGL operations to a local DRI device. For any
>>          graphical display, this display needs to be paired with =
either
>> diff --git a/ui/cocoa.m b/ui/cocoa.m
>> index 69745c483b..10e492538a 100644
>> --- a/ui/cocoa.m
>> +++ b/ui/cocoa.m
>> @@ -95,6 +95,8 @@ static DisplayChangeListener dcl =3D {
>>  };
>>  static int last_buttons;
>>  static int cursor_hide =3D 1;
>> +static bool cursor_visible =3D 1;
>> +static int left_command_key_enabled =3D 1;
>>    static int gArgc;
>>  static char **gArgv;
>> @@ -411,18 +413,18 @@ QemuCocoaView *cocoaView;
>>    - (void) hideCursor
>>  {
>> -    if (!cursor_hide) {
>> -        return;
>> +    if (cursor_hide && cursor_visible) {
>> +        cursor_visible =3D 0;
>> +        [NSCursor hide];
>>      }
>> -    [NSCursor hide];
>>  }
>>    - (void) unhideCursor
>>  {
>> -    if (!cursor_hide) {
>> -        return;
>> +    if (cursor_hide && !cursor_visible) {
>> +        cursor_visible =3D 1;
>> +        [NSCursor unhide];
>>      }
>> -    [NSCursor unhide];
>>  }
>>    - (void) drawRect:(NSRect) rect
>> @@ -831,10 +833,14 @@ QemuCocoaView *cocoaView;
>>                      }
>>                      break;
>>  -                /* Don't pass command key changes to guest unless =
mouse is grabbed */
>> +                /*
>> +                    Don't pass command key changes to guest unless =
mouse is grabbed
>> +                    or the key is explicitly disabled using the =
left-command-key option
>> +                */
>>                  case kVK_Command:
>>                      if (isMouseGrabbed &&
>> -                        !!(modifiers & NSEventModifierFlagCommand)) =
{
>> +                        !!(modifiers & NSEventModifierFlagCommand) =
&&
>> +                        left_command_key_enabled) {
>>                          [self toggleKey:Q_KEY_CODE_META_L];
>>                      }
>>                      break;
>> @@ -923,10 +929,16 @@ QemuCocoaView *cocoaView;
>>          case NSEventTypeLeftMouseDown:
>>              buttons |=3D MOUSE_EVENT_LBUTTON;
>>              mouse_event =3D true;
>> +            if (isFullscreen) {
>> +                [self hideCursor];
>> +            }
>>              break;
>>          case NSEventTypeRightMouseDown:
>>              buttons |=3D MOUSE_EVENT_RBUTTON;
>>              mouse_event =3D true;
>> +            if (isFullscreen) {
>> +                [self hideCursor];
>> +            }
>>              break;
>>          case NSEventTypeOtherMouseDown:
>>              buttons |=3D MOUSE_EVENT_MBUTTON;
>> @@ -2050,10 +2062,15 @@ static void cocoa_display_init(DisplayState =
*ds, DisplayOptions *opts)
>>              [(QemuCocoaAppController *)[[NSApplication =
sharedApplication] delegate] toggleFullScreen: nil];
>>          });
>>      }
>> +
>>      if (opts->has_show_cursor && opts->show_cursor) {
>>          cursor_hide =3D 0;
>>      }
>>  +    if (opts->u.cocoa.has_left_command_key && =
!opts->u.cocoa.left_command_key) {
>> +        left_command_key_enabled =3D 0;
>> +    }
>> +
>>      // register vga output callbacks
>>      register_displaychangelistener(&dcl);
>> =20
>=20
> You also forgot about the sign off. git commit with a -s switch will =
append the appropriate sign off message.
>=20
> All patches need to be signed off so we know you are okay with them =
going upstream.
>=20

Good point! Will make sure that=E2=80=99s in on the next set of patches.=20=



