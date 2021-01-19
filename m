Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD492FB290
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 08:14:12 +0100 (CET)
Received: from localhost ([::1]:34570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1lDP-00078z-O0
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 02:14:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1lAY-0005jp-Dx
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 02:11:14 -0500
Received: from indium.canonical.com ([91.189.90.7]:44042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1lAT-0004jU-Cl
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 02:11:14 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l1lAS-0007xW-B3
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:08 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 51B282E8138
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 Jan 2021 06:57:26 -0000
From: Thomas Huth <1811653@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: feihu929 th-huth
X-Launchpad-Bug-Reporter: feihu (feihu929)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154745735839.19444.13981937275377739043.malonedeb@gac.canonical.com>
Message-Id: <161103944624.8524.2940828803357697278.malone@wampee.canonical.com>
Subject: [Bug 1811653] Re: usbredir slow when multi bulk packet per second
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="44709f752aec466e4fba4ac588c69193e99da5ce"; Instance="production"
X-Launchpad-Hash: 21cfff21a8451f200cca172ad2b525b302e2dd78
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
Reply-To: Bug 1811653 <1811653@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1811653

Title:
  usbredir slow when multi bulk packet per second

Status in QEMU:
  Incomplete

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

