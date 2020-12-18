Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F64C2DE0F0
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 11:26:02 +0100 (CET)
Received: from localhost ([::1]:46526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqCxV-0004Ll-F9
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 05:26:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvn-0002qI-SL
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:15 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:34835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqCvm-00071Q-2l
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:24:15 -0500
Received: from localhost.localdomain ([82.252.144.198]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MStKq-1kelvQ1Bx0-00UJqs; Fri, 18 Dec 2020 11:24:10 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 00/14] Linux user for 6.0 patches
Date: Fri, 18 Dec 2020 11:23:53 +0100
Message-Id: <20201218102407.597566-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Hvokw5DUedM346Eu1YJhl+5CSM1EaIoDsFcE3VZ0n59lkM4suLE
 abbAel9qPpGr6vmCWYINBJAlPpdo1rauvrrEdZbvHwWJmqXwccmHFKJvRf3RrMM0b4LSnK9
 dmlRauFnS8wEBWapIdHMJPDtdQ+7wFRyLjtA4yTLcgkpD20XDA5HKb/xX0soZSzvgjjNn4V
 3KYSo/HibM35z9U9qnwEA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dvUADuuuyTY=:9BEvTpquSBUBsg+Xjdz12n
 vJ60S7AJ6j3y5bZO6QuMkzMaWTSaUhFYfnng6XYOtp6c7BvgWXsLXJSkvOv5FU6JtIMUwf5z6
 fnKA7c4okh87Ra+H+7mNcpAnDh6Fk0SCIrOs3VMzw7iS6s6sOCgt6ZiIQvIx1/gm7RJ0HKBrD
 27W7O3BNZ5+VAIDvTenu7tHG7n76LZCETFVFISqDdbNQFpnW0UlwIEt2qc8LP47gmUGpEQNUI
 3Yiv/vkaKebUUn//bozOgjvU8sCW8c8KvmC3BIg9jpWRVFFbMFsiFNn88r9qikjrthV6LqFeC
 0tcnYKWm27I+0074uOjokHSGYuI6j22zduY1ziAriq3n2wfGGvwolHcCQsModlniHUlR48Lex
 RP8Iyh+BZEN3JgZlVs7D00/sr3x2XkFZnmCkY+AZiMgmusgILQFcX4ppiEa3+3stLjxOyEyQp
 Kkwvg57CSQ==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit af3f37319cb1e1ca0c42842ecdbd1bcfc64a4b6f=
:=0D
=0D
  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' i=
nt=3D=0D
o staging (2020-12-15 21:24:31 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/linux-user-for-6.0-pull-request=0D
=0D
for you to fetch changes up to 7a5805a08f942325b373643099f784cdac65c9ea:=0D
=0D
  linux-user/sparc: Handle tstate in sparc64_get/set_context() (2020-12-18 =
11=3D=0D
:23:29 +0100)=0D
=0D
----------------------------------------------------------------=0D
Add MIPS Loongson 2F/3A=0D
sparc64 bug fix=0D
Implement copy_file_range=0D
Add most IFTUN ioctls=0D
Fix mremap=0D
=0D
----------------------------------------------------------------=0D
=0D
Andreas Schwab (1):=0D
  linux-user: Implement copy_file_range=0D
=0D
Peter Maydell (4):=0D
  linux-user/sparc: Correct sparc64_get/set_context() FPU handling=0D
  linux-user/sparc: Remove unneeded checks of 'err' from=0D
    sparc64_get_context()=0D
  linux-user/sparc: Don't restore %g7 in sparc64_set_context()=0D
  linux-user/sparc: Handle tstate in sparc64_get/set_context()=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (7):=0D
  linux-user/elfload: Move GET_FEATURE macro out of get_elf_hwcap() body=0D
  linux-user/elfload: Rename MIPS GET_FEATURE() as GET_FEATURE_INSN()=0D
  linux-user/elfload: Introduce MIPS GET_FEATURE_REG_SET() macro=0D
  linux-user/elfload: Introduce MIPS GET_FEATURE_REG_EQU() macro=0D
  linux-user/elfload: Update HWCAP bits from linux 5.7=0D
  linux-user: Add support for MIPS Loongson 2F/3A=0D
  docs/user: Display linux-user binaries nicely=0D
=0D
Shu-Chun Weng (1):=0D
  linux-user: Add most IFTUN ioctls=0D
=0D
Tobias Koch (1):=0D
  linux-user/mmap.c: check range of mremap result in target address=0D
    space=0D
=0D
 docs/user/main.rst          | 99 +++++++++++++++++++++----------------=0D
 linux-user/elfload.c        | 43 +++++++++++++---=0D
 linux-user/ioctls.h         | 46 +++++++++++++++++=0D
 linux-user/mmap.c           | 21 ++++----=0D
 linux-user/sparc/signal.c   | 87 +++++++++++++++++---------------=0D
 linux-user/syscall.c        | 79 +++++++++++++++++++++++++++++=0D
 linux-user/syscall_defs.h   | 32 ++++++++++++=0D
 target/mips/cpu.h           |  1 +=0D
 target/sparc/cpu.h          | 28 +++++++++--=0D
 target/sparc/int64_helper.c |  5 +-=0D
 10 files changed, 333 insertions(+), 108 deletions(-)=0D
=0D
--=3D20=0D
2.29.2=0D
=0D

