Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC217915C
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 18:47:36 +0200 (CEST)
Received: from localhost ([::1]:55136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hs8oB-000882-EU
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 12:47:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33766)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bounces@canonical.com>) id 1hs8mJ-0007IU-0N
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 12:45:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1hs8mH-0000Yz-Id
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 12:45:38 -0400
Received: from indium.canonical.com ([91.189.90.7]:35354)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1hs8mH-0000YT-CU
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 12:45:37 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1hs8mG-0006qR-Bv
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 16:45:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 51CAF2E80D3
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 16:45:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jul 2019 16:37:34 -0000
From: Daniel Berrange <1838312@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=virt-manager;
 component=universe; status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: green-world78
X-Launchpad-Bug-Reporter: Hans Peter (green-world78)
X-Launchpad-Bug-Modifier: Daniel Berrange (berrange)
References: <156441781649.17826.2889969380137011138.malonedeb@gac.canonical.com>
Message-Id: <156441825491.11302.3530391521388377915.launchpad@wampee.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="19010";
 Instance="launchpad-lazr.conf"
X-Launchpad-Hash: f0385a6d833884ee91f8f8b034a57d845a6d08f4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1838312] Re: Qemu virt-manager Segmentation fault
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
Reply-To: Bug 1838312 <1838312@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Also affects: virt-manager (Ubuntu)
   Importance: Undecided
       Status: New

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1838312

Title:
  Qemu virt-manager Segmentation fault

Status in QEMU:
  Invalid
Status in virt-manager package in Ubuntu:
  New

Bug description:
  Hi!

  I installed all these packages:

  sudo apt install qemu
  sudo apt install ipxe-qemu-256k-compat-efi-roms libspice-server1 libbluet=
ooth3
  sudo apt install libbrlapi0.6 libcacard0 libfdt1 libusbredirparser1 libvi=
rglrenderer0 libxen-4.9 libxenstore3.0
  sudo apt install cpu-checker ibverbs-providers ipxe-qemu libibverbs1 libi=
scsi7 libnl-route-3-200 librados2 librbd1 librdmacm1 msr-tools sharutils
  sudo apt install qemu-block-extra qemu-system-common qemu-system-data qem=
u-system-gui qemu-utils
  sudo apt install --no-install-recommends qemu-kvm qemu-system-x86
  sudo apt install libauparse0 ebtables gir1.2-gtk-vnc-2.0 gir1.2-libosinfo=
-1.0 gir1.2-libvirt-glib-1.0 gir1.2-spiceclientglib-2.0 gir1.2-spiceclientg=
tk-3.0 libvde0 libvdeplug2 libgovirt-common libgovirt2 libgtk-vnc-2.0-0 lib=
gvnc-1.0-0 libosinfo-1.0-0 libphodav-2.0-0 libphodav-2.0-common libspice-cl=
ient-glib-2.0-8 libspice-client-gtk-3.0-5 libusbredirhost1 libvirt-clients =
libvirt-daemon libvirt-daemon-driver-storage-rbd libvirt-daemon-system libv=
irt-glib-1.0-0 libvirt0 osinfo-db python3-libvirt python3-libxml2 spice-cli=
ent-glib-usb-acl-helper vde2 vde2-cryptcab virt-viewer virtinst virt-manager

  without the i386 packages for Qemu because I want only 64 bit.

  I installed all these packages without error, but when I run

  # virt-manager

  Output: ...shows me:

  Segmentation fault

  =

  My hardware is 100% ok.
  Maybee a broken lib?


  How can I fix that?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1838312/+subscriptions

