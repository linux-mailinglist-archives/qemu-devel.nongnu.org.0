Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E48B370A61
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 07:57:53 +0200 (CEST)
Received: from localhost ([::1]:46676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ld572-0002tQ-98
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 01:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ld54w-0001Bt-RH
 for qemu-devel@nongnu.org; Sun, 02 May 2021 01:55:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:35166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ld54t-0004cy-Bw
 for qemu-devel@nongnu.org; Sun, 02 May 2021 01:55:42 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ld54p-0004OU-Ua
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 05:55:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E66A52E8041
 for <qemu-devel@nongnu.org>; Sun,  2 May 2021 05:55:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 May 2021 05:48:52 -0000
From: Thomas Huth <1790260@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: elypter-d th-huth
X-Launchpad-Bug-Reporter: elypter (elypter-d)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <153577200805.24343.11078147907776574944.malonedeb@gac.canonical.com>
Message-Id: <161993453268.10070.9555627457577285520.malone@gac.canonical.com>
Subject: [Bug 1790260] Re: binfmt support not working for x86 host and x86_64
 guest
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: 44daa0c437fe77025178390b2c5e29fec45fc2b0
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
Reply-To: Bug 1790260 <1790260@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1790260

Title:
  binfmt support not working for x86 host and x86_64 guest

Status in QEMU:
  Incomplete

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

