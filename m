Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA4B37B461
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 05:08:34 +0200 (CEST)
Received: from localhost ([::1]:55744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgfEf-0000Bn-CD
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 23:08:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lgfD9-0007wp-8k
 for qemu-devel@nongnu.org; Tue, 11 May 2021 23:06:59 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:38600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lgfD7-00058P-8b
 for qemu-devel@nongnu.org; Tue, 11 May 2021 23:06:59 -0400
Received: by mail-ed1-x52f.google.com with SMTP id n25so25292011edr.5
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 20:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Yqppu2Z83mKaILMxHgzqCQQSmAB/TnbtDtLCx8BOCIo=;
 b=RsDw0kayOVNnKmm2LG8urEJQapUX4HoE51Wwy2ffC3/lGX9mwwb8z+/wFNTHPeP9ak
 LX2/UbDpRS7fpNIWj0Mio6QV2U2Fqmvy+o4Q2UcCOe9Z4fkSJCka5ugx1GUWCN87qLmj
 2FedFKeZVl4Te9dJ8SjPqAnajLJiU2ULRnM3OpWBc5BjZ7xgQUVUXtFfJaBQoxaGHTsy
 CmMfk3QW0kygjxVWOTGSfSP8ikXgN82peTybHLd1bYEzzPCXz35l2lCdx8gL3IcjPOIS
 58av/rhRaLBm+lR1FcNpW0UXvmPHxzF+FHPyLImafmcSKFHZKXFrNtxFiCgYowVXEvNW
 AS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Yqppu2Z83mKaILMxHgzqCQQSmAB/TnbtDtLCx8BOCIo=;
 b=PFt6vsk1UdMQZpYEuHC1W8UABHjSV1ypxl0Zl1lK1Y9nIBxSzAkeUDYvTOzf3lT9eU
 gsHmUEW/ir4F0zoXOgAKs5yX181dtsg4aoMJ4Q0yzUnG27xN/MROYS2L2mbrePSit1rh
 AJfSKJJNTCgkRtkaXHH76279+lv/WMZ4G2VoH5V15ArvnT2Hj4jgBAoh1pZ8ZNt/CQsc
 TKoSQMqtTTZiGewfucnCrQCtKzGHDTD/kmdkXGvY6FTBEsk8HpujEqkdqNdlCFkBbPIp
 ieJlAplvXFvTM2lWmAfShJjSanDJOZiEbNd+PPYY22XInNL4x5HzY2Gp7Uw144xm+4Qa
 hv/Q==
X-Gm-Message-State: AOAM531ACXgApXLVVEvAJ6sYu8bkwcFFT16BnuBxlBgzeNm2eXVdMqwa
 N4MIyCE7+xbPNjLjl2ORati+R4aoGkXRDQ0m9WM=
X-Google-Smtp-Source: ABdhPJxU7tCgYXfw1w3pkQnuzNSsDXzHfE/ycnH/upFFPVXJQexGXvZE07geesBxzIC4bqtgMNLuByT9fVdU1lQ+pvE=
X-Received: by 2002:a05:6402:268f:: with SMTP id
 w15mr39585722edd.321.1620788813478; 
 Tue, 11 May 2021 20:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210511185538.29344-1-gustavo@noronha.eti.br>
 <20210511185538.29344-3-gustavo@noronha.eti.br>
In-Reply-To: <20210511185538.29344-3-gustavo@noronha.eti.br>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Wed, 12 May 2021 12:06:42 +0900
Message-ID: <CAMVc7JUQSM=9Nkyv-EZ86iozfyD6otocCjY3quOwzPMavNuL2Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] ui/cocoa: add option to swap Option and Command
To: gustavo@noronha.eti.br
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu Developers <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>

I applied them to my personal tree:
https://github.com/akihikodaki/qemu/tree/macos

