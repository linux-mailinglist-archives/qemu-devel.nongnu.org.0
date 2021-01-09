Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AF82EFDB9
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 05:34:00 +0100 (CET)
Received: from localhost ([::1]:47054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky5wt-0000LD-E1
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 23:33:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5q0-0000BZ-G5
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:26:52 -0500
Received: from indium.canonical.com ([91.189.90.7]:47326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5px-00071A-GW
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:26:52 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ky5pk-0006xq-Sy
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 04:26:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 90AA72E8180
 for <qemu-devel@nongnu.org>; Sat,  9 Jan 2021 04:26:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 Jan 2021 04:17:47 -0000
From: Launchpad Bug Tracker <1698574@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: boot nvidia slow windows7
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor rll-m th-huth
X-Launchpad-Bug-Reporter: Roger Lawhorn (rll-m)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <149772743364.22138.5473878179113955993.malonedeb@soybean.canonical.com>
Message-Id: <161016586807.8490.15224086435410466049.malone@loganberry.canonical.com>
Subject: [Bug 1698574] Re: slow boot windows 7
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: f459b25463ef08c73d66238951a3b6033292b52e
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1698574 <1698574@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1698574

Title:
  slow boot windows 7

Status in QEMU:
  Expired

Bug description:
  Hello,
  I have a nice working qemu with gpu passthrough setup.
  I pass through my nvidia gtx 880m.
  It boots in 4mins 18secs.

  If I remove the "-vga none" switch and allow qemu to create a vga
  adapter I can boot in 1min.

  Why does a normal boot with the nvidia card hang for 3mins (yes, the
  hd light just flickers for that long)?

  Nothing major but I'd like to know, especially if it can be fixed.

  I cannot leave -vga none turned on as the vga adapter grabs up
  resources and the nvidia card complains it cannot start due to lack of
  resources. I'd love to just add resources if possible and keep both
  cards running to get the 1min boot time.

  Here is my script:

  qemu-system-x86_64 -machine type=3Dq35,accel=3Dkvm -cpu host,kvm=3Doff \
  -smp 8,sockets=3D1,cores=3D4,threads=3D2 \
  -bios /usr/share/seabios/bios.bin \
  -serial none \
  -parallel none \
  -vga none \
  -m 7G \
  -mem-prealloc \
  -balloon none \
  -rtc clock=3Dhost,base=3Dlocaltime \
  -device ioh3420,bus=3Dpcie.0,addr=3D1c.0,multifunction=3Don,port=3D1,chas=
sis=3D1,id=3Droot.1 \
  -device vfio-pci,host=3D01:00.0,bus=3Droot.1,addr=3D00.0,multifunction=3D=
on,x-vga=3Don \
  -device virtio-scsi-pci,id=3Dscsi \
  -drive id=3Ddisk0,if=3Dvirtio,cache=3Dnone,format=3Draw,file=3D/home/bob/=
qemu/windows7.img \
  -drive file=3D/home/bob/qemu/qemu2/virtio-win-0.1.126.iso,id=3Disocd,form=
at=3Draw,if=3Dnone -device scsi-cd,drive=3Disocd \
  -netdev type=3Dtap,id=3Dnet0,ifname=3Dtap0 \
  -device virtio-net-pci,netdev=3Dnet0,mac=3D00:16:3e:00:01:01 \
  -usbdevice host:413c:a503 \
  -usbdevice host:13fe:3100 \
  -usbdevice host:0bc2:ab21 \
  -boot menu=3Don \
  -boot order=3Dc


  Here are my specs:

  System:    Host: MSI-GT70-2PE Kernel: 4.8.0-51-generic x86_64 (64 bit gcc=
: 5.4.0)
             Desktop: Cinnamon 3.2.7 (Gtk 3.18.9) Distro: Linux Mint 18.1 S=
erena
  Machine:   Mobo: Micro-Star model: MS-1763 v: REV:0.C Bios: American Mega=
trends v: E1763IMS.51B date: 01/29/2015
  CPU:       Quad core Intel Core i7-4810MQ (-HT-MCP-) cache: 6144 KB
             flags: (lm nx sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx) bmips: 22=
348
             clock speeds: max: 2801 MHz 1: 2801 MHz 2: 800 MHz 3: 900 MHz =
4: 900 MHz 5: 900 MHz 6: 1700 MHz
             7: 800 MHz 8: 900 MHz
  Graphics:  Card-1: Intel 4th Gen Core Processor Integrated Graphics Contr=
oller bus-ID: 00:02.0
             Card-2: NVIDIA GK104M [GeForce GTX 880M] bus-ID: 01:00.0
             Display Server: X.Org 1.18.4 driver: nvidia Resolution: 1920x1=
080@60.00hz
             GLX Renderer: GeForce GTX 880M/PCIe/SSE2 GLX Version: 4.5.0 NV=
IDIA 375.66
  Direct Rendering: Yes

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1698574/+subscriptions

