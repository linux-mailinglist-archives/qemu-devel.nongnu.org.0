Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AA66A0EA9
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 18:26:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVFLe-0008Fj-C3; Thu, 23 Feb 2023 12:25:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVFLb-0008EZ-HP; Thu, 23 Feb 2023 12:25:35 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pVFLY-0008TO-09; Thu, 23 Feb 2023 12:25:35 -0500
Received: by mail-ed1-x52c.google.com with SMTP id da10so46081506edb.3;
 Thu, 23 Feb 2023 09:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y8nOxmkOn9LpaXmc+IYryCDP6AaEqOVoB3ulj8P2HMs=;
 b=ZEvzTa06PH8HTOzJ9Xdbb18NvrhaRbI56eQrqrZOP4dP1F1PFwnTsdPZGjipxZbu5S
 QVRb13nHKi2tluHQxzaSizampnBBRX1yzPG4oTXps0aJNqJTYKA1VwTFIZrCDjOnYX65
 YZmzK1JKfeyGHktW4A/QbSvE/NA69aOVIPqAjRD9Hl5E9pdwFNKVIN09UMlJFsVAhxVr
 Y1KKxigd5Sh13En0oK4pTimLTIUWvxSKmLReawtghXy0Z+a0Og5TAw0QZgSXjVdzkGSM
 St4+ZTlw+4CQ1KtNPlryZTVRQNXqZHIRuJYkkovDn0xRJsmAIjryF5QTf3OQ2ZioBn5E
 /Ahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y8nOxmkOn9LpaXmc+IYryCDP6AaEqOVoB3ulj8P2HMs=;
 b=5fWd3tzS3Pe7I5JZWvfcchQV1pcJxNElzRlrj8RFqMHswkLyD7vflzutL/KhazOXm+
 cM/zi+wu29+khhZdl40Wg9o5CkimwRPaTZnus0okqqOWcbuOz7A3xCDR0fT3hiI9bhiR
 ijtnHbldhFxiq2MCFlF7R6YTBZzC6R6T4QqQ4K1V2eaoB9Bth+bx6xRF81UcYiuajugG
 KwrjyBv1I4PNZ5/A2pfPXK1mrH/zy5RgxAEamc9bWpFApAlyhy/bX6OLfDz3dh03qmhd
 O7udWwK3HNn94pC2qxaq6e7JzuorSDIee+wy4JqGVXa6DAZ5iO6s07Sio4IsxHhcp5Pe
 QzXg==
X-Gm-Message-State: AO0yUKWTPFB2IVIHnXEeMqENKRg7jp6H/3ARKN0+3EgSm9RnJ6UJUcGR
 RM8Qrz4ZNqjuS8FIQkZ8IRHZS1U5PKwQ8w==
X-Google-Smtp-Source: AK7set+5RMYPksTjohWrIg2hdTLKJHgTeE9+3ShkbmOyI52uOj/IlIS0J/Yt9fswHnbCp78fNXScfg==
X-Received: by 2002:a17:906:20d1:b0:8b0:ad0b:7ab8 with SMTP id
 c17-20020a17090620d100b008b0ad0b7ab8mr22527736ejc.14.1677173128949; 
 Thu, 23 Feb 2023 09:25:28 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf06ee0069bc6d590f31a9b0.dip0.t-ipconnect.de.
 [2003:fa:af06:ee00:69bc:6d59:f31:a9b0])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a170906738d00b008e6bd130b14sm2304394ejl.64.2023.02.23.09.25.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 09:25:28 -0800 (PST)
Date: Thu, 23 Feb 2023 17:25:23 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 qemu-arm@nongnu.org, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, 
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>
Subject: Re: [PATCH v7 00/23] Consolidate PIIX south bridges
In-Reply-To: <20230212123805.30799-1-shentey@gmail.com>
References: <20230212123805.30799-1-shentey@gmail.com>
Message-ID: <A5067C75-87DB-4D58-B49E-97BEDF303831@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52c.google.com
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



