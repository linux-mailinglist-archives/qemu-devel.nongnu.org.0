Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E9F3776F9
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 16:32:15 +0200 (CEST)
Received: from localhost ([::1]:34466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfkTe-0004Vy-96
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 10:32:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfkS8-0002WJ-DP
 for qemu-devel@nongnu.org; Sun, 09 May 2021 10:30:40 -0400
Received: from indium.canonical.com ([91.189.90.7]:52950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfkS6-0004R3-HD
 for qemu-devel@nongnu.org; Sun, 09 May 2021 10:30:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfkS4-0005Cx-Em
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 14:30:36 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 68F6D2E8136
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 14:30:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 14:20:52 -0000
From: Thomas Huth <1903493@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: s12a th-huth
X-Launchpad-Bug-Reporter: ssedt (s12a)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160490836647.18396.16400473727011669931.malonedeb@wampee.canonical.com>
Message-Id: <162057005273.10201.1915629590270913309.malone@chaenomeles.canonical.com>
Subject: [Bug 1903493] Re: About wireless network card bridging
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: afbe79ca13b84d21a661ce86a151a026788acf96
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1903493 <1903493@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry, but at least I have a hard time to understand what you exactly
are requesting here? Why should bridging via a wireless card on the host
be much different to bridging via an ethernet interface on the host? Or
do you expect to see a wireless network card in the guest?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1903493

Title:
  About wireless network card bridging

Status in QEMU:
  Incomplete

Bug description:
  As a rookie, I don=E2=80=99t know if I should ask this question here. If =
it=E2=80=99s
  not right, I hope people who see it can help submit it to the right
  place.Can Qemu or kvm add wireless network card bridging ? after all,
  now you see that vbox and vmware can directly choose wireless network
  card bridging, and even hyper-v can be easily set up, arp proxy is too
  difficult for us rookies . I hope that qemu or other links can add a
  function to bridge the wireless network card, which can be directly
  set in virt-manager (for so many years, it seems that I can only use
  bridge-utils to bridge the Ethernet,and Now more and more laptops
  don't have Ethernet ports)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1903493/+subscriptions

