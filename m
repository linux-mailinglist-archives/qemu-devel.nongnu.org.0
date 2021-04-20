Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BABBB365413
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 10:28:48 +0200 (CEST)
Received: from localhost ([::1]:54888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYlkV-0006Eq-6h
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 04:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYliq-0004jq-HF
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:27:04 -0400
Received: from indium.canonical.com ([91.189.90.7]:58886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYlim-0002ZK-O9
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:27:04 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYlij-00028H-OJ
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:26:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 050772E8189
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:26:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Apr 2021 08:19:00 -0000
From: Thomas Huth <1814381@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: rjones-redhat th-huth
X-Launchpad-Bug-Reporter: Richard Jones (rjones-redhat)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154911433612.20173.9806415794048827550.malonedeb@wampee.canonical.com>
Message-Id: <161890674072.6478.10905083508244272314.malone@soybean.canonical.com>
Subject: [Bug 1814381] Re: qemu can't resolve ::1 when no network is available
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="8932ab84469600dc3d8b3344fb7135c702d5179e"; Instance="production"
X-Launchpad-Hash: 64d81ed8c763b892283ed717cd9daa08fd0727bd
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
Reply-To: Bug 1814381 <1814381@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1814381

Title:
  qemu can't resolve ::1 when no network is available

Status in QEMU:
  Incomplete

Bug description:
  I'm not sure if this is a qemu thing or a getaddrinfo/glibc thing, or
  even just something about my laptop.  However we have a test failure
  in nbdkit which only occurs when my laptop is not connected to wifi or
  other networking.  It boils down to:

  =C2=A0=C2=A0$ qemu-img info --image-opts "file.driver=3Dnbd,file.host=3D:=
:1,file.port=3D1234"
  =C2=A0=C2=A0qemu-img: Could not open 'file.driver=3Dnbd,file.host=3D::1,f=
ile.port=3D1234': address resolution failed for ::1:1234: Address family fo=
r hostname not supported

  In a successful case it should connect to a local NBD server on port
  1234, but if you don't have that you will see:

  =C2=A0=C2=A0qemu-img: Could not open
  'file.driver=3Dnbd,file.host=3D::1,file.port=3D1234': Failed to connect
  socket: Connection refused

  I can =E2=80=98ping6 ::1=E2=80=99 fine.

  It also works if I replace =E2=80=98::1=E2=80=99 with =E2=80=98localhost6=
=E2=80=99.

  My /etc/hosts contains:

  127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdo=
main4
  ::1         localhost localhost.localdomain localhost6 localhost6.localdo=
main6

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1814381/+subscriptions

