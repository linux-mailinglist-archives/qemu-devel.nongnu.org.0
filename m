Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 391CD3C1E7C
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 06:37:01 +0200 (CEST)
Received: from localhost ([::1]:50562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1iG4-00070H-5N
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 00:37:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1i5i-0006C7-C0
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:20 -0400
Received: from indium.canonical.com ([91.189.90.7]:60896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1i5a-0001G3-KX
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:26:17 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m1i5J-0005Dh-7d
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 04:25:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AE7012E8188
 for <qemu-devel@nongnu.org>; Fri,  9 Jul 2021 04:25:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Jul 2021 04:17:23 -0000
From: Launchpad Bug Tracker <1899082@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: acceptance pc replay test x86
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: beraldoleal cleber-gnu dovgalyuk janitor th-huth
X-Launchpad-Bug-Reporter: Cleber Rosa (cleber-gnu)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160219062643.30310.16188463455229225461.malonedeb@gac.canonical.com>
Message-Id: <162580424367.19936.15547466471386574264.malone@loganberry.canonical.com>
Subject: [Bug 1899082] Re: ReplayKernel.test_x86_64_pc fails intermittently
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: b898b01ebc212a394848899aa5c361e8de9e8916
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_HI=-5,
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

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1899082

Title:
  ReplayKernel.test_x86_64_pc fails intermittently

Status in QEMU:
  Expired

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

