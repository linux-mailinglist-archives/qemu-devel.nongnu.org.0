Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F5A27CE89
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Sep 2020 15:08:21 +0200 (CEST)
Received: from localhost ([::1]:46746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNFMi-0002eT-GK
	for lists+qemu-devel@lfdr.de; Tue, 29 Sep 2020 09:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kNFKe-0000zK-Ii
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 09:06:14 -0400
Received: from indium.canonical.com ([91.189.90.7]:44236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kNFKV-0004dg-P2
 for qemu-devel@nongnu.org; Tue, 29 Sep 2020 09:06:12 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kNFKT-000176-G2
 for <qemu-devel@nongnu.org>; Tue, 29 Sep 2020 13:06:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6AE7E2E80E7
 for <qemu-devel@nongnu.org>; Tue, 29 Sep 2020 13:06:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2020 12:59:28 -0000
From: Robie Basak <1849644@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Fix Released; importance=Undecided; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=focal; sourcepackage=qemu; 
 component=main; status=Fix Committed; importance=Low;
 assignee=None; 
X-Launchpad-Bug-Tags: verification-needed verification-needed-focal
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange laurent-vivier npes87184 paelzer racb
 samuel-t
X-Launchpad-Bug-Reporter: Samuel (samuel-t)
X-Launchpad-Bug-Modifier: Robie Basak (racb)
References: <157191258679.29920.9268940625941119092.malonedeb@soybean.canonical.com>
Message-Id: <160138436837.23914.2103804164761134137.malone@wampee.canonical.com>
Subject: [Bug 1849644] Re: QEMU VNC websocket proxy requires non-standard
 'binary' subprotocol
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d685c0a40836eb9844ed835c9700f20633c1d7af"; Instance="production"
X-Launchpad-Hash: f1d7c8ae38891a357a4c3a32a2da6a22494bcf96
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/29 09:06:02
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.199, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1849644 <1849644@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Samuel, or anyone else affected,

Accepted qemu into focal-proposed. The package will build now and be
available at https://launchpad.net/ubuntu/+source/qemu/1:4.2-3ubuntu6.7
in a few hours, and then in the -proposed repository.

Please help us by testing this new package.  See
https://wiki.ubuntu.com/Testing/EnableProposed for documentation on how
to enable and use -proposed.  Your feedback will aid us getting this
update out to other Ubuntu users.

If this package fixes the bug for you, please add a comment to this bug,
mentioning the version of the package you tested, what testing has been
performed on the package and change the tag from verification-needed-
focal to verification-done-focal. If it does not fix the bug for you,
please add a comment stating that, and change the tag to verification-
failed-focal. In either case, without details of your testing we will
not be able to proceed.

Further information regarding the verification process can be found at
https://wiki.ubuntu.com/QATeam/PerformingSRUVerification .  Thank you in
advance for helping!

N.B. The updated package will be released to -updates after the bug(s)
fixed by this package have been verified and the package has been in
-proposed for a minimum of 7 days.

** Changed in: qemu (Ubuntu Focal)
       Status: In Progress =3D> Fix Committed

** Tags added: verification-needed verification-needed-focal

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1849644

Title:
  QEMU VNC websocket proxy requires non-standard 'binary' subprotocol

Status in QEMU:
  Fix Released
Status in qemu package in Ubuntu:
  Fix Released
Status in qemu source package in Focal:
  Fix Committed

Bug description:
  [Impact]

   * The exact details of the protocol/subprotocal was slightly unclear
     between the projects. So qemu ended up insisting on "binary" being
     used but newer noVNC clients no more used it.

   * Qemu got fixed in 5.0 to be more tolerant and accept an empty sub-
     protocol as well. This SRU backports that fix to Focal.

  [Test Case]

   * Without the fix the following will "Failed to connect", but with
  the fix it will work.

  $ sudo apt install qemu-system-x86
  # will only boot into a failing bootloader, but that is enough
  $ qemu-system-x86_64 -vnc :0,websocket
  # We need version 1.2 or later, so use the snap
  $ snap install novnc
  $ novnc --vnc localhost:5700
  Connect browser to http://<IP>:6080/vnc.html
  Click "Connect"

   * Cross check with an older noVNC (e.g. the one in Focal) if the =

     connectivity still works on those as well

     - Reminders when switching between the noVNC implementations
       - always refresh the browser with all clear ctrl+alt+f5
       - start/stop the snapped one via snap.novnc.novncsvc.service

  [Regression Potential]

   * This is exclusive to the functionality of noVNC, so regressions would =

     have to be expected in there. The tests try to exercise the basics, but
     e.g. Openstack would be a major product using =


  [Other Info]
   =

   * The noVNC in Focal itself does not yet have the offending change, but
     we want the qemu in focal to be connecteable from ~any type of client


  ---


  =

  When running a machine using "-vnc" and the "websocket" option QEMU seems=
 to require the subprotocol called 'binary'. This subprotocol does not exis=
t in the WebSocket specification. In fact it has never existed in the spec,=
 in one of the very early drafts of WebSockets it was briefly mentioned but=
 it never made it to a final version.

  When the WebSocket server requires a non-standard subprotocol any
  WebSocket client that works correctly won't be able to connect.

  One example of such a client is noVNC, it tells the server that it
  doesn't want to use any subprotocol. QEMU's WebSocket proxy doesn't
  let noVNC connect. If noVNC is modified to ask for 'binary' it will
  work, this is, however, incorrect behavior.

  Looking at the code in "io/channel-websock.c" it seems it's quite
  hard-coded to binary:

  Look at line 58 and 433 here:
  https://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dio/channel-websock.c

  This code has to be made more dynamic, and shouldn't require binary.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1849644/+subscriptions

