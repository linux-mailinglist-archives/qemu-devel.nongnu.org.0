Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE105794C7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 10:01:50 +0200 (CEST)
Received: from localhost ([::1]:33802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDiAw-0002NJ-32
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 04:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>)
 id 1oDi8t-0000BE-Rh; Tue, 19 Jul 2022 03:59:43 -0400
Received: from ozlabs.ru ([107.174.27.60]:42160)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>)
 id 1oDi8r-00031Z-Jl; Tue, 19 Jul 2022 03:59:43 -0400
Received: from ole.1.ozlabs.ru (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id E8158804C8;
 Tue, 19 Jul 2022 03:59:34 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
Date: Tue, 19 Jul 2022 17:59:30 +1000
Message-Id: <20220719075930.315237-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=107.174.27.60; envelope-from=aik@ozlabs.ru;
 helo=ozlabs.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The following changes since commit d2066bc50d690a6605307eaf0e72a9cf51e6fc25:

  target/ppc: Check page dir/table base alignment (2022-07-18 13:59:43 -0300)

are available in the Git repository at:

  git@github.com:aik/qemu.git tags/qemu-slof-20220719

for you to fetch changes up to 17c1ad657904787b1d986fb4c85431fee006a6ea:

  pseries: Update SLOF firmware image (2022-07-19 17:50:46 +1000)

----------------------------------------------------------------
Alexey Kardashevskiy (1):
      pseries: Update SLOF firmware image

 docs/system/ppc/pseries.rst |   2 +-
 pc-bios/README              |   2 +-
 pc-bios/slof.bin            | Bin 992384 -> 995176 bytes
 roms/SLOF                   |   2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)


*** Note: this is not for master, this is for pseries
*** Note2: this has not sync'd to git.qemu.org but softfreeze is
too soon so I am posting it anyway.


The image grew in size because of change of the toolchain from
native PPC to cross on x86.


The only change is that now SLOF can also boot big endian zImage
but kernel-addr=0 is still required.


