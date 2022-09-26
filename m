Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7A85EAF78
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 20:18:49 +0200 (CEST)
Received: from localhost ([::1]:45126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocsgq-0008AI-NQ
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 14:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4R-000876-CM
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:07 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:42807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ocs4P-00025D-0g
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:39:07 -0400
Received: by mail-oi1-x22f.google.com with SMTP id d64so9115426oia.9
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 10:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=p2zCpSY8K0rCN/Ah3C29xJCV5erbXm33J2i6PaOkL2A=;
 b=Zhmdz/GIdRkUbGH1SINPR9n5GTDgai04j6oyoAxYz7iwMd+vL6AOwZxPhq90S79qrz
 f8S7C5l5b4et4htX/OXVGmPFHTOxiZadoTwFyN5SVG/OrmJmMTUStrSQ2ycqxlokhCRL
 1AZhy7y8+rfeTsEo7xzah8gjxe0qUL2NaiK3qbLvQ98hWZXtHt+wwinwe4mOyNKKrPYQ
 COW3Qh0HwgtZ5CTYvKGtUoUXHoRyxdkaWVOyrrxXyl8QKOv2jky3acWgjHVSdrL4Ydcd
 6M8URIi8i3/QWZ8SorLsyxMhzNmYQWqCFpU80A1tAvDTs0kADjoGF1eqzf7c5Uy4eLY5
 85TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=p2zCpSY8K0rCN/Ah3C29xJCV5erbXm33J2i6PaOkL2A=;
 b=WBYl4Y/+dWo4fPt2WH9RLhIQWTKuYcpWqBx5WUsZ+Uva3tmAh1zQG5QH9/RH5iBYWL
 TKD6lKV84nQqdpQB5K9q/eRo37ET7BvCx3UIpfWjKnahxjaIN8G/gX35/wetlDzRPxAH
 ymVz0Y+6rJdmgCEBYomdMKbLXUPPxxVi1WM2ODMlfGNSaBcAoNsnOZA3/RobILQ+GXZZ
 Jgm3zBmOkVBVe0+UqsXLRR0BB7peMZT1qPBX35+UUpfXdbxiu3eqFBfV642q9Oy1VuzV
 +on3PB8EQuSj/5Znd3tipfaG1M5JKZQGr2wnKkuREFz9qWkwKyRmVS7ubDqcx+soqMHj
 Lu+w==
X-Gm-Message-State: ACrzQf1ZTOvi1cCALEF7qRzpLfCOzoIUQ3xFlwWE+Qxe65ptkP1zKogs
 8o5Ik0/XwaS/cWuVjKpBk/3gewnZDt8=
X-Google-Smtp-Source: AMsMyM7S4Ic+hT4FDpnjZ3rS1Zo43C7ogtLLoqeZbWxhPo6C4O+Btu6IAU7hdRamGTsiIZj6S4oi5g==
X-Received: by 2002:a05:6808:2206:b0:350:7190:139a with SMTP id
 bd6-20020a056808220600b003507190139amr10724643oib.273.1664213941807; 
 Mon, 26 Sep 2022 10:39:01 -0700 (PDT)
Received: from balboa.COMFAST (189-68-154-15.dsl.telesp.net.br.
 [189.68.154.15]) by smtp.gmail.com with ESMTPSA id
 m12-20020a0568301e6c00b0061c9ab1032dsm7947165otr.18.2022.09.26.10.39.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 10:39:01 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v8 00/16] QMP/HMP: introduce 'dumpdtb'
Date: Mon, 26 Sep 2022 14:38:39 -0300
Message-Id: <20220926173855.1159396-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Hi,

This new version contains all changes proposed during the review process,
all of them done in the patch that introduces dumpdtb.

Other changes made:

- Patch 14/14, the one that introduces the command, is now patch 1. This
change is to make the other machine patches referencing 'dumpdtb QMP/HMP'
to reference an existing command.

- added two new patches based on Philippe's feedback: patch 2 and patch 4.

Mandatory patch pending review: patch 2
Optional machine patches pending review: 3, 4, 5, 7, 16

Changes from v7:
- patch 14: switched to start of the series, now patch 1
- patch 1:
  - changed hmp-commands.hx help to:
   "dump the FDT in dtb format to 'filename'"

  - changed 'filename' to *filename*

  - changed filename description in machine.json to
    "name of the binary FDT file to be created"

  - changed 'size' to uint32_t
  - added a g_assert() for FDT size == zero
  - added a success message in hmp_dumpdtb()
- patch 2 (new):
  - free ms->fdt in machine_finalize() 
- patch 4 (new):
  - assign ms->fdt in boston_mach_init()
- v7 link: https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg01350.html

Daniel Henrique Barboza (16):
  qmp/hmp, device_tree.c: introduce dumpdtb
  hw/core: free ms->fdt in machine_finalize()
  hw/arm: do not free machine->fdt in arm_load_dtb()
  hw/mips: set machine->fdt in boston_mach_init()
  hw/microblaze: set machine->fdt in microblaze_load_dtb()
  hw/nios2: set machine->fdt in nios2_load_dtb()
  hw/ppc: set machine->fdt in ppce500_load_device_tree()
  hw/ppc: set machine->fdt in bamboo_load_device_tree()
  hw/ppc: set machine->fdt in sam460ex_load_device_tree()
  hw/ppc: set machine->fdt in xilinx_load_device_tree()
  hw/ppc: set machine->fdt in pegasos2_machine_reset()
  hw/ppc: set machine->fdt in pnv_reset()
  hw/ppc: set machine->fdt in spapr machine
  hw/riscv: set machine->fdt in sifive_u_machine_init()
  hw/riscv: set machine->fdt in spike_board_init()
  hw/xtensa: set machine->fdt in xtfpga_init()

 hmp-commands.hx              | 15 +++++++++++++++
 hw/arm/boot.c                |  3 ++-
 hw/core/machine.c            |  1 +
 hw/microblaze/boot.c         |  8 +++++++-
 hw/microblaze/meson.build    |  2 +-
 hw/mips/boston.c             |  5 ++++-
 hw/nios2/boot.c              |  8 +++++++-
 hw/nios2/meson.build         |  2 +-
 hw/ppc/e500.c                | 13 ++++++++++++-
 hw/ppc/pegasos2.c            |  4 ++++
 hw/ppc/pnv.c                 |  8 +++++++-
 hw/ppc/ppc440_bamboo.c       | 25 +++++++++++++-----------
 hw/ppc/sam460ex.c            | 21 ++++++++++----------
 hw/ppc/spapr.c               |  3 +++
 hw/ppc/spapr_hcall.c         |  8 ++++++++
 hw/ppc/virtex_ml507.c        | 25 +++++++++++++-----------
 hw/riscv/sifive_u.c          |  3 +++
 hw/riscv/spike.c             |  6 ++++++
 hw/xtensa/meson.build        |  2 +-
 hw/xtensa/xtfpga.c           |  6 +++++-
 include/sysemu/device_tree.h |  1 +
 monitor/misc.c               |  1 +
 qapi/machine.json            | 18 ++++++++++++++++++
 softmmu/device_tree.c        | 37 ++++++++++++++++++++++++++++++++++++
 24 files changed, 183 insertions(+), 42 deletions(-)

-- 
2.37.3


