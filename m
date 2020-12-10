Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B562D5783
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 10:49:04 +0100 (CET)
Received: from localhost ([::1]:56668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knIZL-0004ZC-AK
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 04:49:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knICd-00086M-N2
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:25:35 -0500
Received: from indium.canonical.com ([91.189.90.7]:36568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knICY-0008SE-1o
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:25:35 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1knICW-00088D-R3
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:25:28 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C80C72E8042
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:25:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Dec 2020 09:14:05 -0000
From: Thomas Huth <1597138@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: sgbarber th-huth
X-Launchpad-Bug-Reporter: Shannon Barber (sgbarber)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160628234609.30466.21966.malonedeb@chaenomeles.canonical.com>
Message-Id: <160759164599.31738.16376998443499479658.malone@soybean.canonical.com>
Subject: [Bug 1597138] Re: Deadlock on Windows 10 pop-up
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: aae2a6d5a0cd16cbc4fe26fb4db69801f7e9736d
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
Reply-To: Bug 1597138 <1597138@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has be

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1597138

Title:
  Deadlock on Windows 10 pop-up

Status in QEMU:
  Incomplete

Bug description:
  I was able to install and can log in but whenever a pop-up is attempted t=
he VM appears to deadlock.
  I can still kill -9 the process and recover but the VM and the QEmu conso=
le both hang with no error output.

  At first I thought it was UAC but renaming a file causes a pop-up and tha=
t also deadlocks.
  I rebuilt QEmu 2.6.0 with debug info and did a thread back-trace once the=
 deadlock occurs.
  See the attachment for the trace.

  I am attempting to setup GPU pass-thru with a GTX 970 but this
  deadlock occurs with -vga std (and no GPU pass-thru) as well.

  (I cannot install or start Windows 7 but I am told this is a known
  bug.)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1597138/+subscriptions

