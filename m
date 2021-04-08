Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAABF3584E3
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 15:40:00 +0200 (CEST)
Received: from localhost ([::1]:54092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUUt5-0004CQ-Is
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 09:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lUUpa-0002wb-QD
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:36:22 -0400
Received: from indium.canonical.com ([91.189.90.7]:42556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lUUpY-0001he-BY
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:36:22 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lUUpV-00040r-Pq
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 13:36:17 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C10E12E8164
 for <qemu-devel@nongnu.org>; Thu,  8 Apr 2021 13:36:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Apr 2021 13:27:51 -0000
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
Message-Id: <161788847161.22785.4712945783001871538.malone@chaenomeles.canonical.com>
Subject: [Bug 1920913] Re: Openjdk11+ fails to install on s390x
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="57f1f603f707b9cfa764cae8dd0f3999026b4763"; Instance="production"
X-Launchpad-Hash: 782633f8d63c69104ee7a3472ccc9088e27d6581
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

@davidhildenbrand The other issue which you have mentioned as duplicate
shows java getting stuck for long, whereas for me it crashes right away.
Do you think these 2 are related?

Also observed another behaviour :
java -version randomly passes, sometimes.

I can also confirm that it is observed under s390x chroot as well(logs belo=
w):
``` =

root@XX:/# ulimit -c unlimited
root@XX:/# java -version
openjdk version "11.0.10" 2021-01-19
OpenJDK Runtime Environment (build 11.0.10+9-Ubuntu-0ubuntu1.20.04)
OpenJDK 64-Bit Server VM (build 11.0.10+9-Ubuntu-0ubuntu1.20.04, mixed mode)
root@XX:/# java -version
#
# A fatal error has been detected by the Java Runtime Environment:
#
#  SIGILL (0x4) at pc=3D0x0000004012705b40, pid=3D156601, tid=3D156604
#
# JRE version: OpenJDK Runtime Environment (11.0.10+9) (build 11.0.10+9-Ubu=
ntu-0ubuntu1.20.04)
# Java VM: OpenJDK 64-Bit Server VM (11.0.10+9-Ubuntu-0ubuntu1.20.04, mixed=
 mode, tiered, compressed oops, g1 gc, linux-s390x)
# Problematic frame:
# J 5 c1 java.lang.Object.<init>()V java.base@11.0.10 (1 bytes) @ 0x0000004=
012705b40 [0x0000004012705b00+0x0000000000000040]
#
# Core dump will be written. Default location: Core dumps may be processed =
with "/usr/share/apport/apport %p %s %c %d %P %E" (or dumping to //core.156=
601)
#
# An error report file with more information is saved as:
# //hs_err_pid156601.log
Compiled method (c1)     956    5       3       java.lang.Object::<init> (1=
 bytes)
 total in heap  [0x0000004012705910,0x0000004012705cb8] =3D 936
 relocation     [0x0000004012705a70,0x0000004012705aa0] =3D 48
 constants      [0x0000004012705ac0,0x0000004012705b00] =3D 64
 main code      [0x0000004012705b00,0x0000004012705c00] =3D 256
 stub code      [0x0000004012705c00,0x0000004012705c58] =3D 88
 metadata       [0x0000004012705c58,0x0000004012705c70] =3D 24
 scopes data    [0x0000004012705c70,0x0000004012705c80] =3D 16
 scopes pcs     [0x0000004012705c80,0x0000004012705cb0] =3D 48
 dependencies   [0x0000004012705cb0,0x0000004012705cb8] =3D 8
Compiled method (c1)     960    5       3       java.lang.Object::<init> (1=
 bytes)
 total in heap  [0x0000004012705910,0x0000004012705cb8] =3D 936
 relocation     [0x0000004012705a70,0x0000004012705aa0] =3D 48
 constants      [0x0000004012705ac0,0x0000004012705b00] =3D 64
 main code      [0x0000004012705b00,0x0000004012705c00] =3D 256
 stub code      [0x0000004012705c00,0x0000004012705c58] =3D 88
 metadata       [0x0000004012705c58,0x0000004012705c70] =3D 24
 scopes data    [0x0000004012705c70,0x0000004012705c80] =3D 16
 scopes pcs     [0x0000004012705c80,0x0000004012705cb0] =3D 48
 dependencies   [0x0000004012705cb0,0x0000004012705cb8] =3D 8
Could not load hsdis-s390x.so; library not loadable; PrintAssembly is disab=
led
#
# If you would like to submit a bug report, please visit:
#   https://bugs.launchpad.net/ubuntu/+source/openjdk-lts
#
Aborted (core dumped)
root@XX:/# ulimit -c unlimited
root@XX:/# java -version
#
# A fatal error has been detected by the Java Runtime Environment:
#
#  SIGILL (0x4) at pc=3D0x0000004012706a40, pid=3D156619, tid=3D156622
#
# JRE version: OpenJDK Runtime Environment (11.0.10+9) (build 11.0.10+9-Ubu=
ntu-0ubuntu1.20.04)
# Java VM: OpenJDK 64-Bit Server VM (11.0.10+9-Ubuntu-0ubuntu1.20.04, mixed=
 mode, tiered, compressed oops, g1 gc, linux-s390x)
# Problematic frame:
# J 4 c1 java.lang.Object.<init>()V java.base@11.0.10 (1 bytes) @ 0x0000004=
012706a40 [0x0000004012706a00+0x0000000000000040]
#
.
(truncating logs)

Aborted (core dumped)
root@XX:/#
```

Increasing core limit worked once, but it fails eventually.

Could you please share your thoughts and provide some pointers on
debugging further?

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

