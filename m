Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E63412AFBA0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 00:21:54 +0100 (CET)
Received: from localhost ([::1]:51970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kczR3-0001i1-Iu
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 18:21:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kczPz-0001Hj-2M
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 18:20:47 -0500
Received: from indium.canonical.com ([91.189.90.7]:38418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kczPx-0001Ev-0F
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 18:20:46 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kczPu-0006N7-J5
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 23:20:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 734AE2E8138
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 23:20:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2020 23:07:20 -0000
From: "Laszlo Ersek \(Red Hat\)" <1685526@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: lersek ronsor th-huth
X-Launchpad-Bug-Reporter: Ronsor (ronsor)
X-Launchpad-Bug-Modifier: Laszlo Ersek (Red Hat) (lersek)
References: <20170422172053.5751.58959.malonedeb@chaenomeles.canonical.com>
Message-Id: <160513604030.29670.18272075900227320691.malone@chaenomeles.canonical.com>
Subject: [Bug 1685526] Re: UEFI firmware can't write to "fake" FAT hard disk
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9218c6cee10bde7201ace93cd659634a9bc6c70a"; Instance="production"
X-Launchpad-Hash: fba89aec2eeb0103911c41ae80d8b3f09557b4d8
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 18:20:43
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
Reply-To: Bug 1685526 <1685526@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Out of scope; please see my (independent, more recent) replies here:

[edk2-devel] OVMF/QEMU shell based unit tests and writing to a virtual
disk

https://edk2.groups.io/g/devel/message/66655
https://edk2.groups.io/g/devel/message/66656

(alternative links:
https://www.redhat.com/archives/edk2-devel-archive/2020-October/msg00877.ht=
ml
https://www.redhat.com/archives/edk2-devel-archive/2020-October/msg00878.ht=
ml
)

** Changed in: qemu
       Status: Incomplete =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1685526

Title:
  UEFI firmware can't write to "fake" FAT hard disk

Status in QEMU:
  Invalid

Bug description:
  Using the Tianocore OVMF UEFI firmware, a UEFI application cannot
  write to the emulated fat disk (-hda fat:rw:path/here). A file will
  get created or written, but will be corrupted.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1685526/+subscriptions

