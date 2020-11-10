Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF782ADB6E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 17:18:14 +0100 (CET)
Received: from localhost ([::1]:55186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcWLV-0007Jr-Uf
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 11:18:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcWJE-00061d-DH
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:15:52 -0500
Received: from indium.canonical.com ([91.189.90.7]:57796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcWJ8-0007tF-Fl
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:15:52 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kcWJ6-00078F-IX
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 16:15:44 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 85B972E8074
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 16:15:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2020 16:08:31 -0000
From: Thomas Huth <1767146@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: acpi
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: linuxerfourfun th-huth
X-Launchpad-Bug-Reporter: Maximilian W (linuxerfourfun)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <152475835505.21429.10760202253240886546.malonedeb@soybean.canonical.com>
Message-Id: <160502451133.12454.3277959783190184317.malone@gac.canonical.com>
Subject: [Bug 1767146] Re: No ACPI-table found, option -M 1.6 not found either
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e39939c02bd86af4202bc6e2123a7708215ec8ea"; Instance="production"
X-Launchpad-Hash: 1903bc460108c1a5b22f3b53374f48c633d09d70
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 08:35:46
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1767146

Title:
  No ACPI-table found, option -M 1.6 not found either

Status in QEMU:
  Incomplete

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

