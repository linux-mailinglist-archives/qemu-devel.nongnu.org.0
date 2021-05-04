Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76503372721
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 10:23:21 +0200 (CEST)
Received: from localhost ([::1]:47124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldqKu-0005Iy-Ju
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 04:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldqHl-0001qD-4w
 for qemu-devel@nongnu.org; Tue, 04 May 2021 04:20:05 -0400
Received: from indium.canonical.com ([91.189.90.7]:46846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldqHi-0003Ti-8m
 for qemu-devel@nongnu.org; Tue, 04 May 2021 04:20:04 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldqHg-0001FK-Mj
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 08:20:00 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A441A2E818D
 for <qemu-devel@nongnu.org>; Tue,  4 May 2021 08:20:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 May 2021 08:05:16 -0000
From: Thomas Huth <1618301@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: mouse ps2
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: 3u-mail kjonca th-huth
X-Launchpad-Bug-Reporter: nivekuil (3u-mail)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160830031518.12252.40741.malonedeb@chaenomeles.canonical.com>
Message-Id: <162011551630.11857.16038892491616794544.malone@soybean.canonical.com>
Subject: [Bug 1618301] Re: qemu-input: Mouse stops working in Windows guest
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 641c5d07ec490e4ed963069c873403e5b45bf808
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
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

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/126


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #126
   https://gitlab.com/qemu-project/qemu/-/issues/126

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1618301

Title:
  qemu-input: Mouse stops working in Windows guest

Status in QEMU:
  Expired

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

