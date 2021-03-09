Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142D9331FFE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 08:42:30 +0100 (CET)
Received: from localhost ([::1]:58138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJX0e-0003gs-I7
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 02:42:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lJWzA-0003Gl-Al
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 02:40:56 -0500
Received: from indium.canonical.com ([91.189.90.7]:51920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lJWz8-0006LM-5C
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 02:40:56 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lJWz5-00009e-RS
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 07:40:51 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CE8032E800F
 for <qemu-devel@nongnu.org>; Tue,  9 Mar 2021 07:40:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Mar 2021 07:27:09 -0000
From: Thomas Huth <1918084@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Triaged; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: eddyh th-huth
X-Launchpad-Bug-Reporter: Eddy Hahn (eddyh)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161517335801.3660.13243926426355834161.malonedeb@soybean.canonical.com>
Message-Id: <161527482923.27232.12003907542949818235.malone@gac.canonical.com>
Subject: [Bug 1918084] Re: Build fails on macOS 11.2.2
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f41ce4c616a9df6b2066606b5a16a036a6d2f6bb"; Instance="production"
X-Launchpad-Hash: 3dc674ea51247c1fd76868aa3329d789ec4a51c9
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
Reply-To: Bug 1918084 <1918084@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

That looks weird, like a bug in the toolchain ... no clue how to fix
that right now, but as a work-around, you could try to disable just the
related part of the code by running configure with "--target-list-
exclude=3Daarch64-softmmu,aarch64_be-linux-user,aarch64-linux-user"

** Changed in: qemu
       Status: Incomplete =3D> Triaged

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1918084

Title:
  Build fails on macOS 11.2.2

Status in QEMU:
  Triaged

Bug description:
  Hi,

  I got the latest version from git. I have pre-compiled the dependency
  libraries. All good. configure creates the necessary files. When I
  build I got the following error:

  [1368/6454] Compiling C object libcapstone.a.p/capstone_arch_AArch64_AArc=
h64InstPrinter.c.o
  ninja: build stopped: subcommand failed.
  make[1]: *** [run-ninja] Error 1
  make: *** [all] Error 2

  I've ran make as make -j 8

  original config:

  PKG_CONFIG_PATH=3D"$SERVERPLUS_DIR/dependencies/glib/lib/pkgconfig:$SERVE=
RPLUS_DIR/dependencies/pixman/lib/pkgconfig:$SERVERPLUS_DIR/dependencies
  /cyrus-sasl/lib/pkgconfig" ./configure --prefix=3D"$SERVERPLUS_DIR"
  --enable-hvf --enable-cocoa --enable-vnc-sasl --enable-auth-pam
  --ninja=3D/opt/build/build/stage/tools/ninja/ninja
  --python=3D"$SERVERPLUS_DIR/dependencies/python/bin/python3" --enable-
  bsd-user

  if I build with --target-list=3Dx86_64-softmmu then it will build but I
  will get only the x86_64 QEMU built. With 5.0 I could build all
  emulators.

  $SERVERPLUS_DIR is my target dir.

  Thanks,

  Eddy

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1918084/+subscriptions

