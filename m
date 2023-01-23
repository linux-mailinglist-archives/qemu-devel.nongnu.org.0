Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F17667808B
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 16:52:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJz79-0008HK-VQ; Mon, 23 Jan 2023 10:52:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pJz75-0008Gb-3p; Mon, 23 Jan 2023 10:52:06 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pJz73-0006NW-2b; Mon, 23 Jan 2023 10:52:02 -0500
Received: by mail-ej1-x62c.google.com with SMTP id mp20so31614118ejc.7;
 Mon, 23 Jan 2023 07:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7zht5zbsqDxzLNg6JA5qVxkHPeUiIy8JmRJ4O1v3ReM=;
 b=exb3POTkx5xLOdpmPW2SLP9gSmuxqvzwd4LydgjxXOlb7rS/VikCtGQC9GF/P3mZWk
 mYBw6E0diuRSdurQ7qjf4LDNKAp7mLf/Ywb72IaxfhJkXxggHr9EjDm9PwsUF4t/D1Lc
 qqBdmB/6GMV/SrtdE0P9D0l88/PpnnSpYxSsS9X/atNGHIwC0q8HHuONaGqSPaaMqI3g
 5G2WWYvLyjIl6UOBSkV2xHFUU52nCZq6mC8rMMQ8CwRgB5OM5ilwINd2PhFwMKAwiUUG
 b1vjTHxy2bbYQcpSMZ2W/ftRM4LsXfwe/KarTRzNVQP5iGmBMygNr8Zn+bEnoMPv7dwO
 sR4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7zht5zbsqDxzLNg6JA5qVxkHPeUiIy8JmRJ4O1v3ReM=;
 b=wzwa3LQmsiLSKcjO247DqcGE6rC+8MuiFFw7Jl5JqhLhciGPtGGvUoJXv7nUAG2n/v
 /gzQbEaKpQ43zkNTq/7Aj7GDlseh7yEDfWK3rGsceyE0WkHOFKs/qJw5gc0h8lZMZMui
 kaeqG2Vy327ccbsb3O0SP32tfX0i8MD/T/tpds8AY8XYPabEhouMz9LkXM7Oha9/vGRP
 nfBwDfZtazEaRicGJl9oywY4nVEoE8Ls/0vG2vkMPuTsM89Cejdd7sVniKbImN06Y2uh
 KItPjXfGiLHwM9HPL7Di2FdOLPq4BB8tSlstrHI+FV+GlO3WliAFkz7WcK05OLYZ3HLa
 ULYQ==
X-Gm-Message-State: AFqh2krWcdtd6WOIm7f/mmzNhXGyph33tNC/7Zod0LevBKE7k6F+V7Yt
 6u0W9Iy7wn/buRY4fA1f61I=
X-Google-Smtp-Source: AMrXdXteAXLxhBo0ZCorn8wQAPV6pCNYTNMwzCqA1aBqRNzAn/lmxBsR2WRjlNqbzKFqTjVIMudcfA==
X-Received: by 2002:a17:906:c18f:b0:7f7:a4ed:f2d4 with SMTP id
 g15-20020a170906c18f00b007f7a4edf2d4mr39275546ejz.77.1674489117493; 
 Mon, 23 Jan 2023 07:51:57 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb20021b9da3234f1ff5e.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:21b9:da32:34f1:ff5e])
 by smtp.gmail.com with ESMTPSA id
 tc9-20020a1709078d0900b0086edf177209sm12610845ejc.78.2023.01.23.07.51.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 07:51:57 -0800 (PST)
Date: Mon, 23 Jan 2023 15:51:49 +0000
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
In-Reply-To: <9578e7ca-5f3d-2d00-7288-16ae486fb8c0@linaro.org>
References: <20230109172347.1830-1-shentey@gmail.com>
 <211e791a-9d37-9655-ca93-9e3bda2e21c3@linaro.org>
 <6D8095E7-E540-4D7E-B976-D71522F8664A@gmail.com>
 <752135A6-44DC-4504-8E16-C2E71EC76872@gmail.com>
 <9578e7ca-5f3d-2d00-7288-16ae486fb8c0@linaro.org>
Message-ID: <36BB4E64-8163-44BA-B622-8943E1C1DCE8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
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



