Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B28936786D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 06:17:32 +0200 (CEST)
Received: from localhost ([::1]:36120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZQmR-0001oq-Mt
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 00:17:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZQkq-0008VS-58
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:15:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:43358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZQkm-0004kd-UJ
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:15:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZQkl-00061C-LW
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:15:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A18B72E8026
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:15:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 04:08:06 -0000
From: Thomas Huth <1719689@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Tags: feature-request
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: erichspaker th-huth
X-Launchpad-Bug-Reporter: Erich Spaker (erichspaker)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <150644549574.30872.12487281678930398558.malonedeb@wampee.canonical.com>
Message-Id: <161906448630.23242.1198878878295712134.malone@gac.canonical.com>
Subject: [Bug 1719689] Re: [feature request] add flag to treat warnings as
 errors
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 62f23f7f59731652357105df02e45e239ca711b6
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
Reply-To: Bug 1719689 <1719689@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1719689

Title:
  [feature request] add flag to treat warnings as errors

Status in QEMU:
  Incomplete

Bug description:
  Since booting could potentially take a lot of time and warnings are
  likely to indicate that something is wrong, it would be useful to have
  a command line flag which would abort the boot if there are any
  warnings.

  An example might be network configuration. The following output most
  likely indicates that there is something the user has to fix before
  starting and being able to use the guest os.

  Warning: hub port hub0port0 has no peer
  Warning: vlan 0 with no nics
  Warning: netdev hub0port0 has no peer
  Warning: requested NIC (anonymous, model vitrio-net-device) was not creat=
ed (not supported by this machine?)

  Ideally, there would be an option the user could pass which would
  cause qemu to print these warnings then exit, rather than boot the
  kernel.

  Alternatively, or additionally, a dry run option would be helpful for
  the same purpose: making sure qemu get to the booting the kernel stage
  with everything in working order so that you do not have to wait for
  the kernel to boot and then shut down while debugging things like
  networking (things which can be debugged (at least partially) without
  booting, or trying to boot, the guest os).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1719689/+subscriptions

