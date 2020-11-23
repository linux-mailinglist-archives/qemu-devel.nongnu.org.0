Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BBC2C143C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 20:13:07 +0100 (CET)
Received: from localhost ([::1]:41030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khHGr-0004rI-K3
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 14:13:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khHEi-0004KW-Hg
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:10:52 -0500
Received: from indium.canonical.com ([91.189.90.7]:45054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1khHEg-0002eN-55
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:10:52 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1khHEe-0003zA-4n
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 19:10:48 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 217E32E813A
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 19:10:48 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2020 19:04:15 -0000
From: Peter Maydell <1895895@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: daghaian pmaydell
X-Launchpad-Bug-Reporter: David Aghaian (daghaian)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <160029128826.621.15541420718494673931.malonedeb@chaenomeles.canonical.com>
Message-Id: <160615825578.15804.5383460161621433474.malone@wampee.canonical.com>
Subject: [Bug 1895895] Re: Attaching SD-Card to specific SD-Bus Sabrelite (ARM)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 7b8fd45011bf51dab87105bbb92100022397b516
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
Reply-To: Bug 1895895 <1895895@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The fsl-imx* SoC devices need to create aliases onto the sd-buses with
unique names; see discussion here:


https://lore.kernel.org/qemu-devel/CAFEAcA_PFGc2Ka-egqYqzMq0Nu_aRiNUPif0ynt=
g4L56UTi7MQ@mail.gmail.com/

** Changed in: qemu
       Status: New =3D> Confirmed

** Tags added: arm

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1895895

Title:
  Attaching SD-Card to specific SD-Bus Sabrelite (ARM)

Status in QEMU:
  Confirmed

Bug description:
  Currently, I am looking for a method of attaching an sd-card to a
  specific bus as opposed to defaulting to the first.

  QEMU Version: 5.0.0
  Specifically trying to use qemu-system-arm binary

  =

  Running an "info qtree" shows the output seen in the attached image. I ha=
ve attempted multiple different combinations of arguments to attempt to get=
 the sd-card to appear on the FOURTH sd-bus but no luck. The machine type b=
eing used is Sabrelite. It should be noted that I was able to PATCH QEMU to=
 achieve the result I expected but I had hoped this functionality was alrea=
dy available and did not require modification to QEMU itself.

  =

  For reference, this is the patch that was made to source to allow the car=
d to attach to a specific bus. After the change was made, an sd-card could =
be attached to a bus with the following flags:

  -drive file=3Dsdcard.img,format=3Draw,id=3Dmycard -device sd-
  card,drive=3Dmycard,bus=3Dsd-bus.0

  =

  diff qemu-5.1.0.orig/hw/sd/sdhci.c qemu-5.1.0/hw/sd/sdhci.c
  1311a1312,1314
  >     static int index=3D0;
  >     char name[64];
  >     sprintf(name, "sd-bus.%d", index++);
  1313c1316
  <                         TYPE_SDHCI_BUS, DEVICE(s), "sd-bus");
  ---
  >                         TYPE_SDHCI_BUS, DEVICE(s), name);


  If there is a way to attach an sd-card to the specific bus that does
  NOT require this change, I'd appreciate it.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1895895/+subscriptions

