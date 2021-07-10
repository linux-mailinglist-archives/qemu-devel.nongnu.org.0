Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A32513C32CA
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 06:29:34 +0200 (CEST)
Received: from localhost ([::1]:49212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m24cP-00074H-KX
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 00:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m24Z7-0007nf-RS
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 00:26:09 -0400
Received: from indium.canonical.com ([91.189.90.7]:45010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m24Z5-0000Sy-0J
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 00:26:09 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m24Yy-0003jQ-6U
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 04:26:00 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id BFC722E81F3
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 04:25:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Jul 2021 04:17:37 -0000
From: Launchpad Bug Tracker <1907210@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor kresko5007 th-huth
X-Launchpad-Bug-Reporter: Matic Kres (kresko5007)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160741613811.15859.17314995772376635210.malonedeb@chaenomeles.canonical.com>
Message-Id: <162589065773.5654.10428116150335443215.malone@loganberry.canonical.com>
Subject: [Bug 1907210] Re: QEMU gdbstub command "?" issue
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1b66c075b8638845e61f40eb9036fabeaa01f591"; Instance="production"
X-Launchpad-Hash: b70613ddd00b1b7dad788309c23063f409d730e9
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_HI=-5,
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

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1907210

Title:
  QEMU gdbstub command "?" issue

Status in QEMU:
  Expired

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

