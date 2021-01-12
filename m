Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 766F22F2711
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 05:28:55 +0100 (CET)
Received: from localhost ([::1]:57284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzBIc-0002cd-Hw
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 23:28:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzBFm-00087Z-81
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:25:58 -0500
Received: from indium.canonical.com ([91.189.90.7]:52136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzBFd-0000so-H9
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:25:58 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kzBFb-0004Ty-HX
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:25:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 802932E813B
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:25:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Jan 2021 04:17:37 -0000
From: Launchpad Bug Tracker <1793791@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: eblake janitor schu-schu th-huth
X-Launchpad-Bug-Reporter: Matthew Schumacher (schu-schu)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <153754814620.30461.9078031705394909150.malonedeb@soybean.canonical.com>
Message-Id: <161042505728.10246.2997238944495960789.malone@loganberry.canonical.com>
Subject: [Bug 1793791] Re: Crash with nbd_reply_chunk_iter_receive: Assertion
 `chunk->flags & NBD_REPLY_FLAG_DONE' failed
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe617ea08df036edd5c842aded2b315e1c090677"; Instance="production"
X-Launchpad-Hash: 8ac1919fb192a5532255d3ae1c9b8e5c2c4247ee
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
Reply-To: Bug 1793791 <1793791@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1793791

Title:
  Crash with nbd_reply_chunk_iter_receive: Assertion `chunk->flags &
  NBD_REPLY_FLAG_DONE' failed

Status in QEMU:
  Expired

Bug description:
  Qemu version on both sides: 2.12.1
  Host A Linux: 4.9.76
  Host B Linux: 4.14.67

  While calling from Host A:
  virsh migrate virtualmachine qemu+ssh://hostB/system --live --undefinesou=
rce --persistent --verbose --copy-storage-all

  I get a qemu crash with:

  2018-09-21 16:12:23.073+0000: 14428: info : virObjectUnref:350 : OBJECT_U=
NREF: obj=3D0x7f922c03d990
  qemu-system-x86_64: block/nbd-client.c:606: nbd_reply_chunk_iter_receive:=
 Assertion `chunk->flags & NBD_REPLY_FLAG_DONE' failed.
  2018-09-21 16:12:41.230+0000: shutting down, reason=3Dcrashed
  2018-09-21 16:12:52.900+0000: shutting down, reason=3Dfailed

  It doesn't do it every time, but most of the time.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1793791/+subscriptions

