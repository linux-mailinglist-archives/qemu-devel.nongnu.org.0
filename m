Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8832FAF6D
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 05:33:35 +0100 (CET)
Received: from localhost ([::1]:33982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1ihx-0001yl-S8
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 23:33:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1ifi-0000JU-E8
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 23:31:14 -0500
Received: from indium.canonical.com ([91.189.90.7]:57036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1ifg-0004sU-5f
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 23:31:14 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l1ifd-0003vm-5k
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 04:31:09 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2420D2E8140
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 04:31:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 Jan 2021 04:17:58 -0000
From: Launchpad Bug Tracker <1579645@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor terrence-xu th-huth
X-Launchpad-Bug-Reporter: Terrence (terrence-xu)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160509074733.476.70879.malonedeb@chaenomeles.canonical.com>
Message-Id: <161102987825.12094.10123669232613153909.malone@loganberry.canonical.com>
Subject: [Bug 1579645] Re: [XEN/KVM] pch audio doesn't work on both Windows
 and linux guest with soundhw="ac97"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="44709f752aec466e4fba4ac588c69193e99da5ce"; Instance="production"
X-Launchpad-Hash: 5084d65698cfd57b2c808de202cfe18fecb119a8
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
Reply-To: Bug 1579645 <1579645@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1579645

Title:
   [XEN/KVM] pch audio doesn't work on both Windows and linux guest with
  soundhw=3D"ac97"

Status in QEMU:
  Expired

Bug description:
  Environment:

  when try to boot a guest by qemu with parameter "-soundhw ac97", it showe=
d like below:
  "audio: Could no init =E2=80=9Coss=E2=80=9D audio driver.",
  then login the guest and try run audio, no sound output.
  Reproduce:
  1. kvm: qemu-system-x86_64 -enable-kvm -m 2048 -smp 4 -net nic,model=3Drt=
l8139 -net tap,script=3D/etc/kvm/qemu-ifup -soundhw ac97 -hda [target.img]
     xen: add the audio device in guest configure file by soundhw=3D"ac97",=
 xl create $guest-configure
  2. it will show "audio: Could no init =E2=80=9Coss=E2=80=9D audio driver".
  3. login in guest, it can detect audio device, but actually it is not wor=
king.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1579645/+subscriptions

