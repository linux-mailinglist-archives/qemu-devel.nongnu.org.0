Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE082B01E0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 10:17:42 +0100 (CET)
Received: from localhost ([::1]:34056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kd8jd-0001OY-Il
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 04:17:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kd8iE-00007r-UV
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 04:16:15 -0500
Received: from indium.canonical.com ([91.189.90.7]:50062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kd8i9-00059D-Fs
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 04:16:14 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kd8i6-0002dT-3d
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 09:16:06 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 104D82E8019
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 09:16:06 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2020 09:00:37 -0000
From: Thomas Huth <786208@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: nelhage th-huth
X-Launchpad-Bug-Reporter: Nelson Elhage (nelhage)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20110521152806.22761.57475.malonedeb@wampee.canonical.com>
Message-Id: <160517163776.4993.11778577643494293310.malone@gac.canonical.com>
Subject: [Bug 786208] Re: Missing checks for non-existent device in
 ide_exec_cmd
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9218c6cee10bde7201ace93cd659634a9bc6c70a"; Instance="production"
X-Launchpad-Hash: fb591929df9bef497f81d37982f3ddd911ede54b
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 01:35:39
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 786208 <786208@bugs.launchpad.net>
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
     Assignee: John Snow (jnsnow) =3D> (unassigned)

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/786208

Title:
  Missing checks for non-existent device in ide_exec_cmd

Status in QEMU:
  Incomplete

Bug description:
  Several calls in the ide_exec_cmd handler are missing checks for
  (!s->bs) or similar, resulting in NULL pointer dereferences, divide-
  by-zero, or possibly other badness if the guest performs operations on
  a non-existent IDE master.

  For example, the WIN_READ_NATIVE_MAX command does a 'ide_set_sector(s,
  s->nb_sectors - 1);', which does 'cyl =3D sector_num / (s->heads *
  s->sectors);', which will fail with a divide-by-zero if heads =3D
  sectors =3D 0.

  And WIN_MULTREAD also does not check for s->bs, but does a
  'ide_sector_read(s);', which will do 'bdrv_read(s->bs, sector_num,
  s->io_buffer, n);' on a NULL s->bs, leading to a segfault.

  I do not *believe* that a malicious guest can do anything more than
  cause a crash with these bugs.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/786208/+subscriptions

