Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD05B66160E
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 16:14:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEXMD-0005e8-RZ; Sun, 08 Jan 2023 10:13:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEXMB-0005dq-CZ; Sun, 08 Jan 2023 10:13:07 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEXM9-0005n4-4o; Sun, 08 Jan 2023 10:13:07 -0500
Received: by mail-ej1-x630.google.com with SMTP id ss4so7028401ejb.11;
 Sun, 08 Jan 2023 07:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OoCdzhQdvwmPs3LRzkctTN+XMreVf7XHJ3xQl6F2maw=;
 b=X9H/VKqVWTmmugiOGYVU+srwrSsbFEt+LP3TSOAiw6aFtOMchQ2ku32e5HWPjjaXV2
 dNPRH7GZ2ozZLwiI7tPLje4ESZpn5HaNX1BSebSB2Ia1IS22eoeDe8QX2kSkzYyl91OL
 JihcsyGvcPmxtLO5k9v4zVPtO6jqC+9C8lDe4BNfd/aRrn2POHf1jxE73HlBueOVpD/i
 waD0RQkHLQB3EF0C3pP1igqFsGia06dLoW/M1i3PWoPcy+b1ygsTP2gYwwg8lH9za0fa
 AZiAYPdXLqhFv5XRzSJKPbYVrBHbsqUmbJ3AcSFl6IhlC/95ANdKkcdHaNiy10sqKMvX
 wrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OoCdzhQdvwmPs3LRzkctTN+XMreVf7XHJ3xQl6F2maw=;
 b=xS9KRTO8D26IwUoNnUKkm/ZlPZw3w2iNV1h6u3SKEuHwHLsCAwT7E9ynVMfPgxEMQq
 kclNYXqUiVaVbvc9uMPhobBk3LJ5Nqzu3Kfu/852f1IRHEnyIBtbsJQLQ0tfyJTi2/aU
 aZ+rpQd/wkKt8u6Bzr04alq1ByB5/Tk2IKA8cUFpF7APipizHCAwabbmW2qJqWKbO20A
 CjG7Tbf7jlyQHn5Zqho77kxwCFupEzltnXPcgQjyouAWzaNQoAD42K22TizOfRDQ7Qux
 CBlLWzgyZZvT89OstN+6j9Vsy2IOpMg+t7ZgvaO+5BdRCAlJGaf7hfacQZfjeho5Ioe+
 a3jA==
X-Gm-Message-State: AFqh2krjOEb/efZjDny/giQVyO6dbdngZBrzudSC34j9F1hWOcvQ8WwL
 7woJzKLkpL83ejpJBoZl7ok=
X-Google-Smtp-Source: AMrXdXuHDbn2Yg/o4qgxlym9x5WirVICffI3TtkHcB+DI9XdzcMGlj04DwhhjTT/FQwgr+vxpYhkqQ==
X-Received: by 2002:a17:906:edb0:b0:84d:3623:bf5e with SMTP id
 sa16-20020a170906edb000b0084d3623bf5emr3802029ejb.24.1673190782664; 
 Sun, 08 Jan 2023 07:13:02 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb200b8984a967c4b65c7.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:b898:4a96:7c4b:65c7])
 by smtp.gmail.com with ESMTPSA id
 ka13-20020a170907990d00b0073c10031dc9sm2569989ejc.80.2023.01.08.07.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Jan 2023 07:13:02 -0800 (PST)
Date: Sun, 08 Jan 2023 15:12:50 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
CC: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, John Snow <jsnow@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 00/31] Consolidate PIIX south bridges
In-Reply-To: <dcbda1fc-3380-a96b-78c7-b3b35dee5ac4@ilande.co.uk>
References: <20230105143228.244965-1-shentey@gmail.com>
 <dcbda1fc-3380-a96b-78c7-b3b35dee5ac4@ilande.co.uk>
Message-ID: <50FFD7E4-A40C-4428-ACD2-F7C93C687572@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
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



Am 7=2E Januar 2023 23:57:32 UTC schrieb Mark Cave-Ayland <mark=2Ecave-ayl=
and@ilande=2Eco=2Euk>:
>On 05/01/2023 14:31, Bernhard Beschow wrote:
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
>> consolidation continues in step five which concludes the series=2E Note=
 that the
