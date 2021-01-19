Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDF72FAF91
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 05:45:01 +0100 (CET)
Received: from localhost ([::1]:41134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1it2-0008JL-Ja
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 23:45:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1ig3-000113-25
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 23:31:35 -0500
Received: from indium.canonical.com ([91.189.90.7]:57830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1ig1-0004zG-36
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 23:31:34 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l1ifn-00048D-Kv
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 04:31:19 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 882FD2E8148
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 04:31:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 Jan 2021 04:17:33 -0000
From: Launchpad Bug Tracker <1531352@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bananaappletw janitor th-huth
X-Launchpad-Bug-Reporter: bananaappletw (bananaappletw)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160106010526.4703.56064.malonedeb@chaenomeles.canonical.com>
Message-Id: <161102985382.12094.11013161396315645863.malone@loganberry.canonical.com>
Subject: [Bug 1531352] Re: QEMU_LD_PREFIX not load correct library order in
 the PATH
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="44709f752aec466e4fba4ac588c69193e99da5ce"; Instance="production"
X-Launchpad-Hash: e6148812f136a4e6ad08030e85dcf131a805b35a
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1531352 <1531352@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1531352

Title:
  QEMU_LD_PREFIX not load correct library order in the PATH

Status in QEMU:
  Expired

Bug description:
  run qemu with QEMU_LD_PREFIX argument will not load correct library order=
 in the PATH.
  How to reproduce this bug:
  These command will download the library of other architectures
  wget https://raw.githubusercontent.com/BinaryAnalysisPlatform/qira/master=
/fetchlibs.sh
  bash fetchlibs.sh
  This is 32bit binary file,
  wget http://train.cs.nctu.edu.tw/files/magic
  chmod +x ./magic
  qemu-i386 -L /home/apple/libs/i386 /home/apple/magic
  This is work fine.
  But after you install gcc-multilib, it failed.
  sudo apt-get install gcc-multilib
  qemu-i386 -L /home/apple/libs/i386 /home/apple/magic
  The following is the error message
  /home/apple/magic: 0=EF=BF=BD=EF=BF=BD=EF=BF=BD: =CD=80=C3=8D=EF=BF=BD: D=
$(=EF=BF=BD=04$=02: Error 18446744073549536926
  Because the order of dynamic linker search the shared library is wrong.
  When your system has /lib32 directory, its priority is higher than the QE=
MU_LD_PREFIX.
  If the system not loaded correspond with the dynamic linker, it will cras=
h.
  Code flow:
  linux-user/main.c:
  =C2=A0=C2=A0call loader_exec
  linuxload.c:
  =C2=A0=C2=A0call load_elf_binary
  elfload.c:
  =C2=A0=C2=A0in load_elf_binary function
  =C2=A0=C2=A0dynamic loader will be elf_interpreter
  I think the problem should be here.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1531352/+subscriptions

