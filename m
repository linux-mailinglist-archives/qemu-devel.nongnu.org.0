Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0237365480
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 10:47:30 +0200 (CEST)
Received: from localhost ([::1]:42428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYm2b-0007i7-Qf
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 04:47:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYlrh-0007mR-Q2
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:36:14 -0400
Received: from indium.canonical.com ([91.189.90.7]:33846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYlrZ-0007m9-VA
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:36:13 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYlrW-0004ti-R3
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:36:03 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E56BB2E818E
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:35:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Apr 2021 08:28:09 -0000
From: Thomas Huth <1821131@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: iiordanov th-huth
X-Launchpad-Bug-Reporter: Iordan Iordanov (iiordanov)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155314518422.9752.10319580179667444419.malonedeb@wampee.canonical.com>
Message-Id: <161890729030.5337.14845785094831354964.malone@soybean.canonical.com>
Subject: [Bug 1821131] Re: VM running under latest Qemu receives 2, 3, 8,
 and = when sent the keysyms for @, #, *, and + respectively
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="8932ab84469600dc3d8b3344fb7135c702d5179e"; Instance="production"
X-Launchpad-Hash: 8d90ce2767a8ac2bd025631c689b6aef896a790f
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
Reply-To: Bug 1821131 <1821131@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1821131

Title:
  VM running under latest Qemu receives 2, 3, 8, and =3D when sent the
  keysyms for @, #, *, and + respectively

Status in QEMU:
  Incomplete

Bug description:
  Git commit hash where bug was reproduced:
  62a172e6a77d9072bb1a18f295ce0fcf4b90a4f2

  A user of my application bVNC reported that when he connects to his
  VMs running under Qemu, he cannot send @, #, and *. Instead, 2, 3, and
  8 appear in the VM respectively. I built the latest Qemu from source,
  and reproduced the issue.

  bVNC converts keycodes or unicode characters that the Android keyboard
  sends it to corresponding keysyms. For example, it sends keysym 64 for
  @ rather than sending SHIFT+2.

  A debug log of the application sending the keysyms shows metaState =3D=3D
  0, indicating lack of modifier keys.

  When 2 appears in place of @:

  03-21 00:11:21.761  8864  8864 I RemoteKeyboard: Sending key. Down: true,=
 key: 64. keysym:64, metaState: 0
  03-21 00:11:21.763  8864  8864 I RemoteKeyboard: Sending key. Down: false=
, key: 64. keysym:64, metaState: 0

  When 3 appears in place of #:

  03-21 00:11:08.947  8864  8864 I RemoteKeyboard: Sending key. Down: true,=
 key: 35. keysym:35, metaState: 0
  03-21 00:11:08.950  8864  8864 I RemoteKeyboard: Sending key. Down: false=
, key: 35. keysym:35, metaState: 0

  When 0 appears instead of *:

  03-21 00:11:28.586  8864  8864 I RemoteKeyboard: Sending key. Down: true,=
 key: 42. keysym:42, metaState: 0
  03-21 00:11:28.588  8864  8864 I RemoteKeyboard: Sending key. Down: false=
, key: 42. keysym:42, metaState: 0

  When =3D appears instead of +:
  03-21 01:05:40.021 10061 10061 I RemoteKeyboard: Sending key. Down: true,=
 key: 43. keysym:43, metaState: 0
  03-21 01:05:40.022 10061 10061 I RemoteKeyboard: Sending key. Down: false=
, key: 43. keysym:43, metaState: 0

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1821131/+subscriptions

