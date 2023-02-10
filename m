Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B92692342
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:28:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWG0-0003bG-MI; Fri, 10 Feb 2023 11:28:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pQWFw-0003au-CU; Fri, 10 Feb 2023 11:28:12 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pQWFt-0006Wd-Nd; Fri, 10 Feb 2023 11:28:11 -0500
Received: by mail-ej1-x62a.google.com with SMTP id dr8so17220476ejc.12;
 Fri, 10 Feb 2023 08:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4+fTemlH1kvHhEdSlGQFxAeDKMGKhyDOGppbfWUQ7xM=;
 b=WRjR9MqkV/rSACDiqZIev4ZsDNMbG42OqxD272LUs5QarnaLCUARPluXU3IPZf7PKx
 IfLVWXbNAzmPVl/lGeEEb15/rSVAvEv7gE0FmxQCRi0BhTfChDSYcQsxad66juCkJdQ0
 ANUEwFNsJ8+uYRxDVFCz7JjjNCfn0t50cRMDRIB8SKWC3slymCJf7yJ5K+sQfqatVeFG
 bPeu6X1EOdwfojldVdBzhTT1zqyG38xPsFxhFsoGX+/2WWkrlv4GFCGQ4Tb6HpNZML7y
 kgORzTl7irwmDKrtxxKgpEfTime9u7OTV1aWwXo2LzB0dHSR4UsEEeXR/ClMtTGZG0+8
 7LRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4+fTemlH1kvHhEdSlGQFxAeDKMGKhyDOGppbfWUQ7xM=;
 b=qSzIShMCQkGg99qC5OiphydIJWwchmo7o6m0So15EpErKMkT69ofBXfb9W7LJ/I910
 oJVuTAftnM8dxGf3udTk+b1q76NM94AuAwc+JlIw9gTXue16IeaqtUSm2K0qr/sbpuLb
 yVraW/yugvUX0P5ia1gls02NmYD0CytF/EoqwKhIhW58qlXlzuvI3MJWYnp8KMtnG4KZ
 0K4A7NLR1LkS2pIZW4Tvid/9jgy4qnq6Xi39Ah2ANp1T2/LmMWsv7tySAS97JU8KeuBv
 +OMHvCKPKk7uFjpJ3JgmMB4EIm+CRUSpanwpxrBgRTI+0iJ/KoSolYgpcSRs7IEdgYhD
 xNvA==
X-Gm-Message-State: AO0yUKXN8qxGAWXdcIihyTV8/Ww1RqrfyVdgyrqEOIqdht6HuTWobtQn
 KYG7+qeu+pWSV649YXPO49A=
X-Google-Smtp-Source: AK7set/pHIvXsXkgrUAPEon1XQgF29cP8v4eVxnokwlaoGHpvxhYxJNAOcuAb58RyxmaHb4mhU6t0g==
X-Received: by 2002:a17:906:a3da:b0:878:5c36:a14a with SMTP id
 ca26-20020a170906a3da00b008785c36a14amr14787346ejb.23.1676046485668; 
 Fri, 10 Feb 2023 08:28:05 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-191-141-225.77.191.pool.telefonica.de.
 [77.191.141.225]) by smtp.gmail.com with ESMTPSA id
 u19-20020a1709067d1300b0088b93bfa765sm2563972ejo.138.2023.02.10.08.28.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 08:28:04 -0800 (PST)
Date: Fri, 10 Feb 2023 16:27:55 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>
Subject: Re: [PATCH v6 00/33] Consolidate PIIX south bridges
In-Reply-To: <36BB4E64-8163-44BA-B622-8943E1C1DCE8@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
 <211e791a-9d37-9655-ca93-9e3bda2e21c3@linaro.org>
 <6D8095E7-E540-4D7E-B976-D71522F8664A@gmail.com>
 <752135A6-44DC-4504-8E16-C2E71EC76872@gmail.com>
 <9578e7ca-5f3d-2d00-7288-16ae486fb8c0@linaro.org>
 <36BB4E64-8163-44BA-B622-8943E1C1DCE8@gmail.com>
Message-ID: <50FA07E9-C8DA-4D6E-9A87-F40BB9C2D324@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



Am 23=2E Januar 2023 15:51:49 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>
>
>Am 23=2E Januar 2023 09:25:51 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>>On 20/1/23 13:22, Bernhard Beschow wrote:
>>> Am 13=2E Januar 2023 17:39:45 UTC schrieb Bernhard Beschow <shentey@gm=
ail=2Ecom>:
>>>> Am 13=2E Januar 2023 08:46:53 UTC schrieb "Philippe Mathieu-Daud=C3=
=A9" <philmd@linaro=2Eorg>:
>>>>> On 9/1/23 18:23, Bernhard Beschow wrote:
>>>>>> This series consolidates the implementations of the PIIX3 and PIIX4=
 south
