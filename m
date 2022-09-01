Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4D05A9D21
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:32:10 +0200 (CEST)
Received: from localhost ([::1]:45454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTn6v-0007ZX-8G
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:32:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn1n-0001bY-9p
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:26:53 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:44991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn1l-0001Sg-7N
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:26:51 -0400
Received: by mail-ej1-x62b.google.com with SMTP id kk26so35777665ejc.11
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=bXQsIF8kH/zcvVwSgijUJg04+KihRkyVLjU4F7uhh8s=;
 b=NN6Wu2Zu1Vgasdk1Es93aPpho5OB6yvmQboK+nShRhTUpdqLzV5aTSMkZywpyycYUf
 uB4Pf0bkpX20abbXg4mbvjw5bLoku1NW6jkbAeOlxnKcLtjrChvA0wp+SlnFyzNpoHDx
 2a0gCFu6pZFP0mEzQXpSl3GAq6LVCCeFDfjycMPVJ97CxD+kyOIF+T79LpyIBgu6ONgX
 gFJhL00U7C0BxaFhOjnH0gwh6wMGoCCqOQPbFl2SUOr4XNnTaVUzGTiQdnIDveJaIIWS
 XfuICFuX41gcME2W5kBi1zX7oPQ8a+V84CSRC0TyEnPlO1NU29h7SK0RuQ4fpFd192qI
 ll/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=bXQsIF8kH/zcvVwSgijUJg04+KihRkyVLjU4F7uhh8s=;
 b=H4o+dUL2nuvnj0ZJ5q0XefA1XyXhk81dVv83lNqs6xf3PYvcTf6LANPuO+4cEwfYQQ
 fHYH0avSXJtoZBUNYHFlYdMZYrZHAvJ+rl/U6wktHYI6mj40Q5lka1mk5zASVvQdirJX
 xHJGVgrgWzsNQUhAe9NKAxemZxmYvWxb1UvM3nl1+tFHJUeGSZ7NU6wE8lMWrIGrT4bB
 Dr8pBil7ujJagfanrjBmfceMzi13hLCt2ETcXINeTXMevimfxbLVjp80PvwyaZ53HiLd
 PlzMwHOloNeksKkY68AtSY8E95y7PCEo5/JMRLgQcZEvl7VRR2Oi//uwWJAJRA+gc3UR
 dFPw==
X-Gm-Message-State: ACgBeo2Bhnf29OE1shbsZDxzlwceuWWorYEv29onJ6dwCD06FwO2jHTY
 D9HUv6q8LCI0kvaxJrsH8/FvJIzHoHI=
X-Google-Smtp-Source: AA6agR6x4BlE1ys5jypYMiy5zzC96M1wjX23++69bsK2A4Uif4TcBetl/1y1s/e8DdPCujLwC4DzgQ==
X-Received: by 2002:a17:907:948f:b0:731:3f2e:8916 with SMTP id
 dm15-20020a170907948f00b007313f2e8916mr25108786ejc.442.1662049607338; 
 Thu, 01 Sep 2022 09:26:47 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:26:47 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 00/42] Consolidate PIIX south bridges
Date: Thu,  1 Sep 2022 18:25:31 +0200
Message-Id: <20220901162613.6939-1-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
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
An unsolved problem still is PCI interrupt handling. The first function=0D
passed to pci_bus_irqs() is device-specific while the second one seems=0D
board-specific. This causes both PIIX device models to be coupled to a=0D
particular board. Any advice how to resolve this would be highly appreaciat=
ed.=0D
=0D
Last but not least there might be some opportunity to consolidate VM state=
=0D
handling, probably by reusing the one from PIIX3. Since I'm not very famili=
ar=0D
with the requirements I didn't touch it so far.=0D
=0D
Testing done:=0D
* make check=0D
* Boot live CD:=0D
  * `qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom=0D
manjaro-kde-21.3.2-220704-linux515.iso`=0D
  * `qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom=0D
manjaro-kde-21.3.2-220704-linux515.iso`=0D
=0D
[1] https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg02348.html=
=0D
=0D
Bernhard Beschow (42):=0D
  hw/i386/pc: Create DMA controllers in south bridges=0D
  hw/i386/pc: Create RTC controllers in south bridges=0D
  hw/i386/pc: No need for rtc_state to be an out-parameter=0D
  hw/i386/pc_piix: Allow for setting properties before realizing PIIX3=0D
    south bridge=0D
  hw/isa/piix3: Create USB controller in host device=0D
  hw/isa/piix3: Create power management controller in host device=0D
  hw/intc/i8259: Introduce i8259 proxy "isa-pic"=0D
  hw/isa/piix3: Create ISA PIC in host device=0D
  hw/isa/piix3: Create IDE controller in host device=0D
  hw/isa/piix3: Wire up ACPI interrupt internally=0D
  hw/isa/piix3: Remove extra ';' outside of functions=0D
  hw/isa/piix3: Remove unused include=0D
  hw/isa/piix3: Add size constraints to rcr_ops=0D
  hw/isa/piix3: Modernize reset handling=0D
  hw/isa/piix3: Prefer pci_address_space() over get_system_memory()=0D
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
  hw/isa/piix4: Rename wrongly named method=0D
  hw/isa/piix4: Prefix pci_slot_get_pirq() with "piix4_"=0D
  hw/isa/piix3: Merge hw/isa/piix4.c=0D
  hw/isa/piix: Harmonize names of reset control memory regions=0D
  hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4=0D
  hw/isa/piix: Rename functions to be shared for interrupt triggering=0D
  hw/isa/piix: Consolidate IRQ triggering=0D
  hw/isa/piix: Unexport PIIXState=0D
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
 hw/i386/pc_piix.c                       |  72 +--=0D
 hw/i386/pc_q35.c                        |   3 +-=0D
 hw/intc/i8259.c                         |  27 +=0D
 hw/isa/Kconfig                          |  14 +-=0D
 hw/isa/lpc_ich9.c                       |  11 +=0D
 hw/isa/meson.build                      |   3 +-=0D
 hw/isa/piix.c                           | 669 ++++++++++++++++++++++++=0D
 hw/isa/piix3.c                          | 431 ---------------=0D
 hw/isa/piix4.c                          | 325 ------------=0D
 hw/mips/malta.c                         |  34 +-=0D
 include/hw/i386/ich9.h                  |   2 +=0D
 include/hw/i386/pc.h                    |   2 +-=0D
 include/hw/intc/i8259.h                 |  14 +=0D
 include/hw/southbridge/piix.h           |  41 +-=0D
 19 files changed, 823 insertions(+), 860 deletions(-)=0D
 create mode 100644 hw/isa/piix.c=0D
 delete mode 100644 hw/isa/piix3.c=0D
 delete mode 100644 hw/isa/piix4.c=0D
=0D
-- =0D
2.37.3=0D
=0D

