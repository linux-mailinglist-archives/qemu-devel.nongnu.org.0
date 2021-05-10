Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 101153797B5
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 21:28:50 +0200 (CEST)
Received: from localhost ([::1]:44284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgBaC-0002jy-VS
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 15:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgBJ2-00026i-8Z
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:11:05 -0400
Received: from indium.canonical.com ([91.189.90.7]:43318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgBIs-000650-8L
 for qemu-devel@nongnu.org; Mon, 10 May 2021 15:11:04 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgBIp-0002B3-29
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 19:10:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 0A8AB2E8135
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 19:10:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 May 2021 19:01:47 -0000
From: Thomas Huth <1907210@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kresko5007 th-huth
X-Launchpad-Bug-Reporter: Matic Kres (kresko5007)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160741613811.15859.17314995772376635210.malonedeb@chaenomeles.canonical.com>
Message-Id: <162067330725.2870.8032577802992457703.malone@wampee.canonical.com>
Subject: [Bug 1907210] Re: QEMU gdbstub command "?" issue
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 06c3f2ae277bf4b690a4c0b2ff4328deada63e8a
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
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
Reply-To: Bug 1907210 <1907210@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1907210

Title:
  QEMU gdbstub command "?" issue

Status in QEMU:
  Incomplete

Bug description:
  I am using some third party GDB client, and I have noticed that every tim=
e "?" command is send from the client, QEMU gdbstub removes all break point=
s. This behaviour is not expected since "?" command should only return stop=
 reason.
  Here is documentation from official gdb:
  =E2=80=98?=E2=80=99 Indicate the reason the target halted. The reply is t=
he same as for step and
  continue. This packet has a special interpretation when the target is in =
non-stop
  mode; see Section E.10 [Remote Non-Stop], page 733.
  Reply: See Section E.3 [Stop Reply Packets], page 693, for the reply spec=
ifications.

  With some help on the irc, we have been able to pin point the failure poi=
nt(in attachement file gdbstub.c).
  Function that handles "?" command has this comment in it:
  =C2=A0=C2=A0=C2=A0=C2=A0/*
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* Remove all the breakpoints when this quer=
y is issued,
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* because gdb is doing an initial connect a=
nd the state
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* should be cleaned up.
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*/
  From which it is clear that developer that wrote that code assumed, that =
because most popular gdb client only uses "?" command at initial connect, i=
t is safe to also remove all BPs.
  In my opinion initial connect should be detected in some other way, and n=
ot with "?" command.
  Also note that official gdbserver does not remove the BPs when this comma=
nd is send, this issue is present in QEMU and apparently also on kgdb(I was=
 told that on irc, have not tested it myself)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1907210/+subscriptions

