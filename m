Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A361367D78A
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 22:19:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL9dK-0007x3-61; Thu, 26 Jan 2023 16:18:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pL9d5-0007uM-1j; Thu, 26 Jan 2023 16:17:55 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pL9d3-0007in-3H; Thu, 26 Jan 2023 16:17:54 -0500
Received: by mail-ej1-x629.google.com with SMTP id k4so3155044eje.1;
 Thu, 26 Jan 2023 13:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sWa6bYHpp4opzbitKMzF+Gkf2/jhczI2ZT5O54H0QwA=;
 b=VH5rVElYPAccBtyo+mSP0pZ7XnOXPY67UKqjJ3if0AdAsqokUR0N/VXBUA+LRFWZjw
 WPQfHrms1ldmjk5MpcjiM691meYa3lKnT/9MVqnI9A6i/GrT7WRucanc9T03j9axYiPo
 RVcchi6ieI2Lk9/A1sCvfg8pQ9ITXHi6so+JoB9KtA64AErBfGcrhZth7G0JZ5BYckRJ
 De9Xz45Kqzo1u3mPdD4/SbNE3vPch5kyaB3H24TZF7SyAtmx3/0BHBAOwceJbiICOKYx
 w696aXZXg2j/raJ7HkfsWaOps2ot9GoG7b8q+ai9YW0R0Py1R6KjR3bUUS1Pd/efPz5d
 vPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sWa6bYHpp4opzbitKMzF+Gkf2/jhczI2ZT5O54H0QwA=;
 b=UTzlYid9Gkl7W501g8xt/d6iu0f9Dctmifc9jHzs9G1grI+12JyzCVc1OcnCgAAMxQ
 sdiNjMb9LWayfI1Zqs2UuoCPsmIVxP0JtqydjoK8BjYgoHDDgn6oi8MpSxmp5EB9NSzC
 q007WCcJcrYpUO6ye4rilVvc5nr2vwTKiqbcCHCUv485VYKQnxDtXGpSvb/QU9FA6iB2
 gXluHCAk9Tl6M5S71sJsQlf7aHTmtW8mCOcXAE1mRGs6gJVI9EtJYu+3NUy8V2qNH8Ft
 dj4FzeWM61xy5ixwj2IIja8Sx8k4iYpxlwE8tloDa0fP04V0ZXWX1MK+yVlEE/tMpEWg
 kTmg==
X-Gm-Message-State: AO0yUKWfsERk1xsNilA76ad5hWWDs9IJBvf0bHUJ+rZkyninZkQxsZOH
 eWAh+ESdDeAR/ENHLrNoNFfLNGGiqC78lw==
X-Google-Smtp-Source: AK7set9eTnX7irGzdKSfXYiWd205yZ3LbMJmcnYGCLhkWXEHBtzSyn23pgdzEYItFL9329eMHJOd2g==
X-Received: by 2002:a17:907:98a3:b0:878:6309:13af with SMTP id
 ju3-20020a17090798a300b00878630913afmr3560084ejc.56.1674767870135; 
 Thu, 26 Jan 2023 13:17:50 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a170906384500b00878003adeeesm1117568ejc.23.2023.01.26.13.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 13:17:49 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-ppc@nongnu.org, qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 00/10] Resolve isabus global
Date: Thu, 26 Jan 2023 22:17:30 +0100
Message-Id: <20230126211740.66874-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
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

This series resolves the global "isabus" variable and is basically a v2 of =
[1].=0D
Note that the majority of the work consists of fixing ISA API calls in PIIX=
 IDE=0D
