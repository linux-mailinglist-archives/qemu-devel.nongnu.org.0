Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D36427800E
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 07:56:49 +0200 (CEST)
Received: from localhost ([::1]:48520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLgiu-0002fO-G8
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 01:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kLgiA-0002EC-Kh
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 01:56:02 -0400
Received: from indium.canonical.com ([91.189.90.7]:58970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kLgi8-0001kI-LC
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 01:56:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kLgi6-0001mN-0g
 for <qemu-devel@nongnu.org>; Fri, 25 Sep 2020 05:55:58 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 042B22E80EE
 for <qemu-devel@nongnu.org>; Fri, 25 Sep 2020 05:55:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2020 05:47:54 -0000
From: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF?= <1849644@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Fix Released; importance=Undecided; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=focal; sourcepackage=qemu; 
 component=main; status=In Progress; importance=Low;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange laurent-vivier npes87184 paelzer samuel-t
X-Launchpad-Bug-Reporter: Samuel (samuel-t)
X-Launchpad-Bug-Modifier: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF_=28paelzer?=
 =?utf-8?q?=29?=
References: <157191258679.29920.9268940625941119092.malonedeb@soybean.canonical.com>
Message-Id: <160101287484.26542.12601182506463721030.launchpad@wampee.canonical.com>
Subject: [Bug 1849644] Re: QEMU VNC websocket proxy requires non-standard
 'binary' subprotocol
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a314d157ca9be8d00eae0214fc0d7dff1cd406e4"; Instance="production"
X-Launchpad-Hash: 0b348cc84df50b4d35324883ba7b49ff6ee51e5c
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/25 01:55:59
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1849644 <1849644@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Description changed:

- When running a machine using "-vnc" and the "websocket" option QEMU
- seems to require the subprotocol called 'binary'. This subprotocol does
- not exist in the WebSocket specification. In fact it has never existed
- in the spec, in one of the very early drafts of WebSockets it was
- briefly mentioned but it never made it to a final version.
+ [Impact]
+ =

+  * The exact details of the protocol/subprotocal was slightly unclear
+    between the projects. So qemu ended up insisting on "binary" being
+    used but newer noVNC clients no more used it.
+ =

+  * Qemu got fixed in 5.0 to be more tolerant and accept an empty sub-
+    protocol as well. This SRU backports that fix to Focal.
+ =

+ [Test Case]
+ =

+  * Without the fix the following will "Failed to connect", but with the
+ fix it will work.
+ =

+ $ sudo apt install qemu-system-x86
+ # will only boot into a failing bootloader, but that is enough
+ $ qemu-system-x86_64 -vnc :0,websocket
+ # We need version 1.2 or later, so use the snap
+ $ snap install novnc
+ $ novnc --vnc localhost:5700
+ Connect browser to http://<IP>:6080/vnc.html
+ Click "Connect"
+ =

+  * Cross check with an older noVNC (e.g. the one in Focal) if the =

+    connectivity still works on those as well
+ =

+    - Reminders when switching between the noVNC implementations
+      - always refresh the browser with all clear ctrl+alt+f5
+      - start/stop the snapped one via snap.novnc.novncsvc.service
+ =

+ [Regression Potential]
+ =

+  * This is exclusive to the functionality of noVNC, so regressions would =

+    have to be expected in there. The tests try to exercise the basics, but
+    e.g. Openstack would be a major product using =

+ =

+ [Other Info]
+  =

+  * The noVNC in Focal itself does not yet have the offending change, but
+    we want the qemu in focal to be connecteable from ~any type of client
+ =

+ =

+ ---
+ =

+ =

+ =

+ When running a machine using "-vnc" and the "websocket" option QEMU seems=
 to require the subprotocol called 'binary'. This subprotocol does not exis=
t in the WebSocket specification. In fact it has never existed in the spec,=
 in one of the very early drafts of WebSockets it was briefly mentioned but=
 it never made it to a final version.
  =

  When the WebSocket server requires a non-standard subprotocol any
  WebSocket client that works correctly won't be able to connect.
  =

  One example of such a client is noVNC, it tells the server that it
  doesn't want to use any subprotocol. QEMU's WebSocket proxy doesn't let
  noVNC connect. If noVNC is modified to ask for 'binary' it will work,
  this is, however, incorrect behavior.
  =

  Looking at the code in "io/channel-websock.c" it seems it's quite hard-
  coded to binary:
  =

  Look at line 58 and 433 here:
  https://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dio/channel-websock.c
  =

  This code has to be made more dynamic, and shouldn't require binary.

** Changed in: qemu (Ubuntu Focal)
       Status: Confirmed =3D> Triaged

** Changed in: qemu (Ubuntu Focal)
       Status: Triaged =3D> In Progress

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
  In Progress

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

