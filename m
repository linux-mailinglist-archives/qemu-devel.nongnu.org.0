Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5207375F8C
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 06:46:51 +0200 (CEST)
Received: from localhost ([::1]:44404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lesO2-0003yq-WC
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 00:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lesMx-000335-MJ
 for qemu-devel@nongnu.org; Fri, 07 May 2021 00:45:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:37092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lesMv-0001WA-Ok
 for qemu-devel@nongnu.org; Fri, 07 May 2021 00:45:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lesMu-0003vP-D4
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 04:45:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 616462E8186
 for <qemu-devel@nongnu.org>; Fri,  7 May 2021 04:45:40 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 May 2021 04:39:57 -0000
From: Thomas Huth <1888417@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: force-stop hangs nvidia pci reboot
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: lightninjay th-huth
X-Launchpad-Bug-Reporter: Jason (lightninjay)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159535256686.7592.12361820079263274205.malonedeb@wampee.canonical.com>
Message-Id: <162036239805.32626.8951796255657523099.malone@chaenomeles.canonical.com>
Subject: [Bug 1888417] Re: Latest QEMU git build on Arch linux causes PCI
 Passthrough host to hang on guest reboot.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 3e43717e66d0701e6bd08a021fa4f46a8d4b30ef
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
Reply-To: Bug 1888417 <1888417@bugs.launchpad.net>
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
the state back to "New" within the next 60 days (otherwise it will get
closed as "Expired"). We will then eventually migrate the ticket auto-
matically to the new system (but you won't be the reporter of the bug
in the new system and thus won't get notified on changes anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1888417

Title:
  Latest QEMU git build on Arch linux causes PCI Passthrough host to
  hang on guest reboot.

Status in QEMU:
  Incomplete

Bug description:
  Current Arch linux release, up-to-date as of 7/21/2020.

  Running a windows 7 virtual machine (also happens with windows 10,
  possibly more OSes), with an nvidia GTX 1060 passthrough, if the VM is
  attempted to be restarted, either through the guest interface, or by
  libvirt's gui interface "Virtual Machine Manager", it hangs in a
  "paused" state once the VM shutsdown, and just before the reboot can
  take place.  A force-stop of the VM allows the VM to be properly
  booted without any disk error checks, alluding to a clean shutdown,
  but failed reboot.  The VM can be properly shutdown using the guests
  shutdown function, or the libvirt manager shutdown, without any hangs.
  Reverting to Arch stable build QEMU 5.0.0-7 fixes the issue.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1888417/+subscriptions

