Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D39113BC5AD
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 06:43:29 +0200 (CEST)
Received: from localhost ([::1]:49312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0cvg-0004q6-PK
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 00:43:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfd-0000Hb-JM
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:52508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfb-0003PV-U9
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0cfN-0004wp-ND
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 04:26:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9C00D2E832F
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 04:26:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Jul 2021 04:17:26 -0000
From: Launchpad Bug Tracker <1872644@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: hvf macos
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor js1943 sitsofe th-huth
X-Launchpad-Bug-Reporter: JS (js1943)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <158684876015.5950.10208526082243977591.malonedeb@chaenomeles.canonical.com>
Message-Id: <162554504663.7821.11743460492723740729.malone@loganberry.canonical.com>
Subject: [Bug 1872644] Re: MacOS host qemu-system-x86_64 -cpu host not working
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: bf1a121a71130fdafb323be7e2c0ae8dc2368f28
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
Reply-To: Bug 1872644 <1872644@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1872644

Title:
  MacOS host qemu-system-x86_64 -cpu host not working

Status in QEMU:
  Expired

Bug description:
  MacOS: 10.15.4
  uname -a: Linux door 4.15.0-96-generic #97-Ubuntu SMP Wed Apr 1 03:25:46 =
UTC 2020 x86_64 x86_64 x86_64 GNU/Linux

  I am using qemu on mac host, with ubuntu client.

  I used to have "-cpu host" in my qemu command as follow:-

  qemu-system-x86_64 \
  -no-user-config \
  -nodefaults \
  -name u64d01 \
  -show-cursor \
  -M q35,accel=3Dhvf,usb=3Doff,vmport=3Doff \
  -cpu host \
  -m 8192M \
  -smp 4 \
  -rtc base=3Dutc,clock=3Dhost \
  -device virtio-blk-pci,drive=3Dssd1 \
  -drive id=3Dssd1,file=3D/Users/js/code/vm/qemu/u64d01.qcow2,if=3Dnone,for=
mat=3Dqcow2 \
  -device virtio-net-pci,netdev=3Dnic1,mac=3D52:54:98:76:54:33 \
  -netdev user,id=3Dnic1,ipv4=3Don,ipv6=3Don,hostname=3Du64d01,hostfwd=3Dtc=
p::2222-:22 \
  -device virtio-tablet-pci \
  -device virtio-vga \
  -device ich9-intel-hda,id=3Dsnd,msi=3Don \
  -device hda-output,id=3Dsnd-codec0,bus=3Dsnd.0,cad=3D0,audiodev=3Dsnd0 \
  -audiodev coreaudio,id=3Dsnd0

  Base on log of one of the vm, it was definitely working on
  2020-01-17(base on journal inside vm), with qemu 4.2.0, which I
  installed with brew.

  The only way to make it work is to remove "-cpu host".

  Already tried with 4.1.1, 4.2 and 5.0rc2. Same result.

  To reproduce, try above with a Ubuntu 18.04 installation cd. Client
  will crash during kernel loading.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1872644/+subscriptions

