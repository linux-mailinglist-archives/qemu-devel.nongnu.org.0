Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3499D3C1E41
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 06:27:55 +0200 (CEST)
Received: from localhost ([::1]:42702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1i7F-0008Be-UM
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 00:27:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1i5H-0005MY-QG
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:25:51 -0400
Received: from indium.canonical.com ([91.189.90.7]:60056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m1i5E-00018W-Ls
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 00:25:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m1i58-0005Di-Jx
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 04:25:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 698CF2E8181
 for <qemu-devel@nongnu.org>; Fri,  9 Jul 2021 04:25:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Jul 2021 04:17:19 -0000
From: Launchpad Bug Tracker <1903493@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor s12a th-huth
X-Launchpad-Bug-Reporter: ssedt (s12a)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <160490836647.18396.16400473727011669931.malonedeb@wampee.canonical.com>
Message-Id: <162580423975.19936.16387407835288706909.malone@loganberry.canonical.com>
Subject: [Bug 1903493] Re: About wireless network card bridging
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: f7d4b354f82673f339e853c10cdb1c56df906714
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1903493 <1903493@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1903493

Title:
  About wireless network card bridging

Status in QEMU:
  Expired

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

