Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D951EF65D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jun 2020 13:22:21 +0200 (CEST)
Received: from localhost ([::1]:49678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jhAQW-00081Y-I3
	for lists+qemu-devel@lfdr.de; Fri, 05 Jun 2020 07:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jhAP2-0006jT-Mz
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 07:20:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:38346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jhAP1-0000o2-LP
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 07:20:48 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jhAOz-0004eY-QL
 for <qemu-devel@nongnu.org>; Fri, 05 Jun 2020 11:20:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C627D2E80AD
 for <qemu-devel@nongnu.org>; Fri,  5 Jun 2020 11:20:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2020 11:12:20 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1880822@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=In Progress; importance=Undecided;
 assignee=philmd@redhat.com; 
X-Launchpad-Bug-Tags: cve qemu security
X-Launchpad-Bug-Information-Type: Public Security
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: yes
X-Launchpad-Bug-Commenters: philmd pjps
X-Launchpad-Bug-Reporter: P J P (pjps)
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <159056340380.1780.3709038768569765525.malonedeb@chaenomeles.canonical.com>
Message-Id: <159135554053.31735.8715161407829388738.malone@gac.canonical.com>
Subject: [Bug 1880822] Re: CVE-2020-13253 QEMU: sd: OOB access could crash the
 guest resulting in DoS
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ef9fc486e875d54078fa61cf91e898b895125d89";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 4cb366a69ed11f550c20f25a1731d859466d0cb7
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 04:10:55
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

v3:
https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg01316.html

** Changed in: qemu
     Assignee: (unassigned) =3D> Philippe Mathieu-Daud=C3=A9 (philmd)

** Changed in: qemu
       Status: Confirmed =3D> In Progress

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1880822

Title:
  CVE-2020-13253 QEMU: sd: OOB access could crash the guest resulting in
  DoS

Status in QEMU:
  In Progress

Bug description:
  An out-of-bounds read access issue was found in the SD Memory Card
  emulator of the QEMU. It occurs while performing block write commands
  via sdhci_write(), if a guest user has sent 'address' which is OOB of
  's->wp_groups'. A guest user/process may use this flaw to crash the
  QEMU process resulting in DoS.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1880822/+subscriptions

