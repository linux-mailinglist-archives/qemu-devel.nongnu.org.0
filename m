Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4883E4384B5
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 20:34:49 +0200 (CEST)
Received: from localhost ([::1]:46332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meLqy-00085c-D7
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 14:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1meLnp-0005Cn-6t; Sat, 23 Oct 2021 14:31:33 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:42101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1meLnm-0006VB-2z; Sat, 23 Oct 2021 14:31:32 -0400
Received: from quad ([82.142.24.54]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MLRI3-1mNVjq01DP-00ITIh; Sat, 23
 Oct 2021 20:31:25 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 00/11] Trivial branch for 6.2 patches
Date: Sat, 23 Oct 2021 20:31:12 +0200
Message-Id: <20211023183123.813116-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:y3WQcbTvm3v86VWDWzPerYzFJS6NCRrTCQa7A5Srprz5+k/Q6W9
 P3SSkrlpCFdvBO5jksxzB/XBb/+2WpvmdxqIOncyzcz0docwMpBqj34QNhM4G/dNiQxtp8i
 0QHJuzeUuqVlfUONeQp1872Ls9c1YpW3y6D5we9aStcVSW4F5h+z2Mvz7yPodA4rYcOlTk8
 A5kGhgdM1nakbkab7OrjA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4WWFyjQuWbI=:nCqKa3FRoVCT3dOFp5DAvf
 fCUrNTNd1iV3JTz9uvklmQLykaI5guthjc29GpMZMjWY3ZZlVy6swFix0u0638ZFJ1hjVfo3t
 6RgIosYK59dm5csjQFIzMvSGeRIkr8DyzeDmlwA5XQ5ZhcFpvcf1n0zX6qWKwDntStz4hhgTi
 Qb7Xi4xwB02We1YljSBrjQEqxBPUPeW5z8EPQO0NxrbHkb1VEpX9tFiROWiP7GCyT0doqreL3
 ceEiqgsPUOdBZjgLNRoLSxKA8wXTlArMSd5U8etBLQ3LaZC0L84fHhFMjYCh+0EWFiVLDsynH
 WTBfPME/Cq0m7OOuYpRAACZ6dMDPTy6FfKIb7fhFPuootzLf/7Y1sXv4zyV79aEE06LUFxhTl
 NxCRvWuNiI5i6cJ8lRHthLuTtNOnEWakLEFX2451r+9Tew07PJOjPKxO3dv0CTM+1iduCmBTx
 AzYfIeobDXJ/DEX76Dbauk6KBWFYENg4MoNreUvRBtjEZxqLQVTmGDkXhFzv3m5tLHyCf5BCj
 D0e8h50Ml4nIsI7wlXedCzbxhUnH7F0warzhPc/xXaCmijlkdZDfly6Pp1whhqMAWJydaXbxz
 5qlcy8l6Aob5xzC9idb5PpQpN7WMa8UF4GERVZsjPcFTKK77uCdCx/35sHeUdqh+N6i6hn02m
 C6/J9Ult9Isg5owTzrGJiCdTiuKHGYAiXMJH0MjMAPnYN9mh98LqC9QEB5DsBZkhWH0M=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 1dafe7656a9c2770065e91208edd4c073f5f98a9=
:=0D
=0D
  Merge remote-tracking branch 'remotes/vivier-m68k/tags/q800-pull-request'=
 into staging (2021-10-22 07:47:13 -0700)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/trivial-branch-for-6.2-pull-request=
=0D
=0D
for you to fetch changes up to 2c92be50bcfa8b7529a39fc99078ef14dcfc71aa:=0D
=0D
  analyze-migration.py: fix extract contents ('-x') errors (2021-10-23 20:2=
8:56 +0200)=0D
=0D
----------------------------------------------------------------=0D
Trivial patches pull request 20211023=0D
=0D
----------------------------------------------------------------=0D
=0D
Greg Kurz (2):=0D
  softmmu/physmem.c: Fix typo in comment=0D
  README: Fix some documentation URLs=0D
=0D
Laurent Vivier (2):=0D
  analyze-migration.py: fix a long standing typo=0D
  analyze-migration.py: fix extract contents ('-x') errors=0D
=0D
O=C4=9Fuz Ersen (1):=0D
  po: update turkish translation=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  disas/nios2: Fix style in print_insn_nios2()=0D
  disas/nios2: Simplify endianess conversion=0D
  MAINTAINERS: Add myself as reviewer of 'Machine core' API=0D
=0D
Tong Ho (3):=0D
  hw/nvram: Fix Memory Leak in Xilinx eFuse QOM=0D
  hw/nvram: Fix Memory Leak in Xilinx Versal eFuse device=0D
  hw/nvram: Fix Memory Leak in Xilinx ZynqMP eFuse device=0D
=0D
 MAINTAINERS                       |  1 +=0D
 README.rst                        | 14 +++---=0D
 disas/nios2.c                     | 73 ++++++++++++-------------------=0D
 hw/nvram/xlnx-efuse.c             |  9 ++--=0D
 hw/nvram/xlnx-versal-efuse-ctrl.c | 20 ++++++---=0D
 hw/nvram/xlnx-zynqmp-efuse.c      | 18 +++++---=0D
 include/disas/dis-asm.h           |  3 +-=0D
 po/tr.po                          | 25 +++++------=0D
 scripts/analyze-migration.py      |  6 +--=0D
 softmmu/physmem.c                 |  2 +-=0D
 target/nios2/cpu.c                |  6 +--=0D
 11 files changed, 87 insertions(+), 90 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

