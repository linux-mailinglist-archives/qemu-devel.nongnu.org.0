Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E9627128F
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Sep 2020 08:02:25 +0200 (CEST)
Received: from localhost ([::1]:44420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJsQZ-0003oj-PM
	for lists+qemu-devel@lfdr.de; Sun, 20 Sep 2020 02:02:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kJsPI-0003K5-Qn
 for qemu-devel@nongnu.org; Sun, 20 Sep 2020 02:01:04 -0400
Received: from indium.canonical.com ([91.189.90.7]:41802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kJsPA-0006Zc-I2
 for qemu-devel@nongnu.org; Sun, 20 Sep 2020 02:01:04 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kJsP8-0003TU-BJ
 for <qemu-devel@nongnu.org>; Sun, 20 Sep 2020 06:00:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1B97E2E80EC
 for <qemu-devel@nongnu.org>; Sun, 20 Sep 2020 06:00:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2020 05:51:08 -0000
From: Paolo Bonzini <1896096@bugs.launchpad.net>
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
X-Launchpad-Bug-Modifier: Paolo Bonzini (bonzini)
References: <160036517624.17887.51064102046414127.malonedeb@soybean.canonical.com>
 <160055470726.18094.10303235497441136908.malone@soybean.canonical.com>
Message-Id: <CAHFMJ7sKkpK8amxtVrjgzW_gjCj4FFMe+or5wemF2vA7P8HyJQ@mail.gmail.com>
Subject: Re: [Bug 1896096] Re: Git version: Build process is broken in
 block_curl.c.o
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="83bdf6c8a3a5f87722c8927e54838522f3e57504"; Instance="production"
X-Launchpad-Hash: 70b8b97128ff19eeb733a4520d0d04a68b43e0c5
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/20 02:00:54
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1896096 <1896096@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Il dom 20 set 2020, 00:40 Toolybird <1896096@bugs.launchpad.net> ha
scritto:

> Looking deeper into this... I believe there are indeed qemu bugs here.
>

You're right.

$ cat test
#! /bin/sh
echo before
env | grep LDFLAGS
LDFLAGS=3D"-pie $LDFLAGS"
echo after
env | grep LDFLAGS

$ ./test
before
after

$ LDFLAGS=3D'-Wl,--as-needed' ./test before
LDFLAGS=3D-Wl,--as-needed
after
LDFLAGS=3D-pie -Wl,--as-needed

Because changes to environment variables propagate without having to export
them again.

So we need to unset CFLAGS and LDFLAGS in the configure script.

Paolo

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

