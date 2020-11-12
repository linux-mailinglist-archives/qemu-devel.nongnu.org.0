Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F86E2B01DF
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 10:17:42 +0100 (CET)
Received: from localhost ([::1]:34024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd8jd-0001Nq-El
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 04:17:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kd8iE-00007M-EX
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 04:16:14 -0500
Received: from indium.canonical.com ([91.189.90.7]:50074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kd8i9-00059I-DC
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 04:16:14 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kd8i6-0002dB-Ui
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 09:16:06 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E44452E80EA
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 09:16:06 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2020 08:59:36 -0000
From: Thomas Huth <761469@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=fedora; sourcepackage=None; component=None;
 status=Won't Fix; importance=High; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bug-redhat-bugs cole-redhat-bugs
 daniel-redhat-bugs david-redhat-bugs fedora-redhat-bugs jan-redhat-bugs
 need-redhat-bugs neil-aldur neil-redhat-bugs th-huth
X-Launchpad-Bug-Reporter: Neil Wilson (neil-aldur)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20110415072945.23093.78774.malonedeb@wampee.canonical.com>
Message-Id: <160517157640.29822.8466556436983688004.malone@chaenomeles.canonical.com>
Subject: [Bug 761469] Re: multicast VPN breaks IPv6 Duplicate Address Detection
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9218c6cee10bde7201ace93cd659634a9bc6c70a"; Instance="production"
X-Launchpad-Hash: 203d3902d88c1fd069c2fb878a89225f3c33de85
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 01:35:39
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
Reply-To: Bug 761469 <761469@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/761469

Title:
  multicast VPN breaks IPv6 Duplicate Address Detection

Status in QEMU:
  Incomplete
Status in Fedora:
  Won't Fix

Bug description:
  The multicast VPN facility in Qemu uses Multicast Loopback to make
  sure that other Qemu processes on the Host server receive the
  transmission. The side effect of this is that the process sending the
  packet also gets the packet back on its receive channel and currently
  this is not filtered but passed directly to the Virtual Machine.

  You can see this effect by running tcpdump in the virtual machine.
  Every packet sent appears to be duplicated.

  For IPv4 it doesn't appear to cause much of a problem, however with
  IPv6 the duplicate neighbor solicitation packet is precisely what the
  system uses to detect duplicate addresses. So IPv6 addresses fail to
  establish.

  If you run 'ip addr' on a virtual Linux machine with IPv6 enabled you
  will see 'dadfailed' next to the link local address. 'ping6' will then
  not work.

  Checked against 0.12.1.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/761469/+subscriptions

