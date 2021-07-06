Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F1B3BC5AC
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 06:43:26 +0200 (CEST)
Received: from localhost ([::1]:48906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0cvd-0004Zo-Ab
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 00:43:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfo-0000ro-0Z
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:27:04 -0400
Received: from indium.canonical.com ([91.189.90.7]:53226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfm-0003Zf-CR
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:27:03 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0cfY-0004wt-Ln
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 04:26:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id ECF812E8473
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 04:26:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Jul 2021 04:17:20 -0000
From: Launchpad Bug Tracker <1865188@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor laurent-vivier tebounet th-huth
X-Launchpad-Bug-Reporter: Thierry Briot (tebounet)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <158291064909.26276.9623855364402088462.malonedeb@gac.canonical.com>
Message-Id: <162554504045.7821.14528962531647800282.malone@loganberry.canonical.com>
Subject: [Bug 1865188] Re: Switching from the monitor to the emulated machine
 with a French keyboard (AZERTY)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: 1a2530fc004e571700acb49fdb9a431e53a76c86
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
Reply-To: Bug 1865188 <1865188@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1865188

Title:
  Switching from the monitor to the emulated machine with a French
  keyboard (AZERTY)

Status in QEMU:
  Expired

Bug description:
  Hi,
  I run qemu in an xterm terminal, with TERM=3Dvt100. My keyboard is french=
 AZERTY.

  sudo ./qemu-system-hppa -monitor /dev/pts/2 -k fr  -boot d -drive
  if=3Dscsi,bus=3D0,index=3D5,file=3D../../hpux_11iv1.img,format=3Draw -ser=
ial
  mon:stdio -D qemu1.log -nographic -m 512 -d nochain -cdrom
  ../../distri/11iv1/'HP-
  UX_11iv1_B.11.11_TCOE_September_2005_1of4_Core_OS
  _Install&Recovery_B6821-10046.iso' -net nic,model=3Dtulip  -net tap

  When I want to use the monitor (to change cdrom during the hp-ux
  installation process), the characters I type are misinterpreted. For
  example, I enter "2" at hp-ux prompt, I see : "412691;82;22".
  Impossible to switch from monitor to hp-ux with Ctrl+Alt+1 and
  Ctrl+Alt+2.

  I tried with Debian and Fedora host, TERM=3Dxterm and TERM=3Dvt100, qemu =
options -alt-grab and -ctrl-grab, -monitor in the same terminal or an other=
 terminal than hp-ux. Nothing works.
  Best regards.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1865188/+subscriptions