which implicitly rely on the usage of the isabus global.=0D
=0D
Rather than adding an ISABus pointer in PCIIDEState as in [1] this series u=
ses=0D
a qemu_irq array which is roughly the approach outlined in [2]. Moreover, t=
his=0D
series considers backwards compatibility for user-created PIIX IDE=0D
"Frankensten" devices by fishing out TYPE_ISA_BUS from the QOM tree inside=
=0D
the PIIX IDE device model. This hack can be removed again once a deprecatio=
n=0D
period of user-createable PIIX IDE devices is over. This deprecation wasn't=
=0D
announced yet but now might be a good time.=0D
=0D
This series is structured as follows: The first three patches massage the I=
SA=0D
code for patch 8. Patches 4-8 change the PIIX IDE device models to not use =
the=0D
isabus global implicitly. Finally, the last two patches clan up and remove =
the=0D
isabus singleton.=0D
=0D
Based-on: <20230109172347.1830-1-shentey@gmail.com>=0D
          'Consolidate PIIX south bridges'=0D
=0D
v2:=0D
- Big rework sticking closer to [1], giving it more credit and reusing one =
patch=0D
- Add io port cleanup=0D
- Rebase onto [4] so changes to PIIX could be done once and centrally=0D
=0D
Testing done:=0D
* `make check`=0D
* `./qemu-system-x86_64 -M x-remote -device piix3-ide` still fails graceful=
ly with=0D
  `qemu-system-x86_64: -device piix3-ide: No ISA bus found while piix3-ide =
requires one`=0D
* `qemu-system-x86_64 -M pc -m 2G -cdrom manjaro-kde-21.3.2-220704-linux515=
.iso`=0D
* `qemu-system-x86_64 -M q35 -m 2G -device piix4-ide -cdrom \=0D
   manjaro-kde-21.3.2-220704-linux515.iso`=0D
* `qemu-system-mips64el -M malta -kernel vmlinux-3.2.0-4-5kc-malta -hda \=0D
  debian_wheezy_mipsel_standard.qcow2 -append "root=3D/dev/sda1 console=3Dt=
tyS0"`=0D
=0D
[1] https://patchew.org/QEMU/20210518215545.1793947-1-philmd@redhat.com/=0D
[2] https://lists.nongnu.org/archive/html/qemu-devel/2020-03/msg01707.html=
=0D
[3] https://people.debian.org/~aurel32/qemu/mips/=0D
[4] https://patchew.org/QEMU/20230109172347.1830-1-shentey@gmail.com/=0D
=0D
Bernhard Beschow (9):=0D
  softmmu/ioport: Move portio_list_init() in front of portio_list_add()=0D
  softmmu/ioport: Merge portio_list_add() into portio_list_init()=0D
  softmmu/ioport: Remove unused functions=0D
  hw/ide/piix: Disuse isa_get_irq()=0D
  Revert "hw/ide: Fix crash when plugging a piix3-ide device into the=0D
    x-remote machine"=0D
  hw/ide/pci: Add PCIIDEState::isa_irqs[]=0D
  hw/ide/piix: Require an ISABus only for user-created instances=0D
  hw/ide: Let ide_init_ioport() take a MemoryRegion argument instead of=0D
    ISADevice=0D
  hw/isa/isa-bus: Resolve isabus global=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  hw/isa: Remove use of global isa bus=0D
=0D
 include/exec/ioport.h     |  8 ++---=0D
 include/hw/ide/internal.h |  3 +-=0D
 include/hw/ide/pci.h      |  2 ++=0D
 include/hw/isa/isa.h      | 15 ++++----=0D
 hw/audio/adlib.c          |  4 +--=0D
 hw/display/qxl.c          |  5 ++-=0D
 hw/display/vga.c          |  8 ++---=0D
 hw/dma/i82374.c           |  6 ++--=0D
 hw/ide/ioport.c           | 19 +++++-----=0D
 hw/ide/isa.c              |  4 ++-=0D
 hw/ide/piix.c             | 75 +++++++++++++++++++++++++++++++--------=0D
 hw/isa/isa-bus.c          | 54 +++++++++++++++-------------=0D
 hw/isa/piix.c             |  5 +++=0D
 hw/watchdog/wdt_ib700.c   |  4 +--=0D
 softmmu/ioport.c          | 70 +++++++++++-------------------------=0D
 15 files changed, 149 insertions(+), 133 deletions(-)=0D
=0D
-- =0D
2.39.1=0D
=0D

