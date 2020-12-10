Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1082D5666
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 10:14:09 +0100 (CET)
Received: from localhost ([::1]:33504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knI1Y-0004OU-Fp
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 04:14:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knHpO-0002Cg-Dk
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:01:34 -0500
Received: from indium.canonical.com ([91.189.90.7]:60152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knHpC-0000jC-4o
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:01:34 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1knHp9-0004oD-Qj
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:01:19 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id C97C22E813F
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:01:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Dec 2020 08:53:24 -0000
From: Thomas Huth <1852196@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=lersek@redhat.com; 
X-Launchpad-Bug-Tags: feature-request
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: lersek philmd th-huth
X-Launchpad-Bug-Reporter: Laszlo Ersek (Red Hat) (lersek)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157355353271.7205.5763587027166419396.malonedeb@gac.canonical.com>
Message-Id: <160759040409.4721.15480403185012912251.malone@gac.canonical.com>
Subject: [Bug 1852196] Re: update edk2 submodule & binaries to
 edk2-stable202008
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: 15e410033ab128d621318d1c462b0a3ba99094cf
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
Reply-To: Bug 1852196 <1852196@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Released with QEMU v5.2.0.

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1852196

Title:
  update edk2 submodule & binaries to edk2-stable202008

Status in QEMU:
  Fix Released

Bug description:
  Consume the following upstream edk2 releases:

  https://github.com/tianocore/edk2/releases/tag/edk2-stable201908
  https://github.com/tianocore/edk2/releases/tag/edk2-stable201911
  https://github.com/tianocore/edk2/releases/tag/edk2-stable202002
  https://github.com/tianocore/edk2/releases/tag/edk2-stable202005
  https://github.com/tianocore/edk2/releases/tag/edk2-stable202008

  Worth mentioning (in random order):

  - various CVE fixes [*]
  - OpenSSL-1.1.1g
  - UEFI HTTPS Boot for ARM/AARCH64
  - TPM2 for ARM/AARCH64
  - VCPU hotplug with SMI
  - support for Linux v5.7+ initrd and mixed mode loading
  - Fusion-MPT SCSI driver in OVMF
  - VMware PVSCSI driver in OVMF
  - PXEv4 / PXEv6 boot possible to disable on the QEMU command line
  - SEV-ES support

  [*] the below list has been collected simply from the subject lines in
  commit range edk2-stable201905..edk2-stable202008:

    CVE-2019-11098 CVE-2019-14553 CVE-2019-14558 CVE-2019-14559
    CVE-2019-14562 CVE-2019-14563 CVE-2019-14575 CVE-2019-14586
    CVE-2019-14587

  (Note that any given CVE from the above list may or may not affect the
  firmware binaries packaged with upstream QEMU; consult the upstream
  TianoCore bug tracker at <https://bugzilla.tianocore.org/> for details.)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1852196/+subscriptions

