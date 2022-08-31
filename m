Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C3C5A878A
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 22:31:27 +0200 (CEST)
Received: from localhost ([::1]:58550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTUMx-00026V-2a
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 16:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTUKC-0007As-4J; Wed, 31 Aug 2022 16:28:36 -0400
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a]:40679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTUK7-0005hz-Uy; Wed, 31 Aug 2022 16:28:34 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-11f0fa892aeso18616464fac.7; 
 Wed, 31 Aug 2022 13:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Gzqa7zRAWde0bxjKAu9pR//+ScZ3nvce6hu+yvBYhKo=;
 b=HfWZbw+fobh2l5BsKHTXN7dLaDtmqptDOYX65gWemaLYpKMIa0bwzzgcjbf/4XArpH
 cdS33lK5FchfeT42PtoOMW2/cOEKvAueWuACPIHNNrZ+0GJR9QAP7k8DIYIaa6EMa/cA
 lCGc5k6/YOxh9jUt5qO9En2b7UPgc1JAT2FhDvzGJrwVVIjey22pY15aBi4TLuglH67f
 ZWmy7yPevig/Hu+ZQS9Qa9imcy7ptJC34EdSWK5wEWFad3ouR/IfgbDz2faz3Pz0CvOe
 6/F5u38U4eGv+7ch9co1oTy1Rm0wwcx7/8r7kqVmANdVY60MzuRn4zuz8crhKq+TaFgO
 RnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Gzqa7zRAWde0bxjKAu9pR//+ScZ3nvce6hu+yvBYhKo=;
 b=iP247C1dka7FOTYQ+gy7EGznlZLCDBD/p/EPJi/J32hjrylMxqL7q2PNKjTOApHim0
 n3TxdFT1tkbWhK5vXE0pvzjoLOWalF5vQX05bFvqpOh5QZh68aJJnSvd2auBfHVoEVW3
 89AI9OAfUK8fjCe+j6EFxWOEn9izWGRD5cipYiuayOLcUfcbJU/gp0lM+wmzLk9mJScu
 9QXB9YK5oFMcWNVk0YF2vWJZXdq9Dtpva/K/K2/vDWfMVemceNqKrpe2XMsdF9Kuqujp
 93+Whfqc76gqPJMkIyXj7uLVpZihj3x9KPabXHyHdZpejbTZYa9Tws6nXlNSf0CvpCaX
 dDtw==
X-Gm-Message-State: ACgBeo3rik2QZKL5EcSh2VIFzJbMEqlNVn0iUIYbXTZuG5rS4XBiRHei
 ysUKT8MvNf9/7pD6I/dtH55vhgoK3JA=
X-Google-Smtp-Source: AA6agR6/IY1Qc8aPj01W3SFUDKh7JJfU1Jk3l4TE8tSM8sahTMv1QM2QS7ORliNH5usEs2dPtyqnPA==
X-Received: by 2002:a05:6870:1691:b0:122:3bb7:42ee with SMTP id
 j17-20020a056870169100b001223bb742eemr1638039oae.58.1661977710189; 
 Wed, 31 Aug 2022 13:28:30 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 e6-20020a9d7306000000b006393ea22c1csm9113817otk.16.2022.08.31.13.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 13:28:29 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org
Subject: [PULL v2 00/60] ppc queue
Date: Wed, 31 Aug 2022 17:28:18 -0300
Message-Id: <20220831202818.7630-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

The following changes since commit 93fac696d241dccb04ebb9d23da55fc1e9d8ee36:

  Open 7.2 development tree (2022-08-30 09:40:41 -0700)

are available in the Git repository at:

  https://gitlab.com/danielhb/qemu.git tags/pull-ppc-20220831

for you to fetch changes up to 95e22932870f523765910b01c2dc5b845b8bec85:

  ppc4xx: Fix code style problems reported by checkpatch (2022-08-31 17:05:15 -0300)

----------------------------------------------------------------
ppc patch queue for 2022-08-31:

In the first 7.2 queue we have changes in the powernv pnv-phb handling,
the start of the QOMification of the ppc405 model, the removal of the
taihu machine, a new SLOF image and others.

----------------------------------------------------------------
Alexey Kardashevskiy (1):
      pseries: Update SLOF firmware image

BALATON Zoltan (9):
      ppc4xx: Move PLB model to ppc4xx_devs.c
      ppc4xx: Rename ppc405-plb to ppc4xx-plb
      ppc4xx: Move EBC model to ppc4xx_devs.c
      ppc4xx: Rename ppc405-ebc to ppc4xx-ebc
      hw/intc/ppc-uic: Convert ppc-uic to a PPC4xx DCR device
      ppc405: Move machine specific code to ppc405_boards.c
      hw/ppc/sam460ex: Remove PPC405 dependency from sam460ex
      hw/ppc/Kconfig: Move imply before select
      ppc4xx: Fix code style problems reported by checkpatch

Cédric Le Goater (22):
      ppc/ppc405: Remove taihu machine
      ppc/ppc405: Introduce a PPC405 generic machine
      ppc/ppc405: Move devices under the ref405ep machine
      ppc/ppc405: Move SRAM under the ref405ep machine
      ppc/ppc405: Introduce a PPC405 SoC
      ppc/ppc405: Start QOMification of the SoC
      ppc/ppc405: QOM'ify CPU
      ppc/ppc4xx: Introduce a DCR device model
      ppc/ppc405: QOM'ify CPC
      ppc/ppc405: QOM'ify GPT
      ppc/ppc405: QOM'ify OCM
      ppc/ppc405: QOM'ify GPIO
      ppc/ppc405: QOM'ify DMA
      ppc/ppc405: QOM'ify EBC
      ppc/ppc405: QOM'ify OPBA
      ppc/ppc405: QOM'ify POB
      ppc/ppc405: QOM'ify PLB
      ppc/ppc405: QOM'ify MAL
      ppc/ppc405: Use an embedded PPCUIC model in SoC state
      ppc/ppc405: Use an explicit I2C object
      ppc/ppc405: QOM'ify FPGA
      ppc/ppc4xx: Fix sdram trace events

