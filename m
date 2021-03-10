Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BC333343C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 05:11:56 +0100 (CET)
Received: from localhost ([::1]:39662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJqCR-0005NQ-R9
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 23:11:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAj-0003Te-Tc; Tue, 09 Mar 2021 23:10:11 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:44097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lJqAi-00046X-11; Tue, 09 Mar 2021 23:10:09 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DwJWd0qH2z9sVS; Wed, 10 Mar 2021 15:10:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1615349405;
 bh=eDB5sFOEhqdpsmbTGGku3dsikC0LwplPwsp4xGXiTJI=;
 h=From:To:Cc:Subject:Date:From;
 b=bfwzpJyTRZNfmJ44Onj74Ogl564fRfHL7bjtlUkEAmhIsfrMCo+jTDh1cE1PcJWHk
 nx2+9hTsQFkbhrgZtXJxY+BA38IJnBYfufudaSC79QHvqoodsgslfWswk6PtTPf3C3
 v1IHQ9oWHD6+ZI6XMNxm5vmknxw8eokypSEAjsCY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 00/20] ppc-for-6.0 queue 20210310
Date: Wed, 10 Mar 2021 15:09:42 +1100
Message-Id: <20210310041002.333813-1-david@gibson.dropbear.id.au>
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
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit b2ae1009d7cca2701e17eae55ae2d44fd22c942a:

  Merge remote-tracking branch 'remotes/mcayland/tags/qemu-sparc-20210307' into staging (2021-03-09 13:50:35 +0000)

are available in the Git repository at:

  https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.0-20210310

for you to fetch changes up to eb7f80fd26d73e7e1af105431da58971b1dba517:

  spapr.c: send QAPI event when memory hotunplug fails (2021-03-10 09:07:09 +1100)

----------------------------------------------------------------
ppc patch queue for 2021-03-10

Next batch of patches for the ppc target and machine types.  Includes:
 * Several cleanups for sm501 from Peter Maydell
 * An update to the SLOF guest firmware
 * Improved handling of hotplug failures in spapr, associated cleanups
   to the hotplug handling code
 * Several etsec fixes and cleanups from Bin Meng
 * Assorted other fixes and cleanups

----------------------------------------------------------------
Alexey Kardashevskiy (1):
      pseries: Update SLOF firmware image

Bin Meng (2):
      hw/net: fsl_etsec: Fix build error when HEX_DUMP is on
      hw/ppc: e500: Add missing <ranges> in the eTSEC node

Cédric Le Goater (1):
      docs/system: Extend PPC section

Daniel Henrique Barboza (11):
      spapr_drc.c: do not call spapr_drc_detach() in drc_isolate_logical()
      spapr_drc.c: use spapr_drc_release() in isolate_physical/set_unusable
      spapr: rename spapr_drc_detach() to spapr_drc_unplug_request()
      spapr_drc.c: introduce unplug_timeout_timer
      spapr_drc.c: add hotunplug timeout for CPUs
      spapr_drc.c: use DRC reconfiguration to cleanup DIMM unplug state
      spapr.c: add 'unplug already in progress' message for PHB unplug
      spapr_pci.c: add 'unplug already in progress' message for PCI unplug
      qemu_timer.c: add timer_deadline_ms() helper
      spapr.c: remove duplicated assert in spapr_memory_unplug_request()
      spapr.c: send QAPI event when memory hotunplug fails

Fabiano Rosas (1):
      target/ppc: Fix bcdsub. emulation when result overflows

Peter Maydell (3):
      hw/display/sm501: Remove dead code for non-32-bit RGB surfaces
      hw/display/sm501: Expand out macros in template header
      hw/display/sm501: Inline template header into C file

Vitaly Cheptsov (1):
      target/ppc: fix icount support on Book-e vms accessing SPRs

 docs/system/ppc/embedded.rst      |  10 ++
 docs/system/ppc/powermac.rst      |  34 +++++++
 docs/system/ppc/powernv.rst       | 193 ++++++++++++++++++++++++++++++++++++++
 docs/system/ppc/prep.rst          |  18 ++++
 docs/system/ppc/pseries.rst       |  12 +++
 docs/system/target-ppc.rst        |  53 +++--------
 hw/display/sm501.c                | 160 +++++++++++++++----------------
 hw/display/sm501_template.h       | 131 --------------------------
 hw/net/fsl_etsec/etsec.c          |   1 +
 hw/net/fsl_etsec/rings.c          |   1 +
 hw/ppc/e500.c                     |   1 +
 hw/ppc/spapr.c                    |  67 ++++++++++++-
 hw/ppc/spapr_drc.c                | 110 ++++++++++++++++------
 hw/ppc/spapr_pci.c                |   8 +-
 hw/ppc/trace-events               |   2 +-
 include/hw/ppc/spapr.h            |   1 +
 include/hw/ppc/spapr_drc.h        |   7 +-
 include/qemu/timer.h              |   8 ++
 pc-bios/README                    |   2 +-
 pc-bios/slof.bin                  | Bin 968368 -> 968888 bytes
 roms/SLOF                         |   2 +-
 target/ppc/int_helper.c           |  13 ++-
 target/ppc/translate_init.c.inc   |  36 +++++++
 tests/tcg/configure.sh            |   6 ++
 tests/tcg/ppc64/Makefile.target   |  13 +++
 tests/tcg/ppc64le/Makefile.target |  12 +++
 tests/tcg/ppc64le/bcdsub.c        | 130 +++++++++++++++++++++++++
 util/qemu-timer.c                 |  13 +++
 28 files changed, 751 insertions(+), 293 deletions(-)
 create mode 100644 docs/system/ppc/embedded.rst
 create mode 100644 docs/system/ppc/powermac.rst
 create mode 100644 docs/system/ppc/powernv.rst
 create mode 100644 docs/system/ppc/prep.rst
 create mode 100644 docs/system/ppc/pseries.rst
 delete mode 100644 hw/display/sm501_template.h
 create mode 100644 tests/tcg/ppc64/Makefile.target
 create mode 100644 tests/tcg/ppc64le/Makefile.target
 create mode 100644 tests/tcg/ppc64le/bcdsub.c

