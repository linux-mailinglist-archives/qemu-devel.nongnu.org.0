Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D69212B501C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 19:48:48 +0100 (CET)
Received: from localhost ([::1]:52490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kejYV-0000ve-Ra
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 13:48:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kejHH-00033N-Hv
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:30:59 -0500
Received: from indium.canonical.com ([91.189.90.7]:42746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kejHF-0005zp-E6
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 13:30:59 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kejHD-00022J-74
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 18:30:55 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3446C2E811E
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 18:30:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2020 18:15:21 -0000
From: Thomas Huth <1740887@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: hitchhikr rtillet th-huth
X-Launchpad-Bug-Reporter: charlet franck (hitchhikr)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <151490925457.26459.4227536724801475724.malonedeb@gac.canonical.com>
Message-Id: <160555052117.26516.17554706713489268831.malone@chaenomeles.canonical.com>
Subject: [Bug 1740887] Re: qemu-system-arm & qemu-system-aarch64 for windows
 crash at start
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a2ee2035671f86427804714f331b9ff7fecaef7e"; Instance="production"
X-Launchpad-Hash: 8d8ad273c8f9b448760b57f4af5b446a0afba768
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 13:11:09
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1740887 <1740887@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1740887

Title:
  qemu-system-arm & qemu-system-aarch64 for windows crash at start

Status in QEMU:
  Incomplete

Bug description:
  In Windows 7 64 bit (both 32 & 64 bit QEMU emulator version 2.11.0
  (v2.11.0-11693-g21057c841e-dirty)).

  With arguments:

  qemu-system-arm.exe -M raspi2

  It crashes and reports:

  ERROR:/home/stefan/src/qemu/repo.or.cz/qemu/ar7/qom/object.c:176:type_get=
_parent:
  assertion failed: (type->parent_type !=3D NULL)

  Same goes for qemu-system-aarch64.exe or with -M raspi argument.

  Have a nice day,
  f.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1740887/+subscriptions

