Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA27D51ECDC
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 12:17:39 +0200 (CEST)
Received: from localhost ([::1]:35712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nndys-0000tn-Cf
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 06:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1nndxA-0007oN-45
 for qemu-devel@nongnu.org; Sun, 08 May 2022 06:15:53 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:42998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1nndx5-0005wI-Gf
 for qemu-devel@nongnu.org; Sun, 08 May 2022 06:15:50 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id C17463F187
 for <qemu-devel@nongnu.org>; Sun,  8 May 2022 10:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1652004939;
 bh=MhOuzXD9AYbN99Prs+mP+8qVRE3dp18kTazbBGpyLnE=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=Jshptt7kdI1u4fqrpBXwq9LHOzE8pHoFiV35MlWU2xox3DbHC6rZ3dekNUaru8C4J
 EUQY7xtfH2JAtAcrKqJk3KC0ySofA/j9W2sjPmmEuSf7ha0lylIU+5QFD+Hng5RicI
 xAN38M/yxePH1kTAjkuxPwsvDcZ47exuFiEw+dak0zcfEomKcJ78AShp1Kr2O4zwED
 he/nqVavq72H6+w7q02+kfOGK34R+j87hLgXaHcRUK00PWiauqCVkgF6dbLkKu/OGn
 bG8m2MxkUoQ57Oblh6rNZQZbI9S6dLHpdk1X4cunIwI/5ItEEv8ILK5liUFNWJoIzT
 Sz1hp7p/tXvvA==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 514192E8224
 for <qemu-devel@nongnu.org>; Sun,  8 May 2022 10:15:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 May 2022 10:08:55 -0000
From: Andrii <1703506@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: amnevar babumoger ehabkost imatimba janitor ptx0
 rs-databay ryzen27 scix th-huth
X-Launchpad-Bug-Reporter: A S (scix)
X-Launchpad-Bug-Modifier: Andrii (amnevar)
References: <149974876377.6612.10329067332937096720.malonedeb@gac.canonical.com>
Message-Id: <165200453581.19459.8373168970305312337.malone@angus.canonical.com>
Subject: [Bug 1703506] Re: SMT not supported by QEMU on AMD Ryzen CPU
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a1979342dd08d6250d2d30773ae8aa97bed37b43"; Instance="production"
X-Launchpad-Hash: 4b2fdcb272493d7fc27bd029c1dcb032baaf65b0
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Found the same problem using Gnome boxes, as I understand it uses QEMU.

Error I see in gnome boxes when I'm trying to install windows 10 vm:
SYSTEM THREAD EXCEPTION NOT HANDLED

Fresh install of Ubuntu 22.04
CPU: AMD Ryzen 7 1700

The solution posted by asd fghjkl (ryzen27) worked for me too:

sudo nano /etc/modprobe.d/kvm.conf
add "options kvm ignore_msrs=3D1" (without quotes)
reboot

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


