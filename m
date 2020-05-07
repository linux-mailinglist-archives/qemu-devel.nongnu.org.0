Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD981C814D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 07:06:10 +0200 (CEST)
Received: from localhost ([::1]:41022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWYjZ-0001FB-ME
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 01:06:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jWYht-0007VC-Q7; Thu, 07 May 2020 01:04:25 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:51995 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1jWYhr-0006zG-GF; Thu, 07 May 2020 01:04:25 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 49HhFn1Cckz9sSW; Thu,  7 May 2020 15:04:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1588827853;
 bh=BeBPV0jGM9MMAFCuVvUR8L8BVAjuzxl16FKjLO6gvmg=;
 h=From:To:Cc:Subject:Date:From;
 b=YueiBkhbF3kuk7L3g2mK93+LbujuO1JRIGtpKXgDQjEQaMevraYVPLyPtsjoNQixQ
 IOLlDfn+UDCqc0GA5CHZ4e2z51DrfFkQuCYZXgy7Wu88bVdn7hblJg2YZZR6esZlx9
 H3LkkTz5jb1XMBRKmXnAyxUSd5Mwu3FPOf7MEqMk=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 00/18] ppc-for-5.1 queue 20200507
Date: Thu,  7 May 2020 15:02:10 +1000
Message-Id: <20200507050228.802395-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: aik@ozlabs.ru, qemu-devel@nongnu.org, npiggin@gmail.com, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 570a9214827e3d42f7173c4d4c9f045b99834cf0:

  Merge remote-tracking branch 'remotes/alistair/tags/pull-reg-to-apply-20200505' into staging (2020-05-06 15:38:02 +0100)

are available in the Git repository at:

  git://github.com/dgibson/qemu.git tags/ppc-for-5.1-20200507

for you to fetch changes up to c4f6a4a3dd5f2aa15329b8158de25f50b5ba3252:

  target-ppc: fix rlwimi, rlwinm, rlwnm for Clang-9 (2020-05-07 11:10:50 +1000)

----------------------------------------------------------------
ppc patch queue for 2020-04-07

First pull request for qemu-5.1.  This includes:
 * Removal of all remaining cases where we had CAS triggered reboots
 * A number of improvements to NMI injection
 * Support for partition scoped radix translation in softmmu
 * Some fixes for NVDIMM handling
 * A handful of other minor fixes

----------------------------------------------------------------
Alexey Kardashevskiy (1):
      spapr/cas: Separate CAS handling from rebuilding the FDT

Cédric Le Goater (6):
      target/ppc: Introduce a relocation bool in ppc_radix64_handle_mmu_fault()
      target/ppc: Assert if HV mode is set when running under a pseries machine
      target/ppc: Introduce ppc_radix64_xlate() for Radix tree translation
      target/ppc: Extend ppc_radix64_check_prot() with a 'partition_scoped' bool
      target/ppc: Rework ppc_radix64_walk_tree() for partition-scoped translation
      target/ppc: Add support for Radix partition-scoped translation

Daniel Henrique Barboza (1):
      spapr_nvdimm.c: make 'label-size' mandatory

Daniele Buono (1):
      target-ppc: fix rlwimi, rlwinm, rlwnm for Clang-9

David Gibson (2):
      spapr: Don't allow unplug of NVLink2 devices
      spapr_nvdimm: Tweak error messages

Greg Kurz (3):
      spapr: Don't check capabilities removed between CAS calls
      spapr: Simplify selection of radix/hash during CAS
      spapr: Drop CAS reboot flag

Nicholas Piggin (3):
      target/ppc: Improve syscall exception logging
      ppc/spapr: tweak change system reset helper
      ppc/pnv: Add support for NMI interface

Suraj Jitindar Singh (1):
      target/ppc: Enforce that the root page directory size must be at least 5

 hw/ppc/pnv.c             |  29 +++
 hw/ppc/spapr.c           |  29 ++-
 hw/ppc/spapr_hcall.c     | 108 ++++++-----
 hw/ppc/spapr_nvdimm.c    |  10 +-
 hw/ppc/spapr_pci.c       |   4 +
 include/hw/ppc/spapr.h   |   8 +-
 target/ppc/cpu.h         |   5 +-
 target/ppc/excp_helper.c |  38 +++-
 target/ppc/mmu-radix64.c | 468 ++++++++++++++++++++++++++++++++++-------------
 target/ppc/translate.c   |  24 ++-
 10 files changed, 506 insertions(+), 217 deletions(-)

