Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B635BC067
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 00:32:45 +0200 (CEST)
Received: from localhost ([::1]:47028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa2qC-0005VR-5G
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 18:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oa2o0-0003kx-C5
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 18:30:28 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:42662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oa2nx-0005so-Ip
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 18:30:27 -0400
Received: by mail-ed1-x532.google.com with SMTP id q21so38854338edc.9
 for <qemu-devel@nongnu.org>; Sun, 18 Sep 2022 15:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=zEzbJjNOPoo6FK5Is/Q4nQEi3fOeuWbWEIdbg+/p2gg=;
 b=HPgisDY8gwk3qsyIO3ya/2tqwJPQ8lQCufBVtrokntGtpt/N/tG5qOm3t42QxRH2Wy
 mkgLEZzwlLYfDTMEQrmRIzsD940n3uwbQ7yBT1KWdGpXJYxyMvnA7Ltj02/57IzeG021
 0ko3la8eTJLO8k00jFNfAOWVLqmVD2ufnfCO+qyfpAaqCAf1NTg56AZHEMcfQjT8Wa1x
 e4tpiHFoIrpNklKfarjZMKFvJ0hg5FJACZ4h1sxQiduO5cJUJekQfM6nBKpgpaIglYne
 QQ32Q6vtXK45dlsY/G3tvORgVVHBoOzxCK9BvsRmXDqE/RJaJbHJgCO+a7Q16v8nNQVa
 4MaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=zEzbJjNOPoo6FK5Is/Q4nQEi3fOeuWbWEIdbg+/p2gg=;
 b=hRO8TAkuBJiKC1eMN+goyA9oQWs11Ox4La9Dul4fL9qy9wq+IW3tP+f4qghePK3bvn
 LkvYimCl7Mc9VE5k0zAmnOrWzpz9kIzU0bPOsNZI1EjcDXPbPuLKqelNJtZ+o6CNrkpM
 4q2G/H8NKAEPbi75Dzh/FT+bNHF4I1YmUzwSURaZxMXZsO0pI18cLjIoMQm7/kuI4Rqc
 67jK/6dQqhLL75Pe2EiiiwQvS+S3q5xn4mfLna72T8bIubcNiDCHJIqbXwVTBknQmcrj
 2VBq0zeJUHyX1TG60RB9A8PgCBuTG/z3im4rGvNRpn5TvJ1Spq+ElB2KdfzgiUbttnqw
 0jnw==
X-Gm-Message-State: ACrzQf3BGsP831CCediTytdNQ0vO0ZqUhHmwxWp3v0YYxqYe6nUZtGrN
 HRfqp3oGokFWdNQec+7CLD4=
X-Google-Smtp-Source: AMsMyM5fkshnL7pt6ilshp8Gr5BWsMaGDmK5Nlz0uwnXtwL0tO5C92oblTyQDOKa5Dq9ew0/M7vv1w==
X-Received: by 2002:aa7:d3d3:0:b0:44e:baab:54d9 with SMTP id
 o19-20020aa7d3d3000000b0044ebaab54d9mr12796690edr.43.1663540223732; 
 Sun, 18 Sep 2022 15:30:23 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-078-054-124-024.78.54.pool.telefonica.de.
 [78.54.124.24]) by smtp.gmail.com with ESMTPSA id
 17-20020a170906201100b0073dc5bb7c32sm14544299ejo.64.2022.09.18.15.30.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 15:30:23 -0700 (PDT)
Date: Sun, 18 Sep 2022 22:30:16 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 00/42] Consolidate PIIX south bridges
In-Reply-To: <7bdc1d9c-a18d-958a-4b9b-3487e159e92f@ilande.co.uk>
References: <20220901162613.6939-1-shentey@gmail.com>
 <7bdc1d9c-a18d-958a-4b9b-3487e159e92f@ilande.co.uk>
