Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D39DA276367
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Sep 2020 23:56:59 +0200 (CEST)
Received: from localhost ([::1]:43094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLCl0-0001I7-RS
	for lists+qemu-devel@lfdr.de; Wed, 23 Sep 2020 17:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kLCjk-0000QV-Qf
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 17:55:42 -0400
Received: from indium.canonical.com ([91.189.90.7]:57472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kLCjh-00006S-Do
 for qemu-devel@nongnu.org; Wed, 23 Sep 2020 17:55:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kLCje-00074V-Eo
 for <qemu-devel@nongnu.org>; Wed, 23 Sep 2020 21:55:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 60B3C2E80E9
 for <qemu-devel@nongnu.org>; Wed, 23 Sep 2020 21:55:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2020 21:46:17 -0000
From: Toolybird <1896096@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange bonzini fredb74 laurent-vivier pmaydell
 toolybird
X-Launchpad-Bug-Reporter: Frederic Bezies (fredb74)
X-Launchpad-Bug-Modifier: Toolybird (toolybird)
References: <160036517624.17887.51064102046414127.malonedeb@soybean.canonical.com>
Message-Id: <160089757786.8656.525383336332556044.malone@chaenomeles.canonical.com>
Subject: [Bug 1896096] Re: Git version: Build process is broken in
 block_curl.c.o
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="83bdf6c8a3a5f87722c8927e54838522f3e57504"; Instance="production"
X-Launchpad-Hash: 0fdff53935ae9d81966b9f75f7e1fa6303e8e0b1
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/23 17:55:34
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
Reply-To: Bug 1896096 <1896096@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2 patches appear to work fine in both test scenarios. Thanks again.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1896096

Title:
  Git version: Build process is broken in block_curl.c.o

Status in QEMU:
  Invalid

Bug description:
  Gcc version: 10.2.0
  Glusterfs: 8.1
  Libguestfs: 1.42

  Configure options used:

  configure \
      --prefix=3D/usr \
      --sysconfdir=3D/etc \
      --localstatedir=3D/var \
      --libexecdir=3D/usr/lib/qemu \
      --extra-ldflags=3D"$LDFLAGS" \
      --smbd=3D/usr/bin/smbd \
      --enable-modules \
      --enable-sdl \
      --disable-werror \
      --enable-slirp=3Dsystem \
      --enable-xfsctl \
      --audio-drv-list=3D"pa alsa sdl"
      =

  Error log attached. Here is the beginning:

  /usr/bin/ld: /usr/lib/gcc/x86_64-pc-linux-gnu/10.2.0/../../../../lib/Scrt=
1.o: in function `_start':
  (.text+0x24): undefined reference to `main'
  /usr/bin/ld: libblock-curl.a(block_curl.c.o): in function `curl_block_ini=
t':

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1896096/+subscriptions

