Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E35AD417661
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 15:58:54 +0200 (CEST)
Received: from localhost ([::1]:56510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTlj3-0005gr-VM
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 09:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTlgs-0002wk-2X
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 09:56:38 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:45201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mTlgq-00057U-3L
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 09:56:37 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MfqGN-1n4j8L1eX3-00gHvy; Fri, 24
 Sep 2021 15:56:32 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] Linux user for 6.2 patches
Date: Fri, 24 Sep 2021 15:56:24 +0200
Message-Id: <20210924135631.2067582-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sLKkNurzutzBf1xEd6jcK2yjFCKqAOfSKRiswjzL87M3bsiGXwE
 8dZYC7I9hk9AwFDdG6OH5a3olzSPhAOP7JebARPLDNRU9a0iWrafDxH18krimkXE+sMIRiU
 uYjgmQovwjT+urrJsODVj3zEUEmh6t9QTc2N0khnY1k8ZNV2qJn18O3jbcdu3v3/vfPSxBd
 dY4pV0VErxnTS+I0uZCbQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dDQgRxfoK0E=:R+NuGmuClERLAWY8fsKbzY
 HnqFpLyJU+qw3ulWB/LrQjNFkt5gyDboYbcehwZB3DQfc9V524Q98yTjKpe9jwFR8EBnIMZcw
 afegpZHkKmsH7apUIGoztGzJaUps81RY3A818WSthvkus5EYWVqeGVDChL4XnQ5KWs2eNDQA+
 EOOxSRuuog/oo+Xcd0hRz94Gwt7Ku7LzE7YxiJt653YXe2scFsQEuxL3hTkNnmTI+SHaZpjfS
 ZHs5alWjNXbmYQ08ZsX3KsxtXaPfNTlWtkdxKmbdHMiINoyvU8RVusnyFyYRGTUtg2P9pSCVZ
 t+P433fUOPS1XyYpgX44+OdiBntYPvq8yySsuKe7ka+hcLhPIZJIita0SAMUhXdvmKcfR79/B
 FV6LgE1Rrm/ivx0qH1zQ/FIsakkV+F4rkXdf7UUcZkp+9dP0gh9rtmXVza/ajFcvBNVm+Z8LQ
 yCqBrtBcU+r2Py8VU7evjXXDqV92gYzYEboDNayfL2Ca+kYU3EUG6gGN7JqyZBjsY39bCmoq7
 +iU/zJ9kQ+r99sQQdzdGeAzSY87/cL5dKxy+kCzJ+UG6uGtwrLZwhvsxxhs+5uJWDR6lvPMaE
 thrFLqS/u6t3RvkhI+ctFTWrs8LF1XCt69bwCi2IX7KFKLvzbE1r3MBfIKFFsrGKfpkPVjtIt
 x2sDtn6l0rx0gwLUvRFFfKgcHRoban0XusiuDqTs1gQ2hkhi+UCD7GUVxsO3S9DsPVFOp9kCG
 lsmCJxNLj/GcMw3Ix6LWZ9CabQqMt2H0bWJqXw==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 2c3e83f92d93fbab071b8a96b8ab769b01902475=
:=0D
=0D
  Merge remote-tracking branch 'remotes/alistair23/tags/pull-riscv-to-apply=
-20210921' into staging (2021-09-21 10:57:48 -0700)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/linux-user-for-6.2-pull-request=0D
=0D
for you to fetch changes up to fce9608d02b665fdc3ab7b23f1a911ba6c66775b:=0D
=0D
  linux-user/aarch64: Use force_sig_fault() (2021-09-23 14:43:58 +0200)=0D
=0D
----------------------------------------------------------------=0D
Pull request linux-user 20210924=0D
=0D
Clean up siginfo_t handling for arm, aarch64=0D
=0D
----------------------------------------------------------------=0D
=0D
Peter Maydell (7):=0D
  linux-user/aarch64: Set siginfo_t addr field for SIGTRAP signals=0D
  linux-user/arm: Set siginfo_t addr field for SIGTRAP signals=0D
  linux-user/arm: Use force_sig() to deliver fpa11 emulation SIGFPE=0D
  linux-user: Zero out target_siginfo_t in force_sig()=0D
  linux-user: Provide new force_sig_fault() function=0D
  linux-user/arm: Use force_sig_fault()=0D
  linux-user/aarch64: Use force_sig_fault()=0D
=0D
 linux-user/aarch64/cpu_loop.c | 32 +++++-------------=0D
 linux-user/arm/cpu_loop.c     | 63 +++++++++++------------------------=0D
 linux-user/signal-common.h    |  1 +=0D
 linux-user/signal.c           | 19 ++++++++++-=0D
 4 files changed, 46 insertions(+), 69 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

