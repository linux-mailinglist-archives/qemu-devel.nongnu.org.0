Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B257309C25
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 13:57:44 +0100 (CET)
Received: from localhost ([::1]:57062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6CIQ-0004T4-CW
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 07:57:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l6CH7-00040W-1j
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 07:56:21 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:41933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l6CH3-0006nl-LM
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 07:56:20 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 41991746344;
 Sun, 31 Jan 2021 13:56:13 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 0A3227462BD; Sun, 31 Jan 2021 13:56:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 08BA17456B7;
 Sun, 31 Jan 2021 13:56:13 +0100 (CET)
Date: Sun, 31 Jan 2021 13:56:13 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 01/10] hw/sh4/Kconfig: Rename CONFIG_SH4 ->
 CONFIG_SH4_PERIPHERALS
In-Reply-To: <20210131111316.232778-2-f4bug@amsat.org>
Message-ID: <86e44d2e-893-b1df-70a2-1fea0ed53c7@eik.bme.hu>
References: <20210131111316.232778-1-f4bug@amsat.org>
 <20210131111316.232778-2-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1798951406-1612097773=:74342"
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1798951406-1612097773=:74342
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 31 Jan 2021, Philippe Mathieu-Daudé wrote:
> We want to be able to use the 'SH4' config for architecture
> specific features. As CONFIG_SH4 is only used to select
> peripherals, rename it CONFIG_SH4_PERIPHERALS.

PERIPHERALS is a bit long and hard to write correctly. How about 
CONFIG_SH4_DEVICES (also in other patches you do the same).

Regards,
BALATON Zoltan

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> hw/block/meson.build | 2 +-
> hw/char/meson.build  | 2 +-
> hw/intc/meson.build  | 2 +-
> hw/sh4/Kconfig       | 6 +++---
> hw/timer/meson.build | 2 +-
> 5 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/hw/block/meson.build b/hw/block/meson.build
> index 602ca6c8541..7f24b42c283 100644
> --- a/hw/block/meson.build
> +++ b/hw/block/meson.build
> @@ -12,7 +12,7 @@
> softmmu_ss.add(when: 'CONFIG_SSI_M25P80', if_true: files('m25p80.c'))
> softmmu_ss.add(when: 'CONFIG_SWIM', if_true: files('swim.c'))
> softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen-block.c'))
> -softmmu_ss.add(when: 'CONFIG_SH4', if_true: files('tc58128.c'))
> +softmmu_ss.add(when: 'CONFIG_SH4_PERIPHERALS', if_true: files('tc58128.c'))
> softmmu_ss.add(when: 'CONFIG_NVME_PCI', if_true: files('nvme.c', 'nvme-ns.c'))
>
> specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
> diff --git a/hw/char/meson.build b/hw/char/meson.build
> index 196ac91fa29..3b8cb6a2f5b 100644
> --- a/hw/char/meson.build
> +++ b/hw/char/meson.build
> @@ -31,7 +31,7 @@
> softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_aux.c'))
> softmmu_ss.add(when: 'CONFIG_RENESAS_SCI', if_true: files('renesas_sci.c'))
> softmmu_ss.add(when: 'CONFIG_SIFIVE_UART', if_true: files('sifive_uart.c'))
> -softmmu_ss.add(when: 'CONFIG_SH4', if_true: files('sh_serial.c'))
> +softmmu_ss.add(when: 'CONFIG_SH4_PERIPHERALS', if_true: files('sh_serial.c'))
> softmmu_ss.add(when: 'CONFIG_STM32F2XX_USART', if_true: files('stm32f2xx_usart.c'))
> softmmu_ss.add(when: 'CONFIG_MCHP_PFSOC_MMUART', if_true: files('mchp_pfsoc_mmuart.c'))
>
> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index 53cba115690..b05bab2f4b6 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -47,7 +47,7 @@
> specific_ss.add(when: 'CONFIG_RX_ICU', if_true: files('rx_icu.c'))
> specific_ss.add(when: 'CONFIG_S390_FLIC', if_true: files('s390_flic.c'))
> specific_ss.add(when: 'CONFIG_S390_FLIC_KVM', if_true: files('s390_flic_kvm.c'))
> -specific_ss.add(when: 'CONFIG_SH4', if_true: files('sh_intc.c'))
> +specific_ss.add(when: 'CONFIG_SH4_PERIPHERALS', if_true: files('sh_intc.c'))
> specific_ss.add(when: 'CONFIG_SIFIVE_CLINT', if_true: files('sifive_clint.c'))
> specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: files('sifive_plic.c'))
> specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
> diff --git a/hw/sh4/Kconfig b/hw/sh4/Kconfig
> index 4cbce3a0ed5..fbac8c09152 100644
> --- a/hw/sh4/Kconfig
> +++ b/hw/sh4/Kconfig
> @@ -9,16 +9,16 @@ config R2D
>     select USB_OHCI_PCI
>     select PCI
>     select SM501
> -    select SH4
> +    select SH4_PERIPHERALS
>
> config SHIX
>     bool
>     select SH7750
> -    select SH4
> +    select SH4_PERIPHERALS
>
> config SH7750
>     bool
>
> -config SH4
> +config SH4_PERIPHERALS
>     bool
>     select PTIMER
> diff --git a/hw/timer/meson.build b/hw/timer/meson.build
> index be343f68fed..d3f53dce400 100644
> --- a/hw/timer/meson.build
> +++ b/hw/timer/meson.build
> @@ -30,7 +30,7 @@
> softmmu_ss.add(when: 'CONFIG_PUV3', if_true: files('puv3_ost.c'))
> softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_timer.c'))
> softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_systmr.c'))
> -softmmu_ss.add(when: 'CONFIG_SH4', if_true: files('sh_timer.c'))
> +softmmu_ss.add(when: 'CONFIG_SH4_PERIPHERALS', if_true: files('sh_timer.c'))
> softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_timer.c'))
> softmmu_ss.add(when: 'CONFIG_STM32F2XX_TIMER', if_true: files('stm32f2xx_timer.c'))
> softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_timer.c'))
>
--3866299591-1798951406-1612097773=:74342--

