Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70EB381853
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 13:31:04 +0200 (CEST)
Received: from localhost ([::1]:57212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhsVb-0006hB-QF
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 07:31:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhsQV-0008Jt-6Z
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:25:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:57008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhsQM-000723-IP
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:25:46 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhsQL-0002Do-0f
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 11:25:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0006A2E8187
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 11:25:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 May 2021 11:18:28 -0000
From: Thomas Huth <1925109@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hjiayz163 th-huth
X-Launchpad-Bug-Reporter: hjiayz (hjiayz163)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161888628706.6044.6118190110754714311.malonedeb@soybean.canonical.com>
Message-Id: <162107750904.21009.7986495960924520119.malone@soybean.canonical.com>
Subject: [Bug 1925109] Re: usbredirparser: bulk transfer length exceeds limits
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: cd95a541c8b22d7d03c7f317e2bcce6ea3075f85
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
Reply-To: Bug 1925109 <1925109@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting the bug state to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" or "Confirmed" within the next 60 days (other-
wise it will get closed as "Expired"). We will then eventually migrate
the ticket automatically to the new system (but you won't be the reporter
of the bug in the new system and thus you won't get notified on changes
anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1925109

Title:
  usbredirparser: bulk transfer length exceeds limits

Status in QEMU:
  Incomplete

Bug description:
  2021-04-20T01:26:36.662244Z qemu-system-x86_64: usbredirparser: bulk tran=
sfer length exceeds limits 131072 > 65536
  2021-04-20T01:26:36.662276Z qemu-system-x86_64: usbredirparser: error usb=
redirparser_send_* call invalid params, please report!!
  2021-04-20T01:26:57.670412Z qemu-system-x86_64: usbredirparser: bulk tran=
sfer length exceeds limits 131072 > 65536
  2021-04-20T01:26:57.670445Z qemu-system-x86_64: usbredirparser: error usb=
redirparser_send_* call invalid params, please report!!
  2021-04-20T01:37:01.920613Z qemu-system-x86_64: usbredirparser: bulk tran=
sfer length exceeds limits 131072 > 65536
  2021-04-20T01:37:01.920624Z qemu-system-x86_64: usbredirparser: error usb=
redirparser_send_* call invalid params, please report!!
  host:
  Linux version 5.11.15-arch1-2 (linux@archlinux) (gcc (GCC) 10.2.0, GNU ld=
 (GNU Binutils) 2.36.1) #1 SMP PREEMPT Sat, 17 Apr 2021 00:22:30 +0000
  guest:
  win10 20H2
  usb device:
  Bus 002 Device 007: ID 0781:55ab SanDisk Corp.  SanDisk 3.2Gen1
  size 250G

  https://gitlab.freedesktop.org/spice/usbredir/-/blob/master/usbredirparse=
r/usbredirparser.c#L32

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1925109/+subscriptions

