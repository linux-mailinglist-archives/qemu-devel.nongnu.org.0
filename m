Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A96DBF1B24
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Nov 2019 17:26:18 +0100 (CET)
Received: from localhost ([::1]:60972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSO8P-0004I8-Mf
	for lists+qemu-devel@lfdr.de; Wed, 06 Nov 2019 11:26:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33765)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iSO6O-0002U7-0p
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 11:24:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iSO6M-0000Az-Px
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 11:24:11 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:38955)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1iSO6M-000092-HJ
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 11:24:10 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MlfL0-1i1GTi1g02-00imA7; Wed, 06 Nov 2019 17:24:08 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL v3 0/3] Trivial branch patches
Date: Wed,  6 Nov 2019 17:24:03 +0100
Message-Id: <20191106162406.27030-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:nn7iGZcVWaznC0z5/IRk7AkwzAmSrs+dW1z0vRugzsVA39EklR1
 FWwIzYZaOz1RPsT9yG0Ivt6gHGoHuYG3huGzSOsfViGJOOFq6h2nq8iv2rNX6aZ7fgCNbCb
 OEZRm9Hlb5EuECDCXAGNWtGIj7CNVhqC7pR9Hb05I/Cmq+7qmmQDtGPyNWaAa42oiUJlBQl
 6gKSO8ShsS2HTgbKg/0eQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:c6vaZTse9Z8=:78xjFxQteOJ2FgrM/qitpr
 Hvgu/yqajvEGSY6w8txWNcXcd+K6sfI/CnVadU2etba/Q9hZLOpGF8ISZH3LDjR4xKokGuBdc
 oVyCwPjRk+wx3CyYpOucbAGTbVpyKzChWXF2NQX8JszwNos94EYsedqCzLSMYJzOvTC/BTcOd
 qSNwP/6FyHR5tvGE/1hXC0GNaSIqYhZUiBTfeDBC9dP0oD5R82IFMvVxeR2TxABSLEhdZ3y+C
 PrzpQ1X1OMyXQpuJ+Rv7elGUkB3Nn4564k5/AVj4469e7x5V0GFI9r6pkq571zoB1rSGbitkK
 AeOEpGTudVBCkNTj/D/nBYZAtq4V+G7knn38Ch3mmsuO7f998GWCboXX1qyrtnWMeTm5iEIlz
 WXL3m5kLEBH2A96BVjbd8zZ4LWeuhtDFj3hLNDbpVRLYTOomFKBqwg09NgrfM7U420PIl0hnk
 H2PtwBVEvWMFFEtyQmPBEw2MviQrPO4tHTqRzkVXQ4ZayQQCgt16ubSF7JV3Hi/dqHQx6OXDf
 j7rmsJIsyIg+14N5AP/e6WVzXrA4MusfbtF8sinnPekfGZPtZXqx11NImfEEeQaWL+MtzBOaA
 Wca4a12+OXft3RnFki8Qx10vu/RGkc7aKBxcNZINdbeL2hAbK1h5Fb2Yd3UQYwAf8W9xJzNu4
 BLLKX/cGMrraO++RDbNi9R9/KLGS49oMaKU3Fat5PVjbZvRDkYF0T7Dh0LQJYACfdKh6Han0Z
 tXIpeCtlxYGyxgvRhwvu5wJERrBJRSwULpLlhSSDqgmPsVt/H2rIR2X/QHTkKq4HtJHwXNMYj
 UhcCMGi5eSXtpiEwIaS2jUupTd3rebYN2O61dfnQwBDOTH0p5Kfbp3u+FOvGAXpUSpjx+2o3O
 IS7/PPiUNBFsLVnFThx8fXAs2qQNpp/MikQ30qdg8=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.133
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 36609b4fa36f0ac934874371874416f7533a5408:

  Merge remote-tracking branch 'remotes/palmer/tags/palmer-for-master-4.2-sf1' into staging (2019-11-02 17:59:03 +0000)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-branch-pull-request

for you to fetch changes up to df59feb197cda31a8b807c13bf509259db9e018f:

  global: Squash 'the the' (2019-11-06 17:19:40 +0100)

----------------------------------------------------------------
Trivial fixes (20191105-v3)

v3: remove disas/libvixl/vixl/invalset.h changes
v2: remove patch from Greg that has lines with more than 80 columns

----------------------------------------------------------------

Dr. David Alan Gilbert (1):
  global: Squash 'the the'

Philippe Mathieu-Daudé (2):
  hw/misc/grlib_ahb_apb_pnp: Avoid crash when writing to PnP registers
  hw/misc/grlib_ahb_apb_pnp: Fix 8-bit accesses

 docs/interop/pr-helper.rst          |  2 +-
 docs/specs/ppc-spapr-hotplug.txt    |  2 +-
 docs/specs/ppc-xive.rst             |  2 +-
 docs/specs/tpm.txt                  |  2 +-
 hw/misc/grlib_ahb_apb_pnp.c         | 12 ++++++++++++
 include/hw/xen/interface/io/blkif.h |  2 +-
 scripts/dump-guest-memory.py        |  2 +-
 7 files changed, 18 insertions(+), 6 deletions(-)

-- 
2.21.0


