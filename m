Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE76F3510D2
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:27:44 +0200 (CEST)
Received: from localhost ([::1]:45954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRsg3-0005rW-PA
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lRsem-0004kL-Kj
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:26:24 -0400
Received: from indium.canonical.com ([91.189.90.7]:45788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lRsea-0006y1-3e
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:26:24 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lRseV-0004Rf-UO
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 08:26:07 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E21322E8162
 for <qemu-devel@nongnu.org>; Thu,  1 Apr 2021 08:26:07 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Apr 2021 08:15:58 -0000
From: Mark Cave-Ayland <1909247@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: cve fuzzer qemu security
X-Launchpad-Bug-Information-Type: Public Security
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: yes
X-Launchpad-Bug-Commenters: a1xndr mark-cave-ayland mauro-cascella philmd pjps
X-Launchpad-Bug-Reporter: Mauro Matteo Cascella (mauro-cascella)
X-Launchpad-Bug-Modifier: Mark Cave-Ayland (mark-cave-ayland)
References: <160882932286.4370.15587232403500958955.malonedeb@wampee.canonical.com>
Message-Id: <161726495856.2987.624497283423977492.malone@chaenomeles.canonical.com>
Subject: [Bug 1909247] Re: QEMU: use after free vulnerability in esp_do_dma()
 in hw/scsi/esp.c
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="21fefc602783aa4ba863a4a6c29d38d788ce04ad"; Instance="production"
X-Launchpad-Hash: b6bbb7ab5653bb9bdd005ede9272032631dff8f0
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

Thanks again Alex. I've just posted a v3 to the list which fixes your
extra test cases, and also those contained within the uaf and hw-esp-oob
attachments:

https://lists.gnu.org/archive/html/qemu-devel/2021-04/msg00015.html

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1909247

Title:
  QEMU: use after free vulnerability in esp_do_dma() in hw/scsi/esp.c

Status in QEMU:
  New

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