>> first three patches are only included to avoid merge conflicts with mip=
s-next
>> -- please ignore=2E
>>=20
>> One particular challenge in this series was that the PIC of PIIX3 used =
to be
>> instantiated outside of the south bridge while some sub functions requi=
re a PIC
>> with populated qemu_irqs=2E This has been solved by introducing a proxy=
 PIC which
>> furthermore allows PIIX3 to be agnostic towards the virtualization tech=
nology
>> used (KVM, TCG, Xen)=2E Due to consolidation PIIX4 gained the proxy PIC=
 as well=2E
>>=20
>> Another challenge was dealing with optional devices where Peter already=
 gave
>> advice in [1] which this series implements=2E
>>=20
>> Last but not least there might be some opportunity to consolidate VM st=
ate
>> handling, probably by reusing the one from PIIX3=2E Since I'm not very =
familiar
>> with the requirements I didn't touch it so far=2E
>>=20
>> v5:
>> - Pick up Reviewed-by tags from https://lists=2Enongnu=2Eorg/archive/ht=
ml/qemu-devel/2023-01/msg00116=2Ehtml
>> - Add patch to make usage of the isa_pic global more type-safe
>> - Re-introduce isa-pic as PIC specific proxy (Mark)
>> Note that both patches are unreviewed -> Mark?
>>=20
>> Furthermore, patch 'hw/i386/pc_piix: Associate pci_map_irq_fn as soon a=
s PCI bus
>> is created' needs review and could be merged into
>> https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-11/msg03312=
=2Ehtml =2E
>>=20
>> Testing done:
>> * make check
>> * Boot live CD:
>>    * `qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom manjar=
o-kde-21=2E3=2E2-220704-linux515=2Eiso`
>>    * `qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom manja=
ro-kde-21=2E3=2E2-220704-linux515=2Eiso`
>> * 'qemu-system-mips64el -M malta -kernel vmlinux-3=2E2=2E0-4-5kc-malta =
-hda debian_wheezy_mipsel_standard=2Eqcow2 -append "root=3D/dev/sda1 consol=
e=3DttyS0"`
>>=20
>> Based-on: <20221120150550=2E63059-1-shentey@gmail=2Ecom>
>>            "[PATCH v2 0/3] Decouple INTx-to-LNKx routing from south bri=
dges"
>>=20
>> v4:
>> - Rebase onto "[PATCH v2 0/3] Decouple INTx-to-LNKx routing from south =
bridges"
>>    since it is already queued via mips-next=2E This eliminates patches
>>    'hw/isa/piix3: Prefix pci_slot_get_pirq() with "piix3_"' and 'hw/isa=
/piix4:
>>    Prefix pci_slot_get_pirq() with "piix4_"'=2E
>> - Squash 'hw/isa/piix: Drop the "3" from the PIIX base class' into
>>    'hw/isa/piix3: Rename typedef PIIX3State to PIIXState'=2E I original=
ly only
>>    split these patches since I wasn't sure whether renaming a type was =
allowed=2E
>> - Add new patch 'hw/i386/pc_piix: Associate pci_map_irq_fn as soon as P=
CI bus is
>>    created' for forther cleanup of INTx-to-LNKx route decoupling=2E
>>=20
>> v3:
>> - Introduce one TYPE_ICH9_USB_UHCI(fn) rather than several TYPE_ICH9_US=
B_UHCIx
>>    (Philippe)
>> - Make proxy PIC generic (Philippe)
>> - Track Malta's PIIX dependencies through KConfig
>> - Rebase onto Philippe's 'hw/isa/piix4: Remove MIPS Malta specific bits=
' series [3]
>> - Also rebase onto latest master to resolve merge conflicts=2E This req=
uired
>>    copying Philippe's series as first three patches - please ignore=2E
>>=20
>> v2:
>> - Introduce TYPE_ defines for IDE and USB device models (Mark)
>> - Omit unexporting of PIIXState (Mark)
>> - Improve commit message of patch 5 to mention reset triggering through=
 PCI