>>>>>> bridges and is an extended version of [1]=2E The motivation is to s=
hare as much
>>>>>> code as possible and to bring both device models to feature parity =
such that
>>>>>> perhaps PIIX4 can become a drop-in-replacement for PIIX3 in the pc =
machine=2E This
>>>>>> could resolve the "Frankenstein" PIIX4-PM problem in PIIX3 discusse=
d on this
>>>>>> list before=2E
>>>>>=20
>>>>>> Bernhard Beschow (30):
>>>>>>     hw/pci/pci: Factor out pci_bus_map_irqs() from pci_bus_irqs()
>>>>>>     hw/isa/piix3: Decouple INTx-to-LNKx routing which is board-spec=
ific
>>>>>>     hw/isa/piix4: Decouple INTx-to-LNKx routing which is board-spec=
ific
>>>>>>     hw/mips/Kconfig: Track Malta's PIIX dependencies via Kconfig
>>>>>>     hw/usb/hcd-uhci: Introduce TYPE_ defines for device models
>>>>>>     hw/intc/i8259: Make using the isa_pic singleton more type-safe
>>>>>>     hw/intc/i8259: Introduce i8259 proxy TYPE_ISA_PIC
>>>>>>     hw/i386/pc: Create RTC controllers in south bridges
>>>>>>     hw/i386/pc: No need for rtc_state to be an out-parameter
>>>>>>     hw/i386/pc_piix: Allow for setting properties before realizing =
PIIX3
>>>>>>       south bridge
>>>>>>     hw/isa/piix3: Create USB controller in host device
>>>>>>     hw/isa/piix3: Create power management controller in host device
>>>>>>     hw/isa/piix3: Create TYPE_ISA_PIC in host device
>>>>>>     hw/isa/piix3: Create IDE controller in host device
>>>>>>     hw/isa/piix3: Wire up ACPI interrupt internally
>>>>>>     hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
>>>>>>     hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
>>>>>>     hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
>>>>>>     hw/isa/piix3: Drop the "3" from PIIX base class
>>>>>>     hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
>>>>>>     hw/isa/piix4: Remove unused inbound ISA interrupt lines
>>>>>>     hw/isa/piix4: Use TYPE_ISA_PIC device
>>>>>>     hw/isa/piix4: Reuse struct PIIXState from PIIX3
>>>>>>     hw/isa/piix4: Rename reset control operations to match PIIX3
>>>>>>     hw/isa/piix3: Merge hw/isa/piix4=2Ec
>>>>>>     hw/isa/piix: Harmonize names of reset control memory regions
>>>>>>     hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4
>>>>>>     hw/isa/piix: Rename functions to be shared for interrupt trigge=
ring
>>>>>>     hw/isa/piix: Consolidate IRQ triggering
>>>>>>     hw/isa/piix: Share PIIX3's base class with PIIX4
>>>>>>=20
>>>>>> Philippe Mathieu-Daud=C3=A9 (3):
>>>>>>     hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition
>>>>>>     hw/mips/malta: Set PIIX4 IRQ routes in embedded bootloader
>>>>>>     hw/isa/piix4: Correct IRQRC[A:D] reset values
>>>>>=20
>>>>> I'm queuing the first 10 patches for now to alleviate the size of th=
is
>>>>> series, and I'll respin a v7 with the rest to avoid making you suffe=
r
>>>>> any longer :/ Thanks for insisting in this effort and I apologize it
>>>>> is taking me so long=2E=2E=2E
>>>>=20
>>>> Okay=2E=2E=2E What's the further plan? Is there anything missing?
>>>=20
>>> Ping
>>
>>The plan is "I'll respin a v7 with the rest"=2E
>
>I understood that part=2E I wonder what the blocking issue is/was=2E

The first part of this series contains piix3 changes such as the ISA proxy=
 pic and movement of rtc=2E This seems the riskier part of the series to me=
 which I'd like to get feedback on from the field rather sooner than later=
=2E The reason is that I can't currently forsee how fast I could react if t=
hese changes were merged during (soft) freeze=2E

Is there a possibility to at least get the piix3 part merged already? Mayb=
e perhaps via the pc tree?

Thanks,
Bernhard

>
>Best regards,
>Bernhard

