Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4C15B175D
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 10:42:44 +0200 (CEST)
Received: from localhost ([::1]:50516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWD7S-0006A5-L4
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 04:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oWD4Z-0003Qv-F9
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 04:39:47 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:41973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oWD4T-0002fO-Hs
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 04:39:39 -0400
Received: by mail-ej1-x62c.google.com with SMTP id gh9so14477399ejc.8
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 01:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=hvzVg00AkRjD1cZFa8khD9gG5W0LGVWRMPEIyN6JszQ=;
 b=jDS66l5eYgCrr/T9CHICYAqyzkZsXIT0ANYReYdbCjZI4xP1YfZeoORhZ7uYuoo8WA
 ac1cSCbaSXRHkA2scWz0L1cNn90W6UosMXkFB3kUB6dvIaWlRIu5k2L7lT/Rd3PuH8t8
 cgHKIG447et8RwfGITuRhYwf2/SDoXQphgqKaykAxl6bEeE89UHSvf6MqxDpJcX4aSvg
 cPsisNxUCMheRE6UVM90zfVa/v3FBc4zfdpUXTG8tlC0jUbRrGo4QqWr8n+JVs20dbYd
 C56riQB93Uqh0T/8SZJOu5irAhESw3FvX/XvVdF0gaBA93r+Qxrc0cwlHRDso3XQO89H
 Kz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=hvzVg00AkRjD1cZFa8khD9gG5W0LGVWRMPEIyN6JszQ=;
 b=lmrPT4pOHYV0lDsBsWz8Wzd3LYIv40rkf8T1PLnBCVYxgPyYzeJm+332U0/kKs+n1D
 bjaykLG31PL6fEk83DnNo7YT1ennYRD6N76aNvbyWwjQEF95qIexsLY8FzhlxbnB7rki
 sgpR4Jk4Sx9hCHIQ3CycBEQB74IKP5QLoo2nXVgkAQfcIqWEgazKY4j8iBKJXD7d5FbW
 N4v9t/Flz8qPmej3VSnWNnz830ru4kfFjzUsnw3NqXGDggEKa9Z8M5xEZlGb2FtNyaRQ
 RQ6gUPmiOeDJ3zYTd07Z0mWPaMSyOSJYWneJlHyZUiCLG5MdWxe1JZigMyEiVwm1HHAp
 F8Fw==
X-Gm-Message-State: ACgBeo0DldvbGWPeKfDjeO/ZNTJ+OuLK/N6yAwyJVdFVI7/bEwDO5By4
 KIrN4NACv3wR1duVugyvVq/tzUl7qaY=
X-Google-Smtp-Source: AA6agR4+qdVEA7mB9FiC3rM6ksFeJpBv6DInvAQH1kfZMxt+j1VUq8fmGaNtIMDh20erpijEU928Rg==
X-Received: by 2002:a17:907:c0d:b0:730:a85d:8300 with SMTP id
 ga13-20020a1709070c0d00b00730a85d8300mr5283956ejc.558.1662626374945; 
 Thu, 08 Sep 2022 01:39:34 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-014-172-011.89.14.pool.telefonica.de.
 [89.14.172.11]) by smtp.gmail.com with ESMTPSA id
 kj5-20020a170907764500b0074ae59d85a4sm963112ejc.20.2022.09.08.01.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Sep 2022 01:39:34 -0700 (PDT)
Date: Thu, 08 Sep 2022 08:39:27 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
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
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
Message-ID: <44084D9F-0465-414D-B545-882DED9BF097@gmail.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Am 1=2E September 2022 16:25:31 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>This series consolidates the implementations of the PIIX3 and PIIX4 south=

>
>bridges and is an extended version of [1]=2E The motivation is to share a=
s much
>
>code as possible and to bring both device models to feature parity such t=
hat
>
>perhaps PIIX4 can become a drop-in-replacement for PIIX3 in the pc machin=
e=2E This
>
>could resolve the "Frankenstein" PIIX4-PM problem in PIIX3 discussed on t=
his
>
>list before=2E
>
>
>
>The series is structured as follows: First, PIIX3 is changed to instantia=
te
>
>internal devices itself, like PIIX4 does already=2E Second, PIIX3 gets pr=
epared
>
>for the merge with PIIX4 which includes some fixes, cleanups, and renamin=
gs=2E
>
>Third, the same is done for PIIX4=2E In step four the implementations are=
 merged=2E
>
>Since some consolidations could be done easier with merged implementation=
s, the
>
>consolidation continues in step five which concludes the series=2E
>
>
>
>One particular challenge in this series was that the PIC of PIIX3 used to=
 be
>
>instantiated outside of the south bridge while some sub functions require=
 a PIC
>
>with populated qemu_irqs=2E This has been solved by introducing a proxy P=
IC which
>
>furthermore allows PIIX3 to be agnostic towards the virtualization techno=
logy
>
>used (KVM, TCG, Xen)=2E Due to consolidation PIIX4 gained the PIC as well=
,
>
>possibly allowing the Malta board to gain KVM capabilities in the future=
=2E
>

Ping

Never mind the comment about Malta=2E I think it supports KVM just fine=2E

>
>
>Another challenge was dealing with optional devices where Peter already g=
ave
>
>advice in [1] which this series implements=2E
>
>
>
>An unsolved problem still is PCI interrupt handling=2E The first function=

