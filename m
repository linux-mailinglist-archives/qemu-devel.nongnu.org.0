Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD2A363B51
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 08:13:40 +0200 (CEST)
Received: from localhost ([::1]:42094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYNAC-0000zJ-0L
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 02:13:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYN7u-00009L-K6
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 02:11:18 -0400
Received: from indium.canonical.com ([91.189.90.7]:42248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYN7s-0001Xi-Dv
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 02:11:18 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYN7q-0005dh-39
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 06:11:14 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 151062E8161
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 06:11:14 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Apr 2021 05:58:54 -0000
From: Thomas Huth <1825452@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ivan1024 kraxel-redhat th-huth
X-Launchpad-Bug-Reporter: Ivan Volosyuk (ivan1024)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155563917977.14412.17112414712610030215.malonedeb@gac.canonical.com>
Message-Id: <161881193475.22416.10936157083236572640.malone@wampee.canonical.com>
Subject: [Bug 1825452] Re: Pulse audio backend doesn't work in v4.0.0-rc4
 release
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="26785e5a6adccabf68a42300ea7053912615013e"; Instance="production"
X-Launchpad-Hash: 4a9d51dcd154f37f68620e307d961aa406e8ca82
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
Reply-To: Bug 1825452 <1825452@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looking through old bug tickets... is this still an issue with the
latest version of QEMU? Or could we close this ticket nowadays?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1825452

Title:
  Pulse audio backend doesn't work in  v4.0.0-rc4 release

Status in QEMU:
  Incomplete

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

