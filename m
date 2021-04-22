Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD9C3678DB
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 06:47:19 +0200 (CEST)
Received: from localhost ([::1]:53612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZRFG-0008EU-Am
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 00:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZRCy-0006yF-7s
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:44:56 -0400
Received: from indium.canonical.com ([91.189.90.7]:45968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZRCw-0005IM-F9
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:44:56 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZRCu-00088k-W9
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:44:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id DC8F52E815F
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:44:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 04:33:27 -0000
From: Thomas Huth <1388735@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: megaexception mjt+launchpad-tls th-huth
X-Launchpad-Bug-Reporter: Sergey (megaexception)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20141103075552.9513.99504.malonedeb@chaenomeles.canonical.com>
Message-Id: <161906600785.10223.7439919691089412629.malone@wampee.canonical.com>
Subject: [Bug 1388735] Re: QEMU no longer allows to use full TCP port range
 for VNC
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 0a32b6f409f6f0b2dcb4cd0f995f36e921eec972
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
Reply-To: Bug 1388735 <1388735@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1388735

Title:
  QEMU no longer allows to use full TCP port range for VNC

Status in QEMU:
  Incomplete

Bug description:
  After upgrade to QEMU version 2.1.0 (Debian 2.1+dfsg-4ubuntu6), I am no l=
onger able to use any TCP port for VNC display.
  For example, if I need to assign VNC server a TCP port 443, I used to run:
  # qemu-system-x86_64 -vnc :-5457
  qemu-system-x86_64: Failed to start VNC server on `:-1000': can't convert=
 to a number:-5457
  expected behavior: as any VNC software, take port base of 5900, substract=
 5457 display number, and use TCP port 443

  I ask to change vnc port conversion routine to allow input values in
  range of all TCP ports, from 1 to 65535.

  I really depend on ability to use full TCP range for VNC port numbers,
  and inablity to do so in new version of QEMU is very disappointing.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1388735/+subscriptions

