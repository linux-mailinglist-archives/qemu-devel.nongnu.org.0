Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1F4648F68
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Dec 2022 16:17:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p41ZX-0002TH-GI; Sat, 10 Dec 2022 10:15:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p41ZT-0002Su-13
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 10:15:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p41ZR-0006aj-3A
 for qemu-devel@nongnu.org; Sat, 10 Dec 2022 10:15:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670685319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2vfa4q+cOjwUp+DXb8p3P7GsnzuMPGgH/AB4pskqd0o=;
 b=bSjJw1zq6+Ubr3lGJo/iwTfwgV1V/TljVOla1rn6IXQZgdxPw4A8TC5EHgG6Y3L/AXHYfI
 gNvDFU8n3uMAvU6mJKUsBY26ReQwewcPK/pW96mxBg+UJ/q3Mo3PUaZgX28ZIlJi2xJQs0
 v0s88YOox4tQLO1tlOwbnlWs/UiRpLI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-669-vGM7nS5ENGu--hBhC6JeBQ-1; Sat, 10 Dec 2022 10:15:18 -0500
X-MC-Unique: vGM7nS5ENGu--hBhC6JeBQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 o5-20020a05600c510500b003cfca1a327fso1447244wms.8
 for <qemu-devel@nongnu.org>; Sat, 10 Dec 2022 07:15:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2vfa4q+cOjwUp+DXb8p3P7GsnzuMPGgH/AB4pskqd0o=;
 b=vdtd+5NBmrlqaoXZIf7pyi1z7v/t6jz0IahB90AIbbVhMjZxMr1B1pnepJ+VfqeQ5y
 3MpngfhFZADlvcro7b3nOzHm5G8AyjIi5wnZMy9B3m5iLkCsnIX8dPAlDJZHiuJ92wXj
 awKKV+x1R6HHcb+v3w4kexGBUfBjji106vd5M3/EuwTuTK6ZASvGJrGHHfh5/rOiuwmi
 MeeNSPzs8YSH1n6sKQPPlxusoeIBhVkI9TJumjoDfvOUfWb8Y1lJipPmXsjDVh5GdlLu
 xnrSExdihBHrwneqVhIgO9yN06BxvFHwGgnbKiccaOMoqHf5kVVrI0PhybXn6rGoZKMy
 o2lA==
X-Gm-Message-State: ANoB5plaor4ubdiz8ybZKiLPMGgWjlsFZhJA8XkOoMCgzPZQFyX9sNZN
 qmd1BYrXKJqjy7PbiHAK1JA58Q9QDuboBvCUU9zsyAN7LprRvr50cBDowoKlHnfhbcjdvSb7cj7
 FgF9Au31D4fFy9e4=
X-Received: by 2002:a5d:564a:0:b0:24c:f1ca:b2df with SMTP id
 j10-20020a5d564a000000b0024cf1cab2dfmr1744211wrw.67.1670685301936; 
 Sat, 10 Dec 2022 07:15:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4QFL8eUclQsyDuzcIa+Lu5/2vl4IGI0gnWAmHDI7ThPGgO2lGw4h/Z+27G8WPfBQxD8sPK1Q==
X-Received: by 2002:a05:6402:4006:b0:46c:d5e8:30e4 with SMTP id
 d6-20020a056402400600b0046cd5e830e4mr10093438eda.23.1670684499434; 
 Sat, 10 Dec 2022 07:01:39 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-176-216.web.vodafone.de.
 [109.43.176.216]) by smtp.gmail.com with ESMTPSA id
 ch17-20020a0564021bd100b0046c2eee21a2sm1749082edb.11.2022.12.10.07.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Dec 2022 07:01:38 -0800 (PST)
Message-ID: <f2ce619b-1ca5-7c75-3d71-27bbadf918a2@redhat.com>
Date: Sat, 10 Dec 2022 16:01:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20221209170042.71169-1-philmd@linaro.org>
 <20221209170042.71169-3-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH-for-8.0 2/3] hw/intc: Move omap_lcdc.c out of
 target-specific source set
In-Reply-To: <20221209170042.71169-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.288, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


I suggest to change the subject since you move more than just the omap 
controller.

On 09/12/2022 18.00, Philippe Mathieu-Daudé wrote:
> The Goldfish interrupt controller is not target specific.
> 
> While the Exynos interrupt combiner is only used by the ARM
> targets, we can build this device once for all.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/intc/meson.build | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index bcbf22ff51..2ad8648366 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -13,6 +13,8 @@ softmmu_ss.add(when: 'CONFIG_ARM_GICV3_TCG', if_true: files(
>     'arm_gicv3_redist.c',
>   ))
>   softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_pic.c'))
> +softmmu_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_combiner.c'))
> +softmmu_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
>   softmmu_ss.add(when: 'CONFIG_HEATHROW_PIC', if_true: files('heathrow_pic.c'))
>   softmmu_ss.add(when: 'CONFIG_I8259', if_true: files('i8259_common.c', 'i8259.c'))
>   softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('imx_avic.c', 'imx_gpcv2.c'))
> @@ -33,7 +35,7 @@ specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
>   specific_ss.add(when: ['CONFIG_ARM_GIC_KVM', 'TARGET_AARCH64'], if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
>   specific_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_nvic.c'))
>   specific_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('aspeed_vic.c'))

I think aspeed_vic.c could be moved to softmmu_ss, too?

> -specific_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_gic.c', 'exynos4210_combiner.c'))
> +specific_ss.add(when: 'CONFIG_EXYNOS4', if_true: files('exynos4210_gic.c'))

I just gave it a try, and it seems like exynos4210_gic.c can be moved to 
softmmu_ss, too? Did it fail for you?

>   specific_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_irqmp.c'))
>   specific_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic.c'))
>   specific_ss.add(when: 'CONFIG_LOONGSON_LIOINTC', if_true: files('loongson_liointc.c'))
> @@ -60,7 +62,6 @@ specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('xics_spapr.c', 'spapr_xi
>   specific_ss.add(when: 'CONFIG_XIVE', if_true: files('xive.c'))
>   specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
>   		if_true: files('spapr_xive_kvm.c'))
> -specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
>   specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
>   specific_ss.add(when: 'CONFIG_NIOS2_VIC', if_true: files('nios2_vic.c'))
>   specific_ss.add(when: 'CONFIG_LOONGARCH_IPI', if_true: files('loongarch_ipi.c'))

While you're at it, it seems like these could be moved, too:

  CONFIG_ALLWINNER_A10_PIC / allwinner-a10-pic.c
  CONFIG_OMAP / omap_intc.c
  CONFIG_RASPI / bcm2835_ic.c , bcm2836_control.c

What do you think?

  Thomas


