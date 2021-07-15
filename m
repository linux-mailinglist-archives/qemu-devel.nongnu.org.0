Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1D83C9F2A
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 15:12:36 +0200 (CEST)
Received: from localhost ([::1]:58646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m41AJ-0001Gw-4w
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 09:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m419K-0008V9-0L
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 09:11:34 -0400
Received: from indium.canonical.com ([91.189.90.7]:41044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m419H-0005fV-0n
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 09:11:33 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m419A-0006Ng-UY
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 13:11:25 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8CE8B2E81A2
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 13:11:23 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Jul 2021 13:04:34 -0000
From: Launchpad Bug Tracker <1907952@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Fix Released; importance=Undecided; assignee=None; 
X-Launchpad-Bug: distribution=debian; sourcepackage=qemu; component=main;
 status=Confirmed; importance=Unknown; assignee=None; 
X-Launchpad-Bug-Tags: arm qemu-21.10
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: emojifreak janitor pmaydell
X-Launchpad-Bug-Reporter: Ryutaroh Matsumoto (emojifreak)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160786029328.5567.5976635715445692881.malonedeb@gac.canonical.com>
Message-Id: <162635427744.12724.1128301733416263628.malone@ackee.canonical.com>
Subject: [Bug 1907952] Re: qemu-system-aarch64: with "-display gtk" arrow keys
 are received as just ^[ on ttyAMA0
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4fbbc20799edd34b40f59a0c81c360f947903b2a"; Instance="production"
X-Launchpad-Hash: a76e667bb89cdd63872229c58bfa0205d34c5cc2
Received-SPF: pass client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1907952 <1907952@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This bug was fixed in the package qemu - 1:6.0+dfsg-1~ubuntu3

---------------
qemu (1:6.0+dfsg-1~ubuntu3) impish; urgency=3Dmedium

  * d/p/u/lp-1935617-target-ppc-Fix-load-endianness-for-lxvwsx-lxvdsx.patch:
    fix TCG emulation for ppc64 (LP: #1935617)

qemu (1:6.0+dfsg-1~ubuntu2) impish; urgency=3Dmedium

  * d/control: remove fuse2 trial-build (LP 1934510)

qemu (1:6.0+dfsg-1~ubuntu1) impish; urgency=3Dmedium

  * Merge with Debian experimental, Among many other things this fixes LP B=
ugs:
    (LP: #1907952) broken arrow keys in -display gtk on aarch64
    - qemu-kvm to systemd unit
      - d/qemu-kvm-init: script for QEMU KVM preparation modules, ksm,
        hugepages and architecture specifics
      - d/qemu-system-common.qemu-kvm.service: systemd unit to call
        qemu-kvm-init
      - d/qemu-system-common.install: install helper script
      - d/qemu-system-common.qemu-kvm.default: defaults for
        /etc/default/qemu-kvm
      - d/rules: call dh_installinit and dh_installsystemd for qemu-kvm
    - Distribution specific machine type
      (LP: 1304107 1621042 1776189 1761372 1761372 1776189)
      - d/p/ubuntu/define-ubuntu-machine-types.patch: define distro machine
        types containing release versioned machine attributes
      - d/qemu-system-x86.NEWS Info on fixed machine type defintions
        for host-phys-bits=3Dtrue
      - Add an info about -hpb machine type in debian/qemu-system-x86.NEWS
      - ubuntu-q35 alias added to auto-select the most recent q35 ubuntu ty=
pe
    - Enable nesting by default
      - d/p/ubuntu/enable-svm-by-default.patch: Enable nested svm by default
        in qemu64 on amd
        [ No more strictly needed, but required for backward compatibility ]
    - improved dependencies
      - Make qemu-system-common depend on qemu-block-extra
      - Make qemu-utils depend on qemu-block-extra
      - Let qemu-utils recommend sharutils
    - tolerate ipxe size change on migrations to >=3D18.04 (LP: 1713490)
      - d/p/ubuntu/pre-bionic-256k-ipxe-efi-roms.patch: old machine types
        reference 256k path
      - d/control-in: depend on ipxe-qemu-256k-compat-efi-roms to be able to
        handle incoming migrations from former releases.
    - d/control-in: Disable capstone disassembler library support (universe)
    - d/qemu-system-x86.README.Debian: add info about updated nesting chang=
es
    - d/control*, d/rules: disable xen by default, but provide universe
      package qemu-system-x86-xen as alternative
      [includes compat links changes of 5.0-5ubuntu4]
    - Fix upgrade module handling (LP 1905377)
      --enable-module-upgrades for qemu-xen which doesn't exist in Debian
  * Dropped Changes [in 6.0]:
    - d/p/ubuntu/lp-1907789-build-no-pie-is-no-functional-liker-flag.patch:=
 fix
      ld usage of -no-pie (LP 1907789)
    - d/p/u/lp-1916230-hw-s390x-fix-build-for-virtio-9p-ccw.patch: fix
      virtio-9p-ccw being missing (LP 1916230)
    - d/p/u/lp-1916705-disas-Fix-build-with-glib2.0-2.67.3.patch: Fix FTFBS=
 due
      to glib2.0 >=3D2.67.3 (LP 1916705)
    - d/p/u/lp-1921754*: add EPYC-Rome-v2 as v1 missed IBRS and thereby fai=
ls
      on some HW/Guest combinations e.g. Windows 10 on Threadripper chips
      (LP 1921754)
    - d/p/u/lp-1921880*: add EPYC-Milan features and named cpu type support
      (LP 1921880)
    - d/p/u/lp-1922010-linux-user-s390x-Use-the-guest-pointer-for-the-sigre=
*:
      fix go in qemu-s390x-static (LP 1922010)
  * Dropped Changes [in Debian]:
    - Allow qemu to load old modules post upgrade (LP 1847361)
      - Drop d/qemu-block-extra.*.in, d/qemu-system-gui.*.in
      - d/rules: Drop generating package version into maintainer scripts
  * Dropped Changes [No more needed >21.04]:
      - d/qemu-system-gui.prerm: add no-op prerm to overcome upgrade issues=
 on
        the bad old prerm (LP 1906245 1905377)
  * Added Changes
    - Disable fuse export (universe dependency)
    - d/p/ubuntu/enable-svm-by-default.patch: update to match v6.0
    - d/p/ubuntu/define-ubuntu-machine-types.patch: add ubuntu machine types
      for v6.0
    - d/p/ubuntu/lp-1929926-*: avoid segfaults by uretprobes (LP: #1929926)
    - Ease the use of module retention on upgrades (LP: #1913421)
      - d/run-qemu.mount, d/rules: provide run-qemu.mount in qemu-block-ext=
ra
      - d/rules: only save modules if /run/qemu isn't noexec
      - d/rules: clear all (current and former) modules on purge
      - debian/qemu-block-extra.postinst: enable mount unit on install/upgr=
ade
    - d/control: qemu 6.0 broke libvirt <7.2 add a breaks to avoid partial
      upgrade issues (LP: #1932264)
    - Enable SDL as secondary UI backend (LP: #1256185)
      - d/control: add build dependency libsdl2-dev
      - d/control: enable sdl graphics on build
      - d/qemu-system-gui.install: add ui-sdl.so
      - d/control: add runtime dependency to libgl1
    - d/rules: qemu-system-x86-xen builds modules as well now (follows the
      other packages)

qemu (1:6.0+dfsg-1~exp0) experimental; urgency=3Dmedium

  * new upstream release
  * remove obsolete patches, refresh use-fixed-data-path.patch
  * use libncurses-dev, not old libncursesw5-dev
  * enable fuse export (and build-depend on libfuse3-dev)
  * install (new) manpages for qemu-storage-daemon
  * enable new hexagon qemu-user target
  * two patches to fix 3 new spelling mistakes
  * remove now-unused shared-library-lacks-prerequisites lintian-overrides
    for qemu-user-static

qemu (1:5.2+dfsg-10) unstable; urgency=3Dmedium

  * 5 sdhci fixes from upstream:
    dont-transfer-any-data-when-command-time-out.patch
    dont-write-to-SDHC_SYSAD-register-when-transfer-is-in-progress.patch
    correctly-set-the-controller-status-for-ADMA.patch
    limit-block-size-only-when-SDHC_BLKSIZE-register-is-writable.patch
    reset-the-data-pointer-of-s-fifo_buffer-when-a-different-block-size...p=
atch
    (Closes: #986795, #970937, CVE-2021-3409, CVE-2020-17380, CVE-2020-2508=
5)
  * mptsas-remove-unused-MPTSASState.pending-CVE-2021-3392.patch
    fix possible use-after-free in mptsas_free_request
    (Cloese: #984449, CVE-2021-3392)

 -- Christian Ehrhardt <christian.ehrhardt@canonical.com>  Tue, 13 Jul
2021 09:34:55 +0200

** Changed in: qemu (Ubuntu)
       Status: Triaged =3D> Fix Released

** CVE added: https://cve.mitre.org/cgi-bin/cvename.cgi?name=3D2020-17380

** CVE added: https://cve.mitre.org/cgi-bin/cvename.cgi?name=3D2020-25085

** CVE added: https://cve.mitre.org/cgi-bin/cvename.cgi?name=3D2021-3392

** CVE added: https://cve.mitre.org/cgi-bin/cvename.cgi?name=3D2021-3409

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1907952

Title:
  qemu-system-aarch64: with "-display gtk" arrow keys are received as
  just ^[ on ttyAMA0

Status in QEMU:
  Fix Released
Status in qemu package in Ubuntu:
  Fix Released
Status in qemu package in Debian:
  Confirmed

Bug description:
  I originally observed this on Debian packaged qemu 5.2 at
  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D976808

  Today I checked out the latest git source at
  Sun, 13 Dec 2020 19:21:09 +0900
  and configured the source as follows:

  ./configure --prefix=3D/usr --sysconfdir=3D/etc --libexecdir=3D/usr/lib/q=
emu \
   --localstatedir=3D/var --disable-blobs --disable-strip --localstatedir=
=3D/var \
   --libdir=3D/usr/lib/aarch64-linux-gnu \=20
   --firmwarepath=3D/usr/share/qemu:/usr/share/seabios:/usr/lib/ipxe/qemu \=
=20
   --target-list=3Daarch64-softmmu,arm-softmmu --disable-werror \=20
   --disable-user  --enable-gtk --enable-vnc
  then executed "make" on an ARM64 (not an x86_64) host,
  running the latest Debian testing.

  I did the following commands on an arm64 host with the Debian Installer A=
lpha 3 at
  https://cdimage.debian.org/cdimage/bullseye_di_alpha3/arm64/iso-cd/debian=
-bullseye-DI-alpha3-arm64-netinst.iso

  #!/bin/sh

  ARCH=3Darm64
  IMAGE=3D`pwd`/qemu-disk-${ARCH}.qcow2
  CDROM=3D`pwd`/debian-bullseye-DI-alpha3-${ARCH}-netinst.iso
  rm -f $IMAGE
  qemu-img create -f qcow2 -o compat=3D1.1 -o lazy_refcounts=3Don -o preall=
ocation=3Doff $IMAGE 20G
  cd /var/tmp
  cp /usr/share/AAVMF/AAVMF_VARS.fd .
  $HOME/qemu-git/qemu/build/qemu-system-aarch64 \
      -display gtk -enable-kvm -machine virt -cpu host -m 3072 -smp 2\
      -net nic,model=3Dvirtio -net user -object rng-random,filename=3D/dev/=
urandom,id=3Drng0 \
      -device virtio-rng-pci,rng=3Drng0,id=3Drng-device0 \
      -drive if=3Dvirtio,file=3D${IMAGE},index=3D0,format=3Dqcow2,discard=
=3Dunmap,detect-zeroes=3Dunmap,media=3Ddisk \
      -drive if=3Dvirtio,file=3D${CDROM},index=3D1,format=3Draw,readonly=3D=
on,media=3Dcdrom \
      -drive if=3Dpflash,format=3Draw,unit=3D0,file=3D/usr/share/AAVMF/AAVM=
F_CODE.fd,readonly=3Don \
      -drive if=3Dpflash,format=3Draw,unit=3D1,file=3D`pwd`/AAVMF_VARS.fd

  Then 4 arrow keys on the physical keyboard are received as just "^[".

  This symptom was not observed on qemu-system-x86_64.
  This symptom was not observed with virt-manager on my arm64 host, neither.
  This seems unique to -display gtk of qemu-system-aarch64.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1907952/+subscriptions


