Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EEA36FFB9
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 19:36:30 +0200 (CEST)
Received: from localhost ([::1]:42616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcX41-0006ke-7I
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 13:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcWfB-0000fu-6i
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:10:49 -0400
Received: from indium.canonical.com ([91.189.90.7]:52052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcWf9-0004xR-4G
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:10:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcWf7-0000TN-6K
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 17:10:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2B2D92E8024
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 17:10:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 17:02:00 -0000
From: Thomas Huth <1808928@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: bitmaps block dirt qcow2
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: catborise jnsnow th-huth
X-Launchpad-Bug-Reporter: Ali Sag (catborise)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154511858636.8591.3431958243733477284.malonedeb@gac.canonical.com>
Message-Id: <161980212085.14478.16899779942470374969.malone@wampee.canonical.com>
Subject: [Bug 1808928] Re: Bitmap Extra data is not supported
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: b34d8da09f0d3a0e7e75eb9da9e2e1272517cc0c
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
Reply-To: Bug 1808928 <1808928@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved
to QEMU's new bug tracker on gitlab.com and thus gets marked
as 'expired' now. Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/58


** Changed in: qemu
       Status: Incomplete =3D> Expired

** Changed in: qemu
     Assignee: John Snow (jnsnow) =3D> (unassigned)

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #58
   https://gitlab.com/qemu-project/qemu/-/issues/58

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1808928

Title:
  Bitmap Extra data is not supported

Status in QEMU:
  Expired

Bug description:
  i am using dirty bitmaps and drive-backup. It works as aspected.

  Lately, i encounter a disastrous error. There is not any information
  about that situation. I cannot reach/open/attach/info or anything with
  a qcow2 file.

  virsh version
  Compiled against library: libvirt 4.10.0
  Using library: libvirt 4.10.0
  Using API: QEMU 4.10.0
  Running hypervisor: QEMU 2.12.0

  "qemu-img: Could not open '/var/lib/libvirt/images/test.qcow2': Bitmap
  extra data is not supported"

  what is that mean? what should i do?
  i cannot remove bitmap. i cannot open image or query.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1808928/+subscriptions

