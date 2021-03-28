Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D69934BA42
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Mar 2021 01:47:20 +0100 (CET)
Received: from localhost ([::1]:33232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQJaJ-0004Hr-6Q
	for lists+qemu-devel@lfdr.de; Sat, 27 Mar 2021 20:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lQJXt-0003hQ-As; Sat, 27 Mar 2021 20:44:49 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:37472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lQJXr-0008CM-El; Sat, 27 Mar 2021 20:44:49 -0400
Received: by mail-io1-xd31.google.com with SMTP id b10so9205952iot.4;
 Sat, 27 Mar 2021 17:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yuEOd0/IjLXX0tImksVacQxMi6pEpqUZZB76nEduh+s=;
 b=Bz+YY8SWFLGSAw0/VXe/TtMspqyJGE1ZbQ/BV4LBNZlscyEBU9FdM88nvLdLfD67Gm
 zZWkKgiWynjtj2VkDuGAZk2bUSq+RatmxTj8MKZFRncBnpzcBuylLdGKHaFNbNvHCVGm
 NlPRU4yjhCpMbSHceShSVAc3sM5ui1BfO5M134yZRRO7HQraSazf5Ej5vkLL1I64dyjh
 uKnZLzbuDkGlYLxo4dGUobhM1baFYr7GShKKhRV4ySj17j4CRvF+K77lkUpzQEw9DSGA
 2JdiIA+vJgGR/GiRF5lUWG0ItwtsWHb0ZH54j7N0zwKjxlahswcIbQyCe/qTWINSQolj
 T6LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yuEOd0/IjLXX0tImksVacQxMi6pEpqUZZB76nEduh+s=;
 b=ndFtVSTsnpdFWAuyHCdJkjIOaYbN8tam3yWFZmpOABTTOBo243K98GGg9TsveGqk+r
 KyeV9n1lgdkb9MQQo7EQ41T+OSnuhZ2vNIJw7WdG0mvr1/GA7N6oJQ/IjFS+tcYBDYMB
 j4hPsx2kEj2TfbXjHrgncqCGsBE3KpZX3QqMGQgisb0TaIRJ6r0TXtNq0FqFh+LNq5Vs
 chwFeTGk1n2ZqqSKJeCrKXjSHi51/Vgtu5OQx+jwpOWgQrt+TmETr7qZLw4FWDaLupGP
 Bh+HIkRSs8a31/Ym8y7dOt5xClDsXK8XtP18hzu9RyfWYjqWf8a409sN5h8hlMAh9bi6
 EH6w==
X-Gm-Message-State: AOAM53386Wof+FnCSsLAK/UgwnaWrwkIJqL9X5RLkOtK5qI+DNUo2Kz8
 Zk2E0y03S5Q55aTV9F5q2pjUgMdnG49569GTtTw=
X-Google-Smtp-Source: ABdhPJxIWeQD2GszkSwlyW79SMSQNucYEVcOW8Hy751eSwoDSaqUuGh9gLZ51vZned0lIEpP//O6w8yGaufLjux8Dmg=
X-Received: by 2002:a05:6638:224e:: with SMTP id
 m14mr18662497jas.8.1616892284838; 
 Sat, 27 Mar 2021 17:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210327050236.2232347-1-thuth@redhat.com>
In-Reply-To: <20210327050236.2232347-1-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 27 Mar 2021 20:44:16 -0400
Message-ID: <CAKmqyKN8pA-x_y2TkS31xryDoMe2Yhyd0=FZpmyqMYaQ5z9dwA@mail.gmail.com>
Subject: Re: [PATCH] hw: Do not include hw/irq.h if it is not necessary
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Mar 27, 2021 at 1:02 AM Thomas Huth <thuth@redhat.com> wrote:
>
> Many files include hw/irq.h without needing it. Remove the superfluous
> include statements.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/msf2-soc.c           | 1 -
>  hw/i386/kvm/ioapic.c        | 1 -
>  hw/i386/xen/xen_platform.c  | 1 -
>  hw/m68k/q800.c              | 1 -
>  hw/m68k/virt.c              | 1 -
>  hw/misc/led.c               | 1 -
>  hw/misc/virt_ctrl.c         | 1 -
>  hw/ppc/prep.c               | 1 -
>  hw/riscv/microchip_pfsoc.c  | 1 -
>  hw/sd/cadence_sdhci.c       | 1 -
>  hw/timer/sse-counter.c      | 1 -
>  hw/usb/xlnx-usb-subsystem.c | 1 -
>  12 files changed, 12 deletions(-)
>
> diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
> index d2c29e82d1..5cfe7caf83 100644
> --- a/hw/arm/msf2-soc.c
> +++ b/hw/arm/msf2-soc.c
> @@ -27,7 +27,6 @@
>  #include "qapi/error.h"
>  #include "exec/address-spaces.h"
>  #include "hw/char/serial.h"
> -#include "hw/irq.h"
>  #include "hw/arm/msf2-soc.h"
>  #include "hw/misc/unimp.h"
>  #include "sysemu/sysemu.h"
> diff --git a/hw/i386/kvm/ioapic.c b/hw/i386/kvm/ioapic.c
> index dfc3c98005..71a563181e 100644
> --- a/hw/i386/kvm/ioapic.c
> +++ b/hw/i386/kvm/ioapic.c
> @@ -13,7 +13,6 @@
>  #include "qemu/osdep.h"
>  #include "monitor/monitor.h"
>  #include "hw/i386/x86.h"
> -#include "hw/irq.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/i386/ioapic_internal.h"
>  #include "hw/i386/apic_internal.h"
> diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
> index 01ae1fb161..bf4f20e92b 100644
> --- a/hw/i386/xen/xen_platform.c
> +++ b/hw/i386/xen/xen_platform.c
> @@ -27,7 +27,6 @@
>  #include "qapi/error.h"
>  #include "hw/ide.h"
>  #include "hw/pci/pci.h"
> -#include "hw/irq.h"
>  #include "hw/xen/xen_common.h"
>  #include "migration/vmstate.h"
>  #include "hw/xen/xen-legacy-backend.h"
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index 1c7f7aa07f..d1ab1ff77d 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -27,7 +27,6 @@
>  #include "sysemu/sysemu.h"
>  #include "cpu.h"
>  #include "hw/boards.h"
> -#include "hw/irq.h"
>  #include "hw/or-irq.h"
>  #include "elf.h"
>  #include "hw/loader.h"
> diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
> index 18e6f11041..9469f82800 100644
> --- a/hw/m68k/virt.c
> +++ b/hw/m68k/virt.c
> @@ -13,7 +13,6 @@
>  #include "sysemu/sysemu.h"
>  #include "cpu.h"
>  #include "hw/boards.h"
> -#include "hw/irq.h"
>  #include "hw/qdev-properties.h"
>  #include "elf.h"
>  #include "hw/loader.h"
> diff --git a/hw/misc/led.c b/hw/misc/led.c
> index f552b8b648..f6d6d68bce 100644
> --- a/hw/misc/led.c
> +++ b/hw/misc/led.c
> @@ -10,7 +10,6 @@
>  #include "migration/vmstate.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/misc/led.h"
> -#include "hw/irq.h"
>  #include "trace.h"
>
>  #define LED_INTENSITY_PERCENT_MAX   100
> diff --git a/hw/misc/virt_ctrl.c b/hw/misc/virt_ctrl.c
> index 2ea01bd7a1..3552d7a09a 100644
> --- a/hw/misc/virt_ctrl.c
> +++ b/hw/misc/virt_ctrl.c
> @@ -5,7 +5,6 @@
>   */
>
>  #include "qemu/osdep.h"
> -#include "hw/irq.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/sysbus.h"
>  #include "migration/vmstate.h"
> diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
> index f1b1efdcef..af4ccb9f43 100644
> --- a/hw/ppc/prep.c
> +++ b/hw/ppc/prep.c
> @@ -38,7 +38,6 @@
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "qemu/log.h"
> -#include "hw/irq.h"
>  #include "hw/loader.h"
>  #include "hw/rtc/mc146818rtc.h"
>  #include "hw/isa/pc87312.h"
> diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
> index c4146b7a6b..01537b30eb 100644
> --- a/hw/riscv/microchip_pfsoc.c
> +++ b/hw/riscv/microchip_pfsoc.c
> @@ -41,7 +41,6 @@
>  #include "qemu/cutils.h"
>  #include "qapi/error.h"
>  #include "hw/boards.h"
> -#include "hw/irq.h"
>  #include "hw/loader.h"
>  #include "hw/sysbus.h"
>  #include "chardev/char.h"
> diff --git a/hw/sd/cadence_sdhci.c b/hw/sd/cadence_sdhci.c
> index 0b371c843d..c89538b491 100644
> --- a/hw/sd/cadence_sdhci.c
> +++ b/hw/sd/cadence_sdhci.c
> @@ -26,7 +26,6 @@
>  #include "qemu/log.h"
>  #include "qapi/error.h"
>  #include "migration/vmstate.h"
> -#include "hw/irq.h"
>  #include "hw/sd/cadence_sdhci.h"
>  #include "sdhci-internal.h"
>
> diff --git a/hw/timer/sse-counter.c b/hw/timer/sse-counter.c
> index 0384051f15..16c0e8ad15 100644
> --- a/hw/timer/sse-counter.c
> +++ b/hw/timer/sse-counter.c
> @@ -33,7 +33,6 @@
>  #include "trace.h"
>  #include "hw/timer/sse-counter.h"
>  #include "hw/sysbus.h"
> -#include "hw/irq.h"
>  #include "hw/registerfields.h"
>  #include "hw/clock.h"
>  #include "hw/qdev-clock.h"
> diff --git a/hw/usb/xlnx-usb-subsystem.c b/hw/usb/xlnx-usb-subsystem.c
> index 568257370c..c760c3058a 100644
> --- a/hw/usb/xlnx-usb-subsystem.c
> +++ b/hw/usb/xlnx-usb-subsystem.c
> @@ -24,7 +24,6 @@
>
>  #include "qemu/osdep.h"
>  #include "hw/sysbus.h"
> -#include "hw/irq.h"
>  #include "hw/register.h"
>  #include "qemu/bitops.h"
>  #include "qemu/log.h"
> --
> 2.27.0
>
>

