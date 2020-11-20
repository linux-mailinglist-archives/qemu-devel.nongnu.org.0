Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665D02BB3F3
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 19:51:29 +0100 (CET)
Received: from localhost ([::1]:57452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgBVI-0003Vn-FS
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 13:51:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgBTj-0002wV-6D
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:49:51 -0500
Received: from indium.canonical.com ([91.189.90.7]:40176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kgBTg-00068m-S6
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:49:50 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kgBTe-0000V3-1M
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 18:49:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id F10262E813F
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 18:49:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2020 18:37:55 -0000
From: Thomas Huth <1284090@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fromani-1 th-huth
X-Launchpad-Bug-Reporter: Francesco Romani (fromani-1)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20140224123257.31623.72910.malonedeb@gac.canonical.com>
Message-Id: <160589747532.24563.11607907074775444181.malone@wampee.canonical.com>
Subject: [Bug 1284090] Re: RFE: QMP: report error reason in BLOCK_IO_ERROR
 message
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: d3f9b1caaad89a45be20af56c5e12a3b6e6cf55d
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
Reply-To: Bug 1284090 <1284090@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1284090

Title:
  RFE: QMP: report error reason in BLOCK_IO_ERROR message

Status in QEMU:
  Incomplete

Bug description:
  when a disk drive is configured with the error policy enospc for write er=
rors, the monitoring client needs a way to distinguish
  betwwen generic I/O error and the I/O error for space exausted.

  The JSON QMP protocol lacks this information: the BLOCK_IO_ERROR
  message does not provide a reason or code for the error verified, so
  the monitoring client cannot distinguish the source of the errors.

  verified against git 105a060188dc6fdd4551571a966514d1a5f6815a

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1284090/+subscriptions

