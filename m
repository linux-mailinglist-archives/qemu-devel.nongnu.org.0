Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E2E35F15B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 12:16:29 +0200 (CEST)
Received: from localhost ([::1]:55386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWcZP-0006Cj-Tz
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 06:16:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lWcVv-0004Sa-6G
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 06:12:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:46658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lWcVt-00048K-7V
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 06:12:50 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lWcVp-0002gF-DX
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 10:12:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A76932E8196
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 10:12:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Apr 2021 10:04:32 -0000
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
Message-Id: <161839467285.14854.11053778928063368958.malone@chaenomeles.canonical.com>
Subject: [Bug 1920913] Re: Openjdk11+ fails to install on s390x
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9327c982b35e4a485a3c716663ed8345e279c16e"; Instance="production"
X-Launchpad-Hash: 3c0d7454c16bce207961234d14263c89ef7c4fda
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

As java -version passes few times, further also checked behaviour of Maven.=
 Observed that mvn -v crashes in a similar fashion, however after setting b=
elow:
export MAVEN_OPTS=3D"-XX:-TieredCompilation -XX:+UseG1GC -Dcount=3D1000000"

mvn -v always passes.

root@XX:/# mvn -v
OpenJDK 64-Bit Server VM warning: You have loaded library /apache-maven-3.6=
.3/lib/jansi-native/linux64/libjansi.so which might have disabled stack gua=
rd. The VM will try to fix the stack guard now.
It's highly recommended that you fix the library with 'execstack -c <libfil=
e>', or link it with '-z noexecstack'.
Apache Maven 3.6.3 (cecedd343002696d0abb50b32b541b8a6ba2883f)
Maven home: /apache-maven-3.6.3
Java version: 11.0.7, vendor: Ubuntu, runtime: /usr/lib/jvm/java-11-openjdk=
-s390x
Default locale: en_US, platform encoding: ANSI_X3.4-1968
OS name: "linux", version: "5.4.0-70-generic", arch: "s390x", family: "unix"


However what I am really interested in, is mvn clean install command which =
never passes with above settings.

@davidhildenbrand, any help would be appreciated.

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