Daniel Henrique Barboza (24):
      ppc/pnv: add PHB3 bus init helper
      ppc/pnv: add PnvPHB base/proxy device
      ppc/pnv: turn PnvPHB3 into a PnvPHB backend
      ppc/pnv: add PHB4 bus init helper
      ppc/pnv: turn PnvPHB4 into a PnvPHB backend
      ppc/pnv: add pnv-phb-root-port device
      ppc/pnv: remove pnv-phb3-root-port
      ppc/pnv: remove pnv-phb4-root-port
      ppc/pnv: remove root port name from pnv_phb_attach_root_port()
      ppc/pnv: remove pecc->rp_model
      ppc/pnv: remove PnvPHB4.version
      ppc/pnv: move attach_root_port helper to pnv-phb.c
      ppc/pnv: add phb-id/chip-id PnvPHB3RootBus properties
      ppc/pnv: add phb-id/chip-id PnvPHB4RootBus properties
      ppc/pnv: set root port chassis and slot using Bus properties
      ppc/pnv: add helpers for pnv-phb user devices
      ppc/pnv: turn chip8->phbs[] into a PnvPHB* array
      ppc/pnv: enable user created pnv-phb for powernv8
      ppc/pnv: add PHB4 helpers for user created pnv-phb
      ppc/pnv: enable user created pnv-phb for powernv9
      ppc/pnv: change pnv_phb4_get_pec() to also retrieve chip10->pecs
      ppc/pnv: user creatable pnv-phb for powernv10
      ppc/pnv: consolidate pnv_parent_*_fixup() helpers
      ppc/pnv: fix QOM parenting of user creatable root ports

Lucas Mateus Castro (alqotel) (2):
      fpu: Add rebias bool, value and operation
      target/ppc: Bugfix FP when OE/UE are set

Nicholas Piggin (2):
      target/ppc: Fix host PVR matching for KVM
      ppc/pnv: Add initial P9/10 SBE model

 MAINTAINERS                     |    2 +-
 docs/about/deprecated.rst       |    9 -
 docs/about/removed-features.rst |    6 +
 docs/system/ppc/embedded.rst    |    1 -
 docs/system/ppc/pseries.rst     |    2 +-
 fpu/softfloat-parts.c.inc       |   21 +-
 fpu/softfloat.c                 |    2 +
 hw/intc/ppc-uic.c               |   26 +-
 hw/pci-host/meson.build         |    3 +-
 hw/pci-host/pnv_phb.c           |  337 ++++++++++++
 hw/pci-host/pnv_phb.h           |   55 ++
 hw/pci-host/pnv_phb3.c          |  152 +++--
 hw/pci-host/pnv_phb4.c          |  191 +++----
 hw/pci-host/pnv_phb4_pec.c      |   11 +-
 hw/ppc/Kconfig                  |    3 +-
 hw/ppc/meson.build              |    1 +
 hw/ppc/pnv.c                    |  188 +++++--
 hw/ppc/pnv_sbe.c                |  414 ++++++++++++++
 hw/ppc/pnv_xscom.c              |    3 +
 hw/ppc/ppc405.h                 |  200 +++++--
 hw/ppc/ppc405_boards.c          |  552 +++++++++----------
 hw/ppc/ppc405_uc.c              | 1156 ++++++++++++++-------------------------
 hw/ppc/ppc440_bamboo.c          |   34 +-
 hw/ppc/ppc440_uc.c              |    3 +-
 hw/ppc/ppc4xx_devs.c            |  554 ++++++++++++++-----
 hw/ppc/ppc4xx_pci.c             |   31 +-
 hw/ppc/sam460ex.c               |   38 +-
 hw/ppc/trace-events             |   14 +-
 hw/ppc/virtex_ml507.c           |    7 +-
 include/fpu/softfloat-types.h   |    4 +
 include/hw/intc/ppc-uic.h       |    6 +-
 include/hw/pci-host/pnv_phb3.h  |   19 +-
 include/hw/pci-host/pnv_phb4.h  |   22 +-
 include/hw/ppc/pnv.h            |   13 +-
 include/hw/ppc/pnv_sbe.h        |   55 ++
 include/hw/ppc/pnv_xscom.h      |   12 +
 include/hw/ppc/ppc4xx.h         |   76 ++-
 pc-bios/README                  |    2 +-
 pc-bios/slof.bin                |  Bin 992384 -> 995176 bytes
 roms/SLOF                       |    2 +-
 target/ppc/cpu-qom.h            |    6 +-
 target/ppc/cpu.c                |    2 +
 target/ppc/cpu_init.c           |   91 ++-
 target/ppc/fpu_helper.c         |    2 -
 target/ppc/machine.c            |    2 +-
 45 files changed, 2736 insertions(+), 1594 deletions(-)
 create mode 100644 hw/pci-host/pnv_phb.c
 create mode 100644 hw/pci-host/pnv_phb.h
 create mode 100644 hw/ppc/pnv_sbe.c
 create mode 100644 include/hw/ppc/pnv_sbe.h

