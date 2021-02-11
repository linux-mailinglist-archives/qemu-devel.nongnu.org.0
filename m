Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3453190A6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 18:12:16 +0100 (CET)
Received: from localhost ([::1]:48734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAFVn-0007gn-E0
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 12:12:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lAFLC-0005Qt-T3
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:01:20 -0500
Received: from indium.canonical.com ([91.189.90.7]:54230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lAFL5-0005e8-BY
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 12:01:18 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lAFKz-0001gV-1d
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 17:01:05 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 61F0D2E814D
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 17:01:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Feb 2021 16:51:31 -0000
From: ANIMESH KUMAR SINHA <1912777@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Opinion; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=None; component=None;
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: animeshk th-huth
X-Launchpad-Bug-Reporter: ANIMESH KUMAR SINHA (animeshk)
X-Launchpad-Bug-Modifier: ANIMESH KUMAR SINHA (animeshk)
References: <161131847021.10154.14606822070729811950.malonedeb@gac.canonical.com>
Message-Id: <161306229164.29338.12711021018715300773.launchpad@soybean.canonical.com>
Subject: [Bug 1912777] Re: KVM_EXIT_MMIO has increased in Qemu4.0.0 when
 compared to Qemu 2.11.0
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e34ce994f03aae76d4610a97bccf86c0f2cf9f70"; Instance="production"
X-Launchpad-Hash: 78fe8bb8e49ae0e4886749992ab7649cfcf0daed
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
Reply-To: Bug 1912777 <1912777@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Also affects: qemu (Ubuntu)
   Importance: Undecided
       Status: New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1912777

Title:
  KVM_EXIT_MMIO has increased in Qemu4.0.0 when compared to Qemu 2.11.0

Status in QEMU:
  Opinion
Status in Ubuntu:
  New
Status in qemu package in Ubuntu:
  New

Bug description:
  I was able to generate trace dump in Qemu for kvm_run_exit event in both =
QEMU 2.11.0 and QEMU 4.0.0
  From the trace i noticed that the number of KVM_KXIT_MMIO calls has incre=
ased alot and is causing delay in testcase execution.

  I executed same testcase from Qemu 2.11 and Qemu4.
  Inside Virtual machine when using qemu 2.11 testcase got completed in 11 =
seconds
  but the same testcase when executed on Qemu 4.0.0 got executed in 26 seco=
nds.

  I did a bit of digging and extracted the kvm_run_exit to figure out
  whats going on.

  Please find
  Stats from Qemu2.11:

  KVM_EXIT_UNKNOWN          : 0
  KVM_EXIT_EXCEPTION        : 0
  KVM_EXIT_IO               : 182513
  KVM_EXIT_HYPERCALL        : 0
  KVM_EXIT_DEBUG            : 0
  KVM_EXIT_HLT              : 0
  KVM_EXIT_MMIO             : 216701
  KVM_EXIT_IRQ_WINDOW_OPEN  : 0
  KVM_EXIT_SHUTDOWN         : 0
  KVM_EXIT_FAIL_ENTRY       : 0
  KVM_EXIT_INTR             : 0
  KVM_EXIT_SET_TPR          : 0
  KVM_EXIT_TPR_ACCESS       : 0
  KVM_EXIT_S390_SIEIC       : 0
  KVM_EXIT_S390_RESET       : 0
  KVM_EXIT_DCR              : 0
  KVM_EXIT_NMI              : 0
  KVM_EXIT_INTERNAL_ERROR   : 0
  KVM_EXIT_OSI              : 0
  KVM_EXIT_PAPR_HCALL       : 0
  KVM_EXIT_S390_UCONTROL    : 0
  KVM_EXIT_WATCHDOG         : 0
  KVM_EXIT_S390_TSCH        : 0
  KVM_EXIT_EPR              : 0
  KVM_EXIT_SYSTEM_EVENT     : 0
  KVM_EXIT_S390_STSI        : 0
  KVM_EXIT_IOAPIC_EOI       : 0
  KVM_EXIT_HYPERV           : 0

  KVM_RUN_EXIT              : 399214  (Total in Qemu 2.11 for a
  testcase)

  Stats For Qemu 4.0.0:

  VM_EXIT_UNKNOWN           : 0
  KVM_EXIT_EXCEPTION        : 0
  KVM_EXIT_IO               : 163729
  KVM_EXIT_HYPERCALL        : 0
  KVM_EXIT_DEBUG            : 0
  KVM_EXIT_HLT              : 0
  KVM_EXIT_MMIO             : 1094231
  KVM_EXIT_IRQ_WINDOW_OPEN  : 46
  KVM_EXIT_SHUTDOWN         : 0
  KVM_EXIT_FAIL_ENTRY       : 0
  KVM_EXIT_INTR             : 0
  KVM_EXIT_SET_TPR          : 0
  KVM_EXIT_TPR_ACCESS       : 0
  KVM_EXIT_S390_SIEIC       : 0
  KVM_EXIT_S390_RESET       : 0
  KVM_EXIT_DCR              : 0
  KVM_EXIT_NMI              : 0
  KVM_EXIT_INTERNAL_ERROR   : 0
  KVM_EXIT_OSI              : 0
  KVM_EXIT_PAPR_HCALL       : 0
  KVM_EXIT_S390_UCONTROL    : 0
  KVM_EXIT_WATCHDOG         : 0
  KVM_EXIT_S390_TSCH        : 0
  KVM_EXIT_EPR              : 0
  KVM_EXIT_SYSTEM_EVENT     : 0
  KVM_EXIT_S390_STSI        : 0
  KVM_EXIT_IOAPIC_EOI       : 464
  KVM_EXIT_HYPERV           : 0

  KVM_RUN_EXIT              : 1258470 (Total in qemu 4.0.0 for same
  testcase)

  From above analysis i found that the number of KVM_EXIT_MMIO has
  increased by 4.x.

  Could someone from qemu community help me understand as to why the
  MMIO exits have increased in qemu4 ?

  The results i obtained are after running same testcase.
  On Qemu2.11 testcase gets completed in : 11seconds
  on Qemu4.11 testcase gets completed in : 26 seconds

  VM Qcow2 used in Ubuntu 16.04
  VM kernel OS is : 4.4 generic

  Let me know incase more information is required .

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1912777/+subscriptions

