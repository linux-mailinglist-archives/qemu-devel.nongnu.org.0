Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AF72BC040
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 16:31:54 +0100 (CET)
Received: from localhost ([::1]:49046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgUrg-0003V2-Uw
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 10:31:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgUpe-0002YZ-9g
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 10:29:46 -0500
Received: from indium.canonical.com ([91.189.90.7]:60568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgUpZ-0001ZM-M3
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 10:29:46 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kgUpX-0000cp-IE
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 15:29:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 82EBC2E813E
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 15:29:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2020 15:19:01 -0000
From: Peter Maydell <1614609@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kai-0 pmaydell
X-Launchpad-Bug-Reporter: Kai Poeritz (kai-0)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <20160818161525.30268.81700.malonedeb@gac.canonical.com>
Message-Id: <160597194169.16608.4655593382214633534.malone@chaenomeles.canonical.com>
Subject: [Bug 1614609] Re: alphabetical order of monitor options
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 0e13d4a45a85536e37af54bfe535bd43e85797f2
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

Should be fixed by this patch:
https://patchew.org/QEMU/20201121151711.20783-1-peter.maydell@linaro.org/

** Changed in: qemu
       Status: New =3D> In Progress

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1614609

Title:
  alphabetical order of monitor options

Status in QEMU:
  In Progress

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

