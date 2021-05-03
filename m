Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B80371DBF
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:07:17 +0200 (CEST)
Received: from localhost ([::1]:34520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldc2O-0004m0-Qr
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldbuv-0006sX-GE
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:59:34 -0400
Received: from indium.canonical.com ([91.189.90.7]:36372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldbuq-0005fg-JI
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:59:33 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldbuo-0005BU-IT
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 16:59:26 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 87EE92E8135
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 16:59:26 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 16:47:57 -0000
From: Thomas Huth <1377095@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: hotplug pass-through printer usb
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 123p th-huth
X-Launchpad-Bug-Reporter: 123p (123p)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20141003105035.5331.35277.malonedeb@wampee.canonical.com>
Message-Id: <162006047764.4988.9799073310138044042.malone@chaenomeles.canonical.com>
Subject: [Bug 1377095] Re: KVM guest VM does not reattach a throughpassed USB
 printer from Host after switching printer off and on
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 0f4cd7f0fdfd42533465a00aff8758d6c6f79e05
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1377095 <1377095@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/110


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #110
   https://gitlab.com/qemu-project/qemu/-/issues/110

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1377095

Title:
  KVM guest VM does not reattach a throughpassed USB printer from Host
  after switching printer off and on

Status in QEMU:
  Expired

Bug description:
  =

  Host OS: Gentoo, all packages built 2014-10-01

  qemu version 2.1.0-r1

  Linux kernel 3.14.14   x86_64 Intel(R) Core(TM) i3-3220T CPU @ 2.80GHz
  GenuineIntel GNU/Linux

  =

  Guest VM: Debian 7 (Wheezy) Linux 3.2.0 686

  =

  Start command:
  /usr/bin/qemu-system-i386 -enable-kvm -name wheezy -k de -serial null -pa=
rallel null -hda /var/kvm/wheezy.kvm-img -daemonize -net nic,macaddr=3D02:0=
0:00:00:01:31 -net tap,ifname=3Dtap3,script=3Dno,downscript=3Dno -m 512 -pi=
dfile /var/run/kvm/wheezy.pid -usb -usbdevice tablet -runas myuser -vnc 127=
.0.0.1:3 -usbdevice host:04e8:3242

  Problem:
  USB printer pass-through from KVM host to guest vm only works if I start =
the qemu kvm when the USB printer (vendor/product ID 04e8:3242) is switched=
 on and therefore shown in lsusb on the host. Then it is available in the s=
tarted VM.

  But when I switch the usb printer attached to the host off, it
  disappears in lsusb both on the host and the VM (as expected) but when
  I switch the USB printer on again, it is shown on the host and also on
  the QEMU Monitor (Crtl Alt Shift 2 -> info usbhost), but in the VM
  lsusb does not show it again- so USB pass-through / hot plugging does
  not work. It worked with a previous Version of qemu (1.0 or
  something).

  That is very annoying, because every time I want to print something, I ne=
ed to shutdown the VM, start the printer, and then start the VM (which runs=
 cups as printer server).
  But after printing, I do not want the printer to keep running, so I switc=
h it off.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1377095/+subscriptions

