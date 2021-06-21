Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FB73AE270
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 06:33:07 +0200 (CEST)
Received: from localhost ([::1]:51268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvBcQ-0006L9-78
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 00:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvBVa-0006qh-IZ
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:26:02 -0400
Received: from indium.canonical.com ([91.189.90.7]:37188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lvBVY-0007IP-8l
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:26:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lvBVT-0002BR-MA
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 04:25:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B76F92E81A4
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 04:25:52 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Jun 2021 04:17:16 -0000
From: Launchpad Bug Tracker <1749016@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: qemu-img vhdx
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor msfrucht stefanha th-huth
X-Launchpad-Bug-Reporter: Michael Fruchtman (msfrucht)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <151847184922.10299.8486156753106334227.malonedeb@wampee.canonical.com>
Message-Id: <162424903752.11837.18164542055033550595.malone@loganberry.canonical.com>
Subject: [Bug 1749016] Re: VHDX BAT and Metadata Region Header Required Bit
 Not Set
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: ad1733039a9e2905fe4b7841aefda15d1a6d5064
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1749016 <1749016@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1749016

Title:
  VHDX BAT and Metadata Region Header Required Bit Not Set

Status in QEMU:
  Expired

Bug description:
  When converting a VMDK to VHDX the resulting VHDX's Region table has a
  small error. According to the VHDX specification the BAT and Metadata
  entries for the region header required bit should be set to 1.  In a
  VHDX created by qemu-img, this bit is not set.

  See Table 4: Known Region Properties of the VHDX specification.

  The structure format is as following from Structure 4: Region Table
  Entry:

  struct VHDX_REGION_TABLE_ENTRY {
  GUID Guid;
  UINT64 FileOffset;
  UINT32 Length;
  UINT32 Required:1;
  UINT32 Reserved:31;
  }

  The Required bit for VHDX specified BAT and Metadata Regions Required
  bit in the entry is not set as required in the current specification.

  VHDX Region Table in a valid VHDX

  Offset(h)    00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F
  0x00030000   72 65 67 69 AE 8C 6B C6 02 00 00 00 00 00 00 00
  0x00030010   66 77 C2 2D 23 F6 00 42 9D 64 11 5E 9B FD 4A 08
  0x00030020   00 00 30 00 00 00 00 00 00 00 10 00 01 00 00 00  =

  0x00030030   06 A2 7C 8B 90 47 9A 4B B8 FE 57 5F 05 0F 88 6E
  0x00030040   00 00 20 00 00 00 00 00 00 00 10 00 01 00 00 00

  VHDX Region Table in a VHDX converted by qemu-img from VMDK

  Offset(h)    00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F
  0x00030000   72 65 67 69 AE 8C 6B C6 02 00 00 00 00 00 00 00
  0x00030010   66 77 C2 2D 23 F6 00 42 9D 64 11 5E 9B FD 4A 08
  0x00030020   00 00 30 00 00 00 00 00 00 00 10 00 00 00 00 00  =

  0x00030030   06 A2 7C 8B 90 47 9A 4B B8 FE 57 5F 05 0F 88 6E
  0x00030040   00 00 20 00 00 00 00 00 00 00 10 00 00 00 00 00

  The fist bit at 0x0003002A and 0x0003004A should be set to 1.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1749016/+subscriptions

