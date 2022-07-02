Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5235640BB
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 16:32:25 +0200 (CEST)
Received: from localhost ([::1]:50520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7eAa-0004m3-6B
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 10:32:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o7e8g-0003fz-Dh
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 10:30:26 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:39554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1o7e8e-0002F0-5S
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 10:30:25 -0400
Received: by mail-pf1-x42e.google.com with SMTP id r6so715034pfq.6
 for <qemu-devel@nongnu.org>; Sat, 02 Jul 2022 07:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=J5znrgzRnYoVOojsgSudSLl8rzNEfebchgG3b7J5xzc=;
 b=IWd2X+jrCNHV7+w89rCEmh1fq0ylvBrIaYE/DgJ1huPPF8nHGkC1LKTat2svHULawf
 B6WUAiLLMbnMYjon0vceViPeYL5+IFV4e93kC03/C3jB1PnzNJz2pB3YYzCaAdCj/iIJ
 RKJe6gXE/5whps8+taIuxPycQBlMEtkTwnSetDUfv/+IXYzODgm7o+faX1bi24TdBpKp
 3vJ+D6zHy0Bs019LyzF/9sIKdWGVgHWp+zuJQR7mq4uX1vuBmOrgYL8yoK6zIPKs7Kew
 gbqkcPo5IrVmqRgxfoF01GeywSlrkAmAs3HwD2bl+yO2U7IJanIDClyxf6L6J98WM5o/
 nPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=J5znrgzRnYoVOojsgSudSLl8rzNEfebchgG3b7J5xzc=;
 b=ueIohhVlwRaAsAh8T6GZuya3uPhWRU1+ustH5hFAKeztNtNkIj0S9EaBRbhHHruHAM
 YdbMej2/kvfr9UYUAno5Tpl6f8BaxgF5TIr29zWr0xjj2uLij5/HtLEIcnznIvHXEyrk
 HW07KBPov5FRJSIduvz99Vafvx+Nn70IpdFPTf9phrkIxA6els1PwFqfeN07MQRbjUNd
 B7Olb1L5jU0uLfG8WgtsLrt9tOiW26YJbAeSGpWiC33NiRX7kcSLzBPT7f8DUS2TGvHz
 Tr+7iLpslJdaza9Hx+cx+dzAmFKL5njWMbRG5z2pj0JpisIt5t8rkEzcM8OdQeOWELSP
 0VGA==
X-Gm-Message-State: AJIora8x3xjUIeNiIVvUkEPmDsCrRZGrNX63BrUPoWqyodH1gD56de+o
 Z62MMVc5hHYTsCtqqOwqWto=
X-Google-Smtp-Source: AGRyM1up5hU0ze56S2XJLUucY6wloyyLvvf9GCjZC1sov1Ps/BVcmLmOKXGJ6H2LVC8sXel6F6Cw3A==
X-Received: by 2002:a05:6a00:d9b:b0:525:6b81:4f14 with SMTP id
 bf27-20020a056a000d9b00b005256b814f14mr25763253pfb.38.1656772222825; 
 Sat, 02 Jul 2022 07:30:22 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 j19-20020aa78013000000b00525203c2847sm17760374pfi.128.2022.07.02.07.30.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 07:30:21 -0700 (PDT)
Message-ID: <8e54f374-d4bc-36f1-6d1c-470853174aaa@gmail.com>
Date: Sat, 2 Jul 2022 23:30:16 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] ui/cocoa: Fix switched_to_fullscreen warning
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, f4bug@amsat.org,
 kraxel@redhat.com
References: <20220702044304.90553-1-peter@pjd.dev>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220702044304.90553-1-peter@pjd.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>

On 2022/07/02 13:43, Peter Delevoryas wrote:
> I noticed this error while building QEMU on Mac OS X:
> 
>      [1040/1660] Compiling Objective-C object libcommon.fa.p/ui_cocoa.m.o
>      ../ui/cocoa.m:803:17: warning: variable 'switched_to_fullscreen' set but not used [-Wunused-but-set-variable]
>          static bool switched_to_fullscreen = false;
>                      ^
>      1 warning generated.
> 
> I think the behavior is fine if you remove "switched_to_fullscreen", I can
> still switch in and out of mouse grabbed mode and fullscreen mode with this
> change, and Command keycodes will only be passed to the guest if the mouse
> is grabbed, which I think is the right behavior. I'm not sure why a static
> piece of state was needed to handle that in the first place. Perhaps the
> refactoring of the flags-state-change fixed that by toggling the Command
> keycode on.
> 
> I tested this with an Ubuntu core image on macOS 12.4
> 
>      wget https://cdimage.ubuntu.com/ubuntu-core/18/stable/current/ubuntu-core-18-i386.img.xz
>      xz -d ubuntu-core-18-i386.img.xz
>      qemu-system-x86_64 -drive file=ubuntu-core-18.i386.img,format=raw
> 
> Fixes: 6d73bb643aa7 ("ui/cocoa: Clear modifiers whenever possible")
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> ---
>   ui/cocoa.m | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 84c84e98fc..13e208b037 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -800,7 +800,6 @@ - (bool) handleEventLocked:(NSEvent *)event
>       int buttons = 0;
>       int keycode = 0;
>       bool mouse_event = false;
> -    static bool switched_to_fullscreen = false;
>       // Location of event in virtual screen coordinates
>       NSPoint p = [self screenLocationOfEvent:event];
>       NSUInteger modifiers = [event modifierFlags];
> @@ -952,13 +951,6 @@ - (bool) handleEventLocked:(NSEvent *)event
>   
>               // forward command key combos to the host UI unless the mouse is grabbed
>               if (!isMouseGrabbed && ([event modifierFlags] & NSEventModifierFlagCommand)) {
> -                /*
> -                 * Prevent the command key from being stuck down in the guest
> -                 * when using Command-F to switch to full screen mode.
> -                 */
> -                if (keycode == Q_KEY_CODE_F) {
> -                    switched_to_fullscreen = true;
> -                }
>                   return false;
>               }
>  

