Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB0B3AD7D4
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 06:27:34 +0200 (CEST)
Received: from localhost ([::1]:57496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luSZx-00005Z-5D
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 00:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1luSYJ-0007la-Df
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 00:25:54 -0400
Received: from indium.canonical.com ([91.189.90.7]:35510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1luSYH-0007qC-6O
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 00:25:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1luSYA-000649-Rl
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 04:25:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AEB322E8189
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 04:25:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 19 Jun 2021 04:17:19 -0000
From: Launchpad Bug Tracker <1825452@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ivan1024 janitor kraxel-redhat th-huth
X-Launchpad-Bug-Reporter: Ivan Volosyuk (ivan1024)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <155563917977.14412.17112414712610030215.malonedeb@gac.canonical.com>
Message-Id: <162407624005.25787.2667408560683481450.malone@loganberry.canonical.com>
Subject: [Bug 1825452] Re: Pulse audio backend doesn't work in v4.0.0-rc4
 release
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="ed184eb8c3e03c8a0c3f47e69a5c546619a1af7c"; Instance="production"
X-Launchpad-Hash: cab663591df8d2d75dadb2e1153a09b49412d868
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
Reply-To: Bug 1825452 <1825452@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1825452

Title:
  Pulse audio backend doesn't work in  v4.0.0-rc4 release

Status in QEMU:
  Expired

Bug description:
  Using Gentoo linux, build from source: qemu v4.0.0-rc4 release
  (eeba63fc7fface36f438bcbc0d3b02e7dcb59983)

  Pulse audio backend doesn't initialize because of the:
  audio/paaudio.c:
  -    if (!popts->has_server) {
  -        char pidfile[64];
  -        char *runtime;
  -        struct stat st;
  -
  -        runtime =3D getenv("XDG_RUNTIME_DIR");
  -        if (!runtime) {
  -            return NULL;
  -        }
  -        snprintf(pidfile, sizeof(pidfile), "%s/pulse/pid", runtime);
  -        if (stat(pidfile, &st) !=3D 0) {
  -            return NULL;
  -        }
  -    }
  XDG_RUNTIME_DIR is not set for me. There is no /run/user directory exist =
in my system.

  Also:
  $ less ~/.pulse/client.conf  =

  default-server =3D unix:/home/ivan/.pulse_server

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1825452/+subscriptions