Am 12=2E Februar 2023 12:37:42 UTC schrieb Bernhard Beschow <shentey@gmail=
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
>The series is structured as follows:
>
>
>
>Move sub devices into the PIIX3 south bridge, like PIIX4 does already:
>
>* hw/i386/pc: Create RTC controllers in south bridges
>
>* hw/i386/pc: No need for rtc_state to be an out-parameter
>
>* hw/i386/pc_piix: Allow for setting properties before realizing PIIX3 so=
uth bridge
>
>* hw/isa/piix3: Create USB controller in host device
>
>* hw/isa/piix3: Create power management controller in host device
>
>* hw/isa/piix3: Move ISA bus IRQ assignments into host device
>
>* hw/isa/piix3: Create IDE controller in host device
>
>* hw/isa/piix3: Wire up ACPI interrupt internally
>
>
>
>Make PIIX3 and PIIX4 south bridges more similar:
>
>* hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
>
>* hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
>
>* hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
>
>* hw/isa/piix3: Drop the "3" from PIIX base class
>
>* hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
>
>* hw/isa/piix4: Remove unused inbound ISA interrupt lines
>
>* hw/isa/piix4: Reuse struct PIIXState from PIIX3
>
>* hw/isa/piix4: Create the "intr" property during init() already
>
>* hw/isa/piix4: Rename reset control operations to match PIIX3
>
>
>
>This patch achieves the main goal of the series:
>
>* hw/isa/piix3: Merge hw/isa/piix4=2Ec
>
>
>
>Perform some further consolidations which were easier to do after the mer=
ge:
>
>* hw/isa/piix: Harmonize names of reset control memory regions
>
>* hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4
>
>* hw/isa/piix: Rename functions to be shared for interrupt triggering
>
>* hw/isa/piix: Consolidate IRQ triggering
>
>* hw/isa/piix: Share PIIX3's base class with PIIX4
>
>
>
>One challenge was dealing with optional devices where Peter already gave =
advice
>
>in [1] which this series implements=2E
>
>
>
>There are still some differences in the device models:
>
>- PIIX4 instantiates its own PIC and PIT while PIIX3 doesn't
>
>- PIIX4 wires up the RTC IRQ itself while PIIX3 doesn't
>
>- Different binary layout in VM state
>
>
>
>v7:
>
>- Rebase onto master
>
>- Avoid the PIC proxy (Phil)
>
>  The motivation for the PIC proxy was to allow for wiring up ISA interru=
pts in
>
>  the south bridges=2E ISA interrupt wiring requires the GPIO lines to be=

>
>  populated already but pc_piix assigned the interrupts only after realiz=
ing
>
>  PIIX3=2E By shifting interrupt assignment before realizing, the ISA int=
errupts
>
>  are already populated during PIIX3's realize phase where the ISA interr=
upts
>
>  are wired up=2E
>
>- New patches:
>
>  * hw/isa/piix4: Reuse struct PIIXState from PIIX3
>
>  * hw/isa/piix4: Create the "intr" property during init() already
>
>- Patches with substantial changes (Reviewed-by dropped):
>
>  * hw/isa/piix3: Move ISA bus IRQ assignments into host device
>

Ping

Can we queue the piix3 part already? Now that the series doesn't introduce=
 a PIC proxy any more the piix3 part is essentially QOM cleanup=2E

Note that I cautiously dropped some Reviewed-by tags in the piix3 part as =
well=2E

Best regards,
Bernhard

