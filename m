Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E2C3C3D41
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 16:11:26 +0200 (CEST)
Received: from localhost ([::1]:60294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2aB2-0006J2-Nb
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 10:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>)
 id 1m2aAC-0004z3-V1; Sun, 11 Jul 2021 10:10:34 -0400
Received: from ozlabs.ru ([107.174.27.60]:42758)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>)
 id 1m2aAA-00084X-Sf; Sun, 11 Jul 2021 10:10:32 -0400
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 47049AE8002D;
 Sun, 11 Jul 2021 10:10:23 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
Date: Mon, 12 Jul 2021 00:10:20 +1000
Message-Id: <20210711141020.996718-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=107.174.27.60; envelope-from=aik@ozlabs.ru;
 helo=ozlabs.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 82123b756a1a2f1965350e5794aaa7b5c6a15282:

  target/ppc: Support for H_RPT_INVALIDATE hcall (2021-07-09 11:01:06 +1000)

are available in the Git repository at:

  git@github.com:aik/qemu.git tags/qemu-slof-20210711

for you to fetch changes up to 13a20db82f3d177a348ac9839e30ece66dfa40f7:

  pseries: Update SLOF firmware image (2021-07-12 00:05:05 +1000)

----------------------------------------------------------------
Alexey Kardashevskiy (1):
      pseries: Update SLOF firmware image

 pc-bios/README   |   2 +-
 pc-bios/slof.bin | Bin 968888 -> 991744 bytes
 roms/SLOF        |   2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)


*** Note: this is not for master, this is for pseries

This is all about TPM fixes and improvements.

The change log is:

Alexey Kardashevskiy (2):
      tcgbios: Fix warnings
      version: update to 20210711

Stefan Berger (9):
      tcgbios: Fix details in log entries
      tcgbios: Fix a typo in the sha256 algo description
      tcgbios: Add implementations for sha1, sha384, and sha512
      tpm: Add firmware API call 2HASH-EXT-LOG
      tcgbios: Change format of S_CRTM_VERSION string to ucs-2
      tcgbios: Use assembly for 32 bit rotr in sha256
      tcgbios: Use The proper sha function for each PCR bank
      tcgbios: Add test cases and test script to run them
      Travis: Add script for running tests on Travis

Thomas Huth (1):
      Fix bad header guard in version.h


