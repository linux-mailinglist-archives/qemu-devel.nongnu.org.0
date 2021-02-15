Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D9B31B9BB
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 13:51:26 +0100 (CET)
Received: from localhost ([::1]:58512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBdLa-0000J1-0E
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 07:51:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBdFp-0003xf-Fr
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:45:29 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:53561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lBdFm-0000eP-HJ
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 07:45:29 -0500
Received: from localhost.localdomain ([82.252.134.158]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MN5aF-1lUX9L2Ten-00J3SH; Mon, 15 Feb 2021 13:45:22 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 00/13] Linux user for 6.0 patches
Date: Mon, 15 Feb 2021 13:45:06 +0100
Message-Id: <20210215124519.720265-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+mBsFZENNpKh3zzYGZCvugb2iZgeMS3OdJDzHUSbWSUg7Wsb5VG
 zG04PcYRCPxgt1TNDl12zBZ5pnKtXnDe6Ih6ttNZDoLc+CjFz7MrImmJ2aEhvhxzIwjPBoG
 pLSJj+robzsA9HBhPZ0wbo2cW5oNlkP2v07eZQVIJq9m+DCwnV1Pc/jfyff8uURIAndeRZG
 eXWlgaQ8fy1ZzVSfKE6Qg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5w2cAncyl5Q=:ouAsHxGGA45oi/yLF78QJo
 CM4OnwDKBBR1kemHy8Puvvt1yUmpxFtuFnefnt0y4EAqKVGmfkbrM096K+qICd8sagN9nuB8B
 XescwQOJOJgzSSdtSi9pTnVdv3JjRpyykoPUt+B8bhWMdB7bHMstYzO4qKxKSa1ZS5xOScnwl
 IJXPdvVHVKyN5+H0nyXEPVyzNzf0c7aNsKFG7mtpkeFB95l/dhKHLmwnDFuOAHIG/HbKnE9g5
 094w9YMMwWASk+6Xv513+y5LP5cb95tPbXYFwc48bXL1F/ksEwuSv4+71nVKVgpyWMeX0DFx9
 gZSy5yfYLSfApIFyYtVfAPW5j+mNVwIX4mBGkfmQ9HdKRPT2xMGG7aIyzVjPIs4WYoRg5ZYBx
 TCxYn04Z+8CfHmMZTZaGj3DaUkQtYEjsRsy04SdLagIRWH09PZ/WYh12zc9bS
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
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

The following changes since commit f4ceebdec531243dd72e38f85f085287e6e63258=
:=0D
=0D
  Merge remote-tracking branch 'remotes/vivier/tags/m68k-for-6.0-pull-reque=
st=3D=0D
' into staging (2021-02-13 18:16:43 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/linux-user-for-6.0-pull-request=0D
=0D
for you to fetch changes up to b8f91fd49c5c6993e06f0cd7bf024d176051320e:=0D
=0D
  linux-user/mips: Support the n32 ABI for the R5900 (2021-02-15 12:10:03 +=
01=3D=0D
00)=0D
=0D
----------------------------------------------------------------=0D
Pull request linux-user 20210215=0D
=0D
mips o32 ABI update / R5900 update=0D
Remove outdated info from docs=0D
Add definitions of TARGET_SS_AUTODISARM, TARGET_SO_DOMAIN, TARGET_SO_PROTOC=
OL=0D
Fix ioctl(), waitid(), mremap(), signalfd4(), eventfd2()=0D
Fix O_NONBLOCK (hppa), __O_TMPFILE (hppa/alpha)=0D
=0D
----------------------------------------------------------------=0D
=0D
Alistair Francis (1):=0D
  linux-user/signal: Decode waitid si_code=0D
=0D
Chen Gang (1):=0D
  linux-user: target: signal: Support TARGET_SS_AUTODISARM=0D
=0D
Fredrik Noring (1):=0D
  linux-user/mips: Support the n32 ABI for the R5900=0D
=0D
Giuseppe Musacchio (1):=0D
  linux-user: Fix loading of BSS segments=0D
=0D
Helge Deller (3):=0D
  linux-user: Add missing TARGET___O_TMPFILE for hppa and alpha=0D
  linux-user: fix O_NONBLOCK usage for hppa target=0D
  linux-user: fix O_NONBLOCK in signalfd4() and eventfd2() syscalls=0D
=0D
Jason A. Donenfeld (1):=0D
  linux-user: add TARGET_SO_{DOMAIN,PROTOCOL}=0D
=0D
Peter Maydell (1):=0D
  docs/user: Remove outdated 'Quick Start' section=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (2):=0D
  linux-user/mips64: Restore setup_frame() for o32 ABI=0D
  linux-user/mips64: Support o32 ABI syscalls=0D
=0D
Richard Purdie (1):=0D
  linux-user/mmap: Avoid asserts for out of range mremap calls=0D
=0D
Stefan (1):=0D
  linux-user/syscall: Fix do_ioctl_ifconf() for 64 bit targets.=0D
=0D
 docs/user/main.rst                | 61 -------------------------------=0D
 linux-user/alpha/target_fcntl.h   |  1 +=0D
 linux-user/alpha/target_signal.h  |  6 +++=0D
 linux-user/elfload.c              | 30 ++++++++++-----=0D
 linux-user/generic/signal.h       |  6 +++=0D
 linux-user/generic/sockbits.h     |  3 ++=0D
 linux-user/hppa/target_fcntl.h    |  4 +-=0D
 linux-user/hppa/target_signal.h   |  5 +++=0D
 linux-user/mips/sockbits.h        |  2 +=0D
 linux-user/mips/target_signal.h   |  6 +++=0D
 linux-user/mips64/syscall_nr.h    |  5 ++-=0D
 linux-user/mips64/target_elf.h    |  3 ++=0D
 linux-user/mips64/target_signal.h |  9 +++++=0D
 linux-user/mmap.c                 |  4 +-=0D
 linux-user/signal.c               |  3 +-=0D
 linux-user/sparc/target_signal.h  |  6 +++=0D
 linux-user/syscall.c              | 18 +++++++--=0D
 17 files changed, 93 insertions(+), 79 deletions(-)=0D
=0D
--=3D20=0D
2.29.2=0D
=0D

