Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 507EC40DC95
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 16:19:29 +0200 (CEST)
Received: from localhost ([::1]:41622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQsEa-0003J2-DY
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 10:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQs5z-0000WY-Oo; Thu, 16 Sep 2021 10:10:35 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:57531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQs5x-0005nD-0H; Thu, 16 Sep 2021 10:10:35 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N3KDM-1mqpF91k4w-010I5D; Thu, 16
 Sep 2021 16:10:29 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 00/10] Trivial branch for 6.2 patches
Date: Thu, 16 Sep 2021 16:10:16 +0200
Message-Id: <20210916141026.1174822-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Wpq0bRMF3+P84rb+hJlwu9x/zcLHnK/WIAjQkObOb7JQYS3h86g
 uwFKcgzv8I4JL8g9UgZTApd9qkfgW+14qKS02mVtpfASu1fI9r2x7dQWeeTiJCIjfUpDLN2
 +VfwVK1iLTdC1q/pDgeEjSaP/8rFcBJ/Zp9ygjgVaAOrWxjeZ+8a00Xqr+49VBtJ/UCjn9D
 LMkO6qFFNZrdRX+lJAV5g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1eJwSLzp7Ic=:S8i95Pck8d1Q0xnqO5pUhg
 /gTsUIGLil1qpGOMpDhbYjQbs+u7NtpZtnlIvFhI/e3TniwUbfbTbgzX2OXdcKCRl3AErJE0x
 Uivm3vCd0pzQuh5+v2mAhk66I0MetBxhefknFc57/yy5yqq3NNxseNa9G67026tHqWNmLfmlK
 kgdIbdsp8BDsjNXkZSzyL17mN8I4GKVJrwMIFkrs+yVn1Kiid6zbK0/8vrt6HaF0ShEWtvXoq
 tvT9mmnD5UqRTTuK5qfF+CATJymfawZ/eHBSybR4htpFMMeWQaKHSdSKAnl8J+RSTNOSZkYgI
 DjRwMrN6qbAIsB4kQ9yv3UjZogvg6bBwBecZrJFzcsfJSM50cq89GVrHMYBUg1C+CZPzX7uhr
 v/gTW3mjdlmvuSMHPyzVucCzfHie1QevPd/JQHtE3R7dTc7G+PtJGEi6c/v/fJYz2kSvQDBTP
 GH556nngD9nsCvyti7SBTbs3j8IveZfr+H4s2THcrzFrJOowju9N4+zBsJX5CgdXmqhkh0Ua/
 NRv0vxQN8DV8rvHGWTXnib0Nn7ZUxZgWrsNldOhz90KLcBCqosHjB2Km9RTtws67W8BAWBTGq
 6tWqPgoMV/+4yfjtADtbZXZRgQgUwz6O2gw9uraytvESZPjz8IhX/AsuHgFkWFXitfBfhoX4Q
 mf7X85i4e06BWQAAQRIvZbAeJkRe6zAY981UYNa6PFj2opId1Pf6PAwiNCAdkExpSRskzs54l
 kidPRvwic1+/JjdxIC9saXJdUU2FrczGthLgDw==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

The following changes since commit 831aaf24967a49d7750090b9dcfd6bf356f16529=
:=0D
=0D
  Merge remote-tracking branch 'remotes/marcandre/tags/misc-pull-request' i=
nto staging (2021-09-14 18:14:56 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/trivial-branch-for-6.2-pull-request=
=0D
=0D
for you to fetch changes up to 9ac200acce8c27ef44da31246f337a2454e54e0d:=0D
=0D
  target/sparc: Make sparc_cpu_dump_state() static (2021-09-16 14:52:46 +02=
00)=0D
=0D
----------------------------------------------------------------=0D
Trivial patches pull request 20210916=0D
=0D
----------------------------------------------------------------=0D
=0D
AlexChen (1):=0D
  util: Remove redundant checks in the openpty()=0D
=0D
Cai Huoqing (2):=0D
  intel_iommu: Fix typo in comments=0D
  hw/vfio: Fix typo in comments=0D
=0D
John Arbuckle (1):=0D
  configure: add missing pc-bios/qemu_vga.ndrv symlink in build tree=0D
=0D
Michael Tokarev (2):=0D
  spelling: sytem =3D> system=0D
  target/i386: spelling: occured=3D>occurred, mininum=3D>minimum=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/i386/acpi-build: Fix a typo=0D
  qdev: Complete qdev_init_gpio_out() documentation=0D
  target/sparc: Make sparc_cpu_dump_state() static=0D
=0D
Stefan Weil (1):=0D
  target/avr: Fix compiler errors (-Werror=3Denum-conversion)=0D
=0D
 accel/kvm/kvm-all.c             | 2 +-=0D
 block/file-posix.c              | 2 +-=0D
 configure                       | 4 +++-=0D
 hw/i386/acpi-build.c            | 6 +++---=0D
 hw/i386/intel_iommu.c           | 8 ++++----=0D
 hw/vfio/igd.c                   | 2 +-=0D
 hw/vfio/pci-quirks.c            | 2 +-=0D
 hw/vfio/pci.c                   | 6 +++---=0D
 hw/vfio/platform.c              | 2 +-=0D
 include/hw/qdev-core.h          | 4 ++++=0D
 target/avr/translate.c          | 8 +++-----=0D
 target/i386/cpu-sysemu.c        | 2 +-=0D
 target/sparc/cpu.c              | 2 +-=0D
 target/sparc/cpu.h              | 1 -=0D
 tools/virtiofsd/fuse_lowlevel.h | 4 ++--=0D
 util/qemu-openpty.c             | 7 +++----=0D
 16 files changed, 32 insertions(+), 30 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

