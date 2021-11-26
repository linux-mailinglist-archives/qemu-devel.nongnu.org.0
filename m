Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B4645EF92
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 15:07:18 +0100 (CET)
Received: from localhost ([::1]:53856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqbsi-0001KD-5c
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 09:07:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mqbrF-0000cz-OI
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 09:05:46 -0500
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:34450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mqbrD-0006pD-0x
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 09:05:45 -0500
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id BA70242CEF
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 14:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1637935538;
 bh=B3m/bBArq0anQ2oSMVBFnOsTRSp7er8jlNnBV1Hzato=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=MYWU8GSD9QFyKf8VLMIf8FPdcbmdRrJda/o6qA3X5J6TNs3yytiFLxB/v4AQvgzrv
 KjYqfHIMbGKeN2khbXoUWgGtgacXs0rwyTfKUxOkA3Vn71kpT3Hl7jhUB3zxg3uz74
 FXaVx8rB3awARRGHBwKmwWvej3dH/zh0gQZqvdUVDzM/cpq+8VBFELoUbwUF7W79cr
 NHrKM5+oEemxLCTv1l72spdkb4vr3W0Qvnvifu8GPOxkoGosMkgwO4p8/4g0Tz2yRn
 s6NyVktvDVDwrkHcbc6j0sN6GmKqvAsNEGXU93f9jvgym7VxQHL/ARnN+JsM2m4XuN
 5c+j1CDmrSH7w==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B0EB82E8198
 for <qemu-devel@nongnu.org>; Fri, 26 Nov 2021 14:05:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Nov 2021 13:58:55 -0000
From: Paride Legovini <1952448@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Triaged; importance=High; assignee=paride.legovini@canonical.com; 
X-Launchpad-Bug-Tags: server-next transition-openssl3-jj
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: paelzer paride
X-Launchpad-Bug-Reporter: Paride Legovini (paride)
X-Launchpad-Bug-Modifier: Paride Legovini (paride)
References: <163793031756.14602.3125281839568911014.malonedeb@gac.canonical.com>
Message-Id: <163793513595.21528.6466058208218711637.launchpad@soybean.canonical.com>
Subject: [Bug 1952448] Re: qemu 1:6.0+dfsg-2expubuntu2: Fail to build against
 OpenSSL 3.0
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="78346d219e01c6c7b1bfd882aa0bbcbb42d4e568"; Instance="production"
X-Launchpad-Hash: 4d0dc7eba6943f1720e092a15080c5429ee2d05b
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1952448 <1952448@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Also affects: qemu
   Importance: Undecided
       Status: New

** No longer affects: qemu

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1952448

Title:
  qemu 1:6.0+dfsg-2expubuntu2: Fail to build against OpenSSL 3.0

Status in qemu package in Ubuntu:
  Triaged

Bug description:
  Issue discovered after doing a "No-change rebuild" upload to Jammy
  while working at the liburing2 migration (LP: #1944037).

  Full build log:

  https://launchpadlibrarian.net/570888790/buildlog_ubuntu-jammy-
  amd64.qemu_1%3A6.0+dfsg-2expubuntu3_BUILDING.txt.gz

  Failure mode:

  /<<BUILDDIR>>/qemu-6.0+dfsg/roms/skiboot/libstb/create-container.c: In fu=
nction =E2=80=98getPublicKeyRaw=E2=80=99:
  /<<BUILDDIR>>/qemu-6.0+dfsg/roms/skiboot/libstb/create-container.c:85:17:=
 error: =E2=80=98EVP_PKEY_get1_EC_KEY=E2=80=99 is deprecated: Since OpenSSL=
 3.0 [-Werror=3Ddeprecated-declarations]

  Also note that:

  cc1: all warnings being treated as errors

  Upstream skiboot [1] still uses EVP_PKEY_get1_EC_KEY in master, and
  don't have an open issue about this. To be filed once we setup a
  reproducer that builds skiboot "standalone", outside of the qemu
  source tree.

  For the moment we have to relax the severity of that deprecation
  error, likely appending a -Wno-deprecated-declarations somewhere in
  d/rules.

 =20
  [1] https://github.com/open-power/skiboot

To manage notifications about this bug go to:
https://bugs.launchpad.net/ubuntu/+source/qemu/+bug/1952448/+subscriptions


