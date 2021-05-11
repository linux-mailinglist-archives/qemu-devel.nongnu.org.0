Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07225379F35
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 07:32:13 +0200 (CEST)
Received: from localhost ([::1]:59392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgL08-0007bW-4F
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 01:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgKyu-0006rK-B1
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:30:56 -0400
Received: from indium.canonical.com ([91.189.90.7]:59758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgKyr-00068C-IE
 for qemu-devel@nongnu.org; Tue, 11 May 2021 01:30:56 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgKyq-0002wQ-2r
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:30:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 147902E8060
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 05:30:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 11 May 2021 05:20:39 -0000
From: Thomas Huth <1860914@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: felix.von.s th-huth
X-Launchpad-Bug-Reporter: felix (felix.von.s)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158004768486.19485.8886711795112517187.malonedeb@gac.canonical.com>
Message-Id: <162071043944.1889.15472799982141524485.malone@wampee.canonical.com>
Subject: [Bug 1860914] Re: QEMU prepends pathnames to command lines of
 Multiboot kernels and modules, contrary to the specification
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 910a856dbb78f597b913f2ac5cba22382f06cbe9
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
Reply-To: Bug 1860914 <1860914@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1860914

Title:
  QEMU prepends pathnames to command lines of Multiboot kernels and
  modules, contrary to the specification

Status in QEMU:
  Incomplete

Bug description:
  When QEMU is launched with the -kernel option to boot a Multiboot
  image, the command line passed in the -append option is additionally
  prefixed the pathname of the kernel image and a space. Likewise,
  module command lines passed in the -initrd option are passed with the
  module pathname and a space prepended. At the very least the former is
  contary to what is prescribed in the Multiboot specification, version
  0.6.96[0], which says in =C2=A73.3:

  > General-purpose boot loaders should allow user a complete control on
  command line independently of other factors like image name.

  With respect to module command lines, the spec is less clear, but GNU
  GRUB2 (the de facto reference implementation) does not prepend
  pathnames to command lines of either. I haven't tested GRUB legacy,
  but I assume it exhibits the same behaviour. It would be strange if
  passing pathnames was in fact intended; bootloader pathnames are
  useless to the loaded kernel, which may potentially have a completely
  different view of the file system from the bootloader.

  Also, given that a kernel pathname may contain spaces, skipping it in
  the command line cannot be done reliably, while loading a Multiboot
  module from a pathname that contains spaces is outright impossible.

  Found in 4.2.0, but latest git master apparently behaves the same.

  [0]: https://www.gnu.org/software/grub/manual/multiboot/multiboot.html

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1860914/+subscriptions

