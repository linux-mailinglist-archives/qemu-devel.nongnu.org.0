Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E23B6652999
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 00:09:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7lfR-0008T3-Jm; Tue, 20 Dec 2022 18:05:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p7lej-0008LP-Ip; Tue, 20 Dec 2022 18:04:21 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p7leg-0007bN-Sj; Tue, 20 Dec 2022 18:04:17 -0500
Received: by mail-ej1-x62a.google.com with SMTP id fc4so32729015ejc.12;
 Tue, 20 Dec 2022 15:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UyL/YFrbnszlJ+oaJdX6mk66ToIH5by1rfpx+KLY8KA=;
 b=Xt6rcNBVCD/bz41UOIewLBANLeCrd8yAkj4J7f4jfRSeBprxVS5AAizVjmdmnzdvMw
 aAK9eRhoTukLPkIaZNZLFxwsAzDsPBPaW7qV4hxZMn1dLms4nyjSSO8a/ITbCTYESO1n
 emsvj3YI0FDHk145cINYqzTTUSv5HTnWMvqVd009usbq/bUHwaYDluhf1wF9/qAZRAPU
 o8TXV93mSAHWn3QtlMSC0Sekb1L36/j2AE6hCuuD+87G/0URABG24SKwzTUAmIJa/QW1
 5ZV2GJ/EAQnQJwoSjgurTlhYce8Yl5MCNQfFIGKLE5R2xl0DK0uwV4wbsbYSODg+ATmU
 dWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UyL/YFrbnszlJ+oaJdX6mk66ToIH5by1rfpx+KLY8KA=;
 b=ZyX6nLnMzE7tp9Wk/Q17J+l0TEdkpYRigyj5z31HeWRRGUVdT+rmKDSXTfmdLKw9aG
 /Dedw849U/H+Lwod32QcshyovdxQEle/TfHa4v/u8SWC9G62imIOZRRC7EbNonJL6yud
 Sg03tHtLKlMwFYq+ASm2sGKCyFqKuAZxp93YHmH5gTtDh5qD5ZhYg1+nLOgmkIgILnav
 +N7Fd9BtIZJ5mb2tXbnhqS0tFnLvGfWQ85j6+hRZobe5inDu3EGp7+wxRWE/3JRb1U5k
 vhQ8F03wv7IcxC0LDXCSvkcgVMaAJ9f78i8Zsk0R0VMWdk4x3e3eWFQ59f0GD/iLzm0W
 8LKQ==
X-Gm-Message-State: ANoB5pkHO56auCL8wg3912VTyBv+t0mUrB9ahjBlajPlnJdB7bwUOg/P
 3wDoeFkSXyNVQkTe/gN/ULk=
X-Google-Smtp-Source: AA0mqf6psa6H8hFyo24F39pavj3q14bHPx1XAudF1HIaPQTn7fS+hpkHh8866gXWYDPJ/t/oaCyN8w==
X-Received: by 2002:a17:906:8d0e:b0:7c1:7cc2:1f1e with SMTP id
 rv14-20020a1709068d0e00b007c17cc21f1emr41217208ejc.35.1671577453053; 
 Tue, 20 Dec 2022 15:04:13 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-014-170-133.89.14.pool.telefonica.de.
 [89.14.170.133]) by smtp.gmail.com with ESMTPSA id
 b3-20020a17090630c300b0077b523d309asm6275338ejb.185.2022.12.20.15.04.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 15:04:12 -0800 (PST)
Date: Tue, 20 Dec 2022 23:04:03 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 00/32] Consolidate PIIX south bridges
In-Reply-To: <20221220102921-mutt-send-email-mst@kernel.org>
References: <20221204190553.3274-1-shentey@gmail.com>
 <20221220102921-mutt-send-email-mst@kernel.org>
Message-ID: <40360B77-C7DE-4FB1-9901-08840D971AF8@gmail.com>
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



Am 20=2E Dezember 2022 15:30:00 UTC schrieb "Michael S=2E Tsirkin" <mst@re=
dhat=2Ecom>:
>On Sun, Dec 04, 2022 at 08:05:21PM +0100, Bernhard Beschow wrote:
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
>> used (KVM, TCG, Xen)=2E Due to consolidation PIIX4 gained the proxy PIC=
 as well=2E
>>=20
>> Another challenge was dealing with optional devices where Peter already=
 gave
>> advice in [1] which this series implements=2E
>>=20
>> A challenge still remains with consolidating PCI interrupt handling=2E =
There are
>> still board-specific piix3_pci_slot_get_pirq() and piix4_pci_slot_get_p=
irq()
>> which are implemented in isa/piix=2Ec=2E Any advice how to resolve thes=
e would be
>> highly appreaciated=2E See [2] for details=2E
>>=20
>> Last but not least there might be some opportunity to consolidate VM st=
ate
>> handling, probably by reusing the one from PIIX3=2E Since I'm not very =
familiar
>> with the requirements I didn't touch it so far=2E
>
>Series
>
>Reviewed-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>
>
>ok to be merged through mips tree=2E

Thanks!

