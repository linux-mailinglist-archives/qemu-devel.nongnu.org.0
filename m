Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBD336FEDF
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 18:47:33 +0200 (CEST)
Received: from localhost ([::1]:45316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcWIe-0001DD-9o
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 12:47:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcW0O-0004on-Dr; Fri, 30 Apr 2021 12:28:40 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:40967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcW0M-0005b3-B5; Fri, 30 Apr 2021 12:28:40 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MJmX3-1lsGfj0Oan-00K4le; Fri, 30 Apr 2021 18:28:34 +0200
Subject: Re: [PATCH] hw: Do not include hw/irq.h if it is not necessary
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210327050236.2232347-1-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <7d8e38e3-503c-e3a7-7b5d-81cfdac0581e@vivier.eu>
Date: Fri, 30 Apr 2021 18:28:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210327050236.2232347-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+XMRQxl0SxIEzWWfXC31QBLW3iEg+KQtkTDUme5sMyWohHwjL5V
 ZSAwijGYPbR6V65zN66naRY7tVXQboCfkI6spiKZsiOLz0wB37tUHy5rdsPepgMgh07nr8L
 ThkoNKmo1YQJYqb9qbee2CRuiVhtXdempdhBbjqHlnhT83mT3lCJXvnGRHpKQu4LtqT4fp9
 FbPdkQDiGoz1cQIyR8yuA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:j85wof2egzg=:GdDSaT1eGq7LVQDxbFdX84
 ppuT657tL4Vx0DhYxUjNC7dzX8O3t61n82chGZJ82HWBejWtwsAiHQBh2v5/lYFjem4gZNOdK
 y5BfzIwQ9LADbLijyxasQl5GWdq7VJ7fp+2LW99WAqJyVUMtDKoXFfl4eK+awUuRvW6Kwyc+G
 qKfXOZuNVMH5AwlNE+ptrbEIk9dWfF2OUdpsxv78NIFL1wf1wp+KdSfuaNJbKPHukmJVv0Q9q
 ag9qZya3dBWtyuUDNWJrR9wB3M0ZnEkTKFQAB9FCoVaT3P66p0xT9UPISURTYPrhu5NA7uJPE
 eJiNH2axahulPxy8brn0sbaiVynYYEWbLMay9tYg19COSPAhlaIPGiMVtDabllHH38vlEpHWQ
 4u+PG2jSZeSRopYHXRsUSQWoEKf0hc9qz1eHuf5NV5cnlhZYWaLCH3QKfk0cRTJ05H43rfApU
 96BwBKdhk3Oz68TLKICEs9xQhh96vpIrZGo/uVRidcL0/4xNu4PzO3PFlSWGJvAx/oz3Pq6iL
 MWKU0b0kNPQHObbFyVMIUw=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 27/03/2021 à 06:02, Thomas Huth a écrit :
> Many files include hw/irq.h without needing it. Remove the superfluous
> include statements.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
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
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


