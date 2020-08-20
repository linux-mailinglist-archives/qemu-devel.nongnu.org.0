Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F4F24C226
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 17:27:21 +0200 (CEST)
Received: from localhost ([::1]:53512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8mTI-0006He-Vm
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 11:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k8mNC-0000uh-Lm
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 11:21:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:53138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k8mN9-0008B0-36
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 11:21:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k8mN5-0001mD-6c
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 15:20:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E2A9A2E80D2
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 15:20:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2020 15:09:51 -0000
From: Thomas Huth <1882784@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=High;
 assignee=th.huth@posteo.de; 
X-Launchpad-Bug-Tags: assign igd quirk
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: sshaikh th-huth thecatfelix
X-Launchpad-Bug-Reporter: Shak (sshaikh)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159171166832.31735.6432186230204851906.malonedeb@gac.canonical.com>
Message-Id: <159793619251.1692.16998545158563340089.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1882784] Re: Legacy IGD passthrough in QEMU 5 disabled
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="99c2d833c8d727fd05148486920aca032e908071"; Instance="production"
X-Launchpad-Hash: 46953ce512c433607385805cdde962725d2e92df
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 10:50:55
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1882784 <1882784@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1882784

Title:
  Legacy IGD passthrough in QEMU 5 disabled

Status in QEMU:
  Fix Released

Bug description:
  Bug with tag v5.0.0, or commit
  fdd76fecdde1ad444ff4deb7f1c4f7e4a1ef97d6

  As of QEMU 5 Legacy IGD PT is no longer working.

  Host is a Xeon E3-1226 v3 and my method to test is to run the
  following:

  ./qemu-system-x86_64 \
    -device 'pci-bridge,id=3Dpci.1,chassis_nr=3D1,bus=3Dpci.0,addr=3D0x1f' \
    -device 'vfio-pci,host=3D00:02.0,addr=3D02.0' \
    -L '/usr/share/kvm' \
    -nographic \
    -vga none \
    -nodefaults

  in the hope of seeing a "IGD device 0000:00:02.0 cannot support legacy
  mode due to existing devices at address 1f.0" error.

  The culprit appears to be this commit:

  https://github.com/qemu/qemu/commit/29d62771c81d8fd244a67c14a1d968c268d3f=
b19

  Specifically the following block in pci-quirks.c:

  #ifdef CONFIG_VFIO_IGD
      vfio_probe_igd_bar4_quirk(vdev, nr);
  #endif

  as the kconfig variable CONFIG_VFIO_IGD doesn't appear to be available
  outside of makefiles as described here:
  https://qemu.weilnetz.de/doc/devel/kconfig.html. I can confirm that
  the igd code is being pulled in as removing this check, as would
  defining the variable I presume, makes Legacy IGD PT work again (ie I
  see the expected "existing devices" error).

  I first spotted this in Proxmox, but have confirmed the bug by
  building QEMU sources.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1882784/+subscriptions

