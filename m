Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF752EEC79
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 05:28:28 +0100 (CET)
Received: from localhost ([::1]:49872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxjNz-000323-BZ
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 23:28:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxjLc-0001H6-JA
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:26:00 -0500
Received: from indium.canonical.com ([91.189.90.7]:55736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxjLX-0003cg-VY
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:26:00 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kxjLU-0004CK-5a
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 04:25:52 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D97C02E8147
 for <qemu-devel@nongnu.org>; Fri,  8 Jan 2021 04:25:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 Jan 2021 04:17:23 -0000
From: Launchpad Bug Tracker <1671173@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor narke th-huth
X-Launchpad-Bug-Reporter: Konstantin Tcholokachvili (narke)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20170308172325.8219.67729.malonedeb@chaenomeles.canonical.com>
Message-Id: <161007944368.27824.4287572716769450314.malone@loganberry.canonical.com>
Subject: [Bug 1671173] Re: OS started to crash with a message: "Trying to
 execute code outside RAM or ROM"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9b8a7e9b05b0918031670be47aedac0f241cb913"; Instance="production"
X-Launchpad-Hash: 03f5a475a3cf5809873184f22520e61100e26748
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1671173 <1671173@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1671173

Title:
  OS started to crash with a message: "Trying to execute code outside
  RAM or ROM"

Status in QEMU:
  Expired

Bug description:
  There is a project (https://github.com/narke/colorForth ) wich always
  worked with qemu up to version 2.5.1.1 but doesn't works from version
  2.6 onwards. It continues to work with bochs.

  Downlaod: git clone https://github.com/narke/colorForth.git
  Build: make
  Test: qemu-system-i386 -drive format=3Draw,file=3Dcf2012.img,index=3D0,if=
=3Dfloppy

  =

  System information: Ubuntu LTS 16.04 x86-64
  Affected qemu versions: 2.6 to present (2.8)

  =

  I got the message:

  =

  WARNING: Image format was not specified for 'cf2012.img' and probing gues=
sed raw.
           Automatically detecting the format is dangerous for raw images, =
write operations on block 0 will be restricted.
           Specify the 'raw' format explicitly to remove the restrictions.
  qemu-system-i386: Trying to execute code outside RAM or ROM at 0x8998c426
  This usually means one of the following happened:

  (1) You told QEMU to execute a kernel for the wrong machine type, and it =
crashed on startup (eg trying to run a raspberry pi kernel on a versatilepb=
 QEMU machine)
  (2) You didn't give QEMU a kernel or BIOS filename at all, and QEMU execu=
ted a ROM full of no-op instructions until it fell off the end
  (3) Your guest kernel has a bug and crashed by jumping off into nowhere

  This is almost always one of the first two, so check your command line an=
d that you are using the right type of kernel for this machine.
  If you think option (3) is likely then you can try debugging your guest w=
ith the -d debug options; in particular -d guest_errors will cause the log =
to include a dump of the guest register state at this point.

  Execution cannot continue; stopping here.

  =

  Thank you in advance.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1671173/+subscriptions