>
>passed to pci_bus_irqs() is device-specific while the second one seems
>
>board-specific=2E This causes both PIIX device models to be coupled to a
=
>
>particular board=2E Any advice how to resolve this would be highly apprea=
ciated=2E
>
>
>
>Last but not least there might be some opportunity to consolidate VM stat=
e
>
>handling, probably by reusing the one from PIIX3=2E Since I'm not very fa=
miliar
>
>with the requirements I didn't touch it so far=2E
>
>
>
>Testing done:
>
>* make check
>
>* Boot live CD:
>
>  * `qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom
>
>manjaro-kde-21=2E3=2E2-220704-linux515=2Eiso`
>
>  * `qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom
>
>manjaro-kde-21=2E3=2E2-220704-linux515=2Eiso`
>
>
>
>[1] https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-07/msg02348=
=2Ehtml
>
>
>
>Bernhard Beschow (42):
>
>  hw/i386/pc: Create DMA controllers in south bridges
>
>  hw/i386/pc: Create RTC controllers in south bridges
>
>  hw/i386/pc: No need for rtc_state to be an out-parameter
>
>  hw/i386/pc_piix: Allow for setting properties before realizing PIIX3
>
>    south bridge
>
>  hw/isa/piix3: Create USB controller in host device
>
>  hw/isa/piix3: Create power management controller in host device
>
>  hw/intc/i8259: Introduce i8259 proxy "isa-pic"
>
>  hw/isa/piix3: Create ISA PIC in host device
>
>  hw/isa/piix3: Create IDE controller in host device
>
>  hw/isa/piix3: Wire up ACPI interrupt internally
>
>  hw/isa/piix3: Remove extra ';' outside of functions
>
>  hw/isa/piix3: Remove unused include
>
>  hw/isa/piix3: Add size constraints to rcr_ops
>
>  hw/isa/piix3: Modernize reset handling
>
>  hw/isa/piix3: Prefer pci_address_space() over get_system_memory()
>
>  hw/isa/piix3: Allow board to provide PCI interrupt routes
>
>  hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
>
>  hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
>
>  hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
>
>  hw/isa/piix3: Prefix pci_slot_get_pirq() with "piix3_"
>
>  hw/isa/piix3: Rename typedef PIIX3State to PIIXState
>
>  hw/mips/malta: Reuse dev variable
>
>  meson: Fix dependencies of piix4 southbridge
>
>  hw/isa/piix4: Add missing initialization
>
>  hw/isa/piix4: Move pci_ide_create_devs() call to board code
>
>  hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
>
>  hw/isa/piix4: Allow board to provide PCI interrupt routes
>
>  hw/isa/piix4: Remove unused code
>
>  hw/isa/piix4: Use ISA PIC device
>
>  hw/isa/piix4: Reuse struct PIIXState from PIIX3
>
>  hw/isa/piix4: Rename reset control operations to match PIIX3
>
>  hw/isa/piix4: Rename wrongly named method
>
>  hw/isa/piix4: Prefix pci_slot_get_pirq() with "piix4_"
>
>  hw/isa/piix3: Merge hw/isa/piix4=2Ec
>
>  hw/isa/piix: Harmonize names of reset control memory regions
>
>  hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4
>
>  hw/isa/piix: Rename functions to be shared for interrupt triggering
>
>  hw/isa/piix: Consolidate IRQ triggering
>
>  hw/isa/piix: Unexport PIIXState
>
>  hw/isa/piix: Share PIIX3 base class with PIIX4
>
>  hw/isa/piix: Drop the "3" from the PIIX base class
>
>  hw/i386/acpi-build: Resolve PIIX ISA bridge rather than ACPI
>
>    controller
>
>
>
> MAINTAINERS                             |   6 +-
>
> configs/devices/mips-softmmu/common=2Emak |   3 +-
>
> hw/i386/Kconfig                         |   3 +-
>
> hw/i386/acpi-build=2Ec                    |   4 +-
>
> hw/i386/pc=2Ec                            |  19 +-
>
> hw/i386/pc_piix=2Ec                       |  72 +--
>
> hw/i386/pc_q35=2Ec                        |   3 +-
>
> hw/intc/i8259=2Ec                         |  27 +
>
> hw/isa/Kconfig                          |  14 +-
>
> hw/isa/lpc_ich9=2Ec                       |  11 +
>
> hw/isa/meson=2Ebuild                      |   3 +-
>
> hw/isa/piix=2Ec                           | 669 ++++++++++++++++++++++++=

>
> hw/isa/piix3=2Ec                          | 431 ---------------
>
> hw/isa/piix4=2Ec                          | 325 ------------
>
> hw/mips/malta=2Ec                         |  34 +-
>
> include/hw/i386/ich9=2Eh                  |   2 +
>
> include/hw/i386/pc=2Eh                    |   2 +-
>
> include/hw/intc/i8259=2Eh                 |  14 +
>
> include/hw/southbridge/piix=2Eh           |  41 +-
>
> 19 files changed, 823 insertions(+), 860 deletions(-)
>
> create mode 100644 hw/isa/piix=2Ec
>
> delete mode 100644 hw/isa/piix3=2Ec
>
> delete mode 100644 hw/isa/piix4=2Ec
>
>
>
>-- >
>2=2E37=2E3
>
>
>


