Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA35D2EFDCC
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 05:42:58 +0100 (CET)
Received: from localhost ([::1]:41986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky65Z-0002Bh-6C
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 23:42:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5qC-0000Go-3e
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:27:04 -0500
Received: from indium.canonical.com ([91.189.90.7]:47696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1ky5q2-00074A-7k
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 23:27:03 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1ky5pp-0006qk-O8
 for <qemu-devel@nongnu.org>; Sat, 09 Jan 2021 04:26:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 2FA202E819F
 for <qemu-devel@nongnu.org>; Sat,  9 Jan 2021 04:26:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 Jan 2021 04:17:41 -0000
From: Launchpad Bug Tracker <1687270@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor manuel-reimer schoenebeck th-huth
X-Launchpad-Bug-Reporter: Manuel Reimer (manuel-reimer)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20170430094752.26847.19558.malonedeb@chaenomeles.canonical.com>
Message-Id: <161016586162.8490.6878240066330894268.malone@loganberry.canonical.com>
Subject: [Bug 1687270] Re: Can't write to 9p shared folder with qemu 2.9.0
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fd9c5a87183d01004404fa6027cd262eaa7f6fcf"; Instance="production"
X-Launchpad-Hash: 0a50702095e665dd71dd2c22590b50d4a5c6ea41
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
Reply-To: Bug 1687270 <1687270@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1687270

Title:
  Can't write to 9p shared folder with qemu 2.9.0

Status in QEMU:
  Expired

Bug description:
  When running a virtual machine with qemu 2.9.0 with this parameter for
  sharing a folder:

  -virtfs
  local,id=3Dfsdev1,path=3D$HOME/git,security_model=3Dnone,mount_tag=3Dgit

  then the folder is shared to the VM but in some subfolders I can't
  delete files. The guest system then reports that the file, I want to
  delete, is "no file or folder".

  I've downgraded to 2.8.0 now, which re-enables deleting my files.

  Is this a known bug which will be fixed with a future version?

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1687270/+subscriptions

