Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 008D920F4F9
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 14:46:32 +0200 (CEST)
Received: from localhost ([::1]:54788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqFeg-0005s4-PG
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 08:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jqFdp-0005Lc-TP
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 08:45:37 -0400
Received: from indium.canonical.com ([91.189.90.7]:44150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jqFdo-00066b-6Z
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 08:45:37 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jqFdm-0005sU-If
 for <qemu-devel@nongnu.org>; Tue, 30 Jun 2020 12:45:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 87E8A2E80E7
 for <qemu-devel@nongnu.org>; Tue, 30 Jun 2020 12:45:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2020 12:39:05 -0000
From: dcb <1885719@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dcb314
X-Launchpad-Bug-Reporter: dcb (dcb314)
X-Launchpad-Bug-Modifier: dcb (dcb314)
Message-Id: <159352074602.16310.7520706958589320059.malonedeb@soybean.canonical.com>
Subject: [Bug 1885719] [NEW] qemu/target/nios2/helper.c:261:20:
 style:inconclusive: Found duplicate branches for 'if' and 'else'
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1cbd0aa39df153c901321817f9b57cf3f232b507";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 31bef0a9f1a7de36dc0e8bc8a820567639337591
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 08:40:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1885719 <1885719@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Source code is

            } else if (address >=3D 0x80000000) {
                /* Kernel virtual page */
                return cpu_nios2_handle_virtual_page(cs, address, rw, mmu_i=
dx);
            } else {
                /* User virtual page */
                return cpu_nios2_handle_virtual_page(cs, address, rw, mmu_i=
dx);
            }

** Affects: qemu
     Importance: Undecided
         Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1885719

Title:
  qemu/target/nios2/helper.c:261:20: style:inconclusive: Found duplicate
  branches for 'if' and 'else'

Status in QEMU:
  New

Bug description:
  Source code is

              } else if (address >=3D 0x80000000) {
                  /* Kernel virtual page */
                  return cpu_nios2_handle_virtual_page(cs, address, rw, mmu=
_idx);
              } else {
                  /* User virtual page */
                  return cpu_nios2_handle_virtual_page(cs, address, rw, mmu=
_idx);
              }

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1885719/+subscriptions

