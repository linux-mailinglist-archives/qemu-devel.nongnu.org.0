Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB3C24C10B
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 16:53:40 +0200 (CEST)
Received: from localhost ([::1]:57800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8lwh-0003w1-H2
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 10:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k8luC-00082t-Sb
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 10:51:04 -0400
Received: from indium.canonical.com ([91.189.90.7]:43460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k8lu9-0003jv-IG
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 10:51:04 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k8lu5-0004G4-7F
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 14:50:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 05E1A2E810D
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 14:50:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2020 14:41:24 -0000
From: Thomas Huth <1880822@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=philmd@redhat.com; 
X-Launchpad-Bug-Tags: cve qemu security
X-Launchpad-Bug-Information-Type: Public Security
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: yes
X-Launchpad-Bug-Commenters: philmd pjps
X-Launchpad-Bug-Reporter: P J P (pjps)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159056340380.1780.3709038768569765525.malonedeb@chaenomeles.canonical.com>
Message-Id: <159793448551.881.6352742261659121037.launchpad@wampee.canonical.com>
Subject: [Bug 1880822] Re: CVE-2020-13253 QEMU: sd: OOB access could crash the
 guest resulting in DoS
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="99c2d833c8d727fd05148486920aca032e908071"; Instance="production"
X-Launchpad-Hash: a8531292802da8b0c42d52a773ad9e7e8fab5354
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 10:50:55
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1880822 <1880822@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1880822

Title:
  CVE-2020-13253 QEMU: sd: OOB access could crash the guest resulting in
  DoS

Status in QEMU:
  Fix Released

Bug description:
  An out-of-bounds read access issue was found in the SD Memory Card
  emulator of the QEMU. It occurs while performing block write commands
  via sdhci_write(), if a guest user has sent 'address' which is OOB of
  's->wp_groups'. A guest user/process may use this flaw to crash the
  QEMU process resulting in DoS.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1880822/+subscriptions

