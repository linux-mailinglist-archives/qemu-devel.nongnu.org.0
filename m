Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B51C536F74D
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 10:47:08 +0200 (CEST)
Received: from localhost ([::1]:40194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcOnj-0006AE-Q8
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 04:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcOjn-0004j8-FI
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 04:43:03 -0400
Received: from indium.canonical.com ([91.189.90.7]:55744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcOjj-0003nw-Q1
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 04:43:03 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcOjh-00062u-Id
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:42:57 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8B1682E8165
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:42:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 08:34:59 -0000
From: Thomas Huth <1906905@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: sparc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: mark-cave-ayland philmd th-huth yapkv
X-Launchpad-Bug-Reporter: yapkv (yapkv)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160714087524.10652.4920404623701840898.malonedeb@soybean.canonical.com>
Message-Id: <161977170004.9618.1688359131963949131.malone@gac.canonical.com>
Subject: [Bug 1906905] Re: qemu-system-sparc stucked while booting using
 ss20_v2.25_rom 
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: db80a1b4783db898fde4f505015056053374fc10
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
Reply-To: Bug 1906905 <1906905@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix has been included here:
https://gitlab.com/qemu-project/qemu/-/commit/62a9b228b5fefe0f9e364d

** Changed in: qemu
       Status: Confirmed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1906905

Title:
  qemu-system-sparc stucked while booting using ss20_v2.25_rom

Status in QEMU:
  Fix Released

Bug description:
  I cannot boot up OBP using the current (5.1) version of qemu with
  ss20_v2.25_rom. It just stuck at "Power-ON reset" and hanged.  However
  using the previous version from 2015 I can successfully both up the
  OBP.

  qemu-system-sparc -M SS-20 -m 256 -bios ss20_v2.25.rom -nographic

  Power-ON Reset

  (*hang)

  regards
  Yap KV

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1906905/+subscriptions

