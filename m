Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE18318695
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 09:58:06 +0100 (CET)
Received: from localhost ([::1]:53250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA7nZ-0002ry-Ix
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 03:58:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lA7lf-0002Dg-Vy
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 03:56:08 -0500
Received: from indium.canonical.com ([91.189.90.7]:40448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lA7ld-0006SK-Fx
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 03:56:07 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lA7lZ-0008Bq-Ff
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 08:56:01 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6E6632E8137
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 08:56:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Feb 2021 08:41:49 -0000
From: Pavel Dovgalyuk <1899082@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: acceptance pc replay test x86
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: beraldoleal cleber-gnu dovgalyuk
X-Launchpad-Bug-Reporter: Cleber Rosa (cleber-gnu)
X-Launchpad-Bug-Modifier: Pavel Dovgalyuk (dovgalyuk)
References: <160219062643.30310.16188463455229225461.malonedeb@gac.canonical.com>
Message-Id: <161303290963.31872.8581901119571603728.malone@gac.canonical.com>
Subject: [Bug 1899082] Re: ReplayKernel.test_x86_64_pc fails intermittently
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e34ce994f03aae76d4610a97bccf86c0f2cf9f70"; Instance="production"
X-Launchpad-Hash: d1b45fe0283c0712127d3a6dcdaaf5445e7291b5
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1899082 <1899082@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Beraldo, thanks for the script.
However, I can't reproduce the bug using it. I've got the newest QEMU from =
the repository, and it never hangs in this scenario.

But there are some problems in other runs with more complex tasks.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1899082

Title:
  ReplayKernel.test_x86_64_pc fails intermittently

Status in QEMU:
  New

Bug description:
  Even though this acceptance test is already skipped on GitLab CI, the
  intermittent failures can be seen on other environments too.

  The record phase works fine, but during the replay phase fail to
  finish booting the kernel (until the expected place):

  16:34:47 DEBUG| [    0.034498] Last level dTLB entries: 4KB 0, 2MB 0, 4MB=
 0, 1GB 0
  16:34:47 DEBUG| [    0.034790] Spectre V2 : Spectre mitigation: LFENCE no=
t serializing, switching to generic retpoline
  16:34:47 DEBUG| [    0.035093] Spectre V2 : Mitigation: Full generic retp=
oline
  16:34:47 DEBUG| [    0.035347] Spectre V2 : Spectre v2 / SpectreRSB mitig=
ation: Filling RSB on context switch
  16:34:47 DEBUG| [    0.035667]
  16:36:02 ERROR| =

  16:36:02 ERROR| Reproduced traceback from: /home/cleber/src/avocado/avoca=
do/avocado/core/test.py:767
  16:36:02 ERROR| Traceback (most recent call last):
  16:36:02 ERROR|   File "/var/lib/users/cleber/build/qemu/tests/acceptance=
/replay_kernel.py", line 92, in test_x86_64_pc
  16:36:02 ERROR|     self.run_rr(kernel_path, kernel_command_line, console=
_pattern, shift=3D5)
  16:36:02 ERROR|   File "/var/lib/users/cleber/build/qemu/tests/acceptance=
/replay_kernel.py", line 73, in run_rr
  16:36:02 ERROR|     False, shift, args, replay_path)
  16:36:02 ERROR|   File "/var/lib/users/cleber/build/qemu/tests/acceptance=
/replay_kernel.py", line 55, in run_vm
  16:36:02 ERROR|     self.wait_for_console_pattern(console_pattern, vm)
  16:36:02 ERROR|   File "/var/lib/users/cleber/build/qemu/tests/acceptance=
/boot_linux_console.py", line 53, in wait_for_console_pattern
  16:36:02 ERROR|     vm=3Dvm)
  16:36:02 ERROR|   File "/var/lib/users/cleber/build/qemu/tests/acceptance=
/avocado_qemu/__init__.py", line 130, in wait_for_console_pattern
  16:36:02 ERROR|     _console_interaction(test, success_message, failure_m=
essage, None, vm=3Dvm)
  16:36:02 ERROR|   File "/var/lib/users/cleber/build/qemu/tests/acceptance=
/avocado_qemu/__init__.py", line 82, in _console_interaction
  16:36:02 ERROR|     msg =3D console.readline().strip()
  16:36:02 ERROR|   File "/usr/lib64/python3.7/socket.py", line 575, in rea=
dinto
  16:36:02 ERROR|     def readinto(self, b):
  16:36:02 ERROR|   File "/home/cleber/src/avocado/avocado/avocado/plugins/=
runner.py", line 77, in sigterm_handler
  16:36:02 ERROR|     raise RuntimeError("Test interrupted by SIGTERM")
  16:36:02 ERROR| RuntimeError: Test interrupted by SIGTERM
  16:36:02 ERROR| =


  On my workstation, I can replicate the failure roughly once every 50
  runs.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1899082/+subscriptions

