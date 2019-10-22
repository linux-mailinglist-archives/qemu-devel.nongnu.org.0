Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F56EDFC77
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 06:11:16 +0200 (CEST)
Received: from localhost ([::1]:49844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMlVr-0006CP-F1
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 00:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50283)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>) id 1iMlV2-0005Pp-6P
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 00:10:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>) id 1iMlV0-0003zI-8L
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 00:10:23 -0400
Received: from ozlabs.ru ([107.173.13.209]:60794)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>)
 id 1iMlV0-0003yf-3C; Tue, 22 Oct 2019 00:10:22 -0400
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 4C436AE80013;
 Tue, 22 Oct 2019 00:09:03 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: [GIT PULL for qemu-pseries] pseries: Update SLOF firmware image
Date: Tue, 22 Oct 2019 15:09:45 +1100
Message-Id: <20191022040945.35730-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 107.173.13.209
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

The following changes since commit 7cff77c24d8f5e558cef3538a44044d66aa225a5:

  spapr: Move SpaprIrq::nr_xirqs to SpaprMachineClass (2019-10-16 12:01:41 +1100)

are available in the Git repository at:

  git@github.com:aik/qemu.git tags/qemu-slof-20191022

for you to fetch changes up to 8e59d05f71ae783e12a8eb7eb582e0a86ba3d6dc:

  pseries: Update SLOF firmware image (2019-10-22 15:05:36 +1100)

----------------------------------------------------------------
Alexey Kardashevskiy (1):
      pseries: Update SLOF firmware image

 pc-bios/README   |   2 +-
 pc-bios/slof.bin | Bin 930640 -> 928552 bytes
 roms/SLOF        |   2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)


*** Note: this is not for master, this is for pseries

