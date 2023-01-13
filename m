Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2A2669190
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 09:48:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGFiM-0002N5-Iu; Fri, 13 Jan 2023 03:47:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGFiG-0002M4-1w
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:47:02 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGFiD-0005dg-9Y
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 03:46:59 -0500
Received: by mail-wr1-x431.google.com with SMTP id e3so11154223wru.13
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 00:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7sN7mW/rsD8601mF/U9Jne/Qx7dXlGG7c7jydlSEIN0=;
 b=LQZBHvLI51DDd+o5Zl+DeTBbjEz0IetrBG0ADVDZbvaNgsYJ2qDQSsxOlMEqkqDsVN
 V7ngN0Wb8eHrYZvcKMSywsXG+7jfvHavuqVQPNduXu3gjgoCyFanxwhZXJN6EySbeYuB
 sCkl5CATkfrRuMX12+nNp55E51L1i7Zjaxid49Uake8n+X7G6+EnyMm7E5igGVmh8bK/
 FaxABAS4+/KiFVu8UJiZmgthWxVy1BLycecoOW+le+v39SdR0rEJrU2j8GBafUpTCSdX
 b38vkENFWLH8RdmFbD5lK9EF4RgMpJP682h291Q9TIHhLAlFVWPkgoMwUdBfvR7xTMKi
 EAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7sN7mW/rsD8601mF/U9Jne/Qx7dXlGG7c7jydlSEIN0=;
 b=5ElKi8eFuIQ5O+EayNTMEIOnMb00GEh8XlUKGyEzDR9cJ/gnPqJsLawCAHPoNRK/5Q
 p/aKVatmPFGgb2v+LuJPjv3S6nAKOi4H8I+4OcdLUzHPRZJjc50ChMfu/0f64shkVAnJ
 ZvfflqF3l1T0mhDW0AKLy8uAy6SrZpDOfE8eKwzVhES5cm9HtyxKft3/4S3MOUd9CSSX
 OoyAR6voE1xcNUERjClFClCmyio5mAUY+mXGdvpgmWTPrrE29k20ftUtk+rAlnx01PAh
 2JQagIuadPnSROrg339muwyMR3x9eh6sSms77qa9YPhtqc0kXaWRqWn0uNmbYyeUwD7U
 3SEA==
X-Gm-Message-State: AFqh2kr68sv0tjlp5NQAAg5K5VnRVk3bXP+Jt2vxfDZiBYoLx+nEy7VC
 7HYlM4ie3clLOfOqd85i6mCxDw==
X-Google-Smtp-Source: AMrXdXu4hy1WDuCu84JSCtllpj7jElWaEKj+gPJWZQuKXBp+oG1cZvQ006Ty2rWAokWwWYq/0KfoqA==
X-Received: by 2002:adf:ab16:0:b0:2b6:2eb3:82a1 with SMTP id
 q22-20020adfab16000000b002b62eb382a1mr19590668wrc.67.1673599615421; 
 Fri, 13 Jan 2023 00:46:55 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 az22-20020adfe196000000b002bddaea7a0bsm2345170wrb.57.2023.01.13.00.46.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 00:46:55 -0800 (PST)
Message-ID: <211e791a-9d37-9655-ca93-9e3bda2e21c3@linaro.org>
Date: Fri, 13 Jan 2023 09:46:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v6 00/33] Consolidate PIIX south bridges
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20230109172347.1830-1-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Bernhard,

On 9/1/23 18:23, Bernhard Beschow wrote:
> This series consolidates the implementations of the PIIX3 and PIIX4 south
> bridges and is an extended version of [1]. The motivation is to share as much
> code as possible and to bring both device models to feature parity such that
> perhaps PIIX4 can become a drop-in-replacement for PIIX3 in the pc machine. This
> could resolve the "Frankenstein" PIIX4-PM problem in PIIX3 discussed on this
> list before.

> Bernhard Beschow (30):
>    hw/pci/pci: Factor out pci_bus_map_irqs() from pci_bus_irqs()
>    hw/isa/piix3: Decouple INTx-to-LNKx routing which is board-specific
>    hw/isa/piix4: Decouple INTx-to-LNKx routing which is board-specific
>    hw/mips/Kconfig: Track Malta's PIIX dependencies via Kconfig
>    hw/usb/hcd-uhci: Introduce TYPE_ defines for device models
>    hw/intc/i8259: Make using the isa_pic singleton more type-safe
>    hw/intc/i8259: Introduce i8259 proxy TYPE_ISA_PIC
>    hw/i386/pc: Create RTC controllers in south bridges
>    hw/i386/pc: No need for rtc_state to be an out-parameter
>    hw/i386/pc_piix: Allow for setting properties before realizing PIIX3
>      south bridge
>    hw/isa/piix3: Create USB controller in host device
>    hw/isa/piix3: Create power management controller in host device
>    hw/isa/piix3: Create TYPE_ISA_PIC in host device
>    hw/isa/piix3: Create IDE controller in host device
>    hw/isa/piix3: Wire up ACPI interrupt internally
>    hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
>    hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
>    hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
>    hw/isa/piix3: Drop the "3" from PIIX base class
>    hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
>    hw/isa/piix4: Remove unused inbound ISA interrupt lines
>    hw/isa/piix4: Use TYPE_ISA_PIC device
>    hw/isa/piix4: Reuse struct PIIXState from PIIX3
>    hw/isa/piix4: Rename reset control operations to match PIIX3
>    hw/isa/piix3: Merge hw/isa/piix4.c
>    hw/isa/piix: Harmonize names of reset control memory regions
>    hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4
>    hw/isa/piix: Rename functions to be shared for interrupt triggering
>    hw/isa/piix: Consolidate IRQ triggering
>    hw/isa/piix: Share PIIX3's base class with PIIX4
> 
> Philippe Mathieu-Daudé (3):
>    hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition
>    hw/mips/malta: Set PIIX4 IRQ routes in embedded bootloader
>    hw/isa/piix4: Correct IRQRC[A:D] reset values

I'm queuing the first 10 patches for now to alleviate the size of this
series, and I'll respin a v7 with the rest to avoid making you suffer
any longer :/ Thanks for insisting in this effort and I apologize it
is taking me so long...

Regards,

Phil.

