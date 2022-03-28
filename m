Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D713E4EA38F
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 01:17:31 +0200 (CEST)
Received: from localhost ([::1]:36908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYyc6-0005Ae-GO
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 19:17:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYyb6-0004PP-89
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 19:16:28 -0400
Received: from [2001:4860:4864:20::32] (port=40215
 helo=mail-oa1-x32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYyb4-0004EH-Gx
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 19:16:27 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so16934598fac.7
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 16:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tseYRu5kDIUjN+KKlwwvt5QNBK9HfbgufwVZoXYIBik=;
 b=vFJSYMfc3+dVMIWNOTK5ZLsOPthzAXlqz8EsC3pOTZ/lSwJzuz/XZ/2PwZF6IdNEr7
 Y3CbdRQcPs5ZPWXvXwEI6y0BZp+tZmlPCeI+P4J+CqDuca+/EimLWnThgJwAiyPzQU1p
 D5vc1ZMJ6XAotUos+MiBQbfkR2ubnhsLK9zmpfcimtk/7b+uw5rYJo2dYyQ3MOQfmZIp
 RDl6vkifbkQay7Gwl8yiwWy2PE6TioQb+SIwpxkgm+vU844p79YZ32YDc81Oyq9mGcmU
 v+MonscLpdgBCQkeQSxEod+Nx/11bopsONkbfAV1ahdLCCmH5LsENDnpXDjKNCaMnery
 +hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tseYRu5kDIUjN+KKlwwvt5QNBK9HfbgufwVZoXYIBik=;
 b=TsUE1Tj258QwpZaWZg3cYxBgbkpAT7TGCVQl+VlAi9OAN3k4uMELllEfBSUO/b/dwA
 fihZfqgsSrUo46rbjiA0elX3QN1N96hD7xzSbccpF+4IfyYacnyI4blQ8n+koqSHNhto
 6b0JX78fiRgl6UPY4sTO9T3l7PTcf6nJXnon3IqWUB/ikCZZUsqIbWs9UrBWatBjVEyz
 l1+G4RDzS+sw7/gwwcNo0dfpi2aEzt8+DFXXbUrghBY4E3T6umMBEm4T7VN929G+InzZ
 yl7aArPIULGQo3/riXMZFLHZx2703+xUnJjSgCzVHESJ83kXGWudL0+zvc8YaU9qbHSH
 Dkkw==
X-Gm-Message-State: AOAM531eO1bbRViy04MCDKtKI433umYm/4mgTG9nrz7Wpp5gPaSEooRV
 66z8djyQSb1yY3CBuherkFmwjg==
X-Google-Smtp-Source: ABdhPJxpKvS6qGKam4wPrCi913PabhcK6YRVPCqclIOdPDClSP0myEfEgQd7CGZe/8o3ki9ud7syhA==
X-Received: by 2002:a05:6870:82ab:b0:dd:cbc9:70bd with SMTP id
 q43-20020a05687082ab00b000ddcbc970bdmr786046oae.84.1648509385099; 
 Mon, 28 Mar 2022 16:16:25 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 r205-20020acadad6000000b002ef824213c9sm7914319oig.55.2022.03.28.16.16.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 16:16:24 -0700 (PDT)
Message-ID: <e2738a15-f6e7-7d0b-7412-690c8363b7c9@linaro.org>
Date: Mon, 28 Mar 2022 17:16:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH v7 20/29] hw/loongarch: Add irq hierarchy for the
 system
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220328125749.2918087-1-yangxiaojuan@loongson.cn>
 <20220328125749.2918087-21-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220328125749.2918087-21-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::32
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x32.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/22 06:57, Xiaojuan Yang wrote:
> +static struct DeviceState *ipi, *extioi;

Static variables can't be right.
These need to be somewhere else, or ...

> @@ -107,12 +115,101 @@ static void loongarch_cpu_init(LoongArchCPU *la_cpu, int cpu_num)
>                             NULL, "iocsr_misc", IOCSR_MEM_SIZE);
>   
>       memory_region_add_subregion(&env->system_iocsr, 0, &env->iocsr_mem);
> +    /* ipi memory region */
> +    ipi_addr = SMP_IPI_MAILBOX + cpu_num * 0x100;
> +    memory_region_add_subregion(&env->system_iocsr, ipi_addr,
> +                                sysbus_mmio_get_region(SYS_BUS_DEVICE(ipi),
> +                                cpu_num));
> +    /* extioi memory region */
> +    memory_region_add_subregion(&env->system_iocsr, APIC_BASE,
> +                                sysbus_mmio_get_region(SYS_BUS_DEVICE(extioi),
> +                                cpu_num));

... this code needs to be moved somewhere else.

> +static void loongarch_irq_init(LoongArchMachineState *lams,
> +                               DeviceState *ipi, DeviceState *extioi)
> +{
> +    MachineState *ms = MACHINE(lams);
> +    DeviceState *pch_pic, *pch_msi, *cpudev;
> +
> +    SysBusDevice *d;
> +    int cpu, pin, i;
> +
> +    for (cpu = 0; cpu < ms->smp.cpus; cpu++) {
> +        cpudev = DEVICE(qemu_get_cpu(cpu));
> +        /* connect ipi irq to cpu irq */
> +        qdev_connect_gpio_out(ipi, cpu, qdev_get_gpio_in(cpudev, IRQ_IPI));
> +    }
> +
> +    for (i = 0; i < EXTIOI_IRQS; i++) {
> +        sysbus_connect_irq(SYS_BUS_DEVICE(extioi),
> +                           i, qdev_get_gpio_in(extioi, i));
> +    }

Um... connecting extioi to itself?

I think that graphic that you used in the description of patch 15 belongs here as a comment.

> diff --git a/include/hw/pci-host/ls7a.h b/include/hw/pci-host/ls7a.h
> new file mode 100644
> index 0000000000..bf80e99ce1
> --- /dev/null
> +++ b/include/hw/pci-host/ls7a.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * QEMU LoongArch CPU
> + *
> + * Copyright (c) 2021 Loongson Technology Corporation Limited
> + */
> +
> +#ifndef HW_LS7A_H
> +#define HW_LS7A_H
> +
> +#include "hw/pci/pci.h"
> +#include "hw/pci/pcie_host.h"
> +#include "hw/pci-host/pam.h"
> +#include "qemu/units.h"
> +#include "qemu/range.h"
> +#include "qom/object.h"
> +
> +#define LS7A_PCH_REG_BASE       0x10000000UL
> +#define LS7A_IOAPIC_REG_BASE    (LS7A_PCH_REG_BASE)
> +#define LS7A_PCH_MSI_ADDR_LOW   0x2FF00000UL
> +
> +/*
> + * According to the kernel pch irq start from 64 offset
> + * 0 ~ 16 irqs used for non-pci device while 16 ~ 64 irqs
> + * used for pci device.
> + */
> +#define PCH_PIC_IRQ_OFFSET      64
> +#define LS7A_DEVICE_IRQS        16
> +#define LS7A_PCI_IRQS           48
> +#endif

Why is this file in this patch?
It seems like it should be in either patch 17 or 18?


r~

