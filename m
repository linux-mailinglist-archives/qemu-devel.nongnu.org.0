Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A99D373648
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 10:31:08 +0200 (CEST)
Received: from localhost ([::1]:57676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leCvz-0004hE-Da
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 04:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leCrU-0008Ei-Tz
 for qemu-devel@nongnu.org; Wed, 05 May 2021 04:26:28 -0400
Received: from indium.canonical.com ([91.189.90.7]:40876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leCrP-0006Kd-6S
 for qemu-devel@nongnu.org; Wed, 05 May 2021 04:26:28 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1leCrM-0004FZ-2m
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 08:26:20 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B6DA62E8196
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 08:26:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 08:17:14 -0000
From: Thomas Huth <1693050@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: paulmenzel philmd rmustacc th-huth
X-Launchpad-Bug-Reporter: Robert Mustacchi (rmustacc)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <149558234717.18218.15801621819682136328.malonedeb@chaenomeles.canonical.com>
Message-Id: <162020263450.14828.818469915917686515.malone@soybean.canonical.com>
Subject: [Bug 1693050] Re: xhci HCIVERSION register read emulation incorrectly
 handled
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 4235d5e5424f2084ed78f768539121e612f17d81
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
Reply-To: Bug 1693050 <1693050@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/143


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #143
   https://gitlab.com/qemu-project/qemu/-/issues/143

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1693050

Title:
  xhci HCIVERSION register read emulation incorrectly handled

Status in QEMU:
  Expired

Bug description:
  We had an illumos user trying to run illumos in QEMU 2.9.0 with the
  qemu-xhci device enabled. Note, that while this was discovered against
  QEMU 2.9.0, from my current read of the HEAD, it is still present. The
  illumos bug at https://www.illumos.org/issues/8173 has additional
  information on how the user invoked qemu. While investigating the
  problem we found that the illumos driver was reading a version of
  0x0000 when reading the HCIVERSION register from qemu.

  In the illumos driver we're performing a 16-bit read of the version
  register at offset 0x2. From looking around at other OSes, while Linux
  performs a 4 byte read at offset 0x0 and masks out the version, others
  that care about the version are doing a two byte read, though not all
  actually act on the version and some just discard the information.

  The user who hit this was able to enable tracing (note the tracing
  file is attached to the illumos bug linked previously) and we hit the
  unimplemented register read with offset 0x2 at
  http://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dhw/usb/hcd-
  xhci.c;hb=3DHEAD#l2960. The xhci register specifies today that its
  allowed for users to do 1-4 byte reads; however, that it implements
  only four byte reads in its implementation
  (http://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dhw/usb/hcd-
  xhci.c;hb=3DHEAD#l3333). Hence why when we read the HCIVERSION register
  at offset 0x2, it isn't handled in xhci_cap_read() which then returns
  zeros.

  From digging into this, I think that we're coming into
  memory_region_dispatch_read() and then memory_region_dispatch_read1().
  However, I don't see anything in either the general memory region
  logic or in the xhci_cap_read() function that would deal with
  adjusting the offset that we're reading at and then masking it off
  again. While the access_with_adjusted_size() attempts to deal with
  this, it never adjusts the hardware address that's passed in to be a
  multiple of the implementation defined offset that I can see. I
  suspect that the FIXME at line 582
  (http://git.qemu.org/?p=3Dqemu.git;a=3Dblob;f=3Dmemory.c;hb=3DHEAD#l582) =
and
  the implementation in the xhci code is the crux of the problem.

  For the time being we're working around this in the illumos driver,
  but I wanted to point this out such that it might be helpful for other
  systems which are assuming that they can do the two byte read like on
  hardware.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1693050/+subscriptions

