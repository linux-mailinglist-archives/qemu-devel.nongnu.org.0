Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBF3371456
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 13:35:24 +0200 (CEST)
Received: from localhost ([::1]:59552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldWrD-0000Nt-H4
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 07:35:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldWlm-0003W5-8n
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:29:46 -0400
Received: from indium.canonical.com ([91.189.90.7]:45882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ldWli-0005mf-4O
 for qemu-devel@nongnu.org; Mon, 03 May 2021 07:29:45 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ldWlf-0003tq-Gk
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 11:29:39 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 7A2292E8165
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 11:29:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 May 2021 11:20:03 -0000
From: Thomas Huth <1090604@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: crobinso l00580144 th-huth vbernat
X-Launchpad-Bug-Reporter: Cole Robinson (crobinso)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20121215001427.24095.85792.malonedeb@soybean.canonical.com>
Message-Id: <162004080362.10486.12421927198140725630.malone@gac.canonical.com>
Subject: [Bug 1090604] Re: RFE: Implement support for SMBIOS Type 41 structures
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: cadd290e9c04d4d4b19c0b501b44861d06c1a371
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
Reply-To: Bug 1090604 <1090604@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/91


** Changed in: qemu
       Status: In Progress =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #91
   https://gitlab.com/qemu-project/qemu/-/issues/91

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1090604

Title:
  RFE: Implement support for SMBIOS Type 41 structures

Status in QEMU:
  Expired

Bug description:
  This was originally filed in Fedora bugzilla:
  https://bugzilla.redhat.com/show_bug.cgi?id=3D669955

  """
  Please extend the existing support for SMBIOS in qemu to add a capability=
 to provide "Onboard Devices Extended Information" (Type 41). Not only is t=
his replacing one of the existing types, but it also provides a mapping bet=
ween devices and physical system chassis locations. But there is no physica=
l chassis! Right. However, this doesn't mean you don't want to tell the gue=
st OS which virtual (e.g. network) interface is which. You can do that, if =
you implement this extension that is already going into real hardware, and =
likely other VMs too.

  See also page 117 of the v2.7 of the SMBIOS spec.

  FWIW, VMware ESX and Workstation expose their PCI NICs in the PCI IRQ Rou=
ting Table.  Kind of odd the first time you see it with biosdevname, as you=
r NIC becomes pci3#1, but that's "correct" from a BIOS perspective. :-)
  """

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1090604/+subscriptions

