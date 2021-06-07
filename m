Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABD139E6F0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 20:59:47 +0200 (CEST)
Received: from localhost ([::1]:40678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqKTS-0006EG-Hi
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 14:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lqKRO-0003YJ-UV; Mon, 07 Jun 2021 14:57:38 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:55709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lqKRN-0005jw-4V; Mon, 07 Jun 2021 14:57:38 -0400
Received: from quad ([82.142.12.38]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MGiAs-1lcZ4A3ddy-00Dryg; Mon, 07
 Jun 2021 20:57:33 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 00/11] Trivial branch for 6.1 patches
Date: Mon,  7 Jun 2021 20:57:19 +0200
Message-Id: <20210607185730.346641-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GJDk0G9hDzlDbH1JPXXvT35MI3SU6/0JEuoYCdzmNLkrUXGtZNZ
 XbWTea/1rIuHMc0Ik6MhZ4FsOVlIZ5boxNr+MsoRGxQ10QfVfQcSI57rxO1Y5dfIdsjVffg
 hd27e0jsRE8PZlrn3i7kL7RMM38pzwNHfCwn0k3mbcJJMQC3ZZDoEywZs4BeMoav33fx4i8
 KJku7PSoxmxQFzZCvgn/A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:r3aqaF0sgwc=:VIABW/TFUJ2BSjBuxgvLr9
 DcqgiECS8Hi+AkZDehSnuWOrBhjflekE3NaN75No0/QP9UcFqX3g3MCWBF8VBsn9hQ9oqygmC
 1fugOMpqoXmkSHK45phyJmffp9Z9vfcnfIGN+RFjCTahxC3MTfBxmHYMR7XtXt5rRS+LOE5NF
 3Q/5RskwK9U2L7AzHgLK/ZjG/e5NuqCWUG658U+Q2K68B+/mMckahYnN84L/lXGGCiWR4PCXy
 0bmDaXcWEH0lpWPytTzGT01tW+bibpR8uId6dhA2QPyPHzYzoyfZYvv13TU6eTnBl0LDxSJ62
 psQt7tS8wf6cBFmyx/+GvsXViLgSPiu+Bp+esFS27K6dwU4WV5/QMKpWCTrbpkWbpN9TZ0Ox4
 wx2IpaTU6ptqn+nvtBOSwB7E36okl9ALl1gCeL7O6if9sui7n43zzKogIZ/oYIQH7mbTiehLQ
 /NM8jwiy6AcJ5uJNyG0yt72K82W0sIr782qaCGddDTcsb3xKw12YbT2Ccj74vFRUemQg/Pym3
 YX4qy19DU+yU4i2TjyWsFg=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 6f398e533f5e259b4f937f4aa9de970f7201d166=
:=0D
=0D
  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210604' =
into staging (2021-06-05 11:25:52 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/trivial-branch-for-6.1-pull-request=
=0D
=0D
for you to fetch changes up to df77d45a51412ca84abd7f1490b48c1bccf07057:=0D
=0D
  vhost-vdpa: Remove redundant declaration of address_space_memory (2021-06=
-05 21:33:46 +0200)=0D
=0D
----------------------------------------------------------------=0D
Trivial branch pull request 20210607=0D
=0D
----------------------------------------------------------------=0D
=0D
Dmitry Voronetskiy (1):=0D
  i386/kvm: The value passed to strerror should be positive=0D
=0D
John Snow (1):=0D
  docs: fix broken reference=0D
=0D
Pavel Dovgalyuk (1):=0D
  target/nios2: fix page-fit instruction count=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  target/riscv: Do not include 'pmp.h' in user emulation=0D
  misc: Correct relative include path=0D
  linux-user/syscall: Constify bitmask_transtbl fcntl/mmap flags_tlb[]=0D
  target/hppa: Remove unused 'memory.h' header=0D
  target/mips: Fix 'Uncoditional' typo=0D
  scripts/oss-fuzz: Fix typo in documentation=0D
=0D
Thomas Huth (1):=0D
  hw/display/macfb: Classify the "nubus-macfb" as display device=0D
=0D
Xie Yongji (1):=0D
  vhost-vdpa: Remove redundant declaration of address_space_memory=0D
=0D
 hw/display/macfb.c                             |  1 +=0D
 hw/gpio/aspeed_gpio.c                          |  2 +-=0D
 hw/i386/acpi-common.h                          |  6 +++---=0D
 hw/i386/kvm/apic.c                             |  2 +-=0D
 hw/i386/kvm/clock.c                            |  4 ++--=0D
 hw/i386/kvm/i8254.c                            | 10 +++++-----=0D
 hw/i386/kvm/i8259.c                            |  4 ++--=0D
 hw/i386/kvm/ioapic.c                           |  4 ++--=0D
 hw/intc/ppc-uic.c                              |  2 +-=0D
 hw/virtio/vhost-vdpa.c                         |  1 +=0D
 include/exec/memory.h                          |  2 +-=0D
 include/hw/virtio/vhost-vdpa.h                 |  1 -=0D
 include/monitor/monitor.h                      |  2 +-=0D
 linux-user/syscall.c                           |  4 ++--=0D
 scripts/oss-fuzz/reorder_fuzzer_qtest_trace.py |  2 +-=0D
 target/hppa/cpu.h                              |  1 -=0D
 target/mips/tcg/translate.c                    |  6 +++---=0D
 target/nios2/translate.c                       |  2 +-=0D
 target/riscv/cpu.h                             |  2 ++=0D
 19 files changed, 30 insertions(+), 28 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

