Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB02B377727
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 17:13:44 +0200 (CEST)
Received: from localhost ([::1]:43168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lfl7o-0000Ad-2H
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 11:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfl59-0004LK-8K
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:10:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:55390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lfl4w-0002n4-Hy
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:10:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lfl4v-00008D-35
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 15:10:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 155932E8135
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 15:10:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 15:00:23 -0000
From: Frederic Bezies <1898215@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: fredb74 marcandre-lureau th-huth toolybird
X-Launchpad-Bug-Reporter: Frederic Bezies (fredb74)
X-Launchpad-Bug-Modifier: Frederic Bezies (fredb74)
References: <160164961305.8642.6420581526403273155.malonedeb@wampee.canonical.com>
Message-Id: <162057242374.9948.7224705052649299229.malone@chaenomeles.canonical.com>
Subject: [Bug 1898215] Re: [git][archlinux]Build process is busted in
 spice-display.c
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: 6e78002bbb790270883787c6b6e94eb23758b146
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: Bug 1898215 <1898215@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix released

** Changed in: qemu
       Status: Incomplete =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1898215

Title:
  [git][archlinux]Build process is busted in spice-display.c

Status in QEMU:
  Fix Released

Bug description:
  Linux distribution: Archlinux. Crash log added is based on a build
  from scratch.

  Gcc version: 10.2.0

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

  Crash log:

  ../ui/spice-display.c: In function 'interface_client_monitors_config':
  ../ui/spice-display.c:682:25: error: 'VD_AGENT_CONFIG_MONITORS_FLAG_PHYSI=
CAL_SIZE' undeclared (first use in this function); did you mean 'VD_AGENT_C=
ONFIG_MONITORS_FLAG_USE_POS'?
    682 |         if (mc->flags & VD_AGENT_CONFIG_MONITORS_FLAG_PHYSICAL_SI=
ZE) {
        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
        |                         VD_AGENT_CONFIG_MONITORS_FLAG_USE_POS
  ../ui/spice-display.c:682:25: note: each undeclared identifier is reporte=
d only once for each function it appears in
  ../ui/spice-display.c:683:13: error: unknown type name 'VDAgentMonitorMM'
    683 |             VDAgentMonitorMM *mm =3D (void *)&mc->monitors[mc->nu=
m_of_monitors];
        |             ^~~~~~~~~~~~~~~~
  ../ui/spice-display.c:684:37: error: request for member 'width' in someth=
ing not a structure or union
    684 |             info.width_mm =3D mm[head].width;
        |                                     ^
  ../ui/spice-display.c:685:38: error: request for member 'height' in somet=
hing not a structure or union
    685 |             info.height_mm =3D mm[head].height;
        |                                      ^
  make: *** [Makefile.ninja:2031: libcommon.fa.p/ui_spice-display.c.o] Erro=
r 1
  make: *** Waiting for unfinished jobs....

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1898215/+subscriptions

