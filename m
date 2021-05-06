Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A6D3750DF
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 10:27:42 +0200 (CEST)
Received: from localhost ([::1]:60874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leZMD-0006i2-S9
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 04:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leZLE-0005s2-20
 for qemu-devel@nongnu.org; Thu, 06 May 2021 04:26:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:42412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leZLC-0003T7-7Q
 for qemu-devel@nongnu.org; Thu, 06 May 2021 04:26:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leZL9-00054B-Dj
 for <qemu-devel@nongnu.org>; Thu, 06 May 2021 08:26:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 42B292E8189
 for <qemu-devel@nongnu.org>; Thu,  6 May 2021 08:26:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 May 2021 08:19:47 -0000
From: Thomas Huth <1855002@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth wrampazz
X-Launchpad-Bug-Reporter: Willian Rampazzo (wrampazz)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157540844355.22110.14930704541117670536.malonedeb@soybean.canonical.com>
Message-Id: <162028918734.15527.11324555530707415122.malone@soybean.canonical.com>
Subject: [Bug 1855002] Re: Cannot boot arm kernel images on s390x
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 637b05f48cbe760ad4194687aa3acf2f79b85aee
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
Reply-To: Bug 1855002 <1855002@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/187


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #187
   https://gitlab.com/qemu-project/qemu/-/issues/187

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1855002

Title:
  Cannot boot arm kernel images on s390x

Status in QEMU:
  Expired

Bug description:
  While running the acceptance tests on s390x, the arm tests under
  qemu/tests/acceptance/boot_linux_console.py will timeout, except the
  test using u-boot. All the arm tests run without problems on x86 and
  ppc.

  This test boots the kernel and wait for a kernel panic to make sure it
  can boot that kind of kernel on the host running the test. The URL for
  the kernels are available inside the python test code, but I'm listing
  them here:

  Fail: https://archives.fedoraproject.org/pub/archive/fedora/linux/release=
s/29/Everything/armhfp/os/images/pxeboot/vmlinuz
  Fail: http://archive.raspberrypi.org/debian/pool/main/r/raspberrypi-firmw=
are/raspberrypi-kernel_1.20190215-1_armhf.deb
  Fail: https://snapshot.debian.org/archive/debian/20190928T224601Z/pool/ma=
in/l/linux/linux-image-4.19.0-6-armmp_4.19.67-2+deb10u1_armhf.deb
  Pass: https://raw.githubusercontent.com/Subbaraya-Sundeep/qemu-test-binar=
ies/fa030bd77a014a0b8e360d3b7011df89283a2f0b/spi.bin

  I tried to manually investigate the problem with the first kernel of
  the list. The command I used to try to boot it was:

  /home/linux1/src/v4.2.0-rc3/bin/qemu-system-arm -serial stdio -machine vi=
rt -kernel /home/linux1/venv/python3/data/cache/by_location/1d5fdf8018e79b8=
06aa982600c0866b199946efc/vmlinuz
  -append "printk.time=3D0 console=3DttyAMA0"

  On an x86 machine, I can see it boots and ends with a kernel panic as
  expected. On s390x, it just hangs.

  I also tried to debug with gdb, redirecting the monitor and the serial
  console to other terminal sessions without success.

  QEMU version is the latest as of today,tag v4.2.0-rc4, commit
  1bdc319ab5d289ce6b822e06fb2b13666fd9278e.

  s390x system is a Red Hat Enterprise Linux Server 7.7 running as a
  z/VM 6.4.0 guest at IBM LinuxONE Community Cloud.

  x86 system is a Fedora 31 running on Intel i7-8650U.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1855002/+subscriptions

