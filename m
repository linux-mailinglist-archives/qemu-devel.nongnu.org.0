Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AAD641F46
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 20:25:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1ubW-0007p6-4x; Sun, 04 Dec 2022 14:24:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1ubT-0007oO-G3; Sun, 04 Dec 2022 14:24:43 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1ubR-0005Kf-65; Sun, 04 Dec 2022 14:24:43 -0500
Received: by mail-ej1-x62c.google.com with SMTP id fc4so16174957ejc.12;
 Sun, 04 Dec 2022 11:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DqAqNAtTO/vck6p3GHUpedEGJXHsW4CqsNOaSgz8Leg=;
 b=pd/5rIePJ0ogtRsKnsHjxwujiW6mfeXzFm0n6yasIwfvdIUgOWZ3bSFvyqT411Vksy
 cDD3AVs/0H0EofVpZPh9BYMcLqb8QY8YleoKXlh/JYLZ2PehdmyKft9kTwPxvuKSwChE
 V+5lWbDF4kaGqvHqLo1oAQ/UGw261x9AiITr6SO6ZnBAhDzW+qr0epcTk1QZLYTyE/rt
 gym1phv4GFKj8vqyxH3Rio13X7uYolOwOgMiwIIfx4AsnwGneS1/ZDwCHQQaa+be0M5a
 GQX+hEmf1o70Ld79l6XtpVs5MtBE25hY/4wrOFyB2I1GlOJ88E6yzIX4qpkcJEZCvWe9
 HSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DqAqNAtTO/vck6p3GHUpedEGJXHsW4CqsNOaSgz8Leg=;
 b=InX7PMH4AF3Or8xllQTx1KziK29eFCISSssnx93oD+nn5oy4XekTgHm1U0mRMXsxMU
 ybU69eTEICGOzgeGsS1cDj9xC8z+8xJJNkZF3JEIl7DmIdoTezcw31E36miWQVldaBtw
 eq4U+w8OP4UTvHhePejVzK0jIxX0bcTd1V9ji+9hATBwTQ/MgY0iE1Ej5U3PtHsEpvyV
 SkqBAvhpnz5CASfNU5fXCiLI8QbcJ/BlNfp4wmn8zYXIZgKC351Focpar/lfMpKvC317
 iXvl57HYcUAOFd4xtc7UfOm6UDJ2gnvNN/hgTb73Wh9D2y/3QwdQeYDRneZoZr6FJd+c
 L7WQ==
X-Gm-Message-State: ANoB5pkTZW9UbUT8jJi2N8cYxtuBZXoJ3xDIAjmFv2U3+ZYn/BC4kEMa
 rU19o1LKZYv8WkpKl2i0ePhIqUsXL+E=
X-Google-Smtp-Source: AA0mqf5uCdUF55a44sS9E6RXkgUV3+GlW/39dZjtGcZ17gLrlOvNmAwGzrhZ9hJw1lUgNlpc6XkiYA==
X-Received: by 2002:a17:907:2acd:b0:7c0:dfba:95d with SMTP id
 fm13-20020a1709072acd00b007c0dfba095dmr4722512ejc.146.1670181876797; 
 Sun, 04 Dec 2022 11:24:36 -0800 (PST)
Received: from [127.0.0.1] (dynamic-089-012-182-051.89.12.pool.telefonica.de.
 [89.12.182.51]) by smtp.gmail.com with ESMTPSA id
 n22-20020a05640206d600b0046bada4b121sm5433969edy.54.2022.12.04.11.24.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Dec 2022 11:24:36 -0800 (PST)
Date: Sun, 04 Dec 2022 19:24:22 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 00/32] Consolidate PIIX south bridges
In-Reply-To: <20221204190553.3274-1-shentey@gmail.com>
References: <20221204190553.3274-1-shentey@gmail.com>
Message-ID: <E7C41EC8-95BE-4F2F-A07E-844B7EEF4391@gmail.com>
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

Sorry, the titles should have contained a "v3"=2E=2E=2E

