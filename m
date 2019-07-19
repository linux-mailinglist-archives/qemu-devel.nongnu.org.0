Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9D06D89D
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 03:54:14 +0200 (CEST)
Received: from localhost ([::1]:41900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoI69-0003Rx-Dg
	for lists+qemu-devel@lfdr.de; Thu, 18 Jul 2019 21:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59414)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aik@ozlabs.ru>) id 1hoI5s-0002ql-Qo
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 21:53:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>) id 1hoI5r-0001ms-Tp
 for qemu-devel@nongnu.org; Thu, 18 Jul 2019 21:53:56 -0400
Received: from ozlabs.ru ([107.173.13.209]:39626)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>)
 id 1hoI5r-0001mT-Ok; Thu, 18 Jul 2019 21:53:55 -0400
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id ACF15AE807E3;
 Thu, 18 Jul 2019 21:53:48 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: David Gibson <david@gibson.dropbear.id.au>
Date: Fri, 19 Jul 2019 11:53:51 +1000
Message-Id: <20190719015351.8485-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 107.173.13.209
Subject: [Qemu-devel] [GIT PULL for qemu-pseries] pseries: Update SLOF
 firmware image
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

The following changes since commit 5a30afd844be309a820658d956720356ec1d9769:

  ppc/pnv: update skiboot to v6.4 (2019-07-19 11:46:31 +1000)

are available in the Git repository at:

  git@github.com:aik/qemu.git tags/qemu-slof-20190719

for you to fetch changes up to 2ef7bff0a1aa90bb449c2edac553fe9e61a24461:

  pseries: Update SLOF firmware image (2019-07-19 11:50:47 +1000)

----------------------------------------------------------------
Alexey Kardashevskiy (1):
      pseries: Update SLOF firmware image

 pc-bios/README   |   2 +-
 pc-bios/slof.bin | Bin 926432 -> 926784 bytes
 roms/SLOF        |   2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)


*** Note: this is not for master, this is for pseries

