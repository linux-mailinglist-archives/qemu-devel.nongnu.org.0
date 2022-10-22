Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D504609866
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 05:02:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omgfx-0001Or-8X
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 15:30:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG4P-0006zI-QE; Sat, 22 Oct 2022 11:05:56 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1omG4N-0001zz-NO; Sat, 22 Oct 2022 11:05:53 -0400
Received: by mail-ed1-x52b.google.com with SMTP id b12so16116762edd.6;
 Sat, 22 Oct 2022 08:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NovAA0yfq1xh3UCa3bxcXd6xqSkYuOKAweWUuQI6MZE=;
 b=O/Dd6fT6CsxsNDu+7nDfc+JFm8MRrG+0VBmLGbD0M9rKxQ4YbId8HgljMA/wWpGUqG
 7wkcKYEv4nQVSIsHAtkmQGKCEr5oGgtN3Rx8bB6U79XwW2Y/EDh3W5VHUrmnxdGbnR+4
 gd43v1tRtHp6uYJE0iolUmEX+2d2myNejC2aOMimv3L1zOQOgt3RN0gwgFH6l57nTJA2
 m0CmVX3s+qBwJCDBFEu7dyG/NhoLsZ/pYeoTVfSQFm1OrjvvMyylcohRWiK6OKtXoLry
 icBJoVwR+5GZfgMU1y/jvDKxSwV69mo4p24Yxt8cDXOLK3NHZ6Q8/qkjUw2J0OHlp1ad
 6RRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NovAA0yfq1xh3UCa3bxcXd6xqSkYuOKAweWUuQI6MZE=;
 b=F5tYh0gfJk/grmjffkKVK44ICz3I7vHU2oU1qXHnqyCfXxE0yZx78F4m1gog5cvAoD
 HdjARegfADrXkesIgldm8vsLja3GZZy7CrC6ZxzeILPhMhcHMY0yJLILNIysW2fBlduO
 IoSh/Xi2FPuagykPEWkxLBVoufhJkP1xdK7lT0+Woy+w1lnS2g0433lbUC1tRLS1u0nJ
 /Khb/4MzUTvFJSLbK7WNqga8EQrd5S+79UTVEqzaJSeFUB+JR6JoM9rbv0Vful0Rg7px
 DssRDF84dFnRJlCCltfHDgEGK/1kxR+3T0qi8wK/Dt693nM+PEA7KuitX1TAw40jHFxL
 I1vw==
X-Gm-Message-State: ACrzQf0gdHQAcGyQvcet1igJZMI9I7O7fCTjDTJPXeqbGNGbTaizy4jn
 qYOVAO2+1IWCeeXjbpFNwiYCZrws1y0iYw==
X-Google-Smtp-Source: AMsMyM6rNoP+E7/MhZV5ytqeJj5ar8ZG6NLO68FX3UG18CfZOxo1TXeFfiP1U0GjyiQ3zhCEYnrdZw==
X-Received: by 2002:a17:906:30c5:b0:782:707:9e2d with SMTP id
 b5-20020a17090630c500b0078207079e2dmr19774988ejb.286.1666451146078; 
 Sat, 22 Oct 2022 08:05:46 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-171-138.77.191.pool.telefonica.de. [77.191.171.138])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170906310400b00780ab5a9116sm13021558ejx.211.2022.10.22.08.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 08:05:45 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 00/43] Consolidate PIIX south bridges
Date: Sat, 22 Oct 2022 17:04:25 +0200
Message-Id: <20221022150508.26830-1-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
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

This series consolidates the implementations of the PIIX3 and PIIX4 south=0D
bridges and is an extended version of [1]. The motivation is to share as mu=
ch=0D
code as possible and to bring both device models to feature parity such tha=
t=0D
perhaps PIIX4 can become a drop-in-replacement for PIIX3 in the pc machine.=
 This=0D
could resolve the "Frankenstein" PIIX4-PM problem in PIIX3 discussed on thi=
s=0D
list before.=0D
=0D
The series is structured as follows: First, PIIX3 is changed to instantiate=
=0D
internal devices itself, like PIIX4 does already. Second, PIIX3 gets prepar=
ed=0D
for the merge with PIIX4 which includes some fixes, cleanups, and renamings=
.=0D
Third, the same is done for PIIX4. In step four the implementations are mer=
ged.=0D
Since some consolidations could be done easier with merged implementations,=
 the=0D
consolidation continues in step five which concludes the series.=0D
=0D
One particular challenge in this series was that the PIC of PIIX3 used to b=
e=0D
instantiated outside of the south bridge while some sub functions require a=
 PIC=0D
