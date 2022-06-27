Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9B155B7E5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 08:14:59 +0200 (CEST)
Received: from localhost ([::1]:35790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5i1S-0006yh-Ml
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 02:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5hzh-00061c-VJ
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 02:13:11 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:37422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o5hzf-0008LY-W6
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 02:13:09 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 w19-20020a17090a8a1300b001ec79064d8dso11327478pjn.2
 for <qemu-devel@nongnu.org>; Sun, 26 Jun 2022 23:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=AIR8fdVAPGwrMFxEu7zXPofflBi6PJDXUTq9PFCYWGA=;
 b=biL1CwMSE7Nx+siFgfKTyRkjjF51HCnai0YDyC/yQY6dYMJBYno74QB1P70sOzfKiE
 4x78nS7Bvi0NsEJRXlQLyl0d529Y5zW711roBaYkN+Jab5BsULttjjR9hAaggfxcSdYR
 0OqYLrQum4AP8ZFfBQ0i12IjtCxrj1x3Aqnl9TvdRUM8p7CFp/X8Vpn1IM1nXChvvRfd
 4sZPf18QY5TWpg4UhcnOWnjRhz5cCjemGsgBwj4MByD5Asiz6LXfIEAORVBL8iHK401a
 kw/axxo2lJ0Um4ztN0axFwGWy1lmFEPdvQqcZWZXZoCy93NxJ0jqG2Ou2cz8mkdrhNeR
 GRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AIR8fdVAPGwrMFxEu7zXPofflBi6PJDXUTq9PFCYWGA=;
 b=8QclAOozwI1E+nxUbjwFwEuvWuX8EYQpqR4tW3w3Bz4OVmiRfPNnXC0doMDbMiktfI
 C3V505NsFiFaqmUZ0ZOi6q6zRtewMRHxpdMAGwrh2vIGYEhZtsETQgGcNzNxE8nkRrDy
 TsVMxQhOWT5xjsv005JUNLGKwQJ0Tk/EAC0X/U1LdrbylvnkdiZwV8BI/Wg4BD6RBhfR
 XUK/dBLdhRLFCIMX9VM3WJ21gyAD50mVPmsx0vvNFNzMNfcdPkdZnAdW5KGa+uoplWIm
 vJaoFcFiEMWI7C1h6m1DJvWAABZDfLjBj8SWx6C8MVIUuKV+CpH3PchceW+HTtzgG/Yq
 FmGA==
X-Gm-Message-State: AJIora9cqrLrbzKvk/CJ/DYMEEqSnp+frBB8Hd5T+PO4V5zSMBIbazYv
 7loEWQ3A3XNVeNS4smhZ0pXatg==
X-Google-Smtp-Source: AGRyM1vWeUHelIzHV0mB+W32y3lVfOCHI2uf3K8e0dCg1K92o6kdNCJG1WpZ3Yc6tGhFY67J8Hfd2A==
X-Received: by 2002:a17:90b:3e86:b0:1ec:f7e8:e4e4 with SMTP id
 rj6-20020a17090b3e8600b001ecf7e8e4e4mr19390464pjb.218.1656310385449; 
 Sun, 26 Jun 2022 23:13:05 -0700 (PDT)
Received: from [192.168.44.231] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 mm9-20020a17090b358900b001ec729d4f08sm6165489pjb.54.2022.06.26.23.13.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jun 2022 23:13:04 -0700 (PDT)
Message-ID: <849c6eac-428c-a1f1-9e87-f470da5fbc76@linaro.org>
Date: Mon, 27 Jun 2022 11:42:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/55] qemu-sparc queue 20220626
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220626174531.969187-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/26/22 23:14, Mark Cave-Ayland wrote:
> The following changes since commit 40d522490714b65e0856444277db6c14c5cc3796:
> 
>    Merge tag 'for-upstream' of git://repo.or.cz/qemu/kevin into staging (2022-06-24 10:52:46 -0700)
> 
> are available in the Git repository at:
> 
>    https://github.com/mcayland/qemu.git tags/qemu-sparc-20220626
> 
> for you to fetch changes up to 39fbaeca096a9bf6cbe2af88572c1cb2aa62aa8c:
> 
>    artist: set memory region owners for buffers to the artist device (2022-06-26 18:40:28 +0100)
> 
> ----------------------------------------------------------------
> qemu-sparc queue
> - This is the PS2 QOM part 1 series, along with the trivial artist patch

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Mark Cave-Ayland (55):
>        ps2: checkpatch fixes
>        ps2: QOMify PS2State
>        ps2: QOMify PS2KbdState
>        ps2: QOMify PS2MouseState
>        ps2: move QOM type definitions from ps2.c to ps2.h
>        ps2: improve function prototypes in ps2.c and ps2.h
>        ps2: introduce PS2DeviceClass
>        ps2: implement ps2_reset() for the PS2_DEVICE QOM type based upon ps2_common_reset()
>        ps2: remove duplicate setting of scancode_set in ps2_kbd_init()
>        ps2: implement ps2_kbd_realize() and use it to register ps2_keyboard_handler
>        ps2: implement ps2_mouse_realize() and use it to register ps2_mouse_handler
>        ps2: don't use vmstate_register() in ps2_kbd_init()
>        ps2: don't use vmstate_register() in ps2_mouse_init()
>        pl050: checkpatch fixes
>        pl050: split pl050_update_irq() into separate pl050_set_irq() and pl050_update_irq() functions
>        lasips2: spacing fixes
>        lasips2: rename ps2dev_update_irq() to lasips2_port_set_irq()
>        pckbd: checkpatch fixes
>        pckbd: move KBDState from pckbd.c to i8042.h
>        pckbd: move ISAKBDState from pckbd.c to i8042.h
>        pckbd: introduce new I8042_MMIO QOM type
>        pckbd: implement i8042_mmio_reset() for I8042_MMIO device
>        pckbd: add mask qdev property to I8042_MMIO device
>        pckbd: add size qdev property to I8042_MMIO device
>        pckbd: implement i8042_mmio_realize() function
>        pckbd: implement i8042_mmio_init() function
>        pckbd: alter i8042_mm_init() to return a I8042_MMIO device
>        pckbd: move mapping of I8042_MMIO registers to MIPS magnum machine
>        pckbd: more vmstate_register() from i8042_mm_init() to i8042_mmio_realize()
>        pckbd: move ps2_kbd_init() and ps2_mouse_init() to i8042_mmio_realize()
>        ps2: make ps2_raise_irq() function static
>        ps2: use ps2_raise_irq() instead of calling update_irq() directly
>        ps2: introduce ps2_lower_irq() instead of calling update_irq() directly
>        ps2: add gpio for output IRQ and optionally use it in ps2_raise_irq() and ps2_lower_irq()
>        pckbd: replace irq_kbd and irq_mouse with qemu_irq array in KBDState
>        pl050: switch over from update_irq() function to PS2 device gpio
>        pl050: add QEMU interface comment
>        lasips2: QOMify LASIPS2State
>        lasips2: move lasips2 QOM types from lasips2.c to lasips2.h
>        lasips2: rename lasips2_init() to lasips2_initfn() and update it to return the LASIPS2 device
>        lasips2: implement lasips2_init() function
>        lasips2: move mapping of LASIPS2 registers to HPPA machine
>        lasips2: move initialisation of PS2 ports from lasi_initfn() to lasi_init()
>        lasips2: add base property
>        lasips2: implement lasips2_realize()
>        lasips2: use sysbus IRQ for output IRQ
>        lasips2: switch over from update_irq() function to PS2 device gpio
>        lasips2: add QEMU interface comment
>        pckbd: switch I8042_MMIO device from update_irq() function to PS2 device gpio
>        pckbd: add QEMU interface comment for I8042_MMIO device
>        pckbd: add i8042_reset() function to I8042 device
>        pckbd: switch I8042 device from update_irq() function to PS2 device gpio
>        pckbd: add QEMU interface comment for I8042 device
>        ps2: remove update_irq() function and update_arg parameter
>        artist: set memory region owners for buffers to the artist device
> 
>   hw/display/artist.c        |   2 +-
>   hw/hppa/machine.c          |  11 +-
>   hw/input/lasips2.c         | 123 +++++++----
>   hw/input/pckbd.c           | 338 ++++++++++++++++++++----------
>   hw/input/pl050.c           |  56 +++--
>   hw/input/ps2.c             | 501 ++++++++++++++++++++++++++-------------------
>   hw/mips/jazz.c             |  11 +-
>   include/hw/input/i8042.h   |  75 ++++++-
>   include/hw/input/lasips2.h |  39 +++-
>   include/hw/input/ps2.h     |  79 ++++++-
>   10 files changed, 846 insertions(+), 389 deletions(-)


