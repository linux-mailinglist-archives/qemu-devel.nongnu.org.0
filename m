Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE903AFC80
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 07:13:38 +0200 (CEST)
Received: from localhost ([::1]:56102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvYjB-0006jI-4f
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 01:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY4d-0003W8-DH
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:31:43 -0400
Received: from indium.canonical.com ([91.189.90.7]:59266)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvY4X-0000cW-Ex
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 00:31:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvY4I-0003rh-B7
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:31:22 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 489532E808D
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:31:22 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Jun 2021 04:17:30 -0000
From: Launchpad Bug Tracker <1451067@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor miki4242 th-huth
X-Launchpad-Bug-Reporter: Alain Kalker (miki4242)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20150502182723.29231.13701.malonedeb@soybean.canonical.com>
Message-Id: <162433545050.20423.13210111310609389444.malone@loganberry.canonical.com>
Subject: [Bug 1451067] Re: -smb option requires full path for Samba sharing to
 work
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="3619498b5524a71696f3dd612f4d11bd63449bb1"; Instance="production"
X-Launchpad-Hash: 12145e012a972950935126a28f9523a062efbb8c
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
Reply-To: Bug 1451067 <1451067@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1451067

Title:
  -smb option requires full path for Samba sharing to work

Status in QEMU:
  Expired

Bug description:
  This issue has been reported on qemu-devel a looong time ago:
  https://lists.gnu.org/archive/html/qemu-devel/2005-12/msg00141.html

  QEMU version 2.2.1-4 on Arch Linux x86_64

  Steps to reproduce:

  host$ mkdir share
  host$ chmod o+rwx share
  host$ qemu <other options> -smb share

  vm$ smbclient //10.0.2.4/qemu -N
  smbclient: Can't load /etc/samba/smb.conf - run testparm to debug it
  Domain=3D[WORKGROUP] OS=3D[Windows 6.1] Server=3D[Samba 4.2.1]
  tree connect failed: NT_STATUS_BAD_NETWORK_NAME
  vm$ poweroff

  Workaround:

  host$ qemu <other options> -smb /full/path/to/share

  vm$ $ smbclient //10.0.2.4/qemu -N
  smbclient: Can't load /etc/samba/smb.conf - run testparm to debug it
  Domain=3D[WORKGROUP] OS=3D[Windows 6.1] Server=3D[Samba 4.2.1]
  smb: \> ls
    .                                   D        0  Sat May  2 19:57:31 2015
    ..                                  D        0  Sat May  2 19:57:31 2015

  		961302540 blocks of size 1024. 637557248 blocks available
  smb: \> quit

  Please, please fix this gotcha, whether in the documentation or in
  code. it can cause some serious bouts of hair-pulling.

  -Alain

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1451067/+subscriptions

