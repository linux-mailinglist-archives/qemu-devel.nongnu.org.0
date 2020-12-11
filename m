Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 735A32D6F13
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 05:21:29 +0100 (CET)
Received: from localhost ([::1]:33714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knZvs-0002m6-AT
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 23:21:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knZq3-0005Wy-RN; Thu, 10 Dec 2020 23:15:28 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:57213 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knZq0-0000Vt-83; Thu, 10 Dec 2020 23:15:27 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CscrZ2MvKz9sWS; Fri, 11 Dec 2020 15:15:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607660110;
 bh=MZNQj2GHcmTvFmaWxWZvyf7ujr4it3gNqWEBCWEzBG4=;
 h=From:To:Cc:Subject:Date:From;
 b=V4/zcOpkKpdV7x7WBEyj+Zmo6iA5EAWNaBmEPB3TV4YzbJ8yAFLaC9nlagk4LOHLP
 Vb70VpCtBiQigizPdbrdObvKUnM9spPUzzgEK/aXHOLPyh+Pi0FZ/0OhZSaN4Uac61
 zEJ7Alo0cESwzmgsUgbPeqsNMvFm/L4wnQMBNyuI=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 00/30] ppc-for-6.0 queue 20201211
Date: Fri, 11 Dec 2020 15:14:37 +1100
Message-Id: <20201211041507.425378-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 2ecfc0657afa5d29a373271b342f704a1a3c6737:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-misc-2020-12-10' into staging (2020-12-10 17:01:05 +0000)

are available in the Git repository at:

  https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.0-20201211

for you to fetch changes up to 7728c7ef126468a3e982b03b427196b1cccfa2c8:

  spapr.c: set a 'kvm-type' default value instead of relying on NULL (2020-12-11 12:02:10 +1100)

----------------------------------------------------------------
ppc patch queue 2020-12-11

Here's my first pull request for qemu-6.0, with a bunch of things
queued over the freeze.  Highlights are:
 * A bunch of cleanups to hotplug error paths from Greg Kurz
 * A number of TCG fixes from new contributor LemonBoy
 * Added Greg Kurz as co-maintainer
 * Assorted other bugfixes and cleanups

----------------------------------------------------------------
Chen Qun (2):
      target/ppc: replaced the TODO with LOG_UNIMP and add break for silence warnings
      ppc: Add a missing break for PPC6xx_INPUT_TBEN

Cédric Le Goater (1):
      xive: Add trace events

Daniel Henrique Barboza (1):
      spapr.c: set a 'kvm-type' default value instead of relying on NULL

David Gibson (1):
      MAINTAINERS: Add Greg Kurz as co-maintainer for ppc

Gan Qixin (1):
      ppc/e500: Free irqs array to avoid memleak

Greg Kurz (17):
      spapr/xive: Turn some sanity checks into assertions
      spapr/xics: Drop unused argument to xics_kvm_has_broken_disconnect()
      spapr: Do PCI device hotplug sanity checks at pre-plug only
      spapr: Do NVDIMM/PC-DIMM device hotplug sanity checks at pre-plug only
      spapr: Make PHB placement functions and spapr_pre_plug_phb() return status
      spapr: Do PHB hoplug sanity check at pre-plug
      spapr: Do TPM proxy hotplug sanity checks at pre-plug
      spapr: Fix pre-2.10 dummy ICP hack
      spapr: Abort if ppc_set_compat() fails for hot-plugged CPUs
      spapr: Simplify error path of spapr_core_plug()
      spapr: spapr_drc_attach() cannot fail
      target/ppc: Remove "compat" property of server class POWER CPUs
      hw/ppc: Do not re-read the clock on pre_save if doing savevm
      target/ppc: Introduce an mmu_is_64bit() helper
      spapr: Pass sPAPR machine state down to spapr_pci_switch_vga()
      spapr: Don't use qdev_get_machine() in spapr_msi_write()
      spapr: Pass sPAPR machine state to some RTAS events handling functions

LemonBoy (5):
      ppc/translate: Fix unordered f64/f128 comparisons
      ppc/translate: Turn the helper macros into functions
      ppc/translate: Delay NaN checking after comparison
      ppc/translate: Raise exceptions after setting the cc
      ppc/translate: Rewrite gen_lxvdsx to use gvec primitives

Philippe Mathieu-Daudé (1):
      hw/ppc/spapr_tpm_proxy: Fix hexadecimal format string specifier

Stephane Duverger (1):
      ppc/translate: Use POWERPC_MMU_64 to detect 64-bit MMU models

 MAINTAINERS                         |  17 ++-
 docs/system/deprecated.rst          |   7 --
 hw/intc/spapr_xive.c                |  47 ++++++--
 hw/intc/spapr_xive_kvm.c            |   5 +
 hw/intc/trace-events                |  33 ++++++
 hw/intc/xics_kvm.c                  |   2 +-
 hw/intc/xive.c                      |  40 ++++++-
 hw/ppc/e500.c                       |   1 +
 hw/ppc/ppc.c                        |   6 +-
 hw/ppc/spapr.c                      | 186 ++++++++++++++++--------------
 hw/ppc/spapr_drc.c                  |   8 +-
 hw/ppc/spapr_events.c               |  21 ++--
 hw/ppc/spapr_hcall.c                |   7 +-
 hw/ppc/spapr_irq.c                  |   2 +-
 hw/ppc/spapr_nvdimm.c               |  11 +-
 hw/ppc/spapr_pci.c                  |  48 +++++---
 hw/ppc/trace-events                 |   2 +-
 include/hw/ppc/spapr.h              |   4 +-
 include/hw/ppc/spapr_drc.h          |   8 +-
 include/hw/ppc/spapr_nvdimm.h       |   2 +-
 include/hw/ppc/xics_spapr.h         |   2 +-
 target/ppc/cpu-qom.h                |   5 +
 target/ppc/excp_helper.c            |   4 +-
 target/ppc/fpu_helper.c             | 220 +++++++++++++++++++++---------------
 target/ppc/machine.c                |   4 +-
 target/ppc/mmu-hash64.c             |   2 +-
 target/ppc/mmu_helper.c             |  15 +--
 target/ppc/translate.c              |   4 +-
 target/ppc/translate/vsx-impl.c.inc |  46 ++++----
 target/ppc/translate_init.c.inc     |  61 +---------
 30 files changed, 478 insertions(+), 342 deletions(-)

