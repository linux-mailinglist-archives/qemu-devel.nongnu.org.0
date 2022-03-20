Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD5C4E1AFC
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 11:10:23 +0100 (CET)
Received: from localhost ([::1]:36334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVsVy-0000ET-5J
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 06:10:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVsTM-0007bt-Et
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 06:07:40 -0400
Received: from [2607:f8b0:4864:20::112d] (port=35056
 helo=mail-yw1-x112d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVsTK-00079A-H1
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 06:07:40 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2d07ae0b1c0so129462877b3.2
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 03:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F/CgasYLAF0n3qXvxgdzxewrRHRhAwGR7hjt3C8Fdz4=;
 b=l+5COkIuLIZMw6cizdnz1xi1YdONgy/6FKG1vnfzjT8XVA7q95lI3G0CxSGh+0t9Qo
 aRxoTl0DzgXYwQ2H1QB2OVFbPQk+2WhCOAKNS3gc4J6K4MGN5y+P/qMfx1cREfGAsRHi
 e2unh0klZ4u+mLq7yybU9VV6Dx/azqHCkUxGwKXYmcwNs/Y9Q+c5XtS7ZRKVPHF07hbD
 nqwBS2bPTcxAmjeNUG5TfODQXOK0aCsYQd4lVyiu34+QU7ST1TUHzItO9jgMoDKFZzMf
 uVZ82CGE4HXlnGz/1oKAOGZ6u2eOVSf4DjNXTULaQuzDLKbYzuQvNc18wh7xcVd1rlom
 2FLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F/CgasYLAF0n3qXvxgdzxewrRHRhAwGR7hjt3C8Fdz4=;
 b=N8SD1bOdYZCBFCMzytOvkgN7Eay9zK1XYvC3e1rFZv/DEE9zDlTarggC92fvgONfAh
 pheJTyZ7CcifLH8LM5VyTQaSfp859SJisnh9tWMcIjBrmfG6B8QT/f9UOVpmWmyrDv6/
 9nzMvM59SUidSlJubpDVYOJcz/sb/Uury6dQUDDgrBPLFGtqssj2gMMFQ8ETsJv9CC2/
 GysGY1v7oKN6Bs2vAFLGl/xOCMpWm6Ajgdw5rGC18V7qj2uzCPiFZGqj65A5DPNjJhnR
 lXZ4hQHCzrtFla8y1uW/6iFmLNLgHBGB2iUy4R/qjisWxtHZTp2YO6dMUfpltttai/Jn
 tgqg==
X-Gm-Message-State: AOAM531AZ8dZZDb1sQPY3ZeKurxb+LE9/jOoFqFb9l+lDb9FS9PRBGb5
 DfJx/7WbXASGM/grRzU6UuzAJ5M+U1uC6w3eebmkbQ==
X-Google-Smtp-Source: ABdhPJwekopLJc5pl8aWmmvVok2JCXEppZF0gP0IEz1K/VTTAjiZDJzWrNKy/PSTedwfYCJPGwT9Vpp+X7YOoe4Zrsg=
X-Received: by 2002:a81:1151:0:b0:2e5:99ec:9933 with SMTP id
 78-20020a811151000000b002e599ec9933mr18284088ywr.64.1647770856795; Sun, 20
 Mar 2022 03:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220319193214.56553-1-zongyuan.li@smartx.com>
 <20220319193214.56553-2-zongyuan.li@smartx.com>
In-Reply-To: <20220319193214.56553-2-zongyuan.li@smartx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 20 Mar 2022 10:07:24 +0000
Message-ID: <CAFEAcA8WQarGR-XponK9eh_hfedJYt2B2XmNJLkWtFK4VhT5RA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/1] hw/arm/realview: replace 'qemu_split_irq' with
 'TYPE_SPLIT_IRQ'
To: Zongyuan Li <zongyuan.li@smartx.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: "open list:Real View" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 19 Mar 2022 at 19:32, Zongyuan Li <zongyuan.li@smartx.com> wrote:
>
> Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/811

Thanks for this patch.

> +#include "hw/qdev-core.h"
>  #include "qemu/osdep.h"

The osdep.h include must always be first in every .c file.
Put new #include lines below it, not above it.

>  #include "qapi/error.h"
>  #include "cpu.h"
>  #include "hw/sysbus.h"
>  #include "hw/arm/boot.h"
>  #include "hw/arm/primecell.h"
> +#include "hw/core/split-irq.h"
>  #include "hw/net/lan9118.h"
>  #include "hw/net/smc91c111.h"
>  #include "hw/pci/pci.h"
>  #include "net/net.h"
> +#include "qom/object.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/boards.h"
>  #include "hw/i2c/i2c.h"
> @@ -27,6 +30,7 @@
>  #include "hw/irq.h"
>  #include "hw/i2c/arm_sbcon_i2c.h"
>  #include "hw/sd/sd.h"
> +#include <stdarg.h>

This include should not be necessary -- osdep.h provides it for you.

>
>  #define SMP_BOOT_ADDR 0xe0000000
>  #define SMP_BOOTREG_ADDR 0x10000030
> @@ -53,6 +57,30 @@ static const int realview_board_id[] = {
>      0x76d
>  };
>
> +static bool split_to_irq_varargs(Object *obj, int nums_of_output, ...) {
> +    int i;
> +    va_list va;
> +    qemu_irq output;
> +    Object *src_irq= object_new(TYPE_SPLIT_IRQ);
> +
> +    if (!object_property_set_int(src_irq, "num-lines", nums_of_output, &error_fatal)) {
> +        return false;
> +    }
> +
> +    if (!qdev_realize(DEVICE(src_irq), NULL, &error_fatal)) {
> +        return false;
> +    }

In board code, prefer to create this device with
qdev_new() and then realize it with
qdev_realize_and_unref(). There's an example in
hw/openrisc/openrisc_sim.c. (NB: for splitters and other
devices created in SoC device objects rather than board code,
the pattern will be different.)

> +
> +    va_start(va, nums_of_output);
> +    for (i = 0; i < nums_of_output; i++) {
> +        output = va_arg(va, qemu_irq);
> +        qdev_connect_gpio_out(DEVICE(src_irq), i, output);
> +    }
> +       va_end(va);
> +
> +    return true;
> +}

I think this varargs function is unnecessarily complicated. We only
create two split devices here, and they are always with a fixed
number of output. Just write the "create splitter and wire it up"
code directly. Again, the openrisc_sim.c code is a good example.

> +
>  static void realview_init(MachineState *machine,
>                            enum realview_board_type board_type)
>  {
> @@ -67,6 +95,8 @@ static void realview_init(MachineState *machine,
>      SysBusDevice *busdev;
>      qemu_irq pic[64];
>      qemu_irq mmc_irq[2];
> +    Object *mmc_irq_for_ro = object_new(TYPE_SPLIT_IRQ);
> +    Object *mmc_irq_for_cardin = object_new(TYPE_SPLIT_IRQ);

You seem to be creating the splitter objects both here and also
in your split_to_irq_varargs() function...

>      PCIBus *pci_bus = NULL;
>      NICInfo *nd;
>      DriveInfo *dinfo;
> @@ -229,14 +259,20 @@ static void realview_init(MachineState *machine,
>       * and the PL061 has them the other way about. Also the card
>       * detect line is inverted.
>       */
> -    mmc_irq[0] = qemu_irq_split(
> -        qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_WPROT),
> -        qdev_get_gpio_in(gpio2, 1));
> -    mmc_irq[1] = qemu_irq_split(
> -        qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_CARDIN),
> -        qemu_irq_invert(qdev_get_gpio_in(gpio2, 0)));
> -    qdev_connect_gpio_out_named(dev, "card-read-only", 0, mmc_irq[0]);
> -    qdev_connect_gpio_out_named(dev, "card-inserted", 0, mmc_irq[1]);
> +    if (!split_to_irq_varargs(mmc_irq_for_ro, 2,
> +                              qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_WPROT),
> +                              qdev_get_gpio_in(gpio2, 1))) {
> +        return;
> +    }
> +    qdev_connect_gpio_out_named(dev, "card-read-only", 0, DEVICE(mmc_irq_for_ro));
> +
> +    if (!split_to_irq_varargs(mmc_irq_for_cardin, 2,
> +                              qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_CARDIN),
> +                              qemu_irq_invert(qdev_get_gpio_in(gpio2, 0)))) {
> +        return;
> +    }
> +    qdev_connect_gpio_out_named(dev, "card-inserted", 0, DEVICE(mmc_irq_for_cardin));
> +
>      dinfo = drive_get(IF_SD, 0, 0);
>      if (dinfo) {
>          DeviceState *card;
> --
> 2.34.0

thanks
-- PMM