Am 23=2E Januar 2023 09:25:51 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <p=
hilmd@linaro=2Eorg>:
>On 20/1/23 13:22, Bernhard Beschow wrote:
>> Am 13=2E Januar 2023 17:39:45 UTC schrieb Bernhard Beschow <shentey@gma=
il=2Ecom>:
>>> Am 13=2E Januar 2023 08:46:53 UTC schrieb "Philippe Mathieu-Daud=C3=A9=
" <philmd@linaro=2Eorg>:
>>>> On 9/1/23 18:23, Bernhard Beschow wrote:
>>>>> This series consolidates the implementations of the PIIX3 and PIIX4 =
south
>>>>> bridges and is an extended version of [1]=2E The motivation is to sh=
are as much
>>>>> code as possible and to bring both device models to feature parity s=
uch that
>>>>> perhaps PIIX4 can become a drop-in-replacement for PIIX3 in the pc m=
achine=2E This
>>>>> could resolve the "Frankenstein" PIIX4-PM problem in PIIX3 discussed=
 on this
>>>>> list before=2E
>>>>=20
>>>>> Bernhard Beschow (30):
>>>>>     hw/pci/pci: Factor out pci_bus_map_irqs() from pci_bus_irqs()
>>>>>     hw/isa/piix3: Decouple INTx-to-LNKx routing which is board-speci=
fic
>>>>>     hw/isa/piix4: Decouple INTx-to-LNKx routing which is board-speci=
fic
>>>>>     hw/mips/Kconfig: Track Malta's PIIX dependencies via Kconfig
>>>>>     hw/usb/hcd-uhci: Introduce TYPE_ defines for device models
>>>>>     hw/intc/i8259: Make using the isa_pic singleton more type-safe
>>>>>     hw/intc/i8259: Introduce i8259 proxy TYPE_ISA_PIC
>>>>>     hw/i386/pc: Create RTC controllers in south bridges
>>>>>     hw/i386/pc: No need for rtc_state to be an out-parameter
>>>>>     hw/i386/pc_piix: Allow for setting properties before realizing P=
IIX3
>>>>>       south bridge
>>>>>     hw/isa/piix3: Create USB controller in host device
>>>>>     hw/isa/piix3: Create power management controller in host device
>>>>>     hw/isa/piix3: Create TYPE_ISA_PIC in host device
>>>>>     hw/isa/piix3: Create IDE controller in host device
>>>>>     hw/isa/piix3: Wire up ACPI interrupt internally
>>>>>     hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
>>>>>     hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
>>>>>     hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
>>>>>     hw/isa/piix3: Drop the "3" from PIIX base class
>>>>>     hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
>>>>>     hw/isa/piix4: Remove unused inbound ISA interrupt lines
>>>>>     hw/isa/piix4: Use TYPE_ISA_PIC device
>>>>>     hw/isa/piix4: Reuse struct PIIXState from PIIX3
>>>>>     hw/isa/piix4: Rename reset control operations to match PIIX3
>>>>>     hw/isa/piix3: Merge hw/isa/piix4=2Ec
>>>>>     hw/isa/piix: Harmonize names of reset control memory regions
>>>>>     hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4
>>>>>     hw/isa/piix: Rename functions to be shared for interrupt trigger=
ing
>>>>>     hw/isa/piix: Consolidate IRQ triggering
>>>>>     hw/isa/piix: Share PIIX3's base class with PIIX4
>>>>>=20
>>>>> Philippe Mathieu-Daud=C3=A9 (3):
>>>>>     hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition
>>>>>     hw/mips/malta: Set PIIX4 IRQ routes in embedded bootloader
>>>>>     hw/isa/piix4: Correct IRQRC[A:D] reset values
>>>>=20
>>>> I'm queuing the first 10 patches for now to alleviate the size of thi=
s
>>>> series, and I'll respin a v7 with the rest to avoid making you suffer
>>>> any longer :/ Thanks for insisting in this effort and I apologize it
>>>> is taking me so long=2E=2E=2E
>>>=20
>>> Okay=2E=2E=2E What's the further plan? Is there anything missing?
>>=20
>> Ping
>
>The plan is "I'll respin a v7 with the rest"=2E

I understood that part=2E I wonder what the blocking issue is/was=2E

Best regards,
Bernhard

