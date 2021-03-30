Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B217334E526
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 12:13:01 +0200 (CEST)
Received: from localhost ([::1]:39348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRBMp-000317-EE
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 06:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lRBKy-0002aG-JA
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 06:11:04 -0400
Received: from indium.canonical.com ([91.189.90.7]:52356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lRBKu-0000L5-1Z
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 06:11:04 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lRBKr-0000uD-UO
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 10:10:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E125A2E8157
 for <qemu-devel@nongnu.org>; Tue, 30 Mar 2021 10:10:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Mar 2021 10:03:54 -0000
From: Namrata Bhave <1920913@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: s390x
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: davidhildenbrand nam121 pmaydell
X-Launchpad-Bug-Reporter: Namrata Bhave (nam121)
X-Launchpad-Bug-Modifier: Namrata Bhave (nam121)
References: <161649998851.23806.5550710395623491265.malonedeb@chaenomeles.canonical.com>
Message-Id: <161709863481.1501.17944356591849104859.malone@soybean.canonical.com>
Subject: [Bug 1920913] Re: Openjdk11+ fails to install on s390x
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="21fefc602783aa4ba863a4a6c29d38d788ce04ad"; Instance="production"
X-Launchpad-Hash: ca07970cf99d428382bea3df407cb84de9b43564
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
Reply-To: Bug 1920913 <1920913@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tried building jdk 11 from source, the generated executable still
crashes(fastdebug as well as release mode):

```
root@24d396a17e00:~/jdk# build/linux-s390x-normal-server-release/jdk/bin/ja=
va -version
#
# A fatal error has been detected by the Java Runtime Environment:
#
#  SIGILL (0x4) at pc=3D0x000000400b234440, pid=3D18175, tid=3D18178
#
# JRE version: OpenJDK Runtime Environment (11.0) (build 11-internal+0-adho=
c..jdk)
# Java VM: OpenJDK 64-Bit Server VM (11-internal+0-adhoc..jdk, mixed mode, =
tiered, compressed oops, g1 gc, linux-s390x)
# Problematic frame:
# J 78 c1 java.util.HashMap.afterNodeInsertion(Z)V java.base (1 bytes) @ 0x=
000000400b234440 [0x000000400b234400+0x0000000000000040]
#
# Core dump will be written. Default location: Core dumps may be processed =
with "/usr/share/apport/apport %p %s %c %d %P %E" (or dumping to /root/jdk/=
core.18175)
#
# An error report file with more information is saved as:
# /root/jdk/hs_err_pid18175.log
Compiled method (c1)    1795   78       3       java.util.HashMap::afterNod=
eInsertion (1 bytes)
 total in heap  [0x000000400b234210,0x000000400b2345b0] =3D 928
 relocation     [0x000000400b234378,0x000000400b2343a0] =3D 40
 constants      [0x000000400b2343c0,0x000000400b234400] =3D 64
 main code      [0x000000400b234400,0x000000400b234500] =3D 256
 stub code      [0x000000400b234500,0x000000400b234558] =3D 88
 metadata       [0x000000400b234558,0x000000400b234568] =3D 16
 scopes data    [0x000000400b234568,0x000000400b234578] =3D 16
 scopes pcs     [0x000000400b234578,0x000000400b2345a8] =3D 48
 dependencies   [0x000000400b2345a8,0x000000400b2345b0] =3D 8
Compiled method (c1)    1806   74       3       java.util.HashMap::putVal (=
300 bytes)
 total in heap  [0x000000400b230210,0x000000400b231f20] =3D 7440
 relocation     [0x000000400b230378,0x000000400b230690] =3D 792
 constants      [0x000000400b2306c0,0x000000400b230a00] =3D 832
 main code      [0x000000400b230a00,0x000000400b231980] =3D 3968
 stub code      [0x000000400b231980,0x000000400b231a68] =3D 232
 metadata       [0x000000400b231a68,0x000000400b231ad0] =3D 104
 scopes data    [0x000000400b231ad0,0x000000400b231ce8] =3D 536
 scopes pcs     [0x000000400b231ce8,0x000000400b231eb8] =3D 464
 dependencies   [0x000000400b231eb8,0x000000400b231ec0] =3D 8
 nul chk table  [0x000000400b231ec0,0x000000400b231f20] =3D 96
Could not load hsdis-s390x.so; library not loadable; PrintAssembly is disab=
led
#
# If you would like to submit a bug report, please visit:
#   http://bugreport.java.com/bugreport/crash.jsp
#
Aborted (core dumped)
root@24d396a17e00:~/jdk#
```

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

