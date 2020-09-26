Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C955279B27
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Sep 2020 19:07:33 +0200 (CEST)
Received: from localhost ([::1]:39700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kMDfY-0000Ty-6e
	for lists+qemu-devel@lfdr.de; Sat, 26 Sep 2020 13:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kMDdi-0007eh-8J
 for qemu-devel@nongnu.org; Sat, 26 Sep 2020 13:05:38 -0400
Received: from indium.canonical.com ([91.189.90.7]:44842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kMDdg-0004F7-Er
 for qemu-devel@nongnu.org; Sat, 26 Sep 2020 13:05:37 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kMDde-00012D-Qw
 for <qemu-devel@nongnu.org>; Sat, 26 Sep 2020 17:05:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C63C82E80AB
 for <qemu-devel@nongnu.org>; Sat, 26 Sep 2020 17:05:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2020 16:56:49 -0000
From: Thomas Huth <1721952@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jom-3 stefanha
X-Launchpad-Bug-Reporter: Joan Moreau (jom-3)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <150737816601.1214.11131017369010701335.malonedeb@chaenomeles.canonical.com>
Message-Id: <160113940972.9482.4794306278902316789.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1721952] Re: Network issue above 2.5.1.1
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a314d157ca9be8d00eae0214fc0d7dff1cd406e4"; Instance="production"
X-Launchpad-Hash: 0ae6efa25411286712650c2b29cbff88105d6220
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/26 13:05:34
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1721952 <1721952@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1721952

Title:
  Network issue above 2.5.1.1

Status in QEMU:
  Incomplete

Bug description:
  Hi,
  WHen running a QEMU guest (Windows7) on a linux x86-64 server, the networ=
k stops working after some time for any version above 2.5.1.1

  In 2.5.1.1, all is fine (no issue with network)
  Any version ablve (trying 2.10.1 now), the application in windows stops a=
ccessing the internet after a while

  THis is my starting line:
  /usr/bin/qemu-system-x86_64 -machine pc-i440fx-1.7,accel=3Dkvm -usb -usbd=
evice tablet -usbdevice keyboard -enable-kvm -cpu core2duo -smp 2 -drive fi=
le=3Dwinpro.qcow,index=3D0,media=3Ddisk,format=3Dqco
  w2 -m 4096 -vga vmware -vnc :3 -k en-us -device e1000,netdev=3Dnic1 -netd=
ev user,id=3Dnic1,smb=3D/data/vps/files/,hostfwd=3Dtcp::10053-:10053,hostfw=
d=3Dtcp::3387-:3389 -rtc base=3Dutc,clock=3Dhost -daemon
  ize

  Thisis my configure line:
  ./configure --prefix=3D/usr --sysconfdir=3D/etc --localstatedir=3D/var --=
enable-kvm --disable-gtk --disable-xen --disable-user --enable-vnc-sasl --d=
isable-libusb --disable-debug-info --disable-spi
  ce --enable-lzo --enable-pie --disable-werror --enable-linux-aio --enable=
-vhost-net --disable-tcmalloc --enable-vde --enable-nettle --disable-smartc=
ard --enable-curl

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1721952/+subscriptions

