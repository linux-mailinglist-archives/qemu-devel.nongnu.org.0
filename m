Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C08884AB733
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:08:57 +0100 (CET)
Received: from localhost ([::1]:57188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH012-00065O-SQ
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:08:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nGzNY-00064E-Lu
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:08 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:50843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nGzNV-000796-4B
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:08 -0500
Received: from quad ([82.142.19.58]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MXY2T-1nprLj37AF-00YvJe; Mon, 07
 Feb 2022 09:28:00 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/8] Linux user for 7.0 patches
Date: Mon,  7 Feb 2022 09:27:51 +0100
Message-Id: <20220207082759.180431-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2OPkme1twV69r54UwEWKIPJPgwtAmWXIsPpyrRzkzU9Z0u6JCGl
 YymOzQvhg28NExpGs6leBaueZGizF7mfKylZ8QdMSRqWIVhyi4csUdJCktSfxUyxl6oxSOt
 kNUonyHDlGu80jgVuZznIgmAlux+i1LgNf5l/8483CgjMCTi96vbzi6i2jhxdBGKsFAqjiq
 Cgex0MtCmtUbmWT3fB6qQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9+rPeg/q/kc=:1PL3cgRva0rJmkwfBZlZ4D
 hoa6hJLn3wqj8Ufpm8xt57G3FFFxsWeh2nUH21NzCElHzc7008N80YYXrk8bWK1GSX2s/gHhP
 oE5xoc7xf6I++/cVn3+nhtdWhGAMM5qQ3qHMrgOG2LiSt5F0wy4wpwz21pvu6ReVIDDdiNwBx
 eUWF8rg3yZXhRGsptFZyP49yJW9VDK/giolgCWlWZwBAN18MlBbczXvxTtQkHTd15hfZsxfjQ
 +uC9riBCTqzMf3358TBlW9XRLJ/ps9NDZXzfwFBgQEjCOGb7FL4bC0PY06u1XY3TjdJ67mTbX
 DHowe/Y8mD33tSMrlFvAspfv1MLG+0gF0tgSk+4XHe+HIsakuH6N/kk4mY2jzyIB3tOBGI1Gn
 iikTl9rXCDKW8Fddlxng/Dw51HMiNhtnnbBjM+esJdj9/Iq+OhkfNm/IDVZD+Tr8+7uZiBxPi
 I5nougAm96k6iqfJWCwnLxQG4IZqlh4Bi9KXo04jX8Zth8U17WQZii2PPoumQy4JarAuoJin6
 7jyFgtqHiVZ+5HHxPWGVNvj1q5a7QnaV6Dzn4NgvOfLT2qwjD2tkm8U9loOLrrLVR3mUJbBEC
 Flkq+qNXm7Aj8Eo66DLVaiwpwV9nSbbiCw/0b9TLLIryPPGjt85JFCiOjXFW9AmK+ZzaoZCea
 zK+N8/ZSMBSQAoZ1P3Ki+uyqVj2e+jfb/ScWiBpW1/6pjoZ28vxmoaBZHYt52vPYcJdU=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 48302d4eb628ff0bea4d7e92cbf6b726410eb4c3=
:=0D
=0D
  Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-=
20220126' into staging (2022-01-26 10:59:50 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/laurent_vivier/qemu.git tags/linux-user-for-7.0-pull-r=
equest=0D
=0D
for you to fetch changes up to 244fd08323088db73590ff2317dfe86f810b51d7:=0D
=0D
  linux-user/syscall: Translate TARGET_RLIMIT_RTTIME (2022-02-01 08:01:44 +=
0100)=0D
=0D
----------------------------------------------------------------=0D
Linux-user pull request 20220207=0D
=0D
Fix target rlimits for alpha=0D
Add startime in /proc/self/stat=0D
=0D
----------------------------------------------------------------=0D
=0D
Cameron Esfahani (1):=0D
  linux-user: Implement starttime field in self stat emulation=0D
=0D
Patrick Venture (1):=0D
  linux-user: sigprocmask check read perms first=0D
=0D
Paul Brook (1):=0D
  linux-user: Fix inotify on aarch64=0D
=0D
Peter Maydell (1):=0D
  linux-user: Remove unnecessary 'aligned' attribute from TaskState=0D
=0D
Serge Belyshev (3):=0D
  linux-user/alpha: Fix target rlimits for alpha and rearrange for=0D
    clarity=0D
  linux-user: Move generic TARGET_RLIMIT* definitions to=0D
    generic/target_resource.h=0D
  linux-user/syscall: Translate TARGET_RLIMIT_RTTIME=0D
=0D
Shu-Chun Weng (1):=0D
  linux-user: rt_sigprocmask, check read perms first=0D
=0D
 linux-user/aarch64/target_resource.h    |  1 +=0D
 linux-user/alpha/target_resource.h      | 21 +++++++=0D
 linux-user/arm/target_resource.h        |  1 +=0D
 linux-user/cris/target_resource.h       |  1 +=0D
 linux-user/fd-trans.c                   |  5 +-=0D
 linux-user/generic/target_resource.h    | 38 ++++++++++++=0D
 linux-user/hexagon/target_resource.h    |  1 +=0D
 linux-user/hppa/target_resource.h       |  1 +=0D
 linux-user/i386/target_resource.h       |  1 +=0D
 linux-user/m68k/target_resource.h       |  1 +=0D
 linux-user/main.c                       | 14 +++++=0D
 linux-user/microblaze/target_resource.h |  1 +=0D
 linux-user/mips/target_resource.h       | 24 ++++++++=0D
 linux-user/mips64/target_resource.h     |  1 +=0D
 linux-user/nios2/target_resource.h      |  1 +=0D
 linux-user/openrisc/target_resource.h   |  1 +=0D
 linux-user/ppc/target_resource.h        |  1 +=0D
 linux-user/qemu.h                       |  9 ++-=0D
 linux-user/riscv/target_resource.h      |  1 +=0D
 linux-user/s390x/target_resource.h      |  1 +=0D
 linux-user/sh4/target_resource.h        |  1 +=0D
 linux-user/sparc/target_resource.h      | 17 ++++++=0D
 linux-user/syscall.c                    | 79 +++++++++----------------=0D
 linux-user/syscall_defs.h               | 56 +-----------------=0D
 linux-user/x86_64/target_resource.h     |  1 +=0D
 linux-user/xtensa/target_resource.h     |  1 +=0D
 26 files changed, 167 insertions(+), 113 deletions(-)=0D
 create mode 100644 linux-user/aarch64/target_resource.h=0D
 create mode 100644 linux-user/alpha/target_resource.h=0D
 create mode 100644 linux-user/arm/target_resource.h=0D
 create mode 100644 linux-user/cris/target_resource.h=0D
 create mode 100644 linux-user/generic/target_resource.h=0D
 create mode 100644 linux-user/hexagon/target_resource.h=0D
 create mode 100644 linux-user/hppa/target_resource.h=0D
 create mode 100644 linux-user/i386/target_resource.h=0D
 create mode 100644 linux-user/m68k/target_resource.h=0D
 create mode 100644 linux-user/microblaze/target_resource.h=0D
 create mode 100644 linux-user/mips/target_resource.h=0D
 create mode 100644 linux-user/mips64/target_resource.h=0D
 create mode 100644 linux-user/nios2/target_resource.h=0D
 create mode 100644 linux-user/openrisc/target_resource.h=0D
 create mode 100644 linux-user/ppc/target_resource.h=0D
 create mode 100644 linux-user/riscv/target_resource.h=0D
 create mode 100644 linux-user/s390x/target_resource.h=0D
 create mode 100644 linux-user/sh4/target_resource.h=0D
 create mode 100644 linux-user/sparc/target_resource.h=0D
 create mode 100644 linux-user/x86_64/target_resource.h=0D
 create mode 100644 linux-user/xtensa/target_resource.h=0D
=0D
-- =0D
2.34.1=0D
=0D

