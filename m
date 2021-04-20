Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E02BE365447
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 10:39:12 +0200 (CEST)
Received: from localhost ([::1]:55764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYluZ-0001P6-VH
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 04:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYlj7-00054v-0w
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:27:21 -0400
Received: from indium.canonical.com ([91.189.90.7]:59210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYlj0-0002dV-1H
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:27:20 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYlin-000287-AA
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:27:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 013D02E816B
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 08:27:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Apr 2021 08:11:32 -0000
From: Thomas Huth <1805913@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: linux-user syscall-abi
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dflogeras2 likan manuel-reimer marcin-konarski+u1
 philippe-vaucher pmaydell schneiderit th-huth
 wolletd
X-Launchpad-Bug-Reporter: Kan Li (likan)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154353638253.10384.17899256838547579767.malonedeb@chaenomeles.canonical.com>
Message-Id: <161890629242.16645.258219476967666032.malone@wampee.canonical.com>
Subject: [Bug 1805913] Re: readdir() returns NULL (errno=EOVERFLOW) for 32-bit
 user-static qemu on 64-bit host
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="8932ab84469600dc3d8b3344fb7135c702d5179e"; Instance="production"
X-Launchpad-Hash: 999ee5637756fc4610b63cae5d4b1623b7e3194e
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
Reply-To: Bug 1805913 <1805913@bugs.launchpad.net>
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
       Status: Confirmed =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1805913

Title:
  readdir() returns NULL (errno=3DEOVERFLOW) for 32-bit user-static qemu
  on 64-bit host

Status in QEMU:
  Incomplete

Bug description:
  This can be simply reproduced by compiling and running the attached C
  code (readdir-bug.c) under 32-bit user-static qemu, such as qemu-arm-
  static:

  # Setup docker for user-static binfmt
  docker run --rm --privileged multiarch/qemu-user-static:register --reset
  # Compile the code and run (readdir for / is fine, so create a new direct=
ory /test).
  docker run -v /path/to/qemu-arm-static:/usr/bin/qemu-arm-static -v /path/=
to/readdir-bug.c:/tmp/readdir-bug.c -it --rm arm32v7/ubuntu:18.10 bash -c '=
{ apt update && apt install -y gcc; } >&/dev/null && mkdir -p /test && cd /=
test && gcc /tmp/readdir-bug.c && ./a.out'
  dir=3D0xff5b4150
  readdir(dir)=3D(nil)
  errno=3D75: Value too large for defined data type

  Do remember to replace the /path/to/qemu-arm-static and /path/to
  /readdir-bug.c to the actual paths of the files.

  The root cause is in glibc:
  https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3Dsysdeps/unix/sysv/=
linux/getdents.c;h=3D6d09a5be7057e2792be9150d3a2c7b293cf6fc34;hb=3Da5275ba5=
378c9256d18e582572b4315e8edfcbfb#l87

  By C standard, the return type of readdir() is DIR*, in which the
  inode number and offset are 32-bit integers, therefore, glibc calls
  getdents64() and check if the inode number and offset fits the 32-bit
  range, and reports EOVERFLOW if not.

  The problem here is for 32-bit user-static qemu running on 64-bit
  host, getdents64 simply passing through the inode number and offset
  from underlying getdents64 syscall (from 64-bit kernel), which is very
  likely to not fit into 32-bit range. On real hardware, the 32-bit
  kernel creates 32-bit inode numbers, therefore works properly.

  The glibc code makes sense to do the check to be conformant with C
  standard, therefore ideally it should be a fix on qemu side. I admit
  this is difficult because qemu has to maintain a mapping between
  underlying 64-bit inode numbers and 32-bit inode numbers, which would
  severely hurt the performance. I don't expect this could be fix
  anytime soon (or even there would be a fix), but it would be
  worthwhile to surface this issue.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1805913/+subscriptions