>
>
>Testing done:
>
>* `make check`
>
>* Boot live CD:
>
>  * `qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom manjaro-k=
de-21=2E3=2E2-220704-linux515=2Eiso`
>
>  * `qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom manjaro-=
kde-21=2E3=2E2-220704-linux515=2Eiso`
>
>* 'qemu-system-mips64el -M malta -kernel vmlinux-3=2E2=2E0-4-5kc-malta -h=
da debian_wheezy_mipsel_standard=2Eqcow2 -append "root=3D/dev/sda1 console=
=3DttyS0"`
>
>* Run HVM domU guest under Xen with manjaro-kde-21=2E3=2E2-220704-linux51=
5=2Eiso image
>
>
>
>v6:
>
>- Fix some comments about TYPE_ISA_PIC (Mark) =2E=2E=2E and use it consis=
tently
>
>  within the patch series=2E
>
>- Incorporate series "[PATCH v2 0/3] Decouple INTx-to-LNKx routing from s=
outh
>
>  bridges" [2] for maintainer convenience=2E
>
>- Merge v5's 'hw/i386/pc_piix: Associate pci_map_irq_fn as soon as PCI bu=
s is
>
>  created' into
>
>  https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-11/msg03312=
=2Ehtml =2E Do
>
>  similar for Malta=2E
>
>- Rebase onto latest master (d6271b657286 "Merge tag 'for_upstream' of
>
>  https://git=2Ekernel=2Eorg/pub/scm/virt/kvm/mst/qemu into staging")
>
>
>
>v5:
>
>- Pick up Reviewed-by tags from https://lists=2Enongnu=2Eorg/archive/html=
/qemu-devel/2023-01/msg00116=2Ehtml
>
>- Add patch to make usage of the isa_pic global more type-safe
>
>- Re-introduce isa-pic as PIC specific proxy (Mark)
>
>
>
>v4:
>
>- Rebase onto "[PATCH v2 0/3] Decouple INTx-to-LNKx routing from south br=
idges"
>
>  since it is already queued via mips-next=2E This eliminates patches
>
>  'hw/isa/piix3: Prefix pci_slot_get_pirq() with "piix3_"' and 'hw/isa/pi=
ix4:
>
>  Prefix pci_slot_get_pirq() with "piix4_"'=2E
>
>- Squash 'hw/isa/piix: Drop the "3" from the PIIX base class' into
>
>  'hw/isa/piix3: Rename typedef PIIX3State to PIIXState'=2E I originally =
only
>
>  split these patches since I wasn't sure whether renaming a type was all=
owed=2E
>
>- Add new patch 'hw/i386/pc_piix: Associate pci_map_irq_fn as soon as PCI=
 bus is
>
>  created' for forther cleanup of INTx-to-LNKx route decoupling=2E
>
>
>
>v3:
>
>- Introduce one TYPE_ICH9_USB_UHCI(fn) rather than several TYPE_ICH9_USB_=
UHCIx
>
>  (Philippe)
>
>- Make proxy PIC generic (Philippe)
>
>- Track Malta's PIIX dependencies through KConfig
>
>- Rebase onto Philippe's 'hw/isa/piix4: Remove MIPS Malta specific bits' =
series [3]
>
>- Also rebase onto latest master to resolve merge conflicts=2E This requi=
red
>
>  copying Philippe's series as first three patches - please ignore=2E
>
>
>
>v2:
>
>- Introduce TYPE_ defines for IDE and USB device models (Mark)
>
>- Omit unexporting of PIIXState (Mark)
>
>- Improve commit message of patch 5 to mention reset triggering through P=
CI
>
>  configuration space (Mark)
>
>- Move reviewed patches w/o dependencies to the bottom of the series for =
early
>
>  upstreaming
>
>
>
>[1] https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-07/msg02348=
=2Ehtml
>
>[2] https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-11/msg03310=
=2Ehtml
>
>[3] https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-10/msg05367=
=2Ehtml
>
>
>
>Bernhard Beschow (23):
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
>  hw/isa/piix3: Move ISA bus IRQ assignments into host device
>
>  hw/isa/piix3: Create IDE controller in host device
>
>  hw/isa/piix3: Wire up ACPI interrupt internally
>
>  hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
>
>  hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
>
>  hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
>
>  hw/isa/piix3: Drop the "3" from PIIX base class
>
>  hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
>
>  hw/isa/piix4: Remove unused inbound ISA interrupt lines
>
>  hw/isa/piix4: Reuse struct PIIXState from PIIX3
>
>  hw/isa/piix4: Create the "intr" property during init() already
>
>  hw/isa/piix4: Rename reset control operations to match PIIX3
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
>  hw/isa/piix: Share PIIX3's base class with PIIX4
>
>
>
> MAINTAINERS                   |   6 +-
>
> include/hw/i386/ich9=2Eh        |   2 +
>
> include/hw/i386/pc=2Eh          |   2 +-
>
> include/hw/southbridge/piix=2Eh |  28 +++-
>
> hw/i386/pc=2Ec                  |  16 +-
>
> hw/i386/pc_piix=2Ec             |  67 ++++----
>
> hw/i386/pc_q35=2Ec              |   3 +-
>
> hw/isa/lpc_ich9=2Ec             |   8 +
>
> hw/isa/{piix3=2Ec =3D> piix=2Ec}    | 306 ++++++++++++++++++++++++++----=
----
>
> hw/isa/piix4=2Ec                | 302 ---------------------------------
=
>
> hw/mips/malta=2Ec               |   6 +-
>
> hw/i386/Kconfig               |   3 +-
>
> hw/isa/Kconfig                |   8 +-
>
> hw/isa/meson=2Ebuild            |   3 +-
>
> hw/mips/Kconfig               |   2 +-
>
> 15 files changed, 333 insertions(+), 429 deletions(-)
>
> rename hw/isa/{piix3=2Ec =3D> piix=2Ec} (55%)
>
> delete mode 100644 hw/isa/piix4=2Ec
>
>
>
>-- >
>2=2E39=2E1
>
>
>

