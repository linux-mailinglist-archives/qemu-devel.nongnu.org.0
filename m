Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DD3267E37
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Sep 2020 08:55:24 +0200 (CEST)
Received: from localhost ([::1]:46228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHLv1-0006jo-Bw
	for lists+qemu-devel@lfdr.de; Sun, 13 Sep 2020 02:55:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kHLuM-0006KI-NX
 for qemu-devel@nongnu.org; Sun, 13 Sep 2020 02:54:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:35144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kHLuK-0008TS-Ll
 for qemu-devel@nongnu.org; Sun, 13 Sep 2020 02:54:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kHLuH-0006pq-Fb
 for <qemu-devel@nongnu.org>; Sun, 13 Sep 2020 06:54:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6F5FF2E80DB
 for <qemu-devel@nongnu.org>; Sun, 13 Sep 2020 06:54:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2020 06:44:28 -0000
From: kjonca <1618301@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 3u-mail kjonca
X-Launchpad-Bug-Reporter: nivekuil (3u-mail)
X-Launchpad-Bug-Modifier: kjonca (kjonca)
References: <20160830031518.12252.40741.malonedeb@chaenomeles.canonical.com>
Message-Id: <159997946816.2024.11204459017937614158.malone@chaenomeles.canonical.com>
Subject: [Bug 1618301] Re: qemu-input: Mouse stops working in Windows guest
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="83bdf6c8a3a5f87722c8927e54838522f3e57504"; Instance="production"
X-Launchpad-Hash: c0777acd025a26f8151def85b6d06e87315b47fd
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/13 02:54:37
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1618301 <1618301@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Another observation  (not sure if 100% relevant) =

When I leave "Generic PS/2 mouse" as an ONLY pointing device, I can observe=
 erratic moving ("jumping") cursor in (at least) windows guests (NT4 sp 6 ,=
 XP, Win 8.1)

QEMU emulator version 5.0.0 (Debian 1:5.0-6)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1618301

Title:
  qemu-input: Mouse stops working in Windows guest

Status in QEMU:
  New

Bug description:
  ROCCAT Kone XTD mouse will randomly stop working in the guest until
  it's restarted.  Windows Event Viewer shows an error in i8042prt, with
  the message "Could not set the mouse resolution". The XML log:

  - <Event xmlns=3D"http://schemas.microsoft.com/win/2004/08/events/event">
  - <System>
    <Provider Name=3D"i8042prt" /> =

    <EventID Qualifiers=3D"49157">23</EventID> =

    <Level>2</Level> =

    <Task>0</Task> =

    <Keywords>0x80000000000000</Keywords> =

    <TimeCreated SystemTime=3D"2016-08-30T02:52:00.354536300Z" /> =

    <EventRecordID>5708</EventRecordID> =

    <Channel>System</Channel> =

    <Computer>cronus</Computer> =

    <Security /> =

    </System>
  - <EventData>
    <Data /> =

    <Binary>000008000100000000000000170005C03205000000000000000000000000000=
000000000000000000000000000000000</Binary> =

    </EventData>
    </Event>

  Host is running Linux 4.7.2 with QEMU 2.6.1.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1618301/+subscriptions

