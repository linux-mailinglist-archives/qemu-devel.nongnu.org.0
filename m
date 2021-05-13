Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9522637F817
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 14:40:01 +0200 (CEST)
Received: from localhost ([::1]:50676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhAdD-0004hM-1F
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 08:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhAPa-000629-4A
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:25:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:44740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhAPY-00044a-8t
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:25:53 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhAPV-0007Of-A8
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 12:25:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4AE892E8194
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 12:25:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 May 2021 12:15:54 -0000
From: Thomas Huth <1893040@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user s390x tcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange davidhildenbrand gsalgaon nthorat
 particular-qemu ruixinbao th-huth
X-Launchpad-Bug-Reporter: Guirish Salgaonkar (gsalgaon)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159844225257.1396.12890490778938419036.malonedeb@wampee.canonical.com>
Message-Id: <162090815504.16465.11037865156853037994.malone@soybean.canonical.com>
Subject: [Bug 1893040] Re: External modules retreval using Go1.15 on s390x
 appears to have checksum and ECDSA verification issues
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6b3403d85f09252210977b936e821c0b00dbe016"; Instance="production"
X-Launchpad-Hash: 65863fdaf1eaafefeee7c7919ee88672a505f237
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
Reply-To: Bug 1893040 <1893040@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/281


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #281
   https://gitlab.com/qemu-project/qemu/-/issues/281

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1893040

Title:
   External modules retreval using Go1.15 on s390x appears to have
  checksum and ECDSA verification issues

Status in QEMU:
  Expired

Bug description:
  We are observing issue while building go-runner image and we suspect it i=
s due to QEMU version being used. As referred in below issue:
  https://github.com/golang/go/issues/40949

  We tried to build go-runner image using go1.15 and register QEMU
  (docker run --rm --privileged multiarch/qemu-user-
  static@sha256:c772ee1965aa0be9915ee1b018a0dd92ea361b4fa1bcab5bbc033517749=
b2af4
  --reset -p yes) as mentioned in PR
  https://github.com/kubernetes/release/pull/1499. We observed below
  failure during build:

  -------------------------------------------------------------------------=
--------
  ERROR: executor failed running [/bin/sh -c CGO_ENABLED=3D0 GOOS=3Dlinux G=
OARCH=3D${ARCH}     go build -ldflags '-s -w -buildid=3D -extldflags "-stat=
ic"'     -o go-runner ${package}]: buildkit-runc did not terminate successf=
ully
  ------
  =C2=A0> [builder 7/7] RUN CGO_ENABLED=3D0 GOOS=3Dlinux GOARCH=3D${ARCH}  =
   go build -ldflags '-s -w -buildid=3D -extldflags "-static"'     -o go-ru=
nner .:
  ------
  failed to solve: rpc error: code =3D Unknown desc =3D executor failed run=
ning [/bin/sh -c CGO_ENABLED=3D0 GOOS=3Dlinux GOARCH=3D${ARCH}     go build=
 -ldflags '-s -w -buildid=3D -extldflags "-static"'     -o go-runner ${pack=
age}]: buildkit-runc did not terminate successfully
  Makefile:52: recipe for target 'container' failed
  make: *** [container] Error 1
  -------------------------------------------------------------------------=
--------

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1893040/+subscriptions

