Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D7D3739C1
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 13:59:15 +0200 (CEST)
Received: from localhost ([::1]:53672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leGBO-00006o-Ky
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 07:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leG8F-0003Qz-Rs
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:55:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:57896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leG8D-0002Fz-Uh
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:55:59 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1leG8C-0005DZ-Je
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 11:55:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 89D5A2E813A
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 11:55:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 11:45:42 -0000
From: Thomas Huth <1831354@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ohilt th-huth
X-Launchpad-Bug-Reporter: Olie Hilt (ohilt)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155943483504.16885.17011343834954742829.malonedeb@chaenomeles.canonical.com>
Message-Id: <162021514214.3082.16129606707547290656.malone@gac.canonical.com>
Subject: [Bug 1831354] Re: unable to read symlinks when mounting 9p filesystem
 with security_model=mapped
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 3816c32574ba8fe7779f42c4d87b73bd191a2a42
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
Reply-To: Bug 1831354 <1831354@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/173


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #173
   https://gitlab.com/qemu-project/qemu/-/issues/173

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1831354

Title:
  unable to read symlinks when mounting 9p filesystem with
  security_model=3Dmapped

Status in QEMU:
  Expired

Bug description:
  I am trying to use clang that is mounted from a 9p filesystem that has th=
e options =

   -fsdev local,id=3Dvirtfs3,path=3D/clang,security_model=3Dmapped-file -de=
vice virtio-9p-pci,fsdev=3Dvirtfs3,mount_tag=3Dclang

  clang has symlinks to clang-9. eg /clang/clang/bin/clang is a symlink
  that points to clang-9 in the current directory.

  the clang filesystem is on a bind mount point on /clang/clang on the
  host and this is mapped to the same place on the guest. If I have the
  same virtfs mount point with the security_model=3Dnone I don't have this
  problem.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1831354/+subscriptions

