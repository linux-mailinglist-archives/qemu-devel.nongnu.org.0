Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52F6482579
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 18:53:06 +0100 (CET)
Received: from localhost ([::1]:43964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3M5R-0002cr-UE
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 12:53:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n3M4c-0001lC-II; Fri, 31 Dec 2021 12:52:14 -0500
Received: from [2a00:1450:4864:20::334] (port=38606
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n3M4a-0006b0-Ns; Fri, 31 Dec 2021 12:52:14 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 p1-20020a1c7401000000b00345c2d068bdso15230870wmc.3; 
 Fri, 31 Dec 2021 09:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=uua5GbI9GfwNreL+3XtnSKXp8bnZKd9Xwq64+nAEXK8=;
 b=U5/UzcN7TMiAM/vivUb4WZJSDYZyhswQnshvOo4V7X5J76nz2Bqqvwc+wEeQEgOQOd
 aJ5PME1t+1cDTuHQ/wVw35VqMJpcGhK82bUxxB8u3OZgrSYlBQ25pRz0gAtDy6jVA/iJ
 yjXjvNJdJWZF+aOThYCSWyKxxc6wXYkAvOMiRG5ZYITqxd7cmKkqP6Z6un1ZDwTct9kf
 XDZEiObzxcBBsfiNQlKLQ3KtxW2bKfprI7ae0e6eP5V0S/2o/eOKDDK8oIgajr1abJ5s
 b1OSf297sEMC0t/tWGKTDfWj2dqREOrd5Ir9UMobA2763ZBWOBWPrurngzLyespH8JPe
 ZxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=uua5GbI9GfwNreL+3XtnSKXp8bnZKd9Xwq64+nAEXK8=;
 b=iWd9vS2DGC7ok9ty5BaCxY2MdTkTSQd2BtuHwOFJs52xMsMP1Isor2V9VH+nAwsWQU
 kIf6/Vy8asLRD/wL3Yu181At5r6WDk85wkcOjEMDZsi3DfIO27GJRCIqmIuy4jC5BuBE
 8zMKqzvLnofCUTaHn8uUp3EIdX2btS8z1s7mfrYNDIHSmeVwTyqWGpktNwFX7HTBsowB
 u83vp4aj15UMaxgiBuwoCOFOEqaPaP1TpUUYuoPyWWvXoGxr3UTwnKanOVFOIBttdscd
 mpWaTnHypV4Qda5vWc+Dy7ojOE1XfEyl5eBRUeYTgTI1gWBfyUkDa6b2fLdOfwBfb/Gq
 nGqw==
X-Gm-Message-State: AOAM530FUqowj53nJhbpEF9ecKYVZUHqfrF4Q9YLTeaB2lxgy1QaXB2f
 O4YCuGXyLmJ4iIgSxlqDPuo=
X-Google-Smtp-Source: ABdhPJypoS4wc/Xv7aJ5/nmnmEoRAC+SipMzpaG62Ym5Fkap4JQCsylVnhCYLfsUPzWqtd3KVpFYbg==
X-Received: by 2002:a05:600c:a06:: with SMTP id
 z6mr30547966wmp.9.1640973130380; 
 Fri, 31 Dec 2021 09:52:10 -0800 (PST)
Received: from smtpclient.apple (201.11.75.194.dyn.plus.net. [194.75.11.201])
 by smtp.gmail.com with ESMTPSA id
 r20sm25579795wmd.37.2021.12.31.09.52.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 31 Dec 2021 09:52:10 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH 1/1] ui/cocoa: Add option to disable left command and hide
 cursor on click
From: Carwyn Ellis <carwynellis@gmail.com>
In-Reply-To: <5a66bde5-ad0a-a285-4208-82aa06c45a4e@gmail.com>
Date: Fri, 31 Dec 2021 17:52:09 +0000
Content-Transfer-Encoding: quoted-printable
Message-Id: <D12BE64A-5537-4CF7-AA1D-0C205B7824BE@gmail.com>
References: <20211231174210.82446-1-carwynellis@gmail.com>
 <20211231174210.82446-2-carwynellis@gmail.com>
 <5a66bde5-ad0a-a285-4208-82aa06c45a4e@gmail.com>
To: Alexander Orzechowski <orzechowski.alexander@gmail.com>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=carwynellis@gmail.com; helo=mail-wm1-x334.google.com
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

Ok cool, I=E2=80=99ll separate this out into 2 patches for the =
fullscreen and left-command changes respectively.=20

Will aim to get this out at some point tomorrow.

Cheers
Carwyn

> On 31 Dec 2021, at 17:49, Alexander Orzechowski =
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
> All the fullscreen stuff could be put into its own patch.


