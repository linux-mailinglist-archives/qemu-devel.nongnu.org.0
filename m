Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A6836F793
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 11:09:08 +0200 (CEST)
Received: from localhost ([::1]:41096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcP91-0002bf-JP
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 05:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcP5z-0008S5-9e
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:05:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:59664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcP5x-0000PY-8p
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 05:05:59 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcP5w-0008Rl-51
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:05:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 20CF72E815A
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 09:05:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 08:55:32 -0000
From: Thomas Huth <1614609@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kai-0 pmaydell th-huth
X-Launchpad-Bug-Reporter: Kai Poeritz (kai-0)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160818161525.30268.81700.malonedeb@gac.canonical.com>
Message-Id: <161977293343.14478.14571198272547534214.launchpad@wampee.canonical.com>
Subject: [Bug 1614609] Re: alphabetical order of monitor options
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: cd76c496b63a6cb5b4261fd2acec85e7c8de0427
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
Reply-To: Bug 1614609 <1614609@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1614609

Title:
  alphabetical order of monitor options

Status in QEMU:
  Fix Released

Bug description:
  Looking for the 'continue'/'resume' option I found this order that was no=
t quite 'alphabetical'.
  It had me overlook the 'cont' option at glance. Which is just a little im=
practical.

  ...
  boot_set bootdevice -- define new values for the boot device list
  change device filename [format [read-only-mode]] -- change a removable me=
dium, optional format
  chardev-add args -- add chardev
  chardev-remove id -- remove chardev
  client_migrate_info protocol hostname port tls-port cert-subject -- set m=
igration information for remote display
  closefd closefd name -- close a file descriptor previously passed via SCM=
 rights
  commit device|all -- commit changes to the disk images (if -snapshot is u=
sed) or backing files
  cpu index -- set the default CPU
  cpu-add id -- add cpu
  c|cont  -- resume emulation
  delvm tag|id -- delete a VM snapshot from its tag or id
  ...

  I tested this list with 'sort' just to make sure and make a point:

  $ cat Desktop/order-orig.txt =

  boot_set
  change
  chardev-add
  chardev-remove
  client_migrate_info
  closefd
  commit
  cpu
  cpu-add
  c|cont
  delvm
  $ cat Desktop/order-orig.txt | sort
  boot_set
  c|cont
  change
  chardev-add
  chardev-remove
  client_migrate_info
  closefd
  commit
  cpu
  cpu-add
  delvm
  $

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1614609/+subscriptions