with populated qemu_irqs. This has been solved by introducing a proxy PIC w=
hich=0D
furthermore allows PIIX3 to be agnostic towards the virtualization technolo=
gy=0D
used (KVM, TCG, Xen). Due to consolidation PIIX4 gained the PIC as well,=0D
possibly allowing the Malta board to gain KVM capabilities in the future.=0D
=0D
Another challenge was dealing with optional devices where Peter already gav=
e=0D
advice in [1] which this series implements.=0D
=0D
A challenge still remains with consolidating PCI interrupt handling. There =
are=0D
still board-specific piix3_pci_slot_get_pirq() and piix4_pci_slot_get_pirq(=
)=0D
which are implemented in isa/piix.c. Any advice how to resolve these would =
be=0D
highly appreaciated.=0D
=0D
Last but not least there might be some opportunity to consolidate VM state=
=0D
handling, probably by reusing the one from PIIX3. Since I'm not very famili=
ar=0D
with the requirements I didn't touch it so far.=0D
=0D
Testing done:=0D
* make check=0D
* make check-avocado=0D
* Boot live CD:=0D
  * `qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom manjaro-kde=
-21.3.2-220704-linux515.iso`=0D
  * `qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom manjaro-kd=
e-21.3.2-220704-linux515.iso`=0D
* 'qemu-system-mips64el -M malta -kernel vmlinux-3.2.0-4-5kc-malta -hda deb=
ian_wheezy_mipsel_standard.qcow2 -append "root=3D/dev/sda1 console=3Dtty0"`=
=0D
=0D
[1] https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg02348.html=
=0D
=0D
v2:=0D
- Introduce TYPE_ defines for IDE and USB device models (Mark)=0D
- Omit unexporting of PIIXState (Mark)=0D
- Improve commit message of patch 5 to mention reset triggering through PCI=
=0D
  configuration space (Mark)=0D
- Move reviewed patches w/o dependencies to the bottom of the series for ea=
rly=0D
  upstreaming -> @Michael?=0D
=0D
Bernhard Beschow (43):=0D
  hw/i386/pc: Create DMA controllers in south bridges=0D
  hw/i386/pc_piix: Allow for setting properties before realizing PIIX3=0D
    south bridge=0D
  hw/isa/piix3: Remove extra ';' outside of functions=0D
  hw/isa/piix3: Add size constraints to rcr_ops=0D
  hw/isa/piix3: Modernize reset handling=0D
  hw/isa/piix3: Prefer pci_address_space() over get_system_memory()=0D
  hw/isa/piix4: Rename wrongly named method=0D
  hw/ide/piix: Introduce TYPE_ macros for PIIX IDE controllers=0D
  hw/usb/hcd-uhci: Introduce TYPE_ defines for device models=0D
  hw/i386/pc: Create RTC controllers in south bridges=0D
  hw/i386/pc: No need for rtc_state to be an out-parameter=0D
  hw/isa/piix3: Create USB controller in host device=0D
  hw/isa/piix3: Create power management controller in host device=0D
  hw/intc/i8259: Introduce i8259 proxy "isa-pic"=0D
  hw/isa/piix3: Create ISA PIC in host device=0D
  hw/isa/piix3: Create IDE controller in host device=0D
  hw/isa/piix3: Wire up ACPI interrupt internally=0D
  hw/isa/piix3: Remove unused include=0D
  hw/isa/piix3: Allow board to provide PCI interrupt routes=0D
  hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS=0D
  hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4=0D
  hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4=0D
  hw/isa/piix3: Prefix pci_slot_get_pirq() with "piix3_"=0D
  hw/isa/piix3: Rename typedef PIIX3State to PIIXState=0D
  hw/mips/malta: Reuse dev variable=0D
  meson: Fix dependencies of piix4 southbridge=0D
  hw/isa/piix4: Add missing initialization=0D
  hw/isa/piix4: Move pci_ide_create_devs() call to board code=0D
  hw/isa/piix4: Make PIIX4's ACPI and USB functions optional=0D
  hw/isa/piix4: Allow board to provide PCI interrupt routes=0D
  hw/isa/piix4: Remove unused code=0D
  hw/isa/piix4: Use ISA PIC device=0D
  hw/isa/piix4: Reuse struct PIIXState from PIIX3=0D
  hw/isa/piix4: Rename reset control operations to match PIIX3=0D
  hw/isa/piix4: Prefix pci_slot_get_pirq() with "piix4_"=0D
  hw/isa/piix3: Merge hw/isa/piix4.c=0D
  hw/isa/piix: Harmonize names of reset control memory regions=0D
  hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4=0D
  hw/isa/piix: Rename functions to be shared for interrupt triggering=0D
  hw/isa/piix: Consolidate IRQ triggering=0D
  hw/isa/piix: Share PIIX3 base class with PIIX4=0D
  hw/isa/piix: Drop the "3" from the PIIX base class=0D
  hw/i386/acpi-build: Resolve PIIX ISA bridge rather than ACPI=0D
    controller=0D
=0D
 MAINTAINERS                             |   6 +-=0D
 configs/devices/mips-softmmu/common.mak |   3 +-=0D
 hw/i386/Kconfig                         |   3 +-=0D
 hw/i386/acpi-build.c                    |   4 +-=0D
 hw/i386/pc.c                            |  19 +-=0D
 hw/i386/pc_piix.c                       |  72 ++---=0D
 hw/i386/pc_q35.c                        |  16 +-=0D
 hw/ide/piix.c                           |   5 +-=0D
 hw/intc/i8259.c                         |  27 ++=0D
 hw/isa/Kconfig                          |  14 +-=0D
 hw/isa/lpc_ich9.c                       |  11 +=0D
 hw/isa/meson.build                      |   3 +-=0D
 hw/isa/{piix3.c =3D> piix.c}              | 337 ++++++++++++++++++------=0D
 hw/isa/piix4.c                          | 325 -----------------------=0D
 hw/mips/malta.c                         |  34 ++-=0D
 hw/usb/hcd-uhci.c                       |  16 +-=0D
 hw/usb/hcd-uhci.h                       |   9 +=0D
 include/hw/i386/ich9.h                  |   2 +=0D
 include/hw/i386/pc.h                    |   2 +-=0D
 include/hw/ide/piix.h                   |   7 +=0D
 include/hw/intc/i8259.h                 |  14 +=0D
 include/hw/southbridge/piix.h           |  33 ++-=0D
 22 files changed, 473 insertions(+), 489 deletions(-)=0D
 rename hw/isa/{piix3.c =3D> piix.c} (51%)=0D
 delete mode 100644 hw/isa/piix4.c=0D
 create mode 100644 include/hw/ide/piix.h=0D
=0D
-- =0D
2.38.1=0D
=0D

