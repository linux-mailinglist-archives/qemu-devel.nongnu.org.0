Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D55367E31
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 11:58:16 +0200 (CEST)
Received: from localhost ([::1]:47970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZW6B-0008A3-5w
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 05:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZW3I-0006St-9U
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:55:16 -0400
Received: from indium.canonical.com ([91.189.90.7]:51332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZW3F-0008Fr-Mg
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:55:16 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZW3E-00077t-15
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 09:55:12 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B93182E815F
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 09:55:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 09:39:12 -0000
From: Thomas Huth <1614609@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kai-0 pmaydell th-huth
X-Launchpad-Bug-Reporter: Kai Poeritz (kai-0)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160818161525.30268.81700.malonedeb@gac.canonical.com>
Message-Id: <161908435213.32637.6716885957035341378.malone@soybean.canonical.com>
Subject: [Bug 1614609] Re: alphabetical order of monitor options
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: e7f8224728775b1d82f6c7dd0a6abb35dc7cfd7d
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
Reply-To: Bug 1614609 <1614609@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix has been included here:
https://gitlab.com/qemu-project/qemu/-/commit/ff688cd2c7c3a677b71e

** Changed in: qemu
       Status: In Progress =3D> Fix Committed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1614609

Title:
  alphabetical order of monitor options

Status in QEMU:
  Fix Committed

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

