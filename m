Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2344D320559
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 13:37:35 +0100 (CET)
Received: from localhost ([::1]:38222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDRVt-00006R-JI
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 07:37:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lDRU2-0006m3-1b; Sat, 20 Feb 2021 07:35:38 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:49919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lDRTz-0003Ak-12; Sat, 20 Feb 2021 07:35:37 -0500
Received: from localhost.localdomain ([82.252.134.158]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M734j-1lCe8E1A47-008ezc; Sat, 20 Feb 2021 13:35:29 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 00/12] Trivial branch for 6.0 patches
Date: Sat, 20 Feb 2021 13:35:13 +0100
Message-Id: <20210220123525.1353731-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CfdM+iTy+PpaMNJEZz3a93occnnGxZLE4+l+yqIDU7IFc/hURFC
 yK7r6RursyyBhvws+sBuxoib9BBoxMc/2g8pgseJIoZdQ4ON6nWgZwtk+Q3u0gymfyPP6z8
 hjWrEhn4jNIUugNvMIuOhJc/ETVLzoS+cUytZuVngQUeMlvK5qu1Y0xWgExdjkJ+x+akKmk
 PZrELOzpoL8yM3W58iOig==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZWu4aelSJBE=:qtKl8g/Wtr3zOkjaMW7/ji
 9ukyG4c8bJpQGjI9Nhrrd84qUt+quYbRyh31ZTgouzGwxhxg2uZBGjEZODVwZKXxdcRJ8HD2s
 8+mMLIFGDfuoP1/k79x6itXFqkjQ7aOrDimmBIISCKf7sDJp5CEmvIYiP6hhFs0l1Sb3cWzpF
 HYZblv4iuqgrV3rqU+G1fZiayfWhKhJK/uTLbnMw5JPYpp6CywD33QJrwgxFz4MR4CFK80xJE
 IK2wQYD4uB+FT1sK7UYhF3QQWJ4OGxqchDUEuQ5ux2umZU7y+5pDSK0mrj0E53VrmCCiVutd4
 WdHcMnSPHbGJMbqNiw7hbJ4KmVsj9l/SOzSkUnGirIPkVacK20GTzAhu3HeayWlM0A1EH4vWh
 vEKTdcGvcdnwiM6P7dzDhk0wV45YJVRYT1aF9qkYsaT9GzD4VIRp3omtswFcHPHcor4io8a5k
 zUoW/wyeDQ==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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

The following changes since commit e90ef02389dc8b57eaea22b290244609d720a8bf=
:=0D
=0D
  Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2021-02-18' i=
nt=3D=0D
o staging (2021-02-19 17:22:42 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/trivial-branch-for-6.0-pull-request=
=0D
=0D
for you to fetch changes up to 1cb428356beec30cd5067add76e51e01d0f6f680:=0D
=0D
  MAINTAINERS: Fix default-configs/ entries (2021-02-20 12:36:19 +0100)=0D
=0D
----------------------------------------------------------------=0D
Pull request trivial patches 20210220=0D
=0D
----------------------------------------------------------------=0D
=0D
Christian Schoenebeck (1):=0D
  MAINTAINERS: add my github tree URL=0D
=0D
Gan Qixin (5):=0D
  virtio-pmem: put it into the 'storage' category=0D
  vmmouse: put it into the 'input' category=0D
  nvdimm: put it into the 'storage' category=0D
  tpm: put some tpm devices into the correct category=0D
  u2f-passthru: put it into the 'misc' category=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (4):=0D
  hw/i386/xen: Remove dead code=0D
  hw/scsi/megasas: Remove pointless parenthesis=0D
  target/avr/cpu: Use device_class_set_parent_realize()=0D
  MAINTAINERS: Fix default-configs/ entries=0D
=0D
Ryan Finnie (1):=0D
  Fix SPDX-License-Identifier typos=0D
=0D
Thomas Huth (1):=0D
  hw/block/fdc: Remove the check_media_rate property=0D
=0D
 MAINTAINERS                   | 21 +++++++++++----------=0D
 hw/block/fdc.c                | 17 ++---------------=0D
 hw/i386/vmmouse.c             |  1 +=0D
 hw/i386/xen/xen_platform.c    | 13 ++-----------=0D
 hw/mem/nvdimm.c               |  1 +=0D
 hw/misc/aspeed_xdma.c         |  2 +-=0D
 hw/misc/sbsa_ec.c             |  2 +-=0D
 hw/scsi/megasas.c             |  4 ++--=0D
 hw/sd/aspeed_sdhci.c          |  2 +-=0D
 hw/tpm/tpm_tis_isa.c          |  1 +=0D
 hw/tpm/tpm_tis_sysbus.c       |  1 +=0D
 hw/usb/u2f-passthru.c         |  1 +=0D
 hw/virtio/virtio-pmem.c       |  1 +=0D
 include/hw/misc/aspeed_xdma.h |  2 +-=0D
 include/hw/sd/aspeed_sdhci.h  |  2 +-=0D
 target/avr/cpu.c              |  4 +---=0D
 tests/qemu-iotests/172.out    | 35 -----------------------------------=0D
 17 files changed, 29 insertions(+), 81 deletions(-)=0D
=0D
--=3D20=0D
2.29.2=0D
=0D

