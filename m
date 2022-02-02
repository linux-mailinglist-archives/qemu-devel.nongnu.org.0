Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7A44A7B31
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 23:40:18 +0100 (CET)
Received: from localhost ([::1]:53568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFOIM-0002KC-Vn
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 17:40:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nFOEF-0008Py-UJ
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 17:35:55 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:40093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nFOEA-0004QA-45
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 17:35:55 -0500
Received: from quad ([82.142.10.94]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MlwFp-1mWjjN1UoN-00izjt; Wed, 02
 Feb 2022 23:35:30 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] m68k: virt: add a firmware to the virt machine (petit
 boot)
Date: Wed,  2 Feb 2022 23:35:25 +0100
Message-Id: <20220202223528.1260154-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NjGUJK8RzmeRmpdiKfkwJ/8ElhO2kkdA2d6lXTnOGQr1qG9h5we
 +jIbfI/XR5YDVVB/SyKi200rRkqSNY+LZJzxNuzb/LbmiVkpdAUY2vq3lWRsGE3zbx5UlQg
 InyFLQV4REo1xtKKtlzBLSTdZLT7hgCSjBMimMGMMH5onyGMr67bRajZD/vmcBeGdyapLEH
 C0fbzaiZiZpNM27HJcR5w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ozfbZrLLIfc=:QVYC4ZkS0r8DBT77bUVBMe
 aPFNsJt6V/RywNKfZaaJvhR2TbMF9V8K6WJUDwQrlQwrWSQ56NYbq/ADU05RY/0hFe2px29xU
 dS4TglG3jq2tZZ1WYXeCQPKNK1GQ9YbjP/F7YSyKzKrOM/jpV0YTXps9z0D3h6Y5sWirPN+ZT
 V4lTYK1CQehqPROCsaECaxFm8n5L7DyqADg5H7+gaIYtacYlq+VKQRNcy5el207co5ba8r9UG
 /G04/XiBZe+7bVRmS2aQUUFmzFyR7sZhWMeuxgE5Gs9tWUUoMaHBTBj129fNE9odi/UAaFjBP
 ELjlLAGYHaPkV+MkDHrUeDOI1MQj8Iwc8+3D3iOrn6sgIWiFmubeRta0hH4gXCz0nG2HjHeE8
 4q+e3L0zyn4okrXrOsJhPOoCdMulUm69ADymcVmEtCA5z5cfbP6cfZ7rHAERuE9Hhxjndwol1
 9ebnizrv8/I67pT1NRG1G8bpNuYw232bkWB0C+LEgrhrHyyJvflOuXm8tJQNolmMXwnJMphuQ
 8IK0cg6OOudeZ4LEGJRYIKL2spXqeU8NAjRX5t6UsKIRCMCGB2kIKwEuTISGh67O/0H0XxFGm
 0gedhVYCJwUzcjwBljd0SzkVRdQzLKobEztqdaSGRkiB1B99wo8GeSUs8/VeDfkeR8MVX80DS
 b6M7pORx6PeRuvFiKcnLF9Kb387B06ZYooEZhbNITXSeFO5soZGihfpOnp8//y36wn+U=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

For the moment, the virt machine can only be started by using=0D
QEMU "-kernel" parameter, and thus can only load the kernel/initramfs=0D
from the host filesystem.=0D
=0D
Adding a firmware is a good way to allow the machine to boot and update=0D
a kernel from the guest point of view (disk, network, cdrom, ...).=0D
=0D
As I don't want to port a firmware to this machine, the easy way to do=0D
that is to use linux. This approach is already in use by petit boot on=0D
the bare metal POWER systems.=0D
=0D
This series adds a bootstrap ROM to load the firmware (petit boot),=0D
and a buildroot environment to build the petit boot firmware for=0D
the m68k virt machine.=0D
=0D
To build the bootstram ROM:=0D
=0D
$ git submodule init roms/m68k-virt=0D
$ git submodule updage roms/m68k-virt=0D
$ make -C roms m68k-virt-bootrom=0D
=0D
To build the firmware:=0D
=0D
$ git submodule init roms/buildroot=0D
$ git submodule update roms/buildroot=0D
$ make -C roms m68k-virt-firmware=0D
=0D
Build qemu-system-m68k and then you can start QEMU and=0D
play with petit boot:=0D
$ ./qemu-system-m68k -M virt -nographic=0D
=0D
Petit boot supports various bootloader configuration files, like=0D
grub, pxe, kboot, syslinux...=0D
=0D
For instance:=0D
=0D
menuentry "Linux 5.16.0-virt (debian 10.0)" {=0D
	search --set=3Droot --label root=0D
	linux /boot/vmlinux-5.16.0-virt ro root=3D/dev/vda2 console=3DttyGF0=0D
}=0D
=0D
default=3D"vmlinux-5.16.0-virt"=0D
vmlinux-5.16.0-virt=3D'/boot/vmlinux-5.16.0-virt root=3D/dev/vda2 console=
=3DttyGF0'=0D
=0D
default vmlinux-5.16.0-virt (debian 10.0)=0D
label vmlinux-5.16.0-virt (debian 10.0)=0D
 kernel /boot/vmlinux-5.16.0-virt=0D
 append root=3D/dev/vda2 console=3DttyGF0=0D
=0D
Laurent Vivier (3):=0D
  m68k: bootinfo entry size must be aligned on 4 bytes=0D
  m68k: virt: add a bootstrap ROM=0D
  m68k: virt: add a firmware (petitboot)=0D
=0D
 configure                   |   3 +-=0D
 hw/m68k/bootinfo.h          |   4 +-=0D
 include/hw/misc/virt_ctrl.h |   6 ++=0D
 hw/m68k/virt.c              |  38 ++++++++++++=0D
 hw/misc/virt_ctrl.c         | 111 +++++++++++++++++++++++++++++++++++-=0D
 .gitmodules                 |   6 ++=0D
 pc-bios/meson.build         |   3 +=0D
 roms/Makefile               |  15 +++++=0D
 roms/buildroot              |   1 +=0D
 roms/m68k-virt              |   1 +=0D
 10 files changed, 183 insertions(+), 5 deletions(-)=0D
 create mode 160000 roms/buildroot=0D
 create mode 160000 roms/m68k-virt=0D
=0D
-- =0D
2.34.1=0D
=0D

