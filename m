Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 628CE42B673
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 08:09:51 +0200 (CEST)
Received: from localhost ([::1]:35964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maXSY-0005Or-Ec
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 02:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1maVlp-0006Fe-Hs
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 00:21:37 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:59194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heinrich.schuchardt@canonical.com>)
 id 1maVlm-0004vZ-Mq
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 00:21:37 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 379E840011
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 04:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634098890;
 bh=mB967rjNRFvCrQGJ/8JL9yG0Ome0ksn0baJbpiX2pFo=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=mPHtCMQr7JTb3tDWoEPZ/1qbEAG7OdWCoYIE162/moD4vNYFl28Z8if5DYoGKp3+9
 iCbw1YuPJKeHMqPW8HmF5JQoMR8t1en9a53j52GQtoGIeEXu/TF1KNc14Gz3oJ5Rlv
 lof3oaFkw8q3Aq/eiFqGPMKC4gzEtcJhdkCHj/+j5VPdZEDhZ1BqCW9qbOVcZev8SP
 VjpKCHNlI+p2KPtItGE4swFK0CV9xz6o9QLBBSPRgNpLRCVnIbbxHSeEvAsDhATUpl
 +AxgQa8+NAqe22ZAolUCPX3Mve1SDCpKT2jDN5c9D7ZHt97+hAvKA1X584i5vXReyw
 GhV9B2hef3fNg==
Received: by mail-wr1-f72.google.com with SMTP id
 y12-20020a056000168c00b00160da4de2c7so925887wrd.5
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 21:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mB967rjNRFvCrQGJ/8JL9yG0Ome0ksn0baJbpiX2pFo=;
 b=490dghPEE7yeuCsQC1oZzvkIO2JBm3ZS3os1nyrwg/UA3evEE12913PwiauJ/m7DOv
 bj+IkCE/lIWPaG9R1lPaidPozB6kGHBfsUqZbjyeXq70dedMIx7xf7EdOs3SNb0pJ+tg
 /2bJsY4fP+Zfv2ZkJVcSxQeSa+kD4LXizc0wV/MUb3miAvrdktkWz0uu0ZV/vZzwuBsw
 yljHblFir3QJfRujEMHs3RBx3XVfoRzzC/7DHUmW/Ls13ypuFbnRGLY3LHie9CcQoSlh
 ye9IEnG6pXrOxrdTqA3PS0N9sTWb9EOOyNMR0ak/++N+QypkRHBrnZgx27TEIU72q5/a
 R36g==
X-Gm-Message-State: AOAM53160HBtZoq6UxhJuR3U+udCqLiAqnmO3TqTvY73Bnna12Dcjg7M
 /6apqF54vvCIDjC8Et/CH6x1jxoRCkJ6Otp6fL3r64aGBg1iulHgta6rF942Liev4l4e9taZUYC
 AvmxiiN+ogW6aEOz/dtpCR58tpHlbQFoa
X-Received: by 2002:a05:600c:4f81:: with SMTP id
 n1mr10174689wmq.63.1634098889625; 
 Tue, 12 Oct 2021 21:21:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAak0qYnfWKXl0Bsd4wr9Grf/C3RS18n7GdvugqG2kUYa6JK1iW3boaXQR4hZL0n/L72QBxg==
X-Received: by 2002:a05:600c:4f81:: with SMTP id
 n1mr10174656wmq.63.1634098889250; 
 Tue, 12 Oct 2021 21:21:29 -0700 (PDT)
Received: from [192.168.123.35] (ip-88-152-144-157.hsi03.unitymediagroup.de.
 [88.152.144.157])
 by smtp.gmail.com with ESMTPSA id y8sm11407286wrr.21.2021.10.12.21.21.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 21:21:28 -0700 (PDT)
Message-ID: <d6839a02-fd15-0ff4-8dde-8b164fbd87bc@canonical.com>
Date: Wed, 13 Oct 2021 06:21:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 06/16] riscv: qemu: Add devicetree files for
 qemu_riscv32/64
