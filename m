Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0D63686FF
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 21:13:32 +0200 (CEST)
Received: from localhost ([::1]:49832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZelX-0001i6-6l
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 15:13:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZehD-0006Li-06
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 15:09:04 -0400
Received: from indium.canonical.com ([91.189.90.7]:46692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZeh5-0004d4-Uy
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 15:09:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZeh3-00026z-Pl
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 19:08:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 882252E8176
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 19:08:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 17:26:48 -0000
From: Thomas Huth <1703506@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: babumoger ehabkost imatimba ptx0 rs-databay
 ryzen27 scix th-huth
X-Launchpad-Bug-Reporter: A S (scix)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <149974876377.6612.10329067332937096720.malonedeb@gac.canonical.com>
Message-Id: <161911240916.6767.13450026970913858059.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1703506] Re: SMT not supported by QEMU on AMD Ryzen CPU
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 3b5e51410fe93a93059c72f28d420a097663cd2a
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
Reply-To: Bug 1703506 <1703506@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Bug watch removed: Red Hat Bugzilla #1135772
   https://bugzilla.redhat.com/show_bug.cgi?id=3D1135772

** Bug watch removed: Red Hat Bugzilla #1592276
   https://bugzilla.redhat.com/show_bug.cgi?id=3D1592276

** Changed in: qemu
     Assignee: Eduardo Habkost (ehabkost) =3D> (unassigned)

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1703506

Title:
  SMT not supported by QEMU on AMD Ryzen CPU

Status in QEMU:
  Incomplete

Bug description:
  HyperThreading/SMT is supported by AMD Ryzen CPUs but results in this
  message when setting the topology to threads=3D2:

  qemu-system-x86_64: AMD CPU doesn't support hyperthreading. Please
  configure -smp options properly.

  Checking in a Windows 10 guest reveals that SMT is not enabled, and
  from what I understand, QEMU converts the topology from threads to
  cores internally on AMD CPUs. This appears to cause performance
  problems in the guest perhaps because programs are assuming that these
  threads are actual cores.

  Software: Linux 4.12, qemu 2.9.0 host with KVM enabled, Windows 10 pro
  guest

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1703506/+subscriptions

