Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2AD4CEBEE
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 15:28:31 +0100 (CET)
Received: from localhost ([::1]:46902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQrs6-00058x-Rh
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 09:28:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nQrrK-0004Ty-Hy
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 09:27:42 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:65308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nQrrI-0005GO-ID
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 09:27:42 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id D09D8746397;
 Sun,  6 Mar 2022 15:27:38 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 8F4B7746396; Sun,  6 Mar 2022 15:27:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8DDD07462D3;
 Sun,  6 Mar 2022 15:27:38 +0100 (CET)
Date: Sun, 6 Mar 2022 15:27:38 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2 2/2] ui/cocoa: add option to swap Option and Command
In-Reply-To: <20220306121119.45631-3-akihiko.odaki@gmail.com>
Message-ID: <667a025-24c2-2260-77e7-1957156d77f4@eik.bme.hu>
References: <20220306121119.45631-1-akihiko.odaki@gmail.com>
 <20220306121119.45631-3-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Gustavo Noronha Silva <gustavo@noronha.dev.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 6 Mar 2022, Akihiko Odaki wrote:
> From: Gustavo Noronha Silva <gustavo@noronha.dev.br>
>
> On Mac OS X the Option key maps to Alt and Command to Super/Meta. This change
> swaps them around so that Alt is the key closer to the space bar and Meta/Super
> is between Control and Alt, like on non-Mac keyboards.
>
> It is a cocoa display option, disabled by default.
>
> Acked-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Gustavo Noronha Silva <gustavo@noronha.dev.br>
> Message-Id: <20210713213200.2547-3-gustavo@noronha.dev.br>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
> qapi/ui.json    |  7 ++++++-
> qemu-options.hx |  2 +-
> ui/cocoa.m      | 46 ++++++++++++++++++++++++++++++++++++++--------
> 3 files changed, 45 insertions(+), 10 deletions(-)
>
> diff --git a/qapi/ui.json b/qapi/ui.json
> index ff0a04da792..e28339887e0 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1270,10 +1270,15 @@
> #             a global grab on key events. (default: off)
> #             See https://support.apple.com/en-in/guide/mac-help/mh32356/mac
> #
> +# @swap-opt-cmd: Swap the Option and Command keys so that their key codes match
> +#                their position on non-Mac keyboards and you can use Meta/Super
> +#                and Alt where you expect them. (default: off)
> +#
> # Since: 7.0
> ##
> { 'struct'  : 'DisplayCocoa',
> -  'data'    : { '*full-grab'     : 'bool' } }
> +  'data'    : { '*full-grab'           : 'bool',

Indentation off now that next line became shorter.

Regards,
BALATON Zoltan

> +                '*swap-opt-cmd' : 'bool' } }
>
> ##
> # @DisplayType:
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 4df9ccc3446..b57cbcb2c9e 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1917,7 +1917,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
>     "-display curses[,charset=<encoding>]\n"
> #endif
> #if defined(CONFIG_COCOA)
> -    "-display cocoa[,full_grab=on|off]\n"
> +    "-display cocoa[,full-grab=on|off][,swap-opt-cmd=on|off]\n"
> #endif
> #if defined(CONFIG_OPENGL)
>     "-display egl-headless[,rendernode=<file>]\n"
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index bfd602a96b9..ab9de404687 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -95,6 +95,7 @@ static void cocoa_switch(DisplayChangeListener *dcl,
> };
> static int last_buttons;
> static int cursor_hide = 1;
> +static bool swap_opt_cmd;
>
> static int gArgc;
> static char **gArgv;
> @@ -853,12 +854,22 @@ - (bool) handleEventLocked:(NSEvent *)event
>         qkbd_state_key_event(kbd, Q_KEY_CODE_CTRL_R, false);
>     }
>     if (!(modifiers & NSEventModifierFlagOption)) {
> -        qkbd_state_key_event(kbd, Q_KEY_CODE_ALT, false);
> -        qkbd_state_key_event(kbd, Q_KEY_CODE_ALT_R, false);
> +        if (swap_opt_cmd) {
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_META_L, false);
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_META_R, false);
> +        } else {
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_ALT, false);
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_ALT_R, false);
> +        }
>     }
>     if (!(modifiers & NSEventModifierFlagCommand)) {
> -        qkbd_state_key_event(kbd, Q_KEY_CODE_META_L, false);
> -        qkbd_state_key_event(kbd, Q_KEY_CODE_META_R, false);
> +        if (swap_opt_cmd) {
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_ALT, false);
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_ALT_R, false);
> +        } else {
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_META_L, false);
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_META_R, false);
> +        }
>     }
>
>     switch ([event type]) {
> @@ -890,13 +901,21 @@ - (bool) handleEventLocked:(NSEvent *)event
>
>                 case kVK_Option:
>                     if (!!(modifiers & NSEventModifierFlagOption)) {
> -                        [self toggleKey:Q_KEY_CODE_ALT];
> +                        if (swap_opt_cmd) {
> +                            [self toggleKey:Q_KEY_CODE_META_L];
> +                        } else {
> +                            [self toggleKey:Q_KEY_CODE_ALT];
> +                        }
>                     }
>                     break;
>
>                 case kVK_RightOption:
>                     if (!!(modifiers & NSEventModifierFlagOption)) {
> -                        [self toggleKey:Q_KEY_CODE_ALT_R];
> +                        if (swap_opt_cmd) {
> +                            [self toggleKey:Q_KEY_CODE_META_R];
> +                        } else {
> +                            [self toggleKey:Q_KEY_CODE_ALT_R];
> +                        }
>                     }
>                     break;
>
> @@ -904,14 +923,22 @@ - (bool) handleEventLocked:(NSEvent *)event
>                 case kVK_Command:
>                     if (isMouseGrabbed &&
>                         !!(modifiers & NSEventModifierFlagCommand)) {
> -                        [self toggleKey:Q_KEY_CODE_META_L];
> +                        if (swap_opt_cmd) {
> +                            [self toggleKey:Q_KEY_CODE_ALT];
> +                        } else {
> +                            [self toggleKey:Q_KEY_CODE_META_L];
> +                        }
>                     }
>                     break;
>
>                 case kVK_RightCommand:
>                     if (isMouseGrabbed &&
>                         !!(modifiers & NSEventModifierFlagCommand)) {
> -                        [self toggleKey:Q_KEY_CODE_META_R];
> +                        if (swap_opt_cmd) {
> +                            [self toggleKey:Q_KEY_CODE_ALT_R];
> +                        } else {
> +                            [self toggleKey:Q_KEY_CODE_META_R];
> +                        }
>                     }
>                     break;
>             }
> @@ -2130,6 +2157,9 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
>     if (opts->has_show_cursor && opts->show_cursor) {
>         cursor_hide = 0;
>     }
> +    if (opts->u.cocoa.has_swap_opt_cmd) {
> +        swap_opt_cmd = opts->u.cocoa.swap_opt_cmd;
> +    }
>
>     // register vga output callbacks
>     register_displaychangelistener(&dcl);
>

