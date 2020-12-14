Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8102D9BB1
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 17:05:30 +0100 (CET)
Received: from localhost ([::1]:53942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koqLp-0006Q5-8i
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 11:05:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEW-0007sP-Os; Mon, 14 Dec 2020 10:57:59 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:40073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1koqEI-0001Ow-JB; Mon, 14 Dec 2020 10:57:56 -0500
Received: from localhost.localdomain ([82.252.135.218]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M730b-1kkj5o0NeJ-008evo; Mon, 14 Dec 2020 16:57:39 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 00/19] Trivial branch for 6.0 patches
Date: Mon, 14 Dec 2020 16:57:14 +0100
Message-Id: <20201214155733.207430-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ebwc0vzWXndcnBxjxYA6nw78ao0VBC9vu3mjKFpmYGPadoTgR+w
 XpdqRnZAU73yOscg/hy2S6k6LXurCZEwr5Zt25wkG+OfqIhsHS+9oUa0EN1Tshno8HopQ8X
 mwAcqN7yRQiyI320LqapZwE7YjFE980bdZtTKQ9siGW+A0cJd66lDIbZPbEJ01ziKNTwLcn
 /kDCakcNark/1svCnkQgg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:q6SIdgXGla4=:a1QjbkjxEr/h/hukbxfSSc
 SKb0esMzLN247Uh0tjiCU2CLh2IvFKpNtvOl1WIMJwYOgfJNDLD27O4PL01hjDRkmMa1WvyN3
 cAZ+HeLFw6M6m++aBiUdy6LK+kJtHfMVIlVrB0tRijEtWH6f+vdlxoAMo6be4PF6IUQxN3h82
 a3ML3XgONGfh1iwwphLIc56GOXiPO9zz9YwyLb+zsk39fknlOyuGdmIbWcIlifSw6HrsmPW2I
 4vnN75PbZ2QH7+y/Pe1VwKSM/GWzc66ohEyTmD/rjTuCi9ywqzPq0DJ14j/a3+27vEeMrrI/h
 /tM/A5rhSxwZkopZE38U9NVL0TG5EloPqm7TboBTzQMwTeQfjz+CGX68x+oINQqH1kdIhw4CM
 IOiAxNzYKikTg4Z3UOXekMPAMI2nVgcTvHozlbNCvwCOLW7OcPEkO5QsN9pxWm2OwzZ4f6dfm
 udhwGHfQMA==
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

The following changes since commit 17584289af1aaa72c932e7e47c25d583b329dc45=
:=0D
=0D
  Merge remote-tracking branch 'remotes/vivier/tags/m68k-for-6.0-pull-reque=
st=3D=0D
' into staging (2020-12-12 18:33:46 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/trivial-branch-for-6.0-pull-request=
=0D
=0D
for you to fetch changes up to 48f670ecfcbe92f63475c516aefb6e217f469bbf:=0D
=0D
  configure / meson: Move check for linux/btrfs.h to meson.build (2020-12-1=
3 =3D=0D
23:56:16 +0100)=0D
=0D
----------------------------------------------------------------=0D
Pull request trivial-patches 20201214=0D
=0D
----------------------------------------------------------------=0D
=0D
Dov Murik (1):=0D
  target/i386: tracing: format length values as hex=0D
=0D
Gan Qixin (1):=0D
  ads7846: moves from the hw/display folder to the hw/input folder.=0D
=0D
Michael Roth (1):=0D
  MAINTAINERS: update my email address=0D
=0D
Pan Nengyuan (4):=0D
  elf2dmp/qemu_elf: Plug memleak in QEMU_Elf_init=0D
  elf2dmp/pdb: Plug memleak in pdb_init_from_file=0D
  block/file-posix: fix a possible undefined behavior=0D
  blockdev: Fix a memleak in drive_backup_prepare()=0D
=0D
Peter Maydell (2):=0D
  qemu-options.hx: Fix minor issues in icount documentation=0D
  CODING_STYLE.rst: Be less strict about 80 character limit=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (1):=0D
  hw/pci-host/pam: Replace magic number by PAM_REGIONS_COUNT definition=0D
=0D
Roman Bolshakov (1):=0D
  configure: Test if $make actually exists=0D
=0D
Thomas Huth (6):=0D
  configure: Remove the obsolete check for ifaddrs.h=0D
  configure / meson: Move check for pty.h to meson.build=0D
  configure / meson: Move check for drm.h to meson.build=0D
  configure / meson: Move check for sys/signal.h to meson.build=0D
  configure / meson: Move check for sys/kcov.h to meson.build=0D
  configure / meson: Move check for linux/btrfs.h to meson.build=0D
=0D
Xinhao Zhang (1):=0D
  hw/xen: Don't use '#' flag of printf format=0D
=0D
zhouyang (1):=0D
  fsdev: open brace '{' following struct go on the same line=0D
=0D
 CODING_STYLE.rst                |  9 +++--=0D
 MAINTAINERS                     |  4 +--=0D
 block/file-posix.c              |  2 +-=0D
 blockdev.c                      |  1 +=0D
 configure                       | 62 +++------------------------------=0D
 contrib/elf2dmp/pdb.c           |  1 +=0D
 contrib/elf2dmp/qemu_elf.c      |  1 +=0D
 fsdev/9p-marshal.h              | 12 +++----=0D
 fsdev/file-op-9p.h              |  3 +-=0D
 hw/arm/Kconfig                  |  2 +-=0D
 hw/display/Kconfig              |  3 --=0D
 hw/display/meson.build          |  1 -=0D
 hw/input/Kconfig                |  3 ++=0D
 hw/{display =3D3D> input}/ads7846.c |  0=0D
 hw/input/meson.build            |  1 +=0D
 hw/pci-host/pam.c               |  2 +-=0D
 hw/pci-host/q35.c               |  2 +-=0D
 hw/xen/xen_pt.c                 | 10 +++---=0D
 hw/xen/xen_pt_config_init.c     |  6 ++--=0D
 hw/xen/xen_pt_msi.c             | 16 ++++-----=0D
 include/hw/pci-host/i440fx.h    |  2 +-=0D
 include/hw/pci-host/pam.h       |  2 ++=0D
 include/hw/pci-host/q35.h       |  2 +-=0D
 linux-user/ioctls.h             |  2 +-=0D
 linux-user/syscall.c            |  4 +--=0D
 linux-user/syscall_defs.h       |  2 +-=0D
 meson.build                     |  5 +++=0D
 qemu-options.hx                 | 44 +++++++++++++----------=0D
 target/i386/trace-events        |  6 ++--=0D
 29 files changed, 86 insertions(+), 124 deletions(-)=0D
 rename hw/{display =3D3D> input}/ads7846.c (100%)=0D
=0D
--=3D20=0D
2.29.2=0D
=0D

