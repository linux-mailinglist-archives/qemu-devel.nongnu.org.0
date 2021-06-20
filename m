Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4200B3ADCCA
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 06:29:25 +0200 (CEST)
Received: from localhost ([::1]:52992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lup5I-0007zC-9W
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 00:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lup25-0008Ft-1y
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:26:05 -0400
Received: from indium.canonical.com ([91.189.90.7]:45554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lup22-0002nH-Ni
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:26:04 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lup1y-0003g9-Jw
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 04:25:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9AFE72E821A
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 04:25:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Jun 2021 04:17:29 -0000
From: Launchpad Bug Tracker <1814381@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor rjones-redhat th-huth
X-Launchpad-Bug-Reporter: Richard Jones (rjones-redhat)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <154911433612.20173.9806415794048827550.malonedeb@wampee.canonical.com>
Message-Id: <162416265006.7948.3093793181373172023.malone@loganberry.canonical.com>
Subject: [Bug 1814381] Re: qemu can't resolve ::1 when no network is available
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: 6a85274b631fc9b67da0a190d183d1c6c8562fe4
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

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1814381

Title:
  qemu can't resolve ::1 when no network is available

Status in QEMU:
  Expired

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

