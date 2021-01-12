Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14AEF2F2722
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 05:36:25 +0100 (CET)
Received: from localhost ([::1]:52028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzBPs-0003t8-5C
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 23:36:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzBFk-00086y-91
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:25:57 -0500
Received: from indium.canonical.com ([91.189.90.7]:52038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzBFb-0000sF-6z
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:25:56 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kzBFZ-0004Vt-Od
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:25:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B5AC62E813C
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:25:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Jan 2021 04:17:15 -0000
From: Launchpad Bug Tracker <1794950@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fdmanana2 janitor th-huth
X-Launchpad-Bug-Reporter: Filipe Manana (fdmanana2)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <153813115023.24445.9281522775132548105.malonedeb@gac.canonical.com>
Message-Id: <161042503573.10246.7446214052028719738.malone@loganberry.canonical.com>
Subject: [Bug 1794950] Re: qemu hangs when guest is using linux kernel 4.16+
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe617ea08df036edd5c842aded2b315e1c090677"; Instance="production"
X-Launchpad-Hash: c58d9029236f4edb0da9cb8e22275588b350e3d4
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1794950 <1794950@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1794950

Title:
  qemu hangs when guest is using linux kernel 4.16+

Status in QEMU:
  Expired

Bug description:
  I have been using qemu on daily basis 5+ years in order to do btrfs
  development and testing and it always worked perfectly, until I
  upgraded the linux kernel of the guests to 4.16. With 4.16+ kernels,
  when running all the fstests (previously called xfstests), the qemu
  process hangs (console unresponsive, can't ping or ssh the guest
  anymore, etc) and stays in a state Sl+ according to 'ps'.

  This happens on two different physical machines, one running openSUSE
  tumbleweed (which I don't access at the moment to check kernel
  version) and another running xubuntu (tried kernels 4.15.0-32-generic
  and vanilla 4.18.0). Using any kernel from 4.16 to 4.19-rc5 in the
  guests (they use different debian versions) makes qemu hang running
  the fstests suite (after about 30 to 40 minutes, either at test
  generic/299 or test generic/451).

  I tried different qemu versions, 2.11.2, 2.12.1 and 3.0.0, and it
  happens with all of them (all built from the sources available at
  https://www.qemu.org/download/#source).

  I built 3.0.0 with debug enabled, using the following parameters for
  'configure':

  --prefix=3D/home/fdmanana/qemu-3.0.0 --enable-tools --enable-linux-aio
  --enable-kvm --enable-vnc --enable-vnc-png --enable-debug --extra-
  cflags=3D"-O0 -g3 -fno-omit-frame-pointer"

  And captured a coredump of the qemu process, available at:

  https://www.dropbox.com/s/d1tlsimahykwhla/core_dump_debug.tar.xz?dl=3D0

  the stack traces of all threads, for a quick look:

  https://friendpaste.com/zqkz2pD0WgSdeSKITHPDf

  qemu is being invoked with the following script:

  #!/bin/bash -x

  sudo modprobe tun
  sudo modprobe kvm
  sudo modprobe kvm-intel

  sudo tunctl -t tap5 -u fdmanana
  sudo ifconfig tap5 up
  sudo brctl addif br0 tap5

  sudo umount /mnt/tmp5
  sudo mkdir -p /mnt/tmp5
  sudo mount -t tmpfs -o size=3D14G tmpfs /mnt/tmp5
  for ((i =3D 2; i <=3D 7; i++)); do
          sudo qemu-img create -f qcow2 /mnt/tmp5/disk$i 13G
  done
  sudo chown fdmanana /mnt/tmp5/disk*

  qemu-system-x86_64 -m 4G \
          -device virtio-scsi-pci \
          -boot c \
  \
          -drive if=3Dnone,file=3Ddebian5.qcow2,cache=3Dnone,aio=3Dnative,c=
ache.direct=3Don,format=3Dqcow2,id=3Ddrive0,discard=3Don \
          -device scsi-hd,drive=3Ddrive0,bus=3Dscsi.0 \
  \
          -drive if=3Dnone,file=3D/mnt/tmp5/disk2,cache=3Dwriteback,format=
=3Dqcow2,id=3Ddrive1,discard=3Don \
          -device scsi-hd,drive=3Ddrive1,bus=3Dscsi.0 \
  \
          -drive if=3Dnone,file=3D/mnt/tmp5/disk3,cache=3Dwriteback,format=
=3Dqcow2,id=3Ddrive2,discard=3Don \
          -device scsi-hd,drive=3Ddrive2,bus=3Dscsi.0 \
  \
          -drive if=3Dnone,file=3D/mnt/tmp5/disk4,cache=3Dwriteback,format=
=3Dqcow2,id=3Ddrive3,discard=3Don \
          -device scsi-hd,drive=3Ddrive3,bus=3Dscsi.0 \
  \
          -drive if=3Dnone,file=3D/mnt/tmp5/disk5,cache=3Dwriteback,format=
=3Dqcow2,id=3Ddrive4,discard=3Don \
          -device scsi-hd,drive=3Ddrive4,bus=3Dscsi.0 \
  \
          -drive if=3Dnone,file=3D/mnt/tmp5/disk6,cache=3Dwriteback,format=
=3Dqcow2,id=3Ddrive5,discard=3Don \
          -device scsi-hd,drive=3Ddrive5,bus=3Dscsi.0 \
  \
          -drive if=3Dnone,file=3D/mnt/tmp5/disk7,cache=3Dwriteback,format=
=3Dqcow2,id=3Ddrive6,discard=3Don \
          -device scsi-hd,drive=3Ddrive6,bus=3Dscsi.0 \
  \
          -drive if=3Dnone,file=3Ddisk8,cache=3Dwriteback,aio=3Dnative,cach=
e.direct=3Don,format=3Dqcow2,id=3Ddrive7,discard=3Don \
          -device scsi-hd,drive=3Ddrive7,bus=3Dscsi.0 \
  \
          -drive if=3Dnone,file=3Ddisk9,cache=3Dwriteback,aio=3Dnative,cach=
e.direct=3Don,format=3Dqcow2,id=3Ddrive8,discard=3Don \
          -device scsi-hd,drive=3Ddrive8,bus=3Dscsi.0 \
  \
          -drive if=3Dnone,file=3Ddisk10,cache=3Dwriteback,aio=3Dnative,cac=
he.direct=3Don,format=3Dqcow2,id=3Ddrive9,discard=3Don \
          -device scsi-hd,drive=3Ddrive9,bus=3Dscsi.0 \
  \
          -net nic,macaddr=3D52:54:00:12:34:fa -net tap,ifname=3Dtap5,scrip=
t=3Dno,downscript=3Dno \
          -rtc base=3Dlocaltime -enable-kvm -machine accel=3Dkvm -smp 4 -cp=
u host \
          -k pt -serial tcp:127.0.0.1:9997 -display vnc=3D:5


  Is there anything else I can provided to help debug this?

  Thanks.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1794950/+subscriptions

