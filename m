Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF6B121FD8
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 01:36:34 +0100 (CET)
Received: from localhost ([::1]:33768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ih0qn-0004kY-Qd
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 19:36:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43780)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>) id 1ih0q4-0004F9-S0
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 19:35:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>) id 1ih0q2-00046X-Ne
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 19:35:47 -0500
Received: from [107.174.27.60] (port=60708 helo=ozlabs.ru)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>)
 id 1ih0q2-00046H-Hx; Mon, 16 Dec 2019 19:35:46 -0500
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id E9F04AE80027;
 Mon, 16 Dec 2019 19:34:06 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [PULL SUBSYSTEM qemu-pseries] pseries: Update SLOF firmware image
Date: Tue, 17 Dec 2019 11:35:12 +1100
Message-Id: <20191217003512.19627-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 107.174.27.60
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

The following changes since commit 5084c8b76365f4570520e2cb549089ad523dc953:

  ppc/pnv: Drop PnvChipClass::type (2019-12-17 10:59:11 +1100)

are available in the Git repository at:

  git@github.com:aik/qemu.git tags/qemu-slof-20191217

for you to fetch changes up to 37d7f4242316380fb58566f6b667ac7ddbbc22dd:

  pseries: Update SLOF firmware image (2019-12-17 11:32:10 +1100)

----------------------------------------------------------------
Alexey Kardashevskiy (1):
      pseries: Update SLOF firmware image

 pc-bios/README   |   2 +-
 pc-bios/slof.bin | Bin 931040 -> 931032 bytes
 roms/SLOF        |   2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)


*** Note: this is not for master, this is for pseries

