Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FE1370676
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 10:49:23 +0200 (CEST)
Received: from localhost ([::1]:35438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lclJS-00077F-6L
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 04:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lclFr-0005nM-Tt
 for qemu-devel@nongnu.org; Sat, 01 May 2021 04:45:39 -0400
Received: from indium.canonical.com ([91.189.90.7]:45686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lclFq-0003ot-30
 for qemu-devel@nongnu.org; Sat, 01 May 2021 04:45:39 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lclFo-0005xr-EC
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 08:45:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6A6152E8144
 for <qemu-devel@nongnu.org>; Sat,  1 May 2021 08:45:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 May 2021 08:38:18 -0000
From: Thomas Huth <1873344@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ruthan th-huth
X-Launchpad-Bug-Reporter: ruthan (ruthan)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <158706669207.6417.12043133926668000830.malonedeb@chaenomeles.canonical.com>
Message-Id: <161985829872.10149.15554006408497993142.malone@gac.canonical.com>
Subject: [Bug 1873344] Re: KVM Windows 98 sound card passthrough is not
 working for DOS programs..
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: aa182cafe45e4d5d0790f22cddd5851100032596
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
Reply-To: Bug 1873344 <1873344@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/73


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #73
   https://gitlab.com/qemu-project/qemu/-/issues/73

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1873344

Title:
  KVM Windows 98 sound card passthrough is not working for DOS
  programs..

Status in QEMU:
  Expired

Bug description:
  Hello,
  im trying to passthrough PCI soundcards into Qemu Windows 98 machine - i =
tried Yamaha 724/744 and Aunreal Vortex 1, for Windows 98 its working fine,=
 but for Windows 98 dosbox mode its at the best half - working - FM (music)=
 only or nothing with detected by games sound setups.
    All there cards are using SB emulation devices. =


    When i try to boot to pure DOS, without Windows 98, even music is not w=
orking with pass through, only sound which i was able to heard its form Yam=
aha Setup utility test - Native 16bit sound, aby other test, games setup et=
c.. are able to dettect sound cards at all. =

    Im pretty sure that drivers are setup correctly, because im using same =
setup on other physical machine, when its working. My suspect is missing or=
 broken Qemu MB DMA channels emulation.. Because its is need to make DOS so=
und working.

    Im using pass through because, SB16 emulation in Qemu is incomplete
  and for Windows 98 dos box, problem is same as with physical cards.
  Same with AC97 emulation and its Win95 drivers, which have SB
  emulation device fallback..

  Qemu 2.11 + 4.2 Linux Mint 19.3. MB Gigabyte Z170.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1873344/+subscriptions

