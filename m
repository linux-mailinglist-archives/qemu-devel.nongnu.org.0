Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9066345DEC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 13:18:09 +0100 (CET)
Received: from localhost ([::1]:38112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOfz6-0001na-Su
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 08:18:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lOfwu-0000hv-Nj
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:15:53 -0400
Received: from indium.canonical.com ([91.189.90.7]:48012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lOfwj-0007qE-SN
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:15:52 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lOfwg-0002tH-EF
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 12:15:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 63D852E8166
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 12:15:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Mar 2021 12:10:06 -0000
From: Peter Maydell <1920913@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: s390x
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: nam121 pmaydell
X-Launchpad-Bug-Reporter: Namrata Bhave (nam121)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <161649998851.23806.5550710395623491265.malonedeb@chaenomeles.canonical.com>
Message-Id: <161650140676.24097.11506560504017802747.malone@chaenomeles.canonical.com>
Subject: [Bug 1920913] Re: Openjdk11+ fails to install on s390x
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4446feb642ca86be4f6eceb855b408397dad6a50"; Instance="production"
X-Launchpad-Hash: bcb3670f81d82a306dcdaab4f2924ba270f3b2d8
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
Reply-To: Bug 1920913 <1920913@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

You don't say how you're invoking QEMU (system emulation? usermode? what
command line?) Please give the full commandline, repro steps, and any
files/images we would need to reproduce the failure.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1920913

Title:
  Openjdk11+ fails to install on s390x

Status in QEMU:
  New

Bug description:
  While installing openjdk11 or higher from repo, it crashes while configur=
ing ca-certificates-java.
  Although `java -version` passes, `jar -version` crashes. Detailed logs at=
tached to this issue.

  ```
  # A fatal error has been detected by the Java Runtime Environment:
  #
  #  SIGILL (0x4) at pc=3D0x00000040126f9980, pid=3D8425, tid=3D8430
  #
  # JRE version: OpenJDK Runtime Environment (11.0.10+9) (build 11.0.10+9-U=
buntu-0ubuntu1.20.04)
  # Java VM: OpenJDK 64-Bit Server VM (11.0.10+9-Ubuntu-0ubuntu1.20.04, mix=
ed mode, tiered, compressed oops, g1 gc, linux-s390x)
  # Problematic frame:
  # J 4 c1 java.lang.StringLatin1.hashCode([B)I java.base@11.0.10 (42 bytes=
) @ 0x00000040126f9980 [0x00000040126f9980+0x0000000000000000]
  #
  # Core dump will be written. Default location: Core dumps may be processe=
d with "/usr/share/apport/apport %p %s %c %d %P %E" (or dumping to //core.8=
425)
  #
  # An error report file with more information is saved as:
  # //hs_err_pid8425.log
  sed with "/usr/share/apport/apport %p %s %c %d %P %E" (or dumping to /roo=
t/core.10740)
  #
  # An error report file with more information is saved as:
  # /root/hs_err_pid10740.log
  ```

  Observed this on s390x/ubuntu as well as s390x/alpine when run on amd64 h=
ost.
  Please note, on native s390x, the installation is successful. Also this c=
rash is not observed while installing openjdk-8-jdk.

  Qemu version: 5.2.0

  Please let me know if any more details are needed.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1920913/+subscriptions