Content-Language: en-US
To: Simon Glass <sjg@chromium.org>
References: <20211013010120.96851-1-sjg@chromium.org>
 <20211013010120.96851-7-sjg@chromium.org>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20211013010120.96851-7-sjg@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=185.125.188.122;
 envelope-from=heinrich.schuchardt@canonical.com;
 helo=smtp-relay-internal-0.canonical.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Oct 2021 02:07:31 -0400
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
Cc: Tom Rini <trini@konsulko.com>, qemu-devel@nongnu.org,
 Leo <ycliang@andestech.com>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, Rick Chen <rick@andestech.com>,
 Green Wan <green.wan@sifive.com>, Sean Anderson <seanga2@gmail.com>,
 U-Boot Mailing List <u-boot@lists.denx.de>, Zong Li <zong.li@sifive.com>,
 Tianrui Wei <tianrui-wei@outlook.com>, Bin Meng <bmeng.cn@gmail.com>,
 Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
 Padmarao Begari <padmarao.begari@microchip.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/13/21 03:01, Simon Glass wrote:
> Add these files, generated from qemu, so there is a reference devicetree
> in the U-Boot tree.
> 
> Split the existing qemu-virt into two, since we need a different
> devicetree for 32- and 64-bit machines.
> 

You only sent patch 6/16 and 15/16 to me. No clue why. Please, send 
complete patchsets instead of selected patches which cannot be reviewed 
without the context.

Which devices exist depends on the QEMU comannd line.

The files you create here do neither reflect the superset of all QEMU 
settings nor the minimum set. They do not include all devices supported 
on QEMU by U-Boot either.

You cannot assume that the values in this patch will match values used 
by the next invocation of QEMU.

Hence it is totally unclear what this patch might be good for.

Best regards

Heinrich

> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
>   arch/riscv/dts/Makefile              |   2 +-
>   arch/riscv/dts/qemu-virt.dts         |   8 -
>   arch/riscv/dts/qemu-virt32.dts       | 217 +++++++++++++++++++++++++++
>   arch/riscv/dts/qemu-virt64.dts       | 217 +++++++++++++++++++++++++++
>   configs/qemu-riscv32_defconfig       |   1 +
>   configs/qemu-riscv32_smode_defconfig |   1 +
>   configs/qemu-riscv32_spl_defconfig   |   2 +-
>   configs/qemu-riscv64_defconfig       |   1 +
>   configs/qemu-riscv64_smode_defconfig |   1 +
>   configs/qemu-riscv64_spl_defconfig   |   2 +-
>   10 files changed, 441 insertions(+), 11 deletions(-)
>   delete mode 100644 arch/riscv/dts/qemu-virt.dts
>   create mode 100644 arch/riscv/dts/qemu-virt32.dts
>   create mode 100644 arch/riscv/dts/qemu-virt64.dts
> 
> diff --git a/arch/riscv/dts/Makefile b/arch/riscv/dts/Makefile
> index b6e9166767b..90d3f35e6e3 100644
> --- a/arch/riscv/dts/Makefile
> +++ b/arch/riscv/dts/Makefile
> @@ -2,7 +2,7 @@
>   
>   dtb-$(CONFIG_TARGET_AX25_AE350) += ae350_32.dtb ae350_64.dtb
>   dtb-$(CONFIG_TARGET_MICROCHIP_ICICLE) += microchip-mpfs-icicle-kit.dtb
> -dtb-$(CONFIG_TARGET_QEMU_VIRT) += qemu-virt.dtb
> +dtb-$(CONFIG_TARGET_QEMU_VIRT) += qemu-virt32.dtb qemu-virt64.dtb
>   dtb-$(CONFIG_TARGET_OPENPITON_RISCV64) += openpiton-riscv64.dtb
>   dtb-$(CONFIG_TARGET_SIFIVE_UNLEASHED) += hifive-unleashed-a00.dtb
>   dtb-$(CONFIG_TARGET_SIFIVE_UNMATCHED) += hifive-unmatched-a00.dtb
> diff --git a/arch/riscv/dts/qemu-virt.dts b/arch/riscv/dts/qemu-virt.dts
> deleted file mode 100644
> index fecff542b91..00000000000
> --- a/arch/riscv/dts/qemu-virt.dts
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+
> -/*
> - * Copyright (C) 2021, Bin Meng <bmeng.cn@gmail.com>
> - */
> -
> -/dts-v1/;
> -
> -#include "binman.dtsi"
> diff --git a/arch/riscv/dts/qemu-virt32.dts b/arch/riscv/dts/qemu-virt32.dts
> new file mode 100644
> index 00000000000..3c449413523
> --- /dev/null
> +++ b/arch/riscv/dts/qemu-virt32.dts
> @@ -0,0 +1,217 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2021, Bin Meng <bmeng.cn@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "binman.dtsi"
> +
> +/ {
> +	#address-cells = <0x02>;
> +	#size-cells = <0x02>;
> +	compatible = "riscv-virtio";
> +	model = "riscv-virtio,qemu";
> +
> +	fw-cfg@10100000 {
> +		dma-coherent;
> +		reg = <0x00 0x10100000 0x00 0x18>;
> +		compatible = "qemu,fw-cfg-mmio";
> +	};
> +
> +	flash@20000000 {
> +		bank-width = <0x04>;
> +		reg = <0x00 0x20000000 0x00 0x2000000
> +			0x00 0x22000000 0x00 0x2000000>;
> +		compatible = "cfi-flash";
> +	};
> +
> +	chosen {
> +		bootargs = [00];
> +		stdout-path = "/soc/uart@10000000";
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x00 0x80000000 0x00 0x8000000>;
> +	};
> +
> +	cpus {
> +		#address-cells = <0x01>;
> +		#size-cells = <0x00>;
> +		timebase-frequency = <0x989680>;
> +
> +		cpu@0 {
> +			phandle = <0x01>;
> +			device_type = "cpu";
> +			reg = <0x00>;
> +			status = "okay";
> +			compatible = "riscv";
> +			riscv,isa = "rv32imafdcsu";
> +			mmu-type = "riscv,sv32";
> +
> +			interrupt-controller {
> +				#interrupt-cells = <0x01>;
> +				interrupt-controller;
> +				compatible = "riscv,cpu-intc";
> +				phandle = <0x02>;
> +			};
> +		};
> +
> +		cpu-map {
> +
> +			cluster0 {
> +
> +				core0 {
> +					cpu = <0x01>;
> +				};
> +			};
> +		};
> +	};
> +
> +	soc {
> +		#address-cells = <0x02>;
> +		#size-cells = <0x02>;
> +		compatible = "simple-bus";
> +		ranges;
> +
> +		rtc@101000 {
> +			interrupts = <0x0b>;
> +			interrupt-parent = <0x03>;
> +			reg = <0x00 0x101000 0x00 0x1000>;
> +			compatible = "google,goldfish-rtc";
> +		};
> +
> +		uart@10000000 {
> +			interrupts = <0x0a>;
> +			interrupt-parent = <0x03>;
> +			clock-frequency = <0x384000>;
> +			reg = <0x00 0x10000000 0x00 0x100>;
> +			compatible = "ns16550a";
> +		};
> +
> +		poweroff {
> +			value = <0x5555>;
> +			offset = <0x00>;
> +			regmap = <0x04>;
> +			compatible = "syscon-poweroff";
> +		};
> +
> +		reboot {
> +			value = <0x7777>;
> +			offset = <0x00>;
> +			regmap = <0x04>;
> +			compatible = "syscon-reboot";
> +		};
> +
> +		test@100000 {
> +			phandle = <0x04>;
> +			reg = <0x00 0x100000 0x00 0x1000>;
> +			compatible = "sifive,test1\0sifive,test0\0syscon";
> +		};
> +
> +		pci@30000000 {
> +			interrupt-map-mask = <0x1800 0x00 0x00 0x07>;
> +			interrupt-map = <0x00 0x00 0x00 0x01 0x03 0x20 0x00 0x00
> +				0x00 0x02 0x03 0x21 0x00 0x00 0x00 0x03
> +				0x03 0x22 0x00 0x00 0x00 0x04 0x03 0x23
> +				0x800 0x00 0x00 0x01 0x03 0x21 0x800 0x00
> +				0x00 0x02 0x03 0x22 0x800 0x00 0x00 0x03
> +				0x03 0x23 0x800 0x00 0x00 0x04 0x03 0x20
> +				0x1000 0x00 0x00 0x01 0x03 0x22 0x1000 0x00
> +				0x00 0x02 0x03 0x23 0x1000 0x00 0x00 0x03
> +				0x03 0x20 0x1000 0x00 0x00 0x04 0x03 0x21
> +				0x1800 0x00 0x00 0x01 0x03 0x23 0x1800 0x00
> +				0x00 0x02 0x03 0x20 0x1800 0x00 0x00 0x03
> +				0x03 0x21 0x1800 0x00 0x00 0x04 0x03 0x22>;
> +			ranges = <0x1000000 0x00 0x00 0x00
> +				0x3000000 0x00 0x10000 0x2000000
> +				0x00 0x40000000 0x00 0x40000000
> +				0x00 0x40000000 0x3000000 0x03
> +				0x00 0x03 0x00 0x01
> +				0x00>;
> +			reg = <0x00 0x30000000 0x00 0x10000000>;
> +			dma-coherent;
> +			bus-range = <0x00 0xff>;
> +			linux,pci-domain = <0x00>;
> +			device_type = "pci";
> +			compatible = "pci-host-ecam-generic";
> +			#size-cells = <0x02>;
> +			#interrupt-cells = <0x01>;
> +			#address-cells = <0x03>;
> +		};
> +
> +		virtio_mmio@10008000 {
> +			interrupts = <0x08>;
> +			interrupt-parent = <0x03>;
> +			reg = <0x00 0x10008000 0x00 0x1000>;
> +			compatible = "virtio,mmio";
> +		};
> +
> +		virtio_mmio@10007000 {
> +			interrupts = <0x07>;
> +			interrupt-parent = <0x03>;
> +			reg = <0x00 0x10007000 0x00 0x1000>;
> +			compatible = "virtio,mmio";
> +		};
> +
> +		virtio_mmio@10006000 {
> +			interrupts = <0x06>;
> +			interrupt-parent = <0x03>;
> +			reg = <0x00 0x10006000 0x00 0x1000>;
> +			compatible = "virtio,mmio";
> +		};
> +
> +		virtio_mmio@10005000 {
> +			interrupts = <0x05>;
> +			interrupt-parent = <0x03>;
> +			reg = <0x00 0x10005000 0x00 0x1000>;
> +			compatible = "virtio,mmio";
> +		};
> +
> +		virtio_mmio@10004000 {
> +			interrupts = <0x04>;
> +			interrupt-parent = <0x03>;
> +			reg = <0x00 0x10004000 0x00 0x1000>;
> +			compatible = "virtio,mmio";
> +		};
> +
> +		virtio_mmio@10003000 {
> +			interrupts = <0x03>;
> +			interrupt-parent = <0x03>;
> +			reg = <0x00 0x10003000 0x00 0x1000>;
> +			compatible = "virtio,mmio";
> +		};
> +
> +		virtio_mmio@10002000 {
> +			interrupts = <0x02>;
> +			interrupt-parent = <0x03>;
> +			reg = <0x00 0x10002000 0x00 0x1000>;
> +			compatible = "virtio,mmio";
> +		};
> +
> +		virtio_mmio@10001000 {
> +			interrupts = <0x01>;
> +			interrupt-parent = <0x03>;
> +			reg = <0x00 0x10001000 0x00 0x1000>;
> +			compatible = "virtio,mmio";
> +		};
> +
> +		plic@c000000 {
> +			phandle = <0x03>;
> +			riscv,ndev = <0x35>;
> +			reg = <0x00 0xc000000 0x00 0x210000>;
> +			interrupts-extended = <0x02 0x0b 0x02 0x09>;
> +			interrupt-controller;
> +			compatible = "sifive,plic-1.0.0\0riscv,plic0";
> +			#interrupt-cells = <0x01>;
> +			#address-cells = <0x00>;
> +		};
> +
> +		clint@2000000 {
> +			interrupts-extended = <0x02 0x03 0x02 0x07>;
> +			reg = <0x00 0x2000000 0x00 0x10000>;
> +			compatible = "sifive,clint0\0riscv,clint0";
> +		};
> +	};
> +};
> diff --git a/arch/riscv/dts/qemu-virt64.dts b/arch/riscv/dts/qemu-virt64.dts
> new file mode 100644
> index 00000000000..61bc084e280
> --- /dev/null
> +++ b/arch/riscv/dts/qemu-virt64.dts
> @@ -0,0 +1,217 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2021, Bin Meng <bmeng.cn@gmail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "binman.dtsi"
> +
> +/ {
> +	#address-cells = <0x02>;
> +	#size-cells = <0x02>;
> +	compatible = "riscv-virtio";
> +	model = "riscv-virtio,qemu";
> +
> +	fw-cfg@10100000 {
> +		dma-coherent;
> +		reg = <0x00 0x10100000 0x00 0x18>;
> +		compatible = "qemu,fw-cfg-mmio";
> +	};
> +
> +	flash@20000000 {
> +		bank-width = <0x04>;
> +		reg = <0x00 0x20000000 0x00 0x2000000
> +			0x00 0x22000000 0x00 0x2000000>;
> +		compatible = "cfi-flash";
> +	};
> +
> +	chosen {
> +		bootargs = [00];
> +		stdout-path = "/soc/uart@10000000";
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x00 0x80000000 0x00 0x8000000>;
> +	};
> +
> +	cpus {
> +		#address-cells = <0x01>;
> +		#size-cells = <0x00>;
> +		timebase-frequency = <0x989680>;
> +
> +		cpu@0 {
> +			phandle = <0x01>;
> +			device_type = "cpu";
> +			reg = <0x00>;
> +			status = "okay";
> +			compatible = "riscv";
> +			riscv,isa = "rv64imafdcsu";
> +			mmu-type = "riscv,sv48";
> +
> +			interrupt-controller {
> +				#interrupt-cells = <0x01>;
> +				interrupt-controller;
> +				compatible = "riscv,cpu-intc";
> +				phandle = <0x02>;
> +			};
> +		};
> +
> +		cpu-map {
> +
> +			cluster0 {
> +
> +				core0 {
> +					cpu = <0x01>;
> +				};
> +			};
> +		};
> +	};
> +
> +	soc {
> +		#address-cells = <0x02>;
> +		#size-cells = <0x02>;
> +		compatible = "simple-bus";
> +		ranges;
> +
> +		rtc@101000 {
> +			interrupts = <0x0b>;
> +			interrupt-parent = <0x03>;
> +			reg = <0x00 0x101000 0x00 0x1000>;
> +			compatible = "google,goldfish-rtc";
> +		};
> +
> +		uart@10000000 {
> +			interrupts = <0x0a>;
> +			interrupt-parent = <0x03>;
> +			clock-frequency = <0x384000>;
> +			reg = <0x00 0x10000000 0x00 0x100>;
> +			compatible = "ns16550a";
> +		};
> +
> +		poweroff {
> +			value = <0x5555>;
> +			offset = <0x00>;
> +			regmap = <0x04>;
> +			compatible = "syscon-poweroff";
> +		};
> +
> +		reboot {
> +			value = <0x7777>;
> +			offset = <0x00>;
> +			regmap = <0x04>;
> +			compatible = "syscon-reboot";
> +		};
> +
> +		test@100000 {
> +			phandle = <0x04>;
> +			reg = <0x00 0x100000 0x00 0x1000>;
> +			compatible = "sifive,test1\0sifive,test0\0syscon";
> +		};
> +
> +		pci@30000000 {
> +			interrupt-map-mask = <0x1800 0x00 0x00 0x07>;
> +			interrupt-map = <0x00 0x00 0x00 0x01 0x03 0x20 0x00 0x00
> +				0x00 0x02 0x03 0x21 0x00 0x00 0x00 0x03
> +				0x03 0x22 0x00 0x00 0x00 0x04 0x03 0x23
> +				0x800 0x00 0x00 0x01 0x03 0x21 0x800 0x00
> +				0x00 0x02 0x03 0x22 0x800 0x00 0x00 0x03
> +				0x03 0x23 0x800 0x00 0x00 0x04 0x03 0x20
> +				0x1000 0x00 0x00 0x01 0x03 0x22 0x1000 0x00
> +				0x00 0x02 0x03 0x23 0x1000 0x00 0x00 0x03
> +				0x03 0x20 0x1000 0x00 0x00 0x04 0x03 0x21
> +				0x1800 0x00 0x00 0x01 0x03 0x23 0x1800 0x00
> +				0x00 0x02 0x03 0x20 0x1800 0x00 0x00 0x03
> +				0x03 0x21 0x1800 0x00 0x00 0x04 0x03 0x22>;
> +			ranges = <0x1000000 0x00 0x00 0x00
> +				0x3000000 0x00 0x10000 0x2000000
> +				0x00 0x40000000 0x00 0x40000000
> +				0x00 0x40000000 0x3000000 0x03
> +				0x00 0x03 0x00 0x01
> +				0x00>;
> +			reg = <0x00 0x30000000 0x00 0x10000000>;
> +			dma-coherent;
> +			bus-range = <0x00 0xff>;
> +			linux,pci-domain = <0x00>;
> +			device_type = "pci";
> +			compatible = "pci-host-ecam-generic";
> +			#size-cells = <0x02>;
> +			#interrupt-cells = <0x01>;
> +			#address-cells = <0x03>;
> +		};
> +
> +		virtio_mmio@10008000 {
> +			interrupts = <0x08>;
> +			interrupt-parent = <0x03>;
> +			reg = <0x00 0x10008000 0x00 0x1000>;
> +			compatible = "virtio,mmio";
> +		};
> +
> +		virtio_mmio@10007000 {
> +			interrupts = <0x07>;
> +			interrupt-parent = <0x03>;
> +			reg = <0x00 0x10007000 0x00 0x1000>;
> +			compatible = "virtio,mmio";
> +		};
> +
> +		virtio_mmio@10006000 {
> +			interrupts = <0x06>;
> +			interrupt-parent = <0x03>;
> +			reg = <0x00 0x10006000 0x00 0x1000>;
> +			compatible = "virtio,mmio";
> +		};
> +
> +		virtio_mmio@10005000 {
> +			interrupts = <0x05>;
> +			interrupt-parent = <0x03>;
> +			reg = <0x00 0x10005000 0x00 0x1000>;
> +			compatible = "virtio,mmio";
> +		};
> +
> +		virtio_mmio@10004000 {
> +			interrupts = <0x04>;
> +			interrupt-parent = <0x03>;
> +			reg = <0x00 0x10004000 0x00 0x1000>;
> +			compatible = "virtio,mmio";
> +		};
> +
> +		virtio_mmio@10003000 {
> +			interrupts = <0x03>;
> +			interrupt-parent = <0x03>;
> +			reg = <0x00 0x10003000 0x00 0x1000>;
> +			compatible = "virtio,mmio";
> +		};
> +
> +		virtio_mmio@10002000 {
> +			interrupts = <0x02>;
> +			interrupt-parent = <0x03>;
> +			reg = <0x00 0x10002000 0x00 0x1000>;
> +			compatible = "virtio,mmio";
> +		};
> +
> +		virtio_mmio@10001000 {
> +			interrupts = <0x01>;
> +			interrupt-parent = <0x03>;
> +			reg = <0x00 0x10001000 0x00 0x1000>;
> +			compatible = "virtio,mmio";
> +		};
> +
> +		plic@c000000 {
> +			phandle = <0x03>;
> +			riscv,ndev = <0x35>;
> +			reg = <0x00 0xc000000 0x00 0x210000>;
> +			interrupts-extended = <0x02 0x0b 0x02 0x09>;
> +			interrupt-controller;
> +			compatible = "sifive,plic-1.0.0\0riscv,plic0";
> +			#interrupt-cells = <0x01>;
> +			#address-cells = <0x00>;
> +		};
> +
> +		clint@2000000 {
> +			interrupts-extended = <0x02 0x03 0x02 0x07>;
> +			reg = <0x00 0x2000000 0x00 0x10000>;
> +			compatible = "sifive,clint0\0riscv,clint0";
> +		};
> +	};
> +};
> diff --git a/configs/qemu-riscv32_defconfig b/configs/qemu-riscv32_defconfig
> index e77e3ed53a0..54953cd347b 100644
> --- a/configs/qemu-riscv32_defconfig
> +++ b/configs/qemu-riscv32_defconfig
> @@ -2,6 +2,7 @@ CONFIG_RISCV=y
>   CONFIG_NR_DRAM_BANKS=1
>   CONFIG_ENV_SIZE=0x20000
>   CONFIG_SYS_MALLOC_LEN=0x800000
> +CONFIG_DEFAULT_DEVICE_TREE="qemu-virt32"
>   CONFIG_TARGET_QEMU_VIRT=y
>   CONFIG_DISTRO_DEFAULTS=y
>   CONFIG_SYS_LOAD_ADDR=0x80200000
> diff --git a/configs/qemu-riscv32_smode_defconfig b/configs/qemu-riscv32_smode_defconfig
> index 03787416f10..21ee08a643e 100644
> --- a/configs/qemu-riscv32_smode_defconfig
> +++ b/configs/qemu-riscv32_smode_defconfig
> @@ -2,6 +2,7 @@ CONFIG_RISCV=y
>   CONFIG_NR_DRAM_BANKS=1
>   CONFIG_ENV_SIZE=0x20000
>   CONFIG_SYS_MALLOC_LEN=0x800000
> +CONFIG_DEFAULT_DEVICE_TREE="qemu-virt32"
>   CONFIG_TARGET_QEMU_VIRT=y
>   CONFIG_RISCV_SMODE=y
>   CONFIG_DISTRO_DEFAULTS=y
> diff --git a/configs/qemu-riscv32_spl_defconfig b/configs/qemu-riscv32_spl_defconfig
> index b0e655be416..3909c9a15ad 100644
> --- a/configs/qemu-riscv32_spl_defconfig
> +++ b/configs/qemu-riscv32_spl_defconfig
> @@ -2,7 +2,7 @@ CONFIG_RISCV=y
>   CONFIG_NR_DRAM_BANKS=1
>   CONFIG_ENV_SIZE=0x20000
>   CONFIG_SYS_MALLOC_LEN=0x800000
> -CONFIG_DEFAULT_DEVICE_TREE="qemu-virt"
> +CONFIG_DEFAULT_DEVICE_TREE="qemu-virt32"
>   CONFIG_SPL=y
>   CONFIG_TARGET_QEMU_VIRT=y
>   CONFIG_RISCV_SMODE=y
> diff --git a/configs/qemu-riscv64_defconfig b/configs/qemu-riscv64_defconfig
> index 1f8dc2d2053..303ad2d5f39 100644
> --- a/configs/qemu-riscv64_defconfig
> +++ b/configs/qemu-riscv64_defconfig
> @@ -2,6 +2,7 @@ CONFIG_RISCV=y
>   CONFIG_NR_DRAM_BANKS=1
>   CONFIG_ENV_SIZE=0x20000
>   CONFIG_SYS_MALLOC_LEN=0x800000
> +CONFIG_DEFAULT_DEVICE_TREE="qemu-virt64"
>   CONFIG_TARGET_QEMU_VIRT=y
>   CONFIG_ARCH_RV64I=y
>   CONFIG_DISTRO_DEFAULTS=y
> diff --git a/configs/qemu-riscv64_smode_defconfig b/configs/qemu-riscv64_smode_defconfig
> index bdcec1fdaba..62cdf91699f 100644
> --- a/configs/qemu-riscv64_smode_defconfig
> +++ b/configs/qemu-riscv64_smode_defconfig
> @@ -2,6 +2,7 @@ CONFIG_RISCV=y
>   CONFIG_NR_DRAM_BANKS=1
>   CONFIG_ENV_SIZE=0x20000
>   CONFIG_SYS_MALLOC_LEN=0x800000
> +CONFIG_DEFAULT_DEVICE_TREE="qemu-virt64"
>   CONFIG_TARGET_QEMU_VIRT=y
>   CONFIG_ARCH_RV64I=y
>   CONFIG_RISCV_SMODE=y
> diff --git a/configs/qemu-riscv64_spl_defconfig b/configs/qemu-riscv64_spl_defconfig
> index 9745c1a586a..34d88da41b0 100644
> --- a/configs/qemu-riscv64_spl_defconfig
> +++ b/configs/qemu-riscv64_spl_defconfig
> @@ -2,7 +2,7 @@ CONFIG_RISCV=y
>   CONFIG_NR_DRAM_BANKS=1
>   CONFIG_ENV_SIZE=0x20000
>   CONFIG_SYS_MALLOC_LEN=0x800000
> -CONFIG_DEFAULT_DEVICE_TREE="qemu-virt"
> +CONFIG_DEFAULT_DEVICE_TREE="qemu-virt64"
>   CONFIG_SPL=y
>   CONFIG_TARGET_QEMU_VIRT=y
>   CONFIG_ARCH_RV64I=y
> 

