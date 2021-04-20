Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD7836549D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 10:53:19 +0200 (CEST)
Received: from localhost ([::1]:51014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYm8E-0002xh-Uu
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 04:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYlrj-0007nX-PZ
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:36:15 -0400
Received: from indium.canonical.com ([91.189.90.7]:33976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYlra-0007mo-Og
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:36:15 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYlrY-0004vP-Ku
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:36:04 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 51BAF2E8171
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:36:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Apr 2021 08:21:33 -0000
From: Thomas Huth <1817239@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jnsnow laurent-vivier th-huth umarcor
X-Launchpad-Bug-Reporter: umarcor (umarcor)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155080581544.22842.8774442486795126526.malonedeb@wampee.canonical.com>
Message-Id: <161890689343.5292.676521025289593058.malone@soybean.canonical.com>
Subject: [Bug 1817239] Re: add '--targets' option to qemu-binfmt-conf.sh
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="8932ab84469600dc3d8b3344fb7135c702d5179e"; Instance="production"
X-Launchpad-Hash: 69bd3c2e2355247957b51e990b9fe6a59092a13d
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
Reply-To: Bug 1817239 <1817239@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1817239

Title:
  add '--targets' option to qemu-binfmt-conf.sh

Status in QEMU:
  Incomplete

Bug description:
  I'd like to ask for the addition of option '--targets' to scripts
  /qemu-binfmt-conf.sh, in order to allow registering the interpreters
  for the given list of architectures only, instead of using all of the
  ones defined in qemu_target_list. The following is a possible patch
  that implements it:

   qemu-binfmt-conf.sh | 9 ++++++++-
   1 file changed, 8 insertions(+), 1 deletion(-)

  diff --git a/qemu-binfmt-conf.sh b/qemu-binfmt-conf.sh
  index b5a1674..be4a19b 100644
  --- a/qemu-binfmt-conf.sh
  +++ b/qemu-binfmt-conf.sh
  @@ -170,6 +170,7 @@ usage() {
   Usage: qemu-binfmt-conf.sh [--qemu-path PATH][--debian][--systemd CPU]
                              [--help][--credential yes|no][--exportdir PAT=
H]
                              [--persistent yes|no][--qemu-suffix SUFFIX]
  +                           [--targets TARGETS]

          Configure binfmt_misc to use qemu interpreter

  @@ -189,6 +190,8 @@ Usage: qemu-binfmt-conf.sh [--qemu-path PATH][--debia=
n][--systemd CPU]
          --persistent:  if yes, the interpreter is loaded when binfmt is
                         configured and remains in memory. All future uses
                         are cloned from the open file.
  +       --targets:     comma-separated list of targets. If provided, only
  +                      the targets in the list are registered.

       To import templates with update-binfmts, use :

  @@ -324,7 +327,7 @@ CREDENTIAL=3Dno
   PERSISTENT=3Dno
   QEMU_SUFFIX=3D""

  -options=3D$(getopt -o ds:Q:S:e:hc:p: -l debian,systemd:,qemu-path:,qemu-=
suffix:,exportdir:,help,credential:,persistent: -- "$@")
  +options=3D$(getopt -o ds:Q:S:e:hc:p:t: -l debian,systemd:,qemu-path:,qem=
u-suffix:,exportdir:,help,credential:,persistent:,targets: -- "$@")
   eval set -- "$options"

   while true ; do
  @@ -380,6 +383,10 @@ while true ; do
           shift
           PERSISTENT=3D"$1"
           ;;
  +    -t|--targets)
  +        shift
  +        qemu_target_list=3D"$(echo "$1" | tr ',' ' ')"
  +        ;;
       *)
           break
           ;;
  --
  2.20.1

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1817239/+subscriptions

