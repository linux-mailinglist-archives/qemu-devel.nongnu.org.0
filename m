Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE51337F61
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 22:11:21 +0100 (CET)
Received: from localhost ([::1]:35562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKSaW-0007tt-IS
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 16:11:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lKSYx-0006bZ-Gt
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 16:09:44 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:39755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lKSYu-0004wp-SM
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 16:09:43 -0500
Received: from localhost.localdomain ([82.142.6.26]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M5fUy-1lM8Jn3gtu-007Eba; Thu, 11 Mar 2021 22:09:38 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/9] M68k for 6.0 patches
Date: Thu, 11 Mar 2021 22:09:25 +0100
Message-Id: <20210311210934.1935587-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bhb/hAvdKNEvOQapHBKG3i0lNpK0L9+6adzM/sxLsXPsvLhx2K7
 icaAE0LcWiAvaaTQARliQWMZwaYD+afLzgn2bqMLtt+f0EkRVCj18rniz/d52v+O1Q9gU/i
 FJU2/600mYw9b+h1f6rGaJA6RLLdNGhRK8ELtI43fgbuwA8VD4gPKp3pyhfaERAQ0Cp4OQi
 owHpczc7oIyITD6Q23v6A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:edKjApS5h24=:C/PMKkxcOSomJDC+pMWNVQ
 MkGQTHlBpzNfeQevnsgTF+JD4aaFcaAvWVgp3K+0zSquStNf99UOv5B7oxXDu1PQfe2iFQjj6
 lw21jJMYZUtHRq7Y4GYCXhBs3obpMySeSPZayXRq/YboRWndS/LgKQGNQC6NiJkGky6MDYNCg
 FMpix17Tg/pNGgHueIPXCwumaM+c6jrM07/aaDIg7B8+x85fINKf1LMHxXPEnjJKMNHVWi6tu
 S26vRKujtVshTQBm2qOsfua0l0lQXsy8RYipjXKmCrS17kjkS4IJjU0oXFiu5z3EFvoxpo9Py
 ItoDMBJ+zy+91NCAtIYaXNu8H7B0SsUjDtlG6ADJXWoJ+9hMXqq++/qU1q/9ZrBtIgY7lzOGd
 9ToxJ8OVCo9B0mLyXYJR6tbU3E8JYVyRdZkIyKUPWiOxUKMr72OxBedVajfgKy9qV9/OLzo3r
 CmOUu69j4A==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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

The following changes since commit f4abdf32714d1845b7c01ec136dd2b04c2f7db47=
:=0D
=0D
  Merge remote-tracking branch 'remotes/stsquad/tags/pull-testing-docs-xen-=
up=3D=0D
dates-100321-2' into staging (2021-03-11 16:20:58 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu-m68k.git tags/m68k-for-6.0-pull-request=0D
=0D
for you to fetch changes up to dcb5d042fe7901155e9428ce313b3033ccd2312e:=0D
=0D
  m68k: add Virtual M68k Machine (2021-03-11 21:13:00 +0100)=0D
=0D
----------------------------------------------------------------=0D
Introduce the m68k virt machine=0D
Prepare MacOS ROM support:=0D
  - add RTR instruction=0D
  - fix unaligned access requirement=0D
  - fix ATC bit (68040 MMU)=0D
=0D
----------------------------------------------------------------=0D
=0D
Laurent Vivier (6):=0D
  target/m68k: implement rtr instruction=0D
  char: add goldfish-tty=0D
  intc: add goldfish-pic=0D
  m68k: add an interrupt controller=0D
  m68k: add a system controller=0D
  m68k: add Virtual M68k Machine=0D
=0D
Mark Cave-Ayland (3):=0D
  target/m68k: don't set SSW ATC bit for physical bus errors=0D
  target/m68k: reformat m68k_features enum=0D
  target/m68k: add M68K_FEATURE_UNALIGNED_DATA feature=0D
=0D
 docs/specs/virt-ctlr.txt                      |  26 ++=0D
 default-configs/devices/m68k-softmmu.mak      |   1 +=0D
 include/hw/char/goldfish_tty.h                |  35 ++=0D
 include/hw/intc/goldfish_pic.h                |  33 ++=0D
 include/hw/intc/m68k_irqc.h                   |  41 +++=0D
 include/hw/misc/virt_ctrl.h                   |  22 ++=0D
 .../standard-headers/asm-m68k/bootinfo-virt.h |  18 +=0D
 target/m68k/cpu.h                             |  68 ++--=0D
 hw/char/goldfish_tty.c                        | 283 ++++++++++++++++=0D
 hw/intc/goldfish_pic.c                        | 219 ++++++++++++=0D
 hw/intc/m68k_irqc.c                           | 119 +++++++=0D
 hw/m68k/virt.c                                | 313 ++++++++++++++++++=0D
 hw/misc/virt_ctrl.c                           | 151 +++++++++=0D
 target/m68k/cpu.c                             |   1 +=0D
 target/m68k/op_helper.c                       |  17 +-=0D
 target/m68k/translate.c                       |  20 ++=0D
 MAINTAINERS                                   |  13 +=0D
 hw/char/Kconfig                               |   3 +=0D
 hw/char/meson.build                           |   2 +=0D
 hw/char/trace-events                          |  10 +=0D
 hw/intc/Kconfig                               |   6 +=0D
 hw/intc/meson.build                           |   2 +=0D
 hw/intc/trace-events                          |   8 +=0D
 hw/m68k/Kconfig                               |   9 +=0D
 hw/m68k/meson.build                           |   1 +=0D
 hw/misc/Kconfig                               |   3 +=0D
 hw/misc/meson.build                           |   3 +=0D
 hw/misc/trace-events                          |   7 +=0D
 28 files changed, 1410 insertions(+), 24 deletions(-)=0D
 create mode 100644 docs/specs/virt-ctlr.txt=0D
 create mode 100644 include/hw/char/goldfish_tty.h=0D
 create mode 100644 include/hw/intc/goldfish_pic.h=0D
 create mode 100644 include/hw/intc/m68k_irqc.h=0D
 create mode 100644 include/hw/misc/virt_ctrl.h=0D
 create mode 100644 include/standard-headers/asm-m68k/bootinfo-virt.h=0D
 create mode 100644 hw/char/goldfish_tty.c=0D
 create mode 100644 hw/intc/goldfish_pic.c=0D
 create mode 100644 hw/intc/m68k_irqc.c=0D
 create mode 100644 hw/m68k/virt.c=0D
 create mode 100644 hw/misc/virt_ctrl.c=0D
=0D
--=3D20=0D
2.29.2=0D
=0D

