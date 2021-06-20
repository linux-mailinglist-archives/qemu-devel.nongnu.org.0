Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 209153ADCD5
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 06:34:18 +0200 (CEST)
Received: from localhost ([::1]:43114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lupA1-0003io-6Q
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 00:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lup23-0008D0-Lv
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:26:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:45376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lup20-0002kZ-GF
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 00:26:03 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lup1v-0003fU-RH
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 04:25:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1AE1A2E820A
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 04:25:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Jun 2021 04:17:32 -0000
From: Launchpad Bug Tracker <1817239@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor jnsnow laurent-vivier th-huth umarcor
X-Launchpad-Bug-Reporter: umarcor (umarcor)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <155080581544.22842.8774442486795126526.malonedeb@wampee.canonical.com>
Message-Id: <162416265251.7948.3341587162552611617.malone@loganberry.canonical.com>
Subject: [Bug 1817239] Re: add '--targets' option to qemu-binfmt-conf.sh
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: b2f1ecc4316d77d83dea35e1d076f46db048a882
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

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1817239

Title:
  add '--targets' option to qemu-binfmt-conf.sh

Status in QEMU:
  Expired

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

