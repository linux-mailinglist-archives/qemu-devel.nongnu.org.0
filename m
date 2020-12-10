Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 055792D578B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 10:51:36 +0100 (CET)
Received: from localhost ([::1]:35122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knIbh-0007NY-Gj
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 04:51:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knICd-00086q-SX
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:25:35 -0500
Received: from indium.canonical.com ([91.189.90.7]:36592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knICa-0008Up-8p
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:25:35 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1knICY-000898-L0
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:25:30 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9BF7D2E8042
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:25:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Dec 2020 09:12:45 -0000
From: Thomas Huth <1580586@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: freeze
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: none123456 th-huth
X-Launchpad-Bug-Reporter: None (none123456)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160511125051.9523.41725.malonedeb@gac.canonical.com>
Message-Id: <160759156563.15491.12898637366220851567.malone@chaenomeles.canonical.com>
Subject: [Bug 1580586] Re: Qemu WinXP SP3 second loadvm freezes Guest OS
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: 78d3ee5464a6e261e69ea839419d97c6eaac16cf
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
Reply-To: Bug 1580586 <1580586@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1580586

Title:
  Qemu WinXP SP3 second loadvm freezes Guest OS

Status in QEMU:
  Incomplete

Bug description:
  Using Qemu-system-i386 to run WinXP SP3 with the following command
  line:

  qemu-system-i386 -hda qcow2/windowsxp_32bits_dd.qcow2 -m 1024  -net
  user,smb=3D/shared -vga std -net nic,model=3Drtl8139 -rtc
  base=3Dlocaltime,clock=3Dvm -s -snapshot

  savevm works fine, and the first loadvm to the snapshot works
  properly, but the next ones will all freeze the guest OS.

  First I thought it was due to the clock but adding the rtc options did
  not fix it.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1580586/+subscriptions

