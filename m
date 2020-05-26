Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D60491A3812
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Apr 2020 18:32:22 +0200 (CEST)
Received: from localhost ([::1]:52586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMa6H-0005dW-F1
	for lists+qemu-devel@lfdr.de; Thu, 09 Apr 2020 12:32:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57066)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1jMa5T-0005D6-6E
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 12:31:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1jMa5R-0003le-S9
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 12:31:31 -0400
Received: from indium.canonical.com ([91.189.90.7]:37342)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1jMa5R-0003lN-Mt
 for qemu-devel@nongnu.org; Thu, 09 Apr 2020 12:31:29 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jMa5P-00082u-KO
 for <qemu-devel@nongnu.org>; Thu, 09 Apr 2020 16:31:27 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 97D092E8113
 for <qemu-devel@nongnu.org>; Thu,  9 Apr 2020 16:31:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Apr 2020 16:18:37 -0000
From: Frank Heimes <1859656@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=maas; status=Triaged; importance=Low;
 assignee=lee.trager@canonical.com; 
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: product=ubuntu-z-systems; status=Triaged; importance=High;
 assignee=maas; 
X-Launchpad-Bug-Tags: s390x
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: andrew-cloke fheimes ltrager paelzer sfeole
X-Launchpad-Bug-Reporter: Sean Feole (sfeole)
X-Launchpad-Bug-Modifier: Frank Heimes (fheimes)
References: <157902669328.14768.4315907500950527119.malonedeb@wampee.canonical.com>
Message-Id: <158644911744.17284.1369598348282523511.malone@wampee.canonical.com>
Subject: [Bug 1859656] Re: [2.6] Unable to reboot s390x KVM machine after
 initial deploy
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="2e26c9bbd21cdca248baaea29aeffb920afcc32a";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 3b7d785bc16b74927ba6810b8de0fc8d78e3a58a
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1859656 <1859656@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I still think that #29 could be a viable fix for this.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1859656

Title:
  [2.6] Unable to reboot s390x KVM machine after initial deploy

Status in MAAS:
  Triaged
Status in QEMU:
  Incomplete
Status in Ubuntu on IBM z Systems:
  Triaged

Bug description:
  MAAS version: 2.6.1 (7832-g17912cdc9-0ubuntu1~18.04.1)
  Arch: S390x

  Appears that MAAS can not find the s390x bootloader to boot from the
  disk, not sure how maas determines this.  However this was working in
  the past. I had originally thought that if the maas machine was
  deployed then it defaulted to boot from disk.

  If I force the VM to book from disk, the VM starts up as expected.

  Reproduce:

  - Deploy Disco on S390x KVM instance
  - Reboot it

  on the KVM console...

  Connected to domain s2lp6g001
  Escape character is ^]
  done
  =C2=A0=C2=A0Using IPv4 address: 10.246.75.160
  =C2=A0=C2=A0Using TFTP server: 10.246.72.3
  =C2=A0=C2=A0Bootfile name: 'boots390x.bin'
  =C2=A0=C2=A0Receiving data:  0 KBytes
  =C2=A0=C2=A0TFTP error: file not found: boots390x.bin
  Trying pxelinux.cfg files...
  =C2=A0=C2=A0Receiving data:  0 KBytes
  =C2=A0=C2=A0Receiving data:  0 KBytes
  Failed to load OS from network

  =3D=3D> /var/log/maas/rackd.log <=3D=3D
  2020-01-14 18:21:24 provisioningserver.rackdservices.tftp: [info] boots39=
0x.bin requested by 10.246.75.160
  2020-01-14 18:21:24 provisioningserver.rackdservices.tftp: [info] s390x/6=
5a9ca43-9541-49be-b315-e2ca85936ea2 requested by 10.246.75.160
  2020-01-14 18:21:24 provisioningserver.rackdservices.tftp: [info] s390x/0=
1-52-54-00-e5-d7-bb requested by 10.246.75.160
  2020-01-14 18:21:24 provisioningserver.rackdservices.tftp: [info] s390x/0=
AF64BA0 requested by 10.246.75.160
  2020-01-14 18:21:24 provisioningserver.rackdservices.tftp: [info] s390x/0=
AF64BA requested by 10.246.75.160
  2020-01-14 18:21:24 provisioningserver.rackdservices.tftp: [info] s390x/0=
AF64B requested by 10.246.75.160
  2020-01-14 18:21:24 provisioningserver.rackdservices.tftp: [info] s390x/0=
AF64 requested by 10.246.75.160
  2020-01-14 18:21:24 provisioningserver.rackdservices.tftp: [info] s390x/0=
AF6 requested by 10.246.75.160
  2020-01-14 18:21:24 provisioningserver.rackdservices.tftp: [info] s390x/0=
AF requested by 10.246.75.160
  2020-01-14 18:21:24 provisioningserver.rackdservices.tftp: [info] s390x/0=
A requested by 10.246.75.160
  2020-01-14 18:21:24 provisioningserver.rackdservices.tftp: [info] s390x/0=
 requested by 10.246.75.160
  2020-01-14 18:21:24 provisioningserver.rackdservices.tftp: [info] s390x/d=
efault requested by 10.246.75.160

To manage notifications about this bug go to:
https://bugs.launchpad.net/maas/+bug/1859656/+subscriptions

