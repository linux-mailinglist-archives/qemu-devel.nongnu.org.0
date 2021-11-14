Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F43D44F5D8
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Nov 2021 01:58:49 +0100 (CET)
Received: from localhost ([::1]:36894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mm3r6-0002RD-2W
	for lists+qemu-devel@lfdr.de; Sat, 13 Nov 2021 19:58:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>)
 id 1mm3qM-0001cI-OL; Sat, 13 Nov 2021 19:58:02 -0500
Received: from [107.174.27.60] (port=48570 helo=ozlabs.ru)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>)
 id 1mm3qK-0006a0-71; Sat, 13 Nov 2021 19:58:02 -0500
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 74FC880152;
 Sat, 13 Nov 2021 19:51:14 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
Date: Sun, 14 Nov 2021 11:51:11 +1100
Message-Id: <20211114005111.515543-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 107.174.27.60 (failed)
Received-SPF: pass client-ip=107.174.27.60; envelope-from=aik@ozlabs.ru;
 helo=ozlabs.ru
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit d139786e1b3d67991e6cb49a8a59bb2182350285:

  ppc/mmu_helper.c: do not truncate 'ea' in booke206_invalidate_ea_tlb() (2021-11-11 11:35:13 +0100)

are available in the Git repository at:

  git@github.com:aik/qemu.git tags/qemu-slof-20211112

for you to fetch changes up to 73944a4bf4ab259b489af8128b4aec525484d642:

  pseries: Update SLOF firmware image (2021-11-13 14:47:56 +1100)

----------------------------------------------------------------
Alexey Kardashevskiy (1):
      pseries: Update SLOF firmware image

 pc-bios/README   |   2 +-
 pc-bios/slof.bin | Bin 991744 -> 991920 bytes
 roms/SLOF        |   2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)


*** Note: this is not for master, this is for pseries

This has really just one fix from Stefan, the rest is housekeeping.

The full changelog is:

Alexey Kardashevskiy (3):
      Revert "make: Define default rule for .c when V=1 or V=2"
      js2x: Fix compile and cleanup
      version: update to 20211112

Stefan Berger (1):
      tcgbios: Disable platform hierarchy in case of failure

Thomas Huth (8):
      Mention the CR vs. LF problem in the documentation
      slof/fs/accept: Replace TABs with spaces
      Fix the URL to the Linux kernel coding style
      lib/libc/README.txt: Fix "cannel" typo
      travis.yml: Fix keywords
      travis.yml: Update to Focal Fossa
      travis.yml: Compile-test the qemu build
      Silence some trivial compiler warning in the js2x code


