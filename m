Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C91D43430E0
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Mar 2021 05:31:26 +0100 (CET)
Received: from localhost ([::1]:54968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNpkL-0002jK-SA
	for lists+qemu-devel@lfdr.de; Sun, 21 Mar 2021 00:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lNpfg-0000TP-J0
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 00:26:37 -0400
Received: from indium.canonical.com ([91.189.90.7]:48594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lNpfF-0002dO-PM
 for qemu-devel@nongnu.org; Sun, 21 Mar 2021 00:26:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lNpfC-0003hJ-Tx
 for <qemu-devel@nongnu.org>; Sun, 21 Mar 2021 04:26:07 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 267D92E8216
 for <qemu-devel@nongnu.org>; Sun, 21 Mar 2021 04:26:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 21 Mar 2021 04:17:16 -0000
From: Launchpad Bug Tracker <1811653@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: feihu929 janitor th-huth
X-Launchpad-Bug-Reporter: feihu (feihu929)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <154745735839.19444.13981937275377739043.malonedeb@gac.canonical.com>
Message-Id: <161630023616.2150.13498523769915376178.malone@loganberry.canonical.com>
Subject: [Bug 1811653] Re: usbredir slow when multi bulk packet per second
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4446feb642ca86be4f6eceb855b408397dad6a50"; Instance="production"
X-Launchpad-Hash: 576bf5d128b29318b2c9d59c3d49d348284b220e
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
Reply-To: Bug 1811653 <1811653@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1811653

Title:
  usbredir slow when multi bulk packet per second

Status in QEMU:
  Expired

Bug description:
  QEMU Ver: all version
  Client: virt-viewer with spice
  Guest VM: win7
  Bug description:
  =C2=A0=C2=A0Use Qemu 2.1 or later with usbredir, When I redirect a bulk u=
sb-device from virt-viewer client,the bulk-usb-device driver or app in Gues=
tVM will send 50 bulk-urb per times.
  =C2=A0=C2=A0In VM, using the usblyzer to monitor the usb packet, it show =
these 50 bulk-urb packet (24576 bytes per urb) send in 1ms, But in the QEMU=
 VM log, It shows as below
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  2019-01-14T08:27:26.096809Z qemu-kvm: usb-redir: bulk-out ep 86 stream 0 =
len 49152 id 2114122112 0x7f0ffa300b40
  2019-01-14T08:27:26.105680Z qemu-kvm: usb-redir: bulk-in status 0 ep 86 s=
tream 0 len 49152 id 2114122112 0x7f0ffa300b40
  2019-01-14T08:27:26.108219Z qemu-kvm: usb-redir: bulk-out ep 86 stream 0 =
len 49152 id 2114122112 0x7f0ffa300b40
  2019-01-14T08:27:26.116742Z qemu-kvm: usb-redir: bulk-in status 0 ep 86 s=
tream 0 len 49152 id 2114122112 0x7f0ffa300b40
  2019-01-14T08:27:26.119242Z qemu-kvm: usb-redir: bulk-out ep 86 stream 0 =
len 49152 id 2114122112 0x7f0ffa300b40
  2019-01-14T08:27:26.129851Z qemu-kvm: usb-redir: bulk-in status 0 ep 86 s=
tream 0 len 49152 id 2114122112 0x7f0ffa300b40
  2019-01-14T08:27:26.132349Z qemu-kvm: usb-redir: bulk-out ep 86 stream 0 =
len 49152 id 2114122112 0x7f0ffa300b40
  2019-01-14T08:27:26.141248Z qemu-kvm: usb-redir: bulk-in status 0 ep 86 s=
tream 0 len 49152 id 2114122112 0x7f0ffa300b40
  2019-01-14T08:27:26.144932Z qemu-kvm: usb-redir: bulk-out ep 86 stream 0 =
len 49152 id 2114122112 0x7f0ffa300b40
  2019-01-14T08:27:26.154035Z qemu-kvm: usb-redir: bulk-in status 0 ep 86 s=
tream 0 len 49152 id 2114122112 0x7f0ffa300b40
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

  =C2=A0It shows that the bulk packet is single thread send and recv, per
  bulk packet will use 10-20ms, all 50 bulk-packets will use 500~1000ms,
  so the in the VM, bulk-urb will timeout always!

  =C2=A0=C2=A0How to send the bulk packet by multithread to speedup the bul=
k-urb send and recv, for example:
  ------------
  =C2=A0bulk-out ep 86 stream 0 len 49152 id xxxx1
  =C2=A0bulk-out ep 86 stream 0 len 49152 id xxxx2
  =C2=A0bulk-out ep 86 stream 0 len 49152 id xxxx3
  =C2=A0bulk-out ep 86 stream 0 len 49152 id xxxx4
  =C2=A0bulk-out ...
  =C2=A0bulk-out ep 86 stream 0 len 49152 id xxxx50
  ...
  =C2=A0bulk-in status 0 ep 86 stream 0 len 49152 id xxxx1
  =C2=A0bulk-in status 0 ep 86 stream 0 len 49152 id xxxx2
  =C2=A0bulk-in status 0 ep 86 stream 0 len 49152 id xxxx3
  =C2=A0bulk-in status 0 ep 86 stream 0 len 49152 id xxxx4
  =C2=A0bulk-in ...
  =C2=A0bulk-in status 0 ep 86 stream 0 len 49152 id xxxx50
  ------------

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1811653/+subscriptions