Message-ID: <330C6CC8-2A01-408A-9044-D022EA0BB23C@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18=2E September 2022 20:22:55 UTC schrieb Mark Cave-Ayland <mark=2Ecave-=
ayland@ilande=2Eco=2Euk>:
>On 01/09/2022 17:25, Bernhard Beschow wrote:
>
>> This series consolidates the implementations of the PIIX3 and PIIX4 sou=
th
>> bridges and is an extended version of [1]=2E The motivation is to share=
 as much
>> code as possible and to bring both device models to feature parity such=
 that
>> perhaps PIIX4 can become a drop-in-replacement for PIIX3 in the pc mach=
ine=2E This
>> could resolve the "Frankenstein" PIIX4-PM problem in PIIX3 discussed on=
 this
>> list before=2E
>>=20
>> The series is structured as follows: First, PIIX3 is changed to instant=
iate
>> internal devices itself, like PIIX4 does already=2E Second, PIIX3 gets =
prepared
>> for the merge with PIIX4 which includes some fixes, cleanups, and renam=
ings=2E
>> Third, the same is done for PIIX4=2E In step four the implementations a=
re merged=2E
>> Since some consolidations could be done easier with merged implementati=
ons, the
>> consolidation continues in step five which concludes the series=2E
>>=20
>> One particular challenge in this series was that the PIC of PIIX3 used =
to be
>> instantiated outside of the south bridge while some sub functions requi=
re a PIC
>> with populated qemu_irqs=2E This has been solved by introducing a proxy=
 PIC which
>> furthermore allows PIIX3 to be agnostic towards the virtualization tech=
nology
>> used (KVM, TCG, Xen)=2E Due to consolidation PIIX4 gained the PIC as we=
ll,
>> possibly allowing the Malta board to gain KVM capabilities in the futur=
e=2E
>>=20
>> Another challenge was dealing with optional devices where Peter already=
 gave
>> advice in [1] which this series implements=2E
>>=20
>> An unsolved problem still is PCI interrupt handling=2E The first functi=
on
>> passed to pci_bus_irqs() is device-specific while the second one seems
>> board-specific=2E This causes both PIIX device models to be coupled to =
a
>> particular board=2E Any advice how to resolve this would be highly appr=
eaciated=2E
>
>Could you explain this in a bit more detail?

Sure!

Even after the consolidation there are piix3_pci_slot_get_pirq() and piix4=
_pci_slot_get_pirq() which seem board-specific rather than south bridge-spe=
cific=2E So they seem to belong into board code (pc_piix and Malta)=2E piix=
_set_irq(), OTOH, seems appropriate in piix=2Ec and is even shared between =
3 and 4=2E However, pci_bus_irqs() assigns both piix_set_irq() and piix{3,4=
}_pci_slot_get_pirq() in one go=2E So it is unclear to me how to pass the b=
oard-specific piix{3,4}_pci_slot_get_pirq() into the south bridge for pci_b=
us_irqs() if this call is performed there=2E

I'm really curious about an answer=2E Let me know if I was still unclear=
=2E

