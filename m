Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836B2367D94
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 11:19:51 +0200 (CEST)
Received: from localhost ([::1]:41946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZVV0-0006DV-JI
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 05:19:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZVOB-0001Oz-LB
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:12:47 -0400
Received: from indium.canonical.com ([91.189.90.7]:37182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZVO8-0000EG-9L
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 05:12:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZVO6-0007ih-ED
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 09:12:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3BCA02E815F
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 09:12:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 09:03:09 -0000
From: Thomas Huth <1854738@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: luoyonggang th-huth
X-Launchpad-Bug-Reporter: Yonggang Luo (luoyonggang)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157529523112.6529.3237994494675580627.malonedeb@gac.canonical.com>
Message-Id: <161908218969.22364.9377157418988749658.malone@gac.canonical.com>
Subject: [Bug 1854738] Re: ppc doesn't support for mttcg  but ppc64 supported
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 483e9f7807a65e741d3b1cff23e3478e2809e079
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
Reply-To: Bug 1854738 <1854738@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1854738

Title:
  ppc doesn't support for mttcg  but ppc64 supported

Status in QEMU:
  Incomplete

Bug description:
  Currently ppc and ppc64abi32 doesn't suppport for mttcg, I am looking for=
 support
  ```
    ppc)
      gdb_xml_files=3D"power-core.xml power-fpu.xml power-altivec.xml power=
-spe.xml"
    ;;
    ppc64)
      TARGET_BASE_ARCH=3Dppc
      TARGET_ABI_DIR=3Dppc
      mttcg=3Dyes
      gdb_xml_files=3D"power64-core.xml power-fpu.xml power-altivec.xml pow=
er-spe.xml power-vsx.xml"
    ;;
    ppc64le)
      TARGET_ARCH=3Dppc64
      TARGET_BASE_ARCH=3Dppc
      TARGET_ABI_DIR=3Dppc
      mttcg=3Dyes
      gdb_xml_files=3D"power64-core.xml power-fpu.xml power-altivec.xml pow=
er-spe.xml power-vsx.xml"
    ;;
    ppc64abi32)
      TARGET_ARCH=3Dppc64
      TARGET_BASE_ARCH=3Dppc
      TARGET_ABI_DIR=3Dppc
      echo "TARGET_ABI32=3Dy" >> $config_target_mak
      gdb_xml_files=3D"power64-core.xml power-fpu.xml power-altivec.xml pow=
er-spe.xml power-vsx.xml"
    ;;
  ```

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1854738/+subscriptions

