Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 643F035F573
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 15:54:28 +0200 (CEST)
Received: from localhost ([::1]:56918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWfyN-0005lP-Gx
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 09:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lWfv0-0002tW-0a
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 09:50:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:55432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lWfuy-0008IT-7B
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 09:50:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lWfuw-0005Gv-A3
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 13:50:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 4833C2E815F
 for <qemu-devel@nongnu.org>; Wed, 14 Apr 2021 13:50:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Apr 2021 13:36:18 -0000
From: Mauro Matteo Cascella <1909247@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: cve fuzzer qemu security
X-Launchpad-Bug-Information-Type: Public Security
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: yes
X-Launchpad-Bug-Commenters: a1xndr mark-cave-ayland mauro-cascella philmd pjps
X-Launchpad-Bug-Reporter: Mauro Matteo Cascella (mauro-cascella)
X-Launchpad-Bug-Modifier: Mauro Matteo Cascella (mauro-cascella)
References: <160882932286.4370.15587232403500958955.malonedeb@wampee.canonical.com>
Message-Id: <161840737838.14515.7370088548807277246.malone@chaenomeles.canonical.com>
Subject: [Bug 1909247] Re: QEMU: use after free vulnerability in esp_do_dma()
 in hw/scsi/esp.c
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9327c982b35e4a485a3c716663ed8345e279c16e"; Instance="production"
X-Launchpad-Hash: 63bc7a3a70e95fb2853407f3e0ab00b07d35e1ea
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
Reply-To: Bug 1909247 <1909247@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is fixed now, thank you Mark.

Patchset v4:
https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg01000.html

Upstream commits:
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D0db895361b8a82e1114372ff9=
f48
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3De392255766071c8cac480da3a=
9ae
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3De5455b8c1c6170c788f3c0fd5=
77c
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dc5fef9112b15c4b5494791cdf=
8bb
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D7b320a8e67a534925048cbabf=
a51
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D99545751734035b76bd372c4e=
721
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dfa7505c154d4d00ad89a747be=
2ed
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dfbc6510e3379fa8f8370bf711=
98f
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D0ebb5fd80589835153a0c2baa=
1b8
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D324c8809897c8c53ad05c3a71=
47d
https://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D607206948cacda4a80be5b976=
dba

** Changed in: qemu
       Status: New =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1909247

Title:
  QEMU: use after free vulnerability in esp_do_dma() in hw/scsi/esp.c

Status in QEMU:
  Fix Released

Bug description:
  A use-after-free vulnerability was found in the am53c974 SCSI host bus
  adapter emulation of QEMU. It could occur in the esp_do_dma() function
  in hw/scsi/esp.c while handling the 'Information Transfer' command
  (CMD_TI). A privileged guest user may abuse this flaw to crash the
  QEMU process on the host, resulting in a denial of service or
  potential code execution with the privileges of the QEMU process.

  This issue was reported by Cheolwoo Myung (Seoul National University).

  Original report:
  Using hypervisor fuzzer, hyfuzz, I found a use-after-free issue in
  am53c974 emulator of QEMU enabled ASan.

  It occurs while transferring information, as it does not check the
  buffer to be transferred.

  A malicious guest user/process could use this flaw to crash the QEMU
  process resulting in DoS scenario.

  To reproduce this issue, please run the QEMU with the following command
  line.

  # To enable ASan option, please set configuration with the following
  $ ./configure --target-list=3Di386-softmmu --disable-werror --enable-sani=
tizers
  $ make

  # To reproduce this issue, please run the QEMU process with the following=
 command line
  $ ./qemu-system-i386 -m 512 -drive file=3D./hyfuzz.img,index=3D0,media=3D=
disk,format=3Draw \
  -device am53c974,id=3Dscsi -device scsi-hd,drive=3DSysDisk \
  -drive id=3DSysDisk,if=3Dnone,file=3D./disk.img

  Please find attached the disk images to reproduce this issue.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1909247/+subscriptions

