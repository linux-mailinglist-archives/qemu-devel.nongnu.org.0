Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8243D3706AF
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 11:41:28 +0200 (CEST)
Received: from localhost ([::1]:47834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcm7r-0002sO-Li
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 05:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lcm5m-0001dz-I4
 for qemu-devel@nongnu.org; Sat, 01 May 2021 05:39:18 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:29141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lcm5i-0002DV-Ow
 for qemu-devel@nongnu.org; Sat, 01 May 2021 05:39:17 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 47B95745709;
 Sat,  1 May 2021 11:39:09 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9F5187456E3; Sat,  1 May 2021 11:39:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 9D86E7456B4;
 Sat,  1 May 2021 11:39:08 +0200 (CEST)
Date: Sat, 1 May 2021 11:39:08 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: gustavo@noronha.eti.br
Subject: Re: [PATCH v2 2/2] ui/cocoa: add option to swap Option and Command,
 enable by default
In-Reply-To: <20210430213806.81457-3-gustavo@noronha.eti.br>
Message-ID: <89cf53fd-989c-ad9b-2657-3171a8527eb6@eik.bme.hu>
References: <20210430213806.81457-1-gustavo@noronha.eti.br>
 <20210430213806.81457-3-gustavo@noronha.eti.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: 'Peter Maydell ' <peter.maydell@linaro.org>,
 'Gerd Hoffmann ' <kraxel@redhat.com>, qemu-devel@nongnu.org,
 'Markus Armbruster ' <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021, gustavo@noronha.eti.br wrote:
> From: Gustavo Noronha Silva <gustavo@noronha.eti.br>
>
> On Mac OS X the Option key maps to Alt and Command to Super/Meta. This change
> swaps them around so that Alt is the key closer to the space bar and Meta/Super
> is between Control and Alt, like on non-Mac keyboards.
>
> It is a cocoa display option, enabled by default.

Not sure it's a good idea to enable this by default. That mixes up the 
keyboard unexpectedly for those who don't need this and also different 
from previous behaviour so better to have this option enabled by those who 
want it than annoy everyone.

Regards,
BALATON Zoltan

> Acked-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Gustavo Noronha Silva <gustavo@noronha.eti.br>
> ---
> qapi/ui.json    |  8 ++++++-
> qemu-options.hx |  3 ++-
> ui/cocoa.m      | 64 ++++++++++++++++++++++++++++++++++++++++++-------
> 3 files changed, 65 insertions(+), 10 deletions(-)
>
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 4ccfae4bbb..ffd416a474 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1098,10 +1098,16 @@
> #             a global grab on key events. (default: off)
> #             See https://support.apple.com/en-in/guide/mac-help/mh32356/mac
> #
> +# @swap-option-command: Swap the Option and Command keys so that their key
> +#                       codes match their position on non-Mac keyboards and
> +#                       you can use Meta/Super and Alt where you expect them.
> +#                       (default: on)
> +#
> # Since: 6.1
> ##
> { 'struct'  : 'DisplayCocoa',
> -  'data'    : { '*full-grab'     : 'bool' } }
> +  'data'    : { '*full-grab'           : 'bool',
> +                '*swap-option-command' : 'bool' } }
>
> ##
> # @DisplayType:
> diff --git a/qemu-options.hx b/qemu-options.hx
> index a77505241f..6fcb0b6aaa 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1784,7 +1784,8 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
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
> index f1e4449082..73eb5080be 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -73,6 +73,7 @@
>     int width;
>     int height;
>     bool full_grab;
> +    bool swap_option_command;
> } QEMUScreen;
>
> static void cocoa_update(DisplayChangeListener *dcl,
> @@ -327,6 +328,7 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled;
> - (BOOL) isMouseGrabbed;
> - (BOOL) isAbsoluteEnabled;
> - (BOOL) isFullGrabEnabled;
> +- (BOOL) isSwapOptionCommandEnabled;
> - (float) cdx;
> - (float) cdy;
> - (QEMUScreen) gscreen;
> @@ -648,6 +650,13 @@ - (void) setFullGrab:(id)sender to:(BOOL)value
>     screen.full_grab = value;
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
> @@ -797,12 +806,22 @@ - (bool) handleEventLocked:(NSEvent *)event
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
> @@ -834,13 +853,21 @@ - (bool) handleEventLocked:(NSEvent *)event
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
> @@ -848,14 +875,22 @@ - (bool) handleEventLocked:(NSEvent *)event
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
> @@ -1085,6 +1120,7 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled {
> - (BOOL) isMouseGrabbed {return isMouseGrabbed;}
> - (BOOL) isAbsoluteEnabled {return isAbsoluteEnabled;}
> - (BOOL) isFullGrabEnabled {return screen.full_grab;}
> +- (BOOL) isSwapOptionCommandEnabled {return screen.swap_option_command;}
> - (float) cdx {return cdx;}
> - (float) cdy {return cdy;}
> - (QEMUScreen) gscreen {return screen;}
> @@ -1271,6 +1307,13 @@ - (void) setFullGrab:(id)sender to:(BOOL)value
>     [cocoaView setFullGrab:sender to:value];
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
> @@ -1953,6 +1996,11 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
>             [[controller delegate] setFullGrab: nil to:opts->u.cocoa.full_grab];
>         });
>     }
> +    if (!opts->u.cocoa.has_swap_option_command || opts->u.cocoa.swap_option_command) {
> +        dispatch_async(dispatch_get_main_queue(), ^{
> +            [[controller delegate] setSwapOptionCommand: nil];
> +        });
> +    }
>     if (opts->has_show_cursor && opts->show_cursor) {
>         cursor_hide = 0;
>     };
>

