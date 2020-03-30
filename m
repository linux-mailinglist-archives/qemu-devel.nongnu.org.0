Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A98AF19794D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 12:31:21 +0200 (CEST)
Received: from localhost ([::1]:47740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIrhQ-0008S5-2B
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 06:31:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48754)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1jIrg6-0007XJ-A8
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 06:30:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1jIrg5-0001ze-C3
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 06:29:58 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:58403)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1jIrg5-0001xJ-3N
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 06:29:57 -0400
Received: from localhost.localdomain ([82.252.135.106]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MGiF0-1jWfBh2DGk-00DlWB; Mon, 30 Mar 2020 12:29:47 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] Linux user for 5.0 patches
Date: Mon, 30 Mar 2020 12:29:44 +0200
Message-Id: <20200330102945.2388294-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ahtexixo+PlYY4hqo8NVMrRnH/AA1WDKt26IYmPitB6gI0uLZ4O
 fzuy9IW1iwRoOXxPPVkYhjhkxLiDd9PrayqF+wMZaxalhjhRwxq3NI0tONL+TQ47fFZPL+l
 okR/Pcc/CT7kANdI80mClADqhMfK8EfSCek9lhpnb1yNZyevO34ZZBVOxVEcNpYocbX8Wnq
 LqwkRrE6iB7D0RBzgCd+w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Kye3Q9BtiBM=:V9jW7Q0mLXSxSn/siXrq6J
 ISrtFhMi4vxPmqsETA2EQEenBrctY1RkKc/QkiA8a751PwFB+AluR1QrTDtRSG88DBJPRLZZO
 EZRY40xGR8gxGfTBjtMhX13OvDcCiJVLdwBPOLMv0O7gaqn0T904yE5WfP1eeFt6iJMkRlkZp
 rYJxR5l/Y2hC1Jx0k/2iUN7ZfxuZR4q2V7dtXyGS2f2ONbO8/nFOfLuLY22pBBO/ZpivtWc/l
 ymlZl6Y+HRRm0GGJiOTm2z2O6PG7ynTJshT6AkM2Gz6vIAiBRG3pEUHrFd1tPt+OPvuIlLXGG
 7XTp33cRJSPTPdF/2TFSeN0xD7XRjTUQDNFXJaq7gWQE6RyV3dDpxdhqXNh71I+Ig0+IeJ72l
 6Ii97cAVieFnSGR1oJoMMbbrMU8CSfOHUVmzmfXSC8/GzJzetA+4LDfJ+mi1oSHevtAqkGb8s
 60SO8qlkt77860TwPhv+kRjD10qmIjAOYARz+H45tb21JAh6/doGD1Pqu+8a0yBTgIQ6CGD+T
 j0+PpQyrnLa45QXKntQVGfzn1vdDTveVwAhjo/Ni5lrkmbDWkYf+xbacppuWAdVNao+7C4Kab
 IT9l5n5PBSxzteY1DBUPxH1vgWtXHKjtYFAvb6t/H7p3EOwNHLujjzpXOVsSNgBM9I89XgGVc
 m7t9jBAdjWd5/3oqIAnP1LmQ6yjfKgkcgO+HugJNYu47Rifg7E+7J+cxCy6JG4yA85rNEhGJ2
 7d2Z6DiMj6DWOpCRRyhDG5F2DbI1vL0oTdLwdIkaylrX+JYNN1/F4ieE91s1FnV/L28HAkJ0m
 1WoldaEaLZg2Yf/R7wJQ2oWw3R1PyZBKvUvZuVFMRl9aX70WxzAwy8BDwCjbUD5GdB/oso1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit cfe68ae025f704f336d7dd3d1903ce37b445831d:

  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-5.0-pull-request' into staging (2020-03-26 20:55:54 +0000)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/linux-user-for-5.0-pull-request

for you to fetch changes up to 146902964d66881da797e45a5950732e38532e3e:

  linux-user: Support futex_time64 (2020-03-30 12:28:30 +0200)

----------------------------------------------------------------
Add support for futex_time64

----------------------------------------------------------------

Alistair Francis (1):
  linux-user: Support futex_time64

 linux-user/syscall.c | 140 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 126 insertions(+), 14 deletions(-)

-- 
2.25.1