>
>> Testing done:
>> * make check
>> * make check-avocado
>> * Boot live CD:
>>   * `qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom manjaro=
-kde-21=2E3=2E2-220704-linux515=2Eiso`
>>   * `qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom manjar=
o-kde-21=2E3=2E2-220704-linux515=2Eiso`
>> * 'qemu-system-mips64el -M malta -kernel vmlinux-3=2E2=2E0-4-5kc-malta =
-hda debian_wheezy_mipsel_standard=2Eqcow2 -append "root=3D/dev/sda1 consol=
e=3DttyS0"`
>>=20
>> v3:
>> - Introduce one TYPE_ICH9_USB_UHCI(fn) rather than several TYPE_ICH9_US=
B_UHCIx (Philippe)
>> - Make proxy PIC generic (Philippe)
>> - Track Malta's PIIX dependencies through KConfig
>> - Rebase onto Philippe's 'hw/isa/piix4: Remove MIPS Malta specific bits=
' series [3]
>> - Also rebase onto latest master to resolve merge conflicts=2E This req=
uired copying
>>   Philippe's series as first three patches - please ignore=2E
>>=20
>> v2:
>> - Introduce TYPE_ defines for IDE and USB device models (Mark)
>> - Omit unexporting of PIIXState (Mark)
>> - Improve commit message of patch 5 to mention reset triggering through=
 PCI
>>   configuration space (Mark)
>> - Move reviewed patches w/o dependencies to the bottom of the series fo=
r early
>>   upstreaming
>>=20
>> [1] https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-07/msg023=
48=2Ehtml
>> [2] https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-11/msg033=
10=2Ehtml
>> [3] https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-10/msg053=
67=2Ehtml
>>=20
>> Bernhard Beschow (29):
>>   hw/mips/Kconfig: Track Malta's PIIX dependencies via Kconfig
>>   hw/i386/pc_piix: Allow for setting properties before realizing PIIX3
>>     south bridge
>>   hw/usb/hcd-uhci: Introduce TYPE_ defines for device models
>>   hw/i386/pc: Create RTC controllers in south bridges
>>   hw/i386/pc: No need for rtc_state to be an out-parameter
>>   hw/isa/piix3: Create USB controller in host device
>>   hw/isa/piix3: Create power management controller in host device
>>   hw/core: Introduce proxy-pic
>>   hw/isa/piix3: Create Proxy PIC in host device
>>   hw/isa/piix3: Create IDE controller in host device
>>   hw/isa/piix3: Wire up ACPI interrupt internally
>>   hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
>>   hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
>>   hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
>>   hw/isa/piix3: Prefix pci_slot_get_pirq() with "piix3_"
>>   hw/isa/piix3: Rename typedef PIIX3State to PIIXState
>>   hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
>>   hw/isa/piix4: Remove unused code
>>   hw/isa/piix4: Use Proxy PIC device
>>   hw/isa/piix4: Reuse struct PIIXState from PIIX3
>>   hw/isa/piix4: Rename reset control operations to match PIIX3
>>   hw/isa/piix4: Prefix pci_slot_get_pirq() with "piix4_"
>>   hw/isa/piix3: Merge hw/isa/piix4=2Ec
>>   hw/isa/piix: Harmonize names of reset control memory regions
>>   hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4
>>   hw/isa/piix: Rename functions to be shared for interrupt triggering
>>   hw/isa/piix: Consolidate IRQ triggering
>>   hw/isa/piix: Share PIIX3 base class with PIIX4
>>   hw/isa/piix: Drop the "3" from the PIIX base class
>>=20
>> Philippe Mathieu-Daud=C3=A9 (3):
>>   hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition
>>   hw/mips/malta: Set PIIX4 IRQ routes in embedded bootloader
>>   hw/isa/piix4: Correct IRQRC[A:D] reset values
>>=20
>>  MAINTAINERS                             |   8 +-
>>  configs/devices/mips-softmmu/common=2Emak |   2 -
>>  hw/core/Kconfig                         |   3 +
>>  hw/core/meson=2Ebuild                     |   1 +
>>  hw/core/proxy-pic=2Ec                     |  70 +++++
>>  hw/i386/Kconfig                         |   4 +-
>>  hw/i386/pc=2Ec                            |  16 +-
>>  hw/i386/pc_piix=2Ec                       |  71 ++---
>>  hw/i386/pc_q35=2Ec                        |  16 +-
>>  hw/isa/Kconfig                          |  10 +-
>>  hw/isa/lpc_ich9=2Ec                       |   8 +
>>  hw/isa/meson=2Ebuild                      |   3 +-
>>  hw/isa/{piix3=2Ec =3D> piix=2Ec}              | 302 +++++++++++++++++-=
----
>>  hw/isa/piix4=2Ec                          | 327 ----------------------=
--
>>  hw/mips/Kconfig                         |   2 +
>>  hw/mips/malta=2Ec                         |  38 ++-
>>  hw/usb/hcd-uhci=2Ec                       |  16 +-
>>  hw/usb/hcd-uhci=2Eh                       |   4 +
>>  include/hw/core/proxy-pic=2Eh             |  54 ++++
>>  include/hw/i386/ich9=2Eh                  |   2 +
>>  include/hw/i386/pc=2Eh                    |   2 +-
>>  include/hw/southbridge/piix=2Eh           |  30 ++-
>>  22 files changed, 520 insertions(+), 469 deletions(-)
>>  create mode 100644 hw/core/proxy-pic=2Ec
>>  rename hw/isa/{piix3=2Ec =3D> piix=2Ec} (56%)
>>  delete mode 100644 hw/isa/piix4=2Ec
>>  create mode 100644 include/hw/core/proxy-pic=2Eh
>>=20
>> --=20
>> 2=2E38=2E1
>>=20
>