>
>> Last but not least there might be some opportunity to consolidate VM st=
ate
>> handling, probably by reusing the one from PIIX3=2E Since I'm not very =
familiar
>> with the requirements I didn't touch it so far=2E
>>=20
>> Testing done:
>> * make check
>> * Boot live CD:
>>    * `qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom
>> manjaro-kde-21=2E3=2E2-220704-linux515=2Eiso`
>>    * `qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom
>> manjaro-kde-21=2E3=2E2-220704-linux515=2Eiso`
>>=20
>> [1] https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-07/msg023=
48=2Ehtml
>>=20
>> Bernhard Beschow (42):
>>    hw/i386/pc: Create DMA controllers in south bridges
>>    hw/i386/pc: Create RTC controllers in south bridges
>>    hw/i386/pc: No need for rtc_state to be an out-parameter
>>    hw/i386/pc_piix: Allow for setting properties before realizing PIIX3
>>      south bridge
>>    hw/isa/piix3: Create USB controller in host device
>>    hw/isa/piix3: Create power management controller in host device
>>    hw/intc/i8259: Introduce i8259 proxy "isa-pic"
>>    hw/isa/piix3: Create ISA PIC in host device
>>    hw/isa/piix3: Create IDE controller in host device
>>    hw/isa/piix3: Wire up ACPI interrupt internally
>>    hw/isa/piix3: Remove extra ';' outside of functions
>>    hw/isa/piix3: Remove unused include
>>    hw/isa/piix3: Add size constraints to rcr_ops
>>    hw/isa/piix3: Modernize reset handling
>>    hw/isa/piix3: Prefer pci_address_space() over get_system_memory()
>>    hw/isa/piix3: Allow board to provide PCI interrupt routes
>>    hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
>>    hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
>>    hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
>>    hw/isa/piix3: Prefix pci_slot_get_pirq() with "piix3_"
>>    hw/isa/piix3: Rename typedef PIIX3State to PIIXState
>>    hw/mips/malta: Reuse dev variable
>>    meson: Fix dependencies of piix4 southbridge
>>    hw/isa/piix4: Add missing initialization
>>    hw/isa/piix4: Move pci_ide_create_devs() call to board code
>>    hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
>>    hw/isa/piix4: Allow board to provide PCI interrupt routes
>>    hw/isa/piix4: Remove unused code
>>    hw/isa/piix4: Use ISA PIC device
>>    hw/isa/piix4: Reuse struct PIIXState from PIIX3
>>    hw/isa/piix4: Rename reset control operations to match PIIX3
>>    hw/isa/piix4: Rename wrongly named method
>>    hw/isa/piix4: Prefix pci_slot_get_pirq() with "piix4_"
>>    hw/isa/piix3: Merge hw/isa/piix4=2Ec
>>    hw/isa/piix: Harmonize names of reset control memory regions
>>    hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4
>>    hw/isa/piix: Rename functions to be shared for interrupt triggering
>>    hw/isa/piix: Consolidate IRQ triggering
>>    hw/isa/piix: Unexport PIIXState
>>    hw/isa/piix: Share PIIX3 base class with PIIX4
>>    hw/isa/piix: Drop the "3" from the PIIX base class
>>    hw/i386/acpi-build: Resolve PIIX ISA bridge rather than ACPI
>>      controller
>>=20
>>   MAINTAINERS                             |   6 +-
>>   configs/devices/mips-softmmu/common=2Emak |   3 +-
>>   hw/i386/Kconfig                         |   3 +-
>>   hw/i386/acpi-build=2Ec                    |   4 +-
>>   hw/i386/pc=2Ec                            |  19 +-
>>   hw/i386/pc_piix=2Ec                       |  72 +--
>>   hw/i386/pc_q35=2Ec                        |   3 +-
>>   hw/intc/i8259=2Ec                         |  27 +
>>   hw/isa/Kconfig                          |  14 +-
>>   hw/isa/lpc_ich9=2Ec                       |  11 +
>>   hw/isa/meson=2Ebuild                      |   3 +-
>>   hw/isa/piix=2Ec                           | 669 +++++++++++++++++++++=
+++
>>   hw/isa/piix3=2Ec                          | 431 ---------------
>>   hw/isa/piix4=2Ec                          | 325 ------------
>>   hw/mips/malta=2Ec                         |  34 +-
>>   include/hw/i386/ich9=2Eh                  |   2 +
>>   include/hw/i386/pc=2Eh                    |   2 +-
>>   include/hw/intc/i8259=2Eh                 |  14 +
>>   include/hw/southbridge/piix=2Eh           |  41 +-
>>   19 files changed, 823 insertions(+), 860 deletions(-)
>>   create mode 100644 hw/isa/piix=2Ec
>>   delete mode 100644 hw/isa/piix3=2Ec
>>   delete mode 100644 hw/isa/piix4=2Ec
>
>I've had a quick skim over this series and commented on the parts that ca=
ught my eye, however I'm generally happy with the way this series is going =
and it seems like a nice tidy-up - thanks!

I'm glad to read this!

Best regards,
Bernhard
>
>
>ATB,
>
>Mark=2E


