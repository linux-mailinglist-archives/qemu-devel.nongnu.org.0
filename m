Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97830309A31
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 05:27:40 +0100 (CET)
Received: from localhost ([::1]:42850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l64Kp-0006c4-MN
	for lists+qemu-devel@lfdr.de; Sat, 30 Jan 2021 23:27:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l64J9-0005eM-L1
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 23:25:55 -0500
Received: from indium.canonical.com ([91.189.90.7]:36730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1l64J6-0001bv-9T
 for qemu-devel@nongnu.org; Sat, 30 Jan 2021 23:25:55 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1l64J3-0003G4-Jc
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 04:25:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 82D5D2E8148
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 04:25:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 Jan 2021 04:17:19 -0000
From: Launchpad Bug Tracker <1805697@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: egl-headless virgl
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor kraxel-redhat legionnet ryanpress th-huth
X-Launchpad-Bug-Reporter: Anton Sharpaev (legionnet)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <154343711336.10463.14315631936822945059.malonedeb@chaenomeles.canonical.com>
Message-Id: <161206663936.375.5121265992790665348.malone@loganberry.canonical.com>
Subject: [Bug 1805697] Re: egl-headless crashes
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e00fb96b2e64b75333d0178ec15cb78e5aadb64d"; Instance="production"
X-Launchpad-Hash: c6e974b15c89c67d943956b46e6561ee0e654b63
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
Reply-To: Bug 1805697 <1805697@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1805697

Title:
  egl-headless crashes

Status in QEMU:
  Expired

Bug description:
  egl-headless crashes when it is trying change the resolution. After
  XFCE login, for example.

  I tryed it on 2.12, 3.0 and 3.1.0-rc2 versions.

  # qemu-system-x86_64 -enable-kvm -enable-kvm -M q35 -smp 8 -vga virtio
  -spice port=3D59011,addr=3D0.0.0.0,disable-ticketing -hda image.qcow2 -m
  4G -display egl-headless -chardev spicevmc,name=3Dvdagent,id=3Dvdagent

  main_channel_link: add main channel client
  main_channel_client_handle_pong: net test: latency 6.942000 ms, bitrate 8=
497925311 bps (8104.253112 Mbps)
  inputs_connect: inputs channel client create
  red_qxl_set_cursor_peer:
  gl_version 31 - compat profile
  qemu-system-x86_64: ui/egl-headless.c:128: egl_scanout_flush: Assertion `=
surface_width(edpy->ds) =3D=3D edpy->guest_fb.width' failed.
  Aborted (core dumped)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1805697/+subscriptions

