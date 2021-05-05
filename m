Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5357373965
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 13:30:23 +0200 (CEST)
Received: from localhost ([::1]:33000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leFjS-0004JI-P2
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 07:30:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leFfK-0000kU-M3
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:26:07 -0400
Received: from indium.canonical.com ([91.189.90.7]:49016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leFfC-0002HD-OZ
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:26:06 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1leFf9-0000fZ-Pq
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 11:25:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C0BEE2E804C
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 11:25:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 11:17:25 -0000
From: Thomas Huth <1815371@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=debian; sourcepackage=qemu; component=main;
 status=Confirmed; importance=Unknown; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bigon th-huth
X-Launchpad-Bug-Reporter: Laurent Bigonville (bigon)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154982236357.21816.7244935149831813819.malonedeb@chaenomeles.canonical.com>
Message-Id: <162021344602.6423.15926352074480660392.malone@wampee.canonical.com>
Subject: [Bug 1815371] Re:  SPICE session's connection_id's are not unique
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 558a24f0a917ce61ebaa4a8800d2ad82b7c89d1f
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
Reply-To: Bug 1815371 <1815371@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/163


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #163
   https://gitlab.com/qemu-project/qemu/-/issues/163

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1815371

Title:
   SPICE session's connection_id's are not unique

Status in QEMU:
  Expired
Status in qemu package in Debian:
  Confirmed

Bug description:
  From: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D920897

  =3D=3D=3D=3D=3D

  When creating a virtual machine with qemu (e.g. via libvirt) including
  a SPICE server, the client_id of the SPICE session is not unique. For
  example, starting multiple virtual machines on the same libvirtd, the
  client_id is the same for all virtual machine's SPICE sessions.

  =

  A description of the client_id can be found in

  https://www.spice-space.org/static/docs/spice_protocol.pdf under
  section 2.11. c) :

  =

  "UINT32 connection_id - In case of a new session (i.e., channel type is R=
ED_CHANNEL_MAIN) this field is set to zero, and in response the server will=
 allocate session id and will send it via the RedLinkReply message. In case=
 of all other channel types, this field will be equal to the allocated sess=
ion id"

  =

  The relevant code for generating client ids in libspice-server1 can be fo=
und here: https://gitlab.freedesktop.org/spice/spice/blob/v0.12.8/server/re=
ds.c#L1614

  This uses rand() to generate the random id, but qemu (at least in the
  case of qemu-system-x86) fails to initialize the RNG seed (with e.g.
  srand()).

  =

  The result is, that every SPICE session started (by e.g. libvirtd) has th=
e same client_id. Usually, this is not a problem, but running something lik=
e a SPICE proxy, relying on the client_id to correctly route connections, t=
his creates problems.

  =

  Adding something like 'srand(time(NULL));' to qemu (in vl.c) solves this =
issue. Related (as seen in some VNC patches, e.g. 'CVE-2017-15124/04-ui-avo=
id-pointless-VNC-updates-if-framebuffer-isn-t-.patch/ui/vnc.c' ):  srand(ti=
me(NULL)+getpid()+getpid()*987654+rand());

  =

  Tested on Debian 9.7 with kernel  4.9.0-6-amd64 #1 SMP Debian 4.9.88-1+de=
b9u1 (2018-05-07) x86_64 GNU/Linux.


  =3D=3D=3D=3D=3D

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1815371/+subscriptions

