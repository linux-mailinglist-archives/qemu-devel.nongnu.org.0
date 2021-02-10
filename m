Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C083315F4E
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 07:19:25 +0100 (CET)
Received: from localhost ([::1]:41294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9iqS-0003DW-36
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 01:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ioy-0001SN-Fq; Wed, 10 Feb 2021 01:17:52 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:34445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ioq-0000Cj-NA; Wed, 10 Feb 2021 01:17:52 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Db8gj6WWqz9sVb; Wed, 10 Feb 2021 17:17:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612937857;
 bh=J4dO2t45RQHqQNIIjSKp7McaZvbq1VQShxgcRROCxvo=;
 h=From:To:Cc:Subject:Date:From;
 b=Yo8LwbTMpeGaW2E+UwlzvqMyAQ2fLT42d8CIyOvVx5n/cM3jJkJQqdn44ceWFKtn1
 X6e0+2URzleP9QsWnF4KbC8R5MJVFeBWPMYlOTWRB+Vtr0YSOsz+mIUtyNVIhH7sqy
 4AEwkG7h8AK0QP0Ms21yGi9RrmYaItcLUXY+d4+Q=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 00/19] ppc-for-6.0 queue 20210210
Date: Wed, 10 Feb 2021 17:17:16 +1100
Message-Id: <20210210061735.304384-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 1214d55d1c41fbab3a9973a05085b8760647e411:

  Merge remote-tracking branch 'remotes/nvme/tags/nvme-next-pull-request' into staging (2021-02-09 13:24:37 +0000)

are available in the Git repository at:

  https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.0-20210210

for you to fetch changes up to 298091f831db1a8f360686369f9760849e90dd03:

  target/ppc: Add E500 L2CSR0 write helper (2021-02-10 14:50:11 +1100)

----------------------------------------------------------------
ppc patch queue for 20201-02-10

Here's the latest batch of patches for the ppc target and machine
types.  Highlights are:
 * Several fixes for E500 from Bin Meng
 * Fixes and cleanups for PowerNV from Cédric Le Goater
 * Assorted other fixes and cleanups

----------------------------------------------------------------
Bin Meng (4):
      hw/ppc: e500: Use a macro for the platform clock frequency
      hw/ppc: e500: Fill in correct <clock-frequency> for the serial nodes
      hw/net: fsl_etsec: Reverse the RCTRL.RSF logic
      target/ppc: Add E500 L2CSR0 write helper

Cédric Le Goater (8):
      ppc/pnv: Add trace events for PCI event notification
      ppc/xive: Add firmware bit when dumping the ENDs
      ppc/pnv: Use skiboot addresses to load kernel and ramfs
      ppc/pnv: Simplify pnv_bmc_create()
      ppc/pnv: Discard internal BMC initialization when BMC is external
      ppc/pnv: Remove default disablement of the PNOR contents
      ppc/pnv: Introduce a LPC FW memory region attribute to map the PNOR
      ppc/pnv: Set default RAM size to 1 GB

Daniel Henrique Barboza (5):
      spapr.c: use g_auto* with 'nodename' in CPU DT functions
      spapr.c: add 'name' property for hotplugged CPUs nodes
      spapr: move spapr_machine_using_legacy_numa() to spapr_numa.c
      spapr_numa.c: create spapr_numa_initial_nvgpu_numa_id() helper
      spapr_numa.c: fix ibm,max-associativity-domains calculation

Greg Kurz (1):
      spapr: Adjust firmware path of PCI devices

Philippe Mathieu-Daudé (1):
      target/ppc: Remove unused MMU definitions

 hw/intc/pnv_xive.c              |  3 +++
 hw/intc/trace-events            |  3 +++
 hw/intc/xive.c                  |  3 ++-
 hw/net/fsl_etsec/rings.c        |  2 +-
 hw/pci-host/pnv_phb4.c          |  3 +++
 hw/pci-host/trace-events        |  3 +++
 hw/ppc/e500.c                   | 10 ++++++----
 hw/ppc/pnv.c                    | 27 +++++++++++++++++++------
 hw/ppc/pnv_bmc.c                | 22 ++++++++++++++-------
 hw/ppc/pnv_lpc.c                | 15 --------------
 hw/ppc/spapr.c                  | 44 ++++++++++++++++++++---------------------
 hw/ppc/spapr_numa.c             | 27 ++++++++++++++++++++++++-
 hw/ppc/spapr_pci.c              | 33 +++++++++++++++++--------------
 include/hw/pci-host/spapr.h     |  2 ++
 include/hw/ppc/pnv.h            |  1 +
 include/hw/ppc/spapr.h          |  1 -
 include/hw/ppc/spapr_numa.h     |  1 +
 include/hw/ppc/xive_regs.h      |  2 ++
 target/ppc/cpu.h                |  9 ++++++---
 target/ppc/translate_init.c.inc | 16 +++++++++++++++
 20 files changed, 150 insertions(+), 77 deletions(-)

