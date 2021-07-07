Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FD13BECE1
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 19:16:54 +0200 (CEST)
Received: from localhost ([::1]:58166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1BAK-000505-Jo
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 13:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1B9E-0004EP-1Z
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:15:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:45314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1B9B-0003Yx-S2
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 13:15:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m1B98-0001nN-Rz
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 17:15:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D12512E8135
 for <qemu-devel@nongnu.org>; Wed,  7 Jul 2021 17:15:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Jul 2021 17:09:30 -0000
From: Marietto <1883414@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: marietto2008 th-huth urisimchoni
X-Launchpad-Bug-Reporter: Uri Simchoni (urisimchoni)
X-Launchpad-Bug-Modifier: Marietto (marietto2008)
References: <159212433474.11524.6446671863571065618.malonedeb@soybean.canonical.com>
Message-Id: <162567777075.20394.6808843365339321656.malone@soybean.canonical.com>
Subject: [Bug 1883414] Re: Cannot build qemu-5.0.0 from tarball
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: 9fe63ba8e4b601548bac5c5ff5e3faaafa6d2853
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
Reply-To: Bug 1883414 <1883414@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I can confirm this bug. I've got this tarball :
https://github.com/qemu/qemu/archive/refs/tags/v5.2.0.zip

and then I've unpacked it on /opt and then I did :

./configure --prefix=3D/opt/qemu-5.2.0 --target-list=3Daarch64-softmmu,arm-
softmmu --enable-guest-agent --enable-vnc --enable-vnc-jpeg --enable-
vnc-png --enable-kvm --enable-spice --enable-sdl --enable-gtk --enable-
virglrenderer --enable-opengl

Using './build' as the directory for build output

ERROR: missing file /opt/qemu-5.2.0/ui/keycodemapdb/README

This is not a GIT checkout but module content appears to
be missing. Do not use 'git archive' or GitHub download links
to acquire QEMU source archives. Non-GIT builds are only
supported with source archives linked from:

  https://www.qemu.org/download/#source

Developers working with GIT can use scripts/archive-source.sh
if they need to create valid source archives.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1883414

Title:
  Cannot build qemu-5.0.0 from tarball

Status in QEMU:
  Invalid

Bug description:
  Cannot build qemu 5.0.0 from the release tarball. Building from git-
  clone succeeds.

  After downloading and unpacking the 5.0.0 tarball, I typed the
  following:

  mkdir build
  cd build
  ../configure

  Then got the following error message:

  ERROR: missing file /home/uri/qemu-5.0.0/ui/keycodemapdb/README

  This is not a GIT checkout but module content appears to
  be missing. Do not use 'git archive' or GitHub download links
  to acquire QEMU source archives. Non-GIT builds are only
  supported with source archives linked from:

    https://www.qemu.org/download/#source

  Developers working with GIT can use scripts/archive-source.sh
  if they need to create valid source archives.

  It appears the ui/keycodemapdb is missing some files that are obtained
  from a git submodule in a git tree.

  Building from a git clone succeeds.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1883414/+subscriptions

