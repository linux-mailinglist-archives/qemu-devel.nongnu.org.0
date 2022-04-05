Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E869C4F236D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 08:37:25 +0200 (CEST)
Received: from localhost ([::1]:33396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbcoe-0004Kx-Dk
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 02:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1nbcTn-0008MR-6P
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 02:15:51 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:40280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1nbcTj-0006Nk-QR
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 02:15:50 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id A43A23FCE3
 for <qemu-devel@nongnu.org>; Tue,  5 Apr 2022 06:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1649139343;
 bh=UjTVTKScWuRJa4TXOjUh4bZMVEJuLP5NbZn4FJ6m2Bk=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=k+UcLX9A8mLQa2Lb/ou0XH3WnXxozEGa+9jPgUm2p/H9htZkbcrSzPSifjjtIMApg
 lRrmOtxL9qbzehTz0aqGehW7R5se0jlhfGz/3BLmcXXlOAPYhpLpj77QVO43rR37mR
 NiIqcLs79qqCJ/2ZdLO5Oei1W6yrTPCTnrUbL1OYqKxQLjASB5UWDk+G44x5R3++cJ
 Uc95T1R8JFAIHOfuIYuFWmgtJbq7f+bAP0XCXfr7zHD0Gmh5dX8ybzCNIKb2axofgs
 FCdb1ob0c4FmX43NEkcMFc/8ZipI1+uMxFJiFo6rONPugH5EPFWKd5bSUDzGUp15zK
 wuKz1d5OqW6jA==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9D1F22E824D
 for <qemu-devel@nongnu.org>; Tue,  5 Apr 2022 06:15:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 05 Apr 2022 06:07:46 -0000
From: Frank Heimes <1967814@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=ubuntu-z-systems; status=New; importance=High;
 assignee=skipper-screen-team; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=New; importance=Undecided; assignee=canonical-server; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=focal; sourcepackage=qemu;
 component=main; status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Tags: architecture-s39064 bugnameltc-195744 severity-high
 targetmilestone-inin---
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bugproxy fheimes
X-Launchpad-Bug-Reporter: bugproxy (bugproxy)
X-Launchpad-Bug-Modifier: Frank Heimes (fheimes)
References: <164910836405.47300.12765269348955076743.malonedeb@daniels.canonical.com>
Message-Id: <164913886694.50407.5976873424931908962.malone@daniels.canonical.com>
Subject: [Bug 1967814] Re: Ubuntu 20.04.3 - ilzlnx3g1 - virtio-scsi devs on
 KVM guest having miscompares on disktests when there is a failed path.
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="98132e33014dffc15ffeea1182b7db54e65752bd"; Instance="production"
X-Launchpad-Hash: d4fc086791285de819e46898fb7fb8fc8951180f
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1967814 <1967814@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Changing the affected package from "linux (Ubuntu)" (kernel) to "qemu
(Ubuntu)" as affected package, since the attached patch set is for qemu.

** Package changed: linux (Ubuntu) =3D> qemu (Ubuntu)

** Also affects: qemu
   Importance: Undecided
       Status: New

** No longer affects: qemu

** Also affects: ubuntu-z-systems
   Importance: Undecided
       Status: New

** Changed in: ubuntu-z-systems
     Assignee: (unassigned) =3D> Skipper Bug Screeners (skipper-screen-team)

** Changed in: qemu (Ubuntu)
     Assignee: Skipper Bug Screeners (skipper-screen-team) =3D> Canonical S=
erver Team (canonical-server)

** Changed in: ubuntu-z-systems
   Importance: Undecided =3D> High

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1967814

Title:
  Ubuntu 20.04.3 - ilzlnx3g1 - virtio-scsi devs on KVM guest having
  miscompares on disktests when there is a failed path.

Status in Ubuntu on IBM z Systems:
  New
Status in qemu package in Ubuntu:
  New
Status in qemu source package in Focal:
  New

Bug description:
  =3D=3D Comment: #63 - Halil Pasic <PASIC@de.ibm.com> - 2022-03-28 17:33:3=
4 =3D=3D
  I'm pretty confident I've figured out what is going on.=20

  From the guest side, the decision whether the SCSI command was completed =
successfully or not comes down to looking at the sense data. Prior to commit
  a108557bbf ("scsi: inline sg_io_sense_from_errno() into the callers."), w=
e don't
  build sense data as a response to seeing a host status presented by the h=
ost SCSI stack (e.g. kernel).

  Thus when the kernel tells us that  a given SCSI command did not get comp=
leted via
  SCSI_HOST_TRANSPORT_DISRUPTED or SCSI_HOST_NO_LUN, we end up  fooling the=
 guest into believing that the command completed successfully.

  The guest kernel, and especially virtio and multipath are at no fault
  (AFAIU). Given these facts, it isn't all that surprising, that we end
  up with corruptions.

  All we have to do is do backports for QEMU (when necessary). I didn't
  investigate vhost-scsi -- my guess is, that it ain't affected.

  How do we want to handle the back-ports?

  =3D=3D Comment: #66 - Halil Pasic <PASIC@de.ibm.com> - 2022-04-04 05:36:3=
3 =3D=3D
  This is a proposed backport containing 7 patches in mbox format. I tried =
to pick patches sanely, and all I had to do was basically resolving merge c=
onflicts.

  I have to admit I have no extensive experience in doing such invasive
  backports, and my knowledge of the QEMU SCSI stack is very limited. I
  would be happy if the Ubuntu folks would have a good look at this, and
  if possible improve on it.

To manage notifications about this bug go to:
https://bugs.launchpad.net/ubuntu-z-systems/+bug/1967814/+subscriptions