2021=E5=B9=B45=E6=9C=8812=E6=97=A5(=E6=B0=B4) 3:56 <gustavo@noronha.eti.br>=
:
>
> From: Gustavo Noronha Silva <gustavo@noronha.eti.br>
>
> On Mac OS X the Option key maps to Alt and Command to Super/Meta. This ch=
ange
> swaps them around so that Alt is the key closer to the space bar and Meta=
/Super
> is between Control and Alt, like on non-Mac keyboards.
>
> It is a cocoa display option, disabled by default.
>
> Acked-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Gustavo Noronha Silva <gustavo@noronha.eti.br>
> ---
>  qapi/ui.json    |  8 ++++++-
>  qemu-options.hx |  3 ++-
>  ui/cocoa.m      | 64 ++++++++++++++++++++++++++++++++++++++++++-------
>  3 files changed, 65 insertions(+), 10 deletions(-)
>
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 4ccfae4bbb..ee6fde46d5 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1098,10 +1098,16 @@
>  #             a global grab on key events. (default: off)
>  #             See https://support.apple.com/en-in/guide/mac-help/mh32356=
/mac
>  #
> +# @swap-option-command: Swap the Option and Command keys so that their k=
ey
> +#                       codes match their position on non-Mac keyboards =
and
> +#                       you can use Meta/Super and Alt where you expect =
them.
> +#                       (default: off)
> +#
>  # Since: 6.1
>  ##
>  { 'struct'  : 'DisplayCocoa',
> -  'data'    : { '*full-grab'     : 'bool' } }
> +  'data'    : { '*full-grab'           : 'bool',
> +                '*swap-option-command' : 'bool' } }
>
>  ##
>  # @DisplayType:
> diff --git a/qemu-options.hx b/qemu-options.hx
> index eeaa5c73e9..e0e93724b1 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1784,7 +1784,8 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
>      "-display curses[,charset=3D<encoding>]\n"
>  #endif
>  #if defined(CONFIG_COCOA)
> -    "-display cocoa[,full_grab=3Don|off]\n"
> +    "-display cocoa[,full-grab=3Don|off]\n"
> +    "              [,swap-option-command=3Don|off]\n"
>  #endif
>  #if defined(CONFIG_OPENGL)
>      "-display egl-headless[,rendernode=3D<file>]\n"
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 236352deac..995301502b 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -72,6 +72,7 @@
>  typedef struct {
>      int width;
>      int height;
> +    bool swap_option_command;
>  } QEMUScreen;
>
>  static void cocoa_update(DisplayChangeListener *dcl,
> @@ -325,6 +326,7 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnabled;
>   */
>  - (BOOL) isMouseGrabbed;
>  - (BOOL) isAbsoluteEnabled;
> +- (BOOL) isSwapOptionCommandEnabled;
>  - (float) cdx;
>  - (float) cdy;
>  - (QEMUScreen) gscreen;
> @@ -643,6 +645,13 @@ - (void) setFullGrab:(id)sender
>      CFRelease(tapEventsSrc);
>  }
>
> +- (void) setSwapOptionCommand:(id)sender
> +{
> +    COCOA_DEBUG("QemuCocoaView: setSwapOptionCommand\n");
> +
> +    screen.swap_option_command =3D true;
> +}
> +
>  - (void) toggleKey: (int)keycode {
>      qkbd_state_key_event(kbd, keycode, !qkbd_state_key_get(kbd, keycode)=
);
>  }
> @@ -792,12 +801,22 @@ - (bool) handleEventLocked:(NSEvent *)event
>          qkbd_state_key_event(kbd, Q_KEY_CODE_CTRL_R, false);
>      }
>      if (!(modifiers & NSEventModifierFlagOption)) {
> -        qkbd_state_key_event(kbd, Q_KEY_CODE_ALT, false);
> -        qkbd_state_key_event(kbd, Q_KEY_CODE_ALT_R, false);
> +        if ([self isSwapOptionCommandEnabled]) {
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
> +        if ([self isSwapOptionCommandEnabled]) {
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_ALT, false);
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_ALT_R, false);
> +        } else {
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_META_L, false);
> +            qkbd_state_key_event(kbd, Q_KEY_CODE_META_R, false);
> +        }
>      }
>
>      switch ([event type]) {
> @@ -829,13 +848,21 @@ - (bool) handleEventLocked:(NSEvent *)event
>
>                  case kVK_Option:
>                      if (!!(modifiers & NSEventModifierFlagOption)) {
> -                        [self toggleKey:Q_KEY_CODE_ALT];
> +                        if ([self isSwapOptionCommandEnabled]) {
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
> +                        if ([self isSwapOptionCommandEnabled]) {
> +                            [self toggleKey:Q_KEY_CODE_META_R];
> +                        } else {
> +                            [self toggleKey:Q_KEY_CODE_ALT_R];
> +                        }
>                      }
>                      break;
>
> @@ -843,14 +870,22 @@ - (bool) handleEventLocked:(NSEvent *)event
>                  case kVK_Command:
>                      if (isMouseGrabbed &&
>                          !!(modifiers & NSEventModifierFlagCommand)) {
> -                        [self toggleKey:Q_KEY_CODE_META_L];
> +                        if ([self isSwapOptionCommandEnabled]) {
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
> +                        if ([self isSwapOptionCommandEnabled]) {
> +                            [self toggleKey:Q_KEY_CODE_ALT_R];
> +                        } else {
> +                            [self toggleKey:Q_KEY_CODE_META_R];
> +                        }
>                      }
>                      break;
>              }
> @@ -1079,6 +1114,7 @@ - (void) setAbsoluteEnabled:(BOOL)tIsAbsoluteEnable=
d {
>  }
>  - (BOOL) isMouseGrabbed {return isMouseGrabbed;}
>  - (BOOL) isAbsoluteEnabled {return isAbsoluteEnabled;}
> +- (BOOL) isSwapOptionCommandEnabled {return screen.swap_option_command;}
>  - (float) cdx {return cdx;}
>  - (float) cdy {return cdy;}
>  - (QEMUScreen) gscreen {return screen;}
> @@ -1265,6 +1301,13 @@ - (void) setFullGrab:(id)sender
>      [cocoaView setFullGrab:sender];
>  }
>
> +- (void) setSwapOptionCommand:(id)sender
> +{
> +    COCOA_DEBUG("QemuCocoaAppController: setSwapOptionCommand\n");
> +
> +    [cocoaView setSwapOptionCommand:sender];
> +}
> +
>  /* Tries to find then open the specified filename */
>  - (void) openDocumentation: (NSString *) filename
>  {
> @@ -1947,6 +1990,11 @@ static void cocoa_display_init(DisplayState *ds, D=
isplayOptions *opts)
>              [[controller delegate] setFullGrab: nil];
>          });
>      }
> +    if (opts->u.cocoa.has_swap_option_command && opts->u.cocoa.swap_opti=
on_command) {
> +        dispatch_async(dispatch_get_main_queue(), ^{
> +            [[controller delegate] setSwapOptionCommand: nil];
> +        });
> +    }
>      if (opts->has_show_cursor && opts->show_cursor) {
>          cursor_hide =3D 0;
>      }
> --
> 2.30.1 (Apple Git-130)
>