>>    configuration space (Mark)
>> - Move reviewed patches w/o dependencies to the bottom of the series fo=
r early
>>    upstreaming
>>=20
>> [1] https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-07/msg023=
48=2Ehtml
>> [2] https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-11/msg033=
10=2Ehtml
>> [3] https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-10/msg053=
67=2Ehtml
>>=20
>> Bernhard Beschow (28):
>>    hw/mips/Kconfig: Track Malta's PIIX dependencies via Kconfig
>>    hw/usb/hcd-uhci: Introduce TYPE_ defines for device models
>>    hw/i386/pc_piix: Associate pci_map_irq_fn as soon as PCI bus is
>>      created
>>    hw/i386/pc_piix: Allow for setting properties before realizing PIIX3
>>      south bridge
>>    hw/i386/pc: Create RTC controllers in south bridges
>>    hw/i386/pc: No need for rtc_state to be an out-parameter
>>    hw/isa/piix3: Create USB controller in host device
>>    hw/isa/piix3: Create power management controller in host device
>>    hw/intc/i8259: Make using the isa_pic singleton more type-safe
>>    hw/intc/i8259: Introduce i8259 proxy "isa-pic"
>>    hw/isa/piix3: Create ISA PIC in host device
>>    hw/isa/piix3: Create IDE controller in host device
>>    hw/isa/piix3: Wire up ACPI interrupt internally
>>    hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
>>    hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
>>    hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
>>    hw/isa/piix3: Drop the "3" from PIIX base class
>>    hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
>>    hw/isa/piix4: Remove unused inbound ISA interrupt lines
>>    hw/isa/piix4: Use ISA PIC device
>>    hw/isa/piix4: Reuse struct PIIXState from PIIX3
>>    hw/isa/piix4: Rename reset control operations to match PIIX3
>>    hw/isa/piix3: Merge hw/isa/piix4=2Ec
>>    hw/isa/piix: Harmonize names of reset control memory regions
>>    hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4
>>    hw/isa/piix: Rename functions to be shared for interrupt triggering
>>    hw/isa/piix: Consolidate IRQ triggering
>>    hw/isa/piix: Share PIIX3's base class with PIIX4
>>=20
>> Philippe Mathieu-Daud=C3=A9 (3):
>>    hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition
>>    hw/mips/malta: Set PIIX4 IRQ routes in embedded bootloader
>>    hw/isa/piix4: Correct IRQRC[A:D] reset values
>>=20
>>   configs/devices/mips-softmmu/common=2Emak |   2 -
>>   hw/usb/hcd-uhci=2Eh                       |   4 +
>>   include/hw/i386/ich9=2Eh                  |   2 +
>>   include/hw/i386/pc=2Eh                    |   2 +-
>>   include/hw/intc/i8259=2Eh                 |  25 +-
>>   include/hw/southbridge/piix=2Eh           |  30 ++-
>>   include/qemu/typedefs=2Eh                 |   1 +
>>   hw/i386/pc=2Ec                            |  16 +-
>>   hw/i386/pc_piix=2Ec                       |  77 +++---
>>   hw/i386/pc_q35=2Ec                        |  16 +-
>>   hw/intc/i8259=2Ec                         |  38 ++-
>>   hw/isa/lpc_ich9=2Ec                       |   8 +
>>   hw/isa/{piix3=2Ec =3D> piix=2Ec}              | 274 ++++++++++++++++-=
----
>>   hw/isa/piix4=2Ec                          | 302 ---------------------=
---
>>   hw/mips/malta=2Ec                         |  38 ++-
>>   hw/usb/hcd-uhci=2Ec                       |  16 +-
>>   MAINTAINERS                             |   6 +-
>>   hw/i386/Kconfig                         |   4 +-
>>   hw/isa/Kconfig                          |   8 +-
>>   hw/isa/meson=2Ebuild                      |   3 +-
>>   hw/mips/Kconfig                         |   2 +
>>   21 files changed, 419 insertions(+), 455 deletions(-)
>>   rename hw/isa/{piix3=2Ec =3D> piix=2Ec} (57%)
>>   delete mode 100644 hw/isa/piix4=2Ec
>
>I've made a few comments on minor things I spotted reading through the se=
ries, but in general I'm happy with this series as it does a lot of good ti=
dy-up work (and even if any problems do occur later, it's early enough in t=
he development cycle to catch them in plenty of time)=2E

Thanks!

>Phil - over to you!

Shall I respin? I could integrate my PCI series into this one in order to =
avoid the outdated MIPS patches while still delivering a working series=2E =
Yes/No?

Best regards,
Bernhard

>
>
>ATB,
>
>Mark=2E

