Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E174A2AAEF9
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 03:06:36 +0100 (CET)
Received: from localhost ([::1]:58972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kbwZn-0002TR-D3
	for lists+qemu-devel@lfdr.de; Sun, 08 Nov 2020 21:06:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kbwYv-00022x-Dg
 for qemu-devel@nongnu.org; Sun, 08 Nov 2020 21:05:43 -0500
Received: from indium.canonical.com ([91.189.90.7]:59990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kbwYt-00008X-7N
 for qemu-devel@nongnu.org; Sun, 08 Nov 2020 21:05:41 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kbwYp-0001P6-P9
 for <qemu-devel@nongnu.org>; Mon, 09 Nov 2020 02:05:35 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B862C2E8130
 for <qemu-devel@nongnu.org>; Mon,  9 Nov 2020 02:05:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2020 01:57:25 -0000
From: Mark Karpeles <1903470@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: magicaltux
X-Launchpad-Bug-Reporter: Mark Karpeles (magicaltux)
X-Launchpad-Bug-Modifier: Mark Karpeles (magicaltux)
Message-Id: <160488704585.18602.6390058369473747228.malonedeb@soybean.canonical.com>
Subject: [Bug 1903470] [NEW] qemu 5.1.0: Add UNIX socket support for netdev
 socket
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e39939c02bd86af4202bc6e2123a7708215ec8ea"; Instance="production"
X-Launchpad-Hash: 990137ccdc67ea183bb6bd0be875e64fd8b8d762
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/08 21:05:36
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1903470 <1903470@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Public bug reported:

Note: this is a feature request.

qemu has a way to connect instances using a socket:

-netdev socket,id=3Dstr[,fd=3Dh][,listen=3D[host]:port][,connect=3Dhost:por=
t]

This can also be used to connect a qemu instance to something else using
a socket connection, however there is no authentication or security to
the connection, so rather than using a port which can be accessed by any
user on the machine, having the ability to use or connect to UNIX
sockets would be helpful, and adding this option should be fairly
trivial.

UNIX sockets can be found in various parts of qemu (monitor, etc) so I
believe having this on network would make sense.

** Affects: qemu
     Importance: Undecided
         Status: New

** Description changed:

+ Note: this is a feature request.
+ =

  qemu has a way to connect instances using a socket:
  =

  -netdev socket,id=3Dstr[,fd=3Dh][,listen=3D[host]:port][,connect=3Dhost:p=
ort]
  =

  This can also be used to connect a qemu instance to something else using
  a socket connection, however there is no authentication or security to
  the connection, so rather than using a port which can be accessed by any
  user on the machine, having the ability to use or connect to UNIX
  sockets would be helpful, and adding this option should be fairly
  trivial.
  =

  UNIX sockets can be found in various parts of qemu (monitor, etc) so I
  believe having this on network would make sense.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1903470

Title:
  qemu 5.1.0: Add UNIX socket support for netdev socket

Status in QEMU:
  New

Bug description:
  Note: this is a feature request.

  qemu has a way to connect instances using a socket:

  -netdev socket,id=3Dstr[,fd=3Dh][,listen=3D[host]:port][,connect=3Dhost:p=
ort]

  This can also be used to connect a qemu instance to something else
  using a socket connection, however there is no authentication or
  security to the connection, so rather than using a port which can be
  accessed by any user on the machine, having the ability to use or
  connect to UNIX sockets would be helpful, and adding this option
  should be fairly trivial.

  UNIX sockets can be found in various parts of qemu (monitor, etc) so I
  believe having this on network would make sense.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1903470/+subscriptions

