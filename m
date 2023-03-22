Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 422D46C5A72
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 00:33:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf78P-0007Pm-IL; Wed, 22 Mar 2023 18:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1pf78H-0007Pb-Vb
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:40:38 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1pf78F-0008JR-EB
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 18:40:37 -0400
Received: from scripts-1.lp.internal (scripts.lp.internal [10.131.66.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 12DD942832
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 22:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1679524828;
 bh=9L1OH6atSkVKYfJMATKZxhZw/mAzRGonpHStysuqqYo=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=aFeCF9mPyU7KbQneHw8Kdy5jY+JeYJiiERVIXO4uNFOK6fshoxA3i2iPgs9LTzIHV
 cAWAqF8AAg00GsBjbuYariRONxB67Mg7tnBgS0neUrFyxGKdSRxruQjRIgvjdhPMrA
 9NiNZlG6BwIdVyX/CjMOFPqoO813HTvOFCrZTBHGt09hkSzgyk3wiMalP2Q6reMS2L
 YOMMFzph9eHp0xXEeHisK4ghtDkASq8ZywSynkkluZ+bK4jDMKeysSE3WNqhvazUEe
 GvlfNQ0y6q7MKZEZQiWftzmzRfH6vSoXRMMLAdI+02H7itjevU6l4qzyHqbbs2cWvi
 GxrEbgFBA5FcA==
Received: from
 juju-4112d9-prod-launchpad-manual-servers-36.openstack.prodstack5.lan
 (localhost [127.0.0.1])
 by scripts-1.lp.internal (Postfix) with ESMTP id 4F3B43F56B
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 22:40:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Mar 2023 22:32:07 -0000
From: Nelo <1703506@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ak-launchpad amnevar babumoger ehabkost imatimba
 janitor nelo390 ptx0 rs-databay ryzen27 scix th-huth
X-Launchpad-Bug-Reporter: A S (scix)
X-Launchpad-Bug-Modifier: Nelo (nelo390)
References: <149974876377.6612.10329067332937096720.malonedeb@gac.canonical.com>
Message-Id: <167952432774.3031.15041843477170240488.malone@angus.canonical.com>
Subject: [Bug 1703506] Re: SMT not supported by QEMU on AMD Ryzen CPU
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c5a134908fde0a645e56f24c14f906bf278db3e0"; Instance="production"
X-Launchpad-Hash: 89db0d1d2fc3a22436e0abd3794f78f236bf5143
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This affected me. Took me several days.


The solution posted by asd fghjkl (ryzen27) worked for me as  well:

sudo nano /etc/modprobe.d/kvm.conf
options kvm ignore_msrs=3D1
and then rebooted

I'm very glad i found this thread. Don't know where to report this or if
it's even a bug, But hope it gets fixed!

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1703506

Title:
  SMT not supported by QEMU on AMD Ryzen CPU

Status in QEMU:
  Expired

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