Am 4=2E Dezember 2022 19:05:21 UTC schrieb Bernhard Beschow <shentey@gmail=
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
>used (KVM, TCG, Xen)=2E Due to consolidation PIIX4 gained the proxy PIC a=
s well=2E
>
>
>
>Another challenge was dealing with optional devices where Peter already g=
ave
>
>advice in [1] which this series implements=2E
>
>
>
>A challenge still remains with consolidating PCI interrupt handling=2E Th=
ere are
>
>still board-specific piix3_pci_slot_get_pirq() and piix4_pci_slot_get_pir=
q()
>
>which are implemented in isa/piix=2Ec=2E Any advice how to resolve these =
would be
>
>highly appreaciated=2E See [2] for details=2E
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
>* make check-avocado
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
>
>
>v3:
>
>- Introduce one TYPE_ICH9_USB_UHCI(fn) rather than several TYPE_ICH9_USB_=
UHCIx (Philippe)
>
>- Make proxy PIC generic (Philippe)
>
>- Track Malta's PIIX dependencies through KConfig
>
>- Rebase onto Philippe's 'hw/isa/piix4: Remove MIPS Malta specific bits' =
series [3]

- Use OBJECT_DECLARE_SIMPLE_TYPE() for PIIXState (Mark in v1)

Best regards,
Bernhard

>
>- Also rebase onto latest master to resolve merge conflicts=2E This requi=
red copying
>
>  Philippe's series as first three patches - please ignore=2E
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
>Bernhard Beschow (29):
>
>  hw/mips/Kconfig: Track Malta's PIIX dependencies via Kconfig
>
>  hw/i386/pc_piix: Allow for setting properties before realizing PIIX3
>
>    south bridge
>
>  hw/usb/hcd-uhci: Introduce TYPE_ defines for device models
>
>  hw/i386/pc: Create RTC controllers in south bridges
>
>  hw/i386/pc: No need for rtc_state to be an out-parameter
>
>  hw/isa/piix3: Create USB controller in host device
>
>  hw/isa/piix3: Create power management controller in host device
>
>  hw/core: Introduce proxy-pic
>
>  hw/isa/piix3: Create Proxy PIC in host device
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
>  hw/isa/piix3: Prefix pci_slot_get_pirq() with "piix3_"
>
>  hw/isa/piix3: Rename typedef PIIX3State to PIIXState
>
>  hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
>
>  hw/isa/piix4: Remove unused code
>
>  hw/isa/piix4: Use Proxy PIC device
>
>  hw/isa/piix4: Reuse struct PIIXState from PIIX3
>
>  hw/isa/piix4: Rename reset control operations to match PIIX3
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
>  hw/isa/piix: Share PIIX3 base class with PIIX4
>
>  hw/isa/piix: Drop the "3" from the PIIX base class
>
>
>
>Philippe Mathieu-Daud=C3=A9 (3):
>
>  hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition
>
>  hw/mips/malta: Set PIIX4 IRQ routes in embedded bootloader
>
>  hw/isa/piix4: Correct IRQRC[A:D] reset values
>
>
>
> MAINTAINERS                             |   8 +-
>
> configs/devices/mips-softmmu/common=2Emak |   2 -
>
> hw/core/Kconfig                         |   3 +
>
> hw/core/meson=2Ebuild                     |   1 +
>
> hw/core/proxy-pic=2Ec                     |  70 +++++
>
> hw/i386/Kconfig                         |   4 +-
>
> hw/i386/pc=2Ec                            |  16 +-
>
> hw/i386/pc_piix=2Ec                       |  71 ++---
>
> hw/i386/pc_q35=2Ec                        |  16 +-
>
> hw/isa/Kconfig                          |  10 +-
>
> hw/isa/lpc_ich9=2Ec                       |   8 +
>
> hw/isa/meson=2Ebuild                      |   3 +-
>
> hw/isa/{piix3=2Ec =3D> piix=2Ec}              | 302 +++++++++++++++++---=
--
>
> hw/isa/piix4=2Ec                          | 327 ------------------------=

>
> hw/mips/Kconfig                         |   2 +
>
> hw/mips/malta=2Ec                         |  38 ++-
>
> hw/usb/hcd-uhci=2Ec                       |  16 +-
>
> hw/usb/hcd-uhci=2Eh                       |   4 +
>
> include/hw/core/proxy-pic=2Eh             |  54 ++++
>
> include/hw/i386/ich9=2Eh                  |   2 +
>
> include/hw/i386/pc=2Eh                    |   2 +-
>
> include/hw/southbridge/piix=2Eh           |  30 ++-
>
> 22 files changed, 520 insertions(+), 469 deletions(-)
>
> create mode 100644 hw/core/proxy-pic=2Ec
>
> rename hw/isa/{piix3=2Ec =3D> piix=2Ec} (56%)
>
> delete mode 100644 hw/isa/piix4=2Ec
>
> create mode 100644 include/hw/core/proxy-pic=2Eh
>
>
>
>-- >
>2=2E38=2E1
>
>
>

