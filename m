Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DECF2FAF74
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 05:36:43 +0100 (CET)
Received: from localhost ([::1]:42888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1il0-0005ay-3I
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 23:36:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1ifs-0000b3-Fv
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 23:31:24 -0500
Received: from indium.canonical.com ([91.189.90.7]:57610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l1ifn-0004xc-Qw
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 23:31:24 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l1ifl-00047A-1z
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 04:31:17 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CFD8A2E8157
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 04:31:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 Jan 2021 04:17:28 -0000
From: Launchpad Bug Tracker <1555452@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: gdb windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor th-huth yorkwar
X-Launchpad-Bug-Reporter: Yorkwar (yorkwar)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <20160310063544.20794.78000.malonedeb@soybean.canonical.com>
Message-Id: <161102984898.12094.10362602886594407700.malone@loganberry.canonical.com>
Subject: [Bug 1555452] Re: GDB server does not work in Windows
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="44709f752aec466e4fba4ac588c69193e99da5ce"; Instance="production"
X-Launchpad-Hash: 09117f4a72353d4b5efd034d83724bd2d54901a2
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
Reply-To: Bug 1555452 <1555452@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1555452

Title:
  GDB server does not work in Windows

Status in QEMU:
  Expired

Bug description:
  I build qemu with msys2, MINGW64. After fix the socket_error() problem, a=
nd manually specify to use IPv4, GDB server still does not work.  The relat=
ed qemu command is
  "-monitor none -nographic -gdb tcp::1234 -S"
  GDB reports "Timed out"

  There's a message at https://www.mail-archive.com/qemu-devel@nongnu.org/m=
sg357981.html.
  I've fixed the socket_error() problem.
  I see that qio_channel_create_socket_watch is called.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1555452/+subscriptions

