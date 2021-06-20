Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9BD3ADCC7
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 06:27:32 +0200 (CEST)
Received: from localhost ([::1]:44866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lup3T-0002SE-85
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 00:27:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lup21-00087t-T6
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:26:01 -0400
Received: from indium.canonical.com ([91.189.90.7]:45232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lup1y-0002j8-Ck
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:26:01 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lup1t-0003bA-Gw
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 04:25:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 795EE2E81BE
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 04:25:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Jun 2021 04:17:34 -0000
From: Launchpad Bug Tracker <1821131@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: iiordanov janitor th-huth
X-Launchpad-Bug-Reporter: Iordan Iordanov (iiordanov)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <155314518422.9752.10319580179667444419.malonedeb@wampee.canonical.com>
Message-Id: <162416265445.7948.10660061949368629610.malone@loganberry.canonical.com>
Subject: [Bug 1821131] Re: VM running under latest Qemu receives 2, 3, 8,
 and = when sent the keysyms for @, #, *, and + respectively
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: df01a73c1bd38d7f994b42540101dfb89035d63f
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

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1821131

Title:
  VM running under latest Qemu receives 2, 3, 8, and =3D when sent the
  keysyms for @, #, *, and + respectively

Status in QEMU:
  Expired

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

