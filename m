Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF1A4CEB66
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 12:49:32 +0100 (CET)
Received: from localhost ([::1]:35340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQpOE-00033W-Vv
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 06:49:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nQpL0-0002LW-E7
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 06:46:14 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:53800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1nQpKx-0006BP-8N
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 06:46:09 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 91B7C7462D3;
 Sun,  6 Mar 2022 12:46:04 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id DD458745708; Sun,  6 Mar 2022 12:46:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D79F47456FE;
 Sun,  6 Mar 2022 12:46:03 +0100 (CET)
Date: Sun, 6 Mar 2022 12:46:03 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH 2/2] ui/cocoa: add option to swap Option and Command
In-Reply-To: <20220306111114.18285-3-akihiko.odaki@gmail.com>
Message-ID: <a2a389c-b253-133b-9415-ecc5a352c2e@eik.bme.hu>
References: <20220306111114.18285-1-akihiko.odaki@gmail.com>
 <20220306111114.18285-3-akihiko.odaki@gmail.com>
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
> qapi/ui.json    |  8 ++++++-
> qemu-options.hx |  3 ++-
> ui/cocoa.m      | 64 ++++++++++++++++++++++++++++++++++++++++++-------
> 3 files changed, 65 insertions(+), 10 deletions(-)
>
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 1e9893419fe..b082e1a7dee 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1270,10 +1270,16 @@
> #             a global grab on key events. (default: off)
> #             See https://support.apple.com/en-in/guide/mac-help/mh32356/mac
> #
> +# @swap-option-command: Swap the Option and Command keys so that their key
> +#                       codes match their position on non-Mac keyboards and
> +#                       you can use Meta/Super and Alt where you expect them.
> +#                       (default: off)
> +#
> # Since: 6.1
> ##
> { 'struct'  : 'DisplayCocoa',
> -  'data'    : { '*full-grab'     : 'bool' } }
> +  'data'    : { '*full-grab'           : 'bool',
> +                '*swap-option-command' : 'bool' } }

This option name is too long to type. Could we abbreviate it somehow? Like 
swap-opt-cmd or swap-alt-meta?

Regards,
BALATON Zoltan

> ##
> # @DisplayType:
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 4df9ccc3446..8431445e9c0 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1917,7 +1917,8 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
>     "-display curses[,charset=<encoding>]\n"
> #endif
> #if defined(CONFIG_COCOA)
> -    "-display cocoa[,full_grab=on|off]\n"
> +    "-display cocoa[,full-grab=on|off]\n"
> +    "              [,swap-option-command=on|off]\n"
> #endif
> #if defined(CONFIG_OPENGL)
>     "-display egl-headless[,rendernode=<file>]\n"
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index c41bc615d33..b152d3a1563 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -73,6 +73,7 @@
> typedef struct {
>     int width;
>     int height;
> +    bool swap_option_command;
> } QEMUScreen;
>
> static void cocoa_update(DisplayChangeListener *dcl,
> @@ -329,6 +330,7 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled;
>  */
> - (BOOL) isMouseGrabbed;
> - (BOOL) isAbsoluteEnabled;
> +- (BOOL) isSwapOptionCommandEnabled;
> - (float) cdx;
> - (float) cdy;
> - (QEMUScreen) gscreen;
> @@ -704,6 +706,13 @@ - (void) setFullGrab:(id)sender
>     CFRelease(tapEventsSrc);
> }
>
> +- (void) setSwapOptionCommand:(id)sender
> +{
> +    COCOA_DEBUG("QemuCocoaView: setSwapOptionCommand\n");
> +
> +    screen.swap_option_command = true;
> +}
> +
> - (void) toggleKey: (int)keycode {
>     qkbd_state_key_event(kbd, keycode, !qkbd_state_key_get(kbd, keycode));
> }
> @@ -853,12 +862,22 @@ - (bool) handleEventLocked:(NSEvent *)event
>         qkbd_state_key_event(kbd, Q_KEY_CODE_CTRL_R, false);
>     }
>     if (!(modifiers & NSEventModifierFlagOption)) {
> -        qkbd_state_key_event(kbd, Q_KEY_CODE_ALT, false);
> -        qkbd_state_key_event(kbd, Q_KEY_CODE_ALT_R, false);
> +        if ([self isSwapOptionCommandEnabled]) {
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
> +        if ([self isSwapOptionCommandEnabled]) {
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_ALT, false);
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_ALT_R, false);
> +        } else {
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_META_L, false);
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_META_R, false);
> +        }
>     }
>
>     switch ([event type]) {
> @@ -890,13 +909,21 @@ - (bool) handleEventLocked:(NSEvent *)event
>
>                 case kVK_Option:
>                     if (!!(modifiers & NSEventModifierFlagOption)) {
> -                        [self toggleKey:Q_KEY_CODE_ALT];
> +                        if ([self isSwapOptionCommandEnabled]) {
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
> +                        if ([self isSwapOptionCommandEnabled]) {
> +                            [self toggleKey:Q_KEY_CODE_META_R];
> +                        } else {
> +                            [self toggleKey:Q_KEY_CODE_ALT_R];
> +                        }
>                     }
>                     break;
>
> @@ -904,14 +931,22 @@ - (bool) handleEventLocked:(NSEvent *)event
>                 case kVK_Command:
>                     if (isMouseGrabbed &&
>                         !!(modifiers & NSEventModifierFlagCommand)) {
> -                        [self toggleKey:Q_KEY_CODE_META_L];
> +                        if ([self isSwapOptionCommandEnabled]) {
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
> +                        if ([self isSwapOptionCommandEnabled]) {
> +                            [self toggleKey:Q_KEY_CODE_ALT_R];
> +                        } else {
> +                            [self toggleKey:Q_KEY_CODE_META_R];
> +                        }
>                     }
>                     break;
>             }
> @@ -1146,6 +1181,7 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled {
> }
> - (BOOL) isMouseGrabbed {return isMouseGrabbed;}
> - (BOOL) isAbsoluteEnabled {return isAbsoluteEnabled;}
> +- (BOOL) isSwapOptionCommandEnabled {return screen.swap_option_command;}
> - (float) cdx {return cdx;}
> - (float) cdy {return cdy;}
> - (QEMUScreen) gscreen {return screen;}
> @@ -1338,6 +1374,13 @@ - (void) setFullGrab:(id)sender
>     [cocoaView setFullGrab:sender];
> }
>
> +- (void) setSwapOptionCommand:(id)sender
> +{
> +    COCOA_DEBUG("QemuCocoaAppController: setSwapOptionCommand\n");
> +
> +    [cocoaView setSwapOptionCommand:sender];
> +}
> +
> /* Tries to find then open the specified filename */
> - (void) openDocumentation: (NSString *) filename
> {
> @@ -2127,6 +2170,11 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
>             [controller setFullGrab: nil];
>         });
>     }
> +    if (opts->u.cocoa.has_swap_option_command && opts->u.cocoa.swap_option_command) {
> +        dispatch_async(dispatch_get_main_queue(), ^{
> +            [controller setSwapOptionCommand: nil];
> +        });
> +    }
>     if (opts->has_show_cursor && opts->show_cursor) {
>         cursor_hide = 0;
>     }
>

