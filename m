Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0222F050F
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 05:27:49 +0100 (CET)
Received: from localhost ([::1]:45462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kySKS-00011k-Ar
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 23:27:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySIk-0007kk-7i
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:26:02 -0500
Received: from indium.canonical.com ([91.189.90.7]:40274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kySIh-0000f1-Ah
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 23:26:01 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kySIe-0000Cs-Gg
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:25:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 686F02E8144
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 04:25:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 Jan 2021 04:17:36 -0000
From: Launchpad Bug Tracker <1767146@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: acpi
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor linuxerfourfun th-huth
X-Launchpad-Bug-Reporter: Maximilian W (linuxerfourfun)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <152475835505.21429.10760202253240886546.malonedeb@soybean.canonical.com>
Message-Id: <161025225747.18863.16615729725110492912.malone@loganberry.canonical.com>
Subject: [Bug 1767146] Re: No ACPI-table found, option -M 1.6 not found either
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: e65a5bcbec797f82440e3cc9cd695e1fe057daba
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
Reply-To: Bug 1767146 <1767146@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1767146

Title:
  No ACPI-table found, option -M 1.6 not found either

Status in QEMU:
  Expired

Bug description:
  Currently writing a small kernel, when trying to detect memory blocks
  that contain ACPI information, no such block is found. When ran in
  Oracle Virtualbox, code runs flawlessly.

  Code that is detecting the ACPI-Info (with a bit of debug-output):

  ```
  multiboot_memory_map32_t* map =3D (multiboot_memory_map32_t*)mmap;
  for (uint32_t i =3D 0; i < size; i++) {
  =C2=A0Termutils::cout << map[i].type << "type of block  ";
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (mmap[i].type =3D=3D M=
ULTIBOOT_MEMORY_ACPI_RECLAIMABLE) {
  =C2=A0           =C2=A0Termutils::cout << "WE ARE INSIDE\n";
  =C2=A0           =C2=A0fadt =3D (FADT*)(map[i].base_addr_low);
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
  =C2=A0if (i % 9 =3D=3D 0) {
  =C2=A0=C2=A0Termutils::cout << "\n";
  =C2=A0}
  }
  ```

  command qemu is run with:

  qemu-img create build/objects/test 500M
  qemu-system-i386 -hda $(APP_DIR)/clinl.iso -hdb ./build/objects/test

  The iso-image is (zipped) included as attachment.

  qemu-system-i386 --version:

  QEMU emulator version 2.10.1(qemu-2.10.1-3.fc27)
  Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1767146/+subscriptions

