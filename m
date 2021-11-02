Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9900F4439A4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:26:33 +0100 (CET)
Received: from localhost ([::1]:55084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi3Am-0004zr-PT
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mi36k-00064L-Nk; Tue, 02 Nov 2021 19:22:23 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:55627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mi36h-0006LH-S1; Tue, 02 Nov 2021 19:22:22 -0400
Received: from quad ([82.142.14.190]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MmyzH-1mIvkg2NYV-00kB8s; Wed, 03
 Nov 2021 00:22:13 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] Trivial branch for 6.2 patches
Date: Wed,  3 Nov 2021 00:22:08 +0100
Message-Id: <20211102232212.2911638-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rTbczGPGWs1SbRspFrruUwk/v6KniVcaeUSqTzN7rugFQp+qN+8
 Py2vxNADMFZAHjjQUFWOEESyIJbjpN461je32Zz1P9wI8jcV23ObL9r511PPIfNkxCGtXln
 T9hxVVCqCMKOk8GITTm4u3a/jTskJTFsoYijy3LcQx7Fn1Yib1vyW/6hgjEJD5va0Gnh1Mx
 +zrQIGgyGjD9NvxNpDGbQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Rhy23w4mtrQ=:R0g5QWUu6t7yruxM0+uniR
 PeOdAAfcoD25dkK10BcDlxOMdZjeQI3XZECnB/UiNZnCIvLZ1IE6OHq8Nv1mEhlf5Q+dHJ4nI
 LH3ToxyrxFb/uwruD50tx5wcUpB0ShIBp5ViuWgTvThJJJ53D1zPEhg5SoY3SOtvn/pTW7MNm
 3OanQ0ncyWzAKFW4QyxmBuhHjxfiE9rvwJ0rCMivXy9CJllDzq45ZSnGEycMhPqQQh+wHnUue
 ORpl/o5CWXDx89fP5luBUw+Et7QiOsqT9i0/QcoTuBWm82H/Q8IMzoC12qQuV6tBkm9V+Yicx
 ajmf6nBi/xhbedDWdTSbgKkLHbbEv7xBxuFHNXnaN2WsWi/bqGzcA26eS84tYoD0s6QyhN13h
 UDVn+IsdNyUDzNy8aQJHj3eGAfOVPH9Uzpb+FdBEglPHF2xRS1CfzGn5/qk3o8HtdEBCwBDHF
 7Riwf/yYntV5ODSUePl5kBgQiTgy+XFKFDiMNGYjL2Mb465g6NBUtHaCP8peA3+tTD5mMdDVK
 AySjT66QYIBat/AkfdT/sSo1cOdSf982wBwX2yCCAzhMYz3S4IDqNLrc+bKV5Pm8qUln2agZR
 BmLk7iQMPlUYQe78aVM+NcM77HOPcWatUaU3IgQyTr7bpNSpWzTKDgw9OokopUOqqoijTrx4i
 dTs8AnXd3rElLX6BjbdyA8ST5JovMVLSDxEG6APEzaTV7mgGEiTnxNTAuzt6OWV8OHLk=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit af531756d25541a1b3b3d9a14e72e7fedd941a2e=
:=0D
=0D
  Merge remote-tracking branch 'remotes/philmd/tags/renesas-20211030' into =
staging (2021-10-30 11:31:41 -0700)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/trivial-branch-for-6.2-pull-request=
=0D
=0D
for you to fetch changes up to 5d2bd73588d14b5868129ace9c7912a777f06753:=0D
=0D
  hw/input/lasips2: Fix typos in function names (2021-10-31 21:05:40 +0100)=
=0D
=0D
----------------------------------------------------------------=0D
Trivial patches branch pull request 20211101 v2=0D
=0D
----------------------------------------------------------------=0D
=0D
Markus Armbruster (1):=0D
  monitor: Trim some trailing space from human-readable output=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  MAINTAINERS: Split HPPA TCG vs HPPA machines/hardware=0D
  hw/input/lasips2: Fix typos in function names=0D
=0D
Yanan Wang (1):=0D
  hw/core/machine: Add the missing delimiter in cpu_slot_to_string()=0D
=0D
 MAINTAINERS                | 5 ++---=0D
 hw/core/machine.c          | 3 +++=0D
 hw/input/lasips2.c         | 8 ++++----=0D
 monitor/hmp-cmds.c         | 2 +-=0D
 target/i386/cpu-dump.c     | 4 ++--=0D
 target/i386/cpu.c          | 2 +-=0D
 target/ppc/cpu_init.c      | 2 +-=0D
 target/s390x/cpu_models.c  | 4 ++--=0D
 target/xtensa/mmu_helper.c | 2 +-=0D
 9 files changed, 17 insertions(+), 15 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

