Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD9E3B9B98
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 06:40:17 +0200 (CEST)
Received: from localhost ([::1]:35248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzAyO-0008Bs-Lh
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 00:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lzAl7-0000xT-4a
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 00:26:33 -0400
Received: from indium.canonical.com ([91.189.90.7]:43510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lzAkq-0002ai-JA
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 00:26:32 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lzAkd-00053b-Dp
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 04:26:03 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 50A7E2E81A7
 for <qemu-devel@nongnu.org>; Fri,  2 Jul 2021 04:25:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Jul 2021 04:17:17 -0000
From: Launchpad Bug Tracker <1790260@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: elypter-d janitor th-huth
X-Launchpad-Bug-Reporter: elypter (elypter-d)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <153577200805.24343.11078147907776574944.malonedeb@gac.canonical.com>
Message-Id: <162519943781.31921.13206793160187258828.malone@loganberry.canonical.com>
Subject: [Bug 1790260] Re: binfmt support not working for x86 host and x86_64
 guest
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c7d3f30bfe7d7b488c7f9d3c8d7880184b1d065e"; Instance="production"
X-Launchpad-Hash: 9a7bbdf5dfd7ee4a95fa55f17f1722ed25958615
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
Reply-To: Bug 1790260 <1790260@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1790260

Title:
  binfmt support not working for x86 host and x86_64 guest

Status in QEMU:
  Expired

Bug description:
  this is a problem in the qemu-binfmt-conf.sh script and maybe
  somewhere else. the version i checked is the current github mirror
  https://github.com/qemu/qemu/blob/master/scripts/qemu-binfmt-conf.sh

  i am running linux mint 19 32bit on a 32bit x86 cpu and i want to run
  some applications that are only available as x86_64 packages. i use
  multiarch and qemu and it works for simple applications like cacafire.
  however i want to run the application natively from the shell without
  having to use qemu-x86_64 <path>. i also installed the binfmt-support
  package. when i run update-binfmts --display then an extry for x86_64
  is missing and transparent execution is not working.

  the problem seems to be in the qemu-binfmt-conf.sh script. it disables
  the creation of entries for cpus of the same family. this is not a
  problem if you are using a 64bit cpu because 32bit binaries run on it
  natively but it doesnt work in the opposite way. hacking line 310 from

           if [ "$host_family" !=3D "$family" ] ; then

  to

  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if [ "$cpu" =3D "x8=
6_64" ] || [ "$host_family" !=3D "$family" ] ;
  then

  and running it with the --systemd ALL parameter causes a x86_64 config
  file to be created. it still doesnt work but that might have different
  causes.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1790260/+subscriptions

