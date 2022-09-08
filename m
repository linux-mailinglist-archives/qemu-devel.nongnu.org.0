Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5795B2702
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 21:43:07 +0200 (CEST)
Received: from localhost ([::1]:36356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWNQX-0001KX-Va
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 15:43:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWNOL-0004H0-JX; Thu, 08 Sep 2022 15:40:49 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:47021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oWNOJ-0007Aq-Rv; Thu, 08 Sep 2022 15:40:49 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 v2-20020a056830090200b006397457afecso12994133ott.13; 
 Thu, 08 Sep 2022 12:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=jnpSy6+t74si5Loov2CuRPzeMnbeNzObM2RLB7uCkgg=;
 b=JcGKcATOYK5LC1CR4XFsgCQflVHKf+Yh3MjVLoi88nAazAAwthyFgYgkKHVxZP4h2C
 BPLJhevFnh4ER6tJlMzSCZ2RD6zs71G/Zgv00eRzvuUhMJ2msQBWMGk7Y6nA0ViXhBGl
 inVtnSE2E2WYgJXhM0ucDyYWeQUB9uNtHHu6DstpInEjPxNrhZ5n7NsD3gNwZaJkuNWa
 fqAhghtKR6Sc3MEak5W3oyo9ypml9Ci7nyjKO6Amnt/879D3dK12cEljF84iyVUX1DAA
 fg3b4ZOwnBcTqsGvbw9ikg86KN7muhdxP81VW0NF+VDDiWCoUqnXz54BTcbCj7z86V3m
 /3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=jnpSy6+t74si5Loov2CuRPzeMnbeNzObM2RLB7uCkgg=;
 b=ohUMc9Qdf4IJNVE13fS7djTU9lTouK8KT52PahL1nAGPW1IZgoKgcip3BPY7w9a9OA
 Xk34gOwrsxVp+rEGx0DlOSeft2kIXGuHj4c65v2cUP9pe5kLWR/TQoXpZ7YU1+dpGSXa
 EDpAH0MogHncneHZU/6ErRufEybAB8noHcpJSVC6iu8HVbYSD0D1E39ki+7U/LOxbN15
 fPVROkYxYhn5rV273ThZcICQZii0Mb+JjrENIDPA0V8ErlsT4wYoa0WWnimsmbILeIn3
 dpVKagTWQ4qZv8rHm6Qp9Z/WWhnmFaBqLeRxTxipUch5HhwtPrGGdmlj4xEgQz+DUl8J
 eDvg==
X-Gm-Message-State: ACgBeo00Ci5HIafYYTa7eTcySKq1+Pc5xw7pxEvicHsI6DaSCPRe45ZQ
 n+fZdbjBn9Yr2FappRWx81sb+LEaOtSBrg==
X-Google-Smtp-Source: AA6agR41kDq9+w2iad0YppXVSxW49yuB1oh+NBBhsJQ0OfVi3VLtkUh9E2cTQd7AU08OIPiKRGnlmg==
X-Received: by 2002:a05:6830:3706:b0:61c:5d4c:7a26 with SMTP id
 bl6-20020a056830370600b0061c5d4c7a26mr3845090otb.250.1662666046035; 
 Thu, 08 Sep 2022 12:40:46 -0700 (PDT)
Received: from balboa.ibmuc.com (200-207-147-180.dsl.telesp.net.br.
 [200.207.147.180]) by smtp.gmail.com with ESMTPSA id
 3-20020aca0703000000b0033ad6ea8d11sm2839849oih.47.2022.09.08.12.40.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 12:40:45 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, clg@kaod.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH v7 00/14] QMP/HMP: introduce 'dumpdtb'
Date: Thu,  8 Sep 2022 16:40:26 -0300
Message-Id: <20220908194040.518400-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x330.google.com
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

Hi,

This new version implements all change requests from the v6.

- patch 5:
  - change bamboo_load_device_tree() to use a MachineState pointer
- patch 7:
  - change xilinx_load_device_tree() to use a MachineState pointer
- patch 14:
  - placed SRST/ERST below the { }'s
  - removed the '/tmp' reference in the command example
  - removed all 'Requires libfdt' references
  - changed qmp_dumpdtb() missing FDT error message to "This machine
    doesn't have a FDT"
- v6 link: https://lists.gnu.org/archive/html/qemu-devel/2022-09/msg00534.html

Daniel Henrique Barboza (14):
  hw/arm: do not free machine->fdt in arm_load_dtb()
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
  qmp/hmp, device_tree.c: introduce dumpdtb

 hmp-commands.hx              | 15 +++++++++++++++
 hw/arm/boot.c                |  3 ++-
 hw/microblaze/boot.c         |  8 +++++++-
 hw/microblaze/meson.build    |  2 +-
 hw/nios2/boot.c              |  8 +++++++-
 hw/nios2/meson.build         |  2 +-
 hw/ppc/e500.c                | 13 ++++++++++++-
 hw/ppc/pegasos2.c            |  4 ++++
 hw/ppc/pnv.c                 |  8 +++++++-
 hw/ppc/ppc440_bamboo.c       | 25 ++++++++++++++-----------
 hw/ppc/sam460ex.c            | 21 +++++++++++----------
 hw/ppc/spapr.c               |  3 +++
 hw/ppc/spapr_hcall.c         |  8 ++++++++
 hw/ppc/virtex_ml507.c        | 25 ++++++++++++++-----------
 hw/riscv/sifive_u.c          |  3 +++
 hw/riscv/spike.c             |  6 ++++++
 hw/xtensa/meson.build        |  2 +-
 hw/xtensa/xtfpga.c           |  6 +++++-
 include/sysemu/device_tree.h |  1 +
 monitor/misc.c               |  1 +
 qapi/machine.json            | 18 ++++++++++++++++++
 softmmu/device_tree.c        | 31 +++++++++++++++++++++++++++++++
 22 files changed, 172 insertions(+), 41 deletions(-)

-- 
2.37.2


