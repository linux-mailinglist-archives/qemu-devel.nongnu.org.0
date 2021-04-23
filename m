Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F7B368C35
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 06:30:50 +0200 (CEST)
Received: from localhost ([::1]:53306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZnSr-0000zw-L0
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 00:30:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZnO4-0006EP-2H
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 00:25:52 -0400
Received: from indium.canonical.com ([91.189.90.7]:60858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZnO1-0000XM-Sa
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 00:25:51 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZnNx-0000NW-M3
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 04:25:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A589F2E804C
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 04:25:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Apr 2021 04:17:18 -0000
From: Launchpad Bug Tracker <1725707@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange carl.brassey jamiedo2nn janitor th-huth
X-Launchpad-Bug-Reporter: Carl Brassey (carl.brassey)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <150859618440.18353.4071279587956365769.malonedeb@chaenomeles.canonical.com>
Message-Id: <161915143883.2122.3318749986333824943.malone@loganberry.canonical.com>
Subject: [Bug 1725707] Re: QEMU sends excess VNC data to websockify even when
 network is poor
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 635304705312ba1bde9fd2f65c4daa1c9a3703d4
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
Reply-To: Bug 1725707 <1725707@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1725707

Title:
  QEMU sends excess VNC data to websockify even when network is poor

Status in QEMU:
  Expired

Bug description:
  Description of problem
  -------------------------
  In my latest topic, I reported a bug relate to QEMU's websocket:
  https://bugs.launchpad.net/qemu/+bug/1718964

  It has been fixed but someone mentioned that he met the same problem when=
 using QEMU with a standalone websocket proxy.
  That makes me confused because in that scenario QEMU will get a "RAW" VNC=
 connection.
  So I did a test and found that there indeed existed some problems. The pr=
oblem is:

  When the client's network is poor (on a low speed WAN), QEMU still
  sends a lot of data to the websocket proxy, then the client get stuck.
  It seems that only QEMU has this problem, other VNC servers works
  fine.

  Environment
  -------------------------
  All of the following versions have been tested:

  QEMU: 2.8.1.1 / 2.9.1 / 2.10.1 / master (Up to date)
  Host OS: Ubuntu 16.04 Server LTS / CentOS 7 x86_64_1611
  Websocket Proxy: websockify 0.6.0 / 0.7.0 / 0.8.0 / master
  VNC Web Client: noVNC 0.5.1 / 0.61 / 0.62 / master
  Other VNC Servers: TigerVNC 1.8 / x11vnc 0.9.13 / TightVNC 2.8.8

  Steps to reproduce:
  -------------------------
  100% reproducible.

  1. Launch a QEMU instance (No need websocket option):
  qemu-system-x86_64 -enable-kvm -m 6G ./win_x64.qcow2 -vnc :0

  2. Launch websockify on a separate host and connect to QEMU's VNC port

  3. Open VNC Web Client (noVNC/vnc.html) in browser and connect to
  websockify

  4. Play a video (e.g. Watch YouTube) on VM (To produce a lot of frame
  buffer update)

  5. Limit (e.g. Use NetLimiter) the client inbound bandwidth to 300KB/S
  (To simulate a low speed WAN)

  6. Then client's output gets stuck(less than 1 fps), the cursor is
  almost impossible to move

  7. Monitor network traffic on the proxy server

  Current result:
  -------------------------
  Monitor Downlink/Uplink network traffic on the proxy server
  (Refer to the attachments for more details).

  1. Used with QEMU
  - D: 5.9 MB/s U: 5.7 MB/s (Client on LAN)
  - D: 4.3 MB/s U: 334 KB/s (Client on WAN)

  2. Used with other VNC servers
  - D: 5.9 MB/s U: 5.6 MB/s (Client on LAN)
  - D: 369 KB/s U: 328 KB/s (Client on WAN)

  It is found that when the client's network is poor, all the VNC
  servers (tigervnc/x11vnc/tightvnc) will reduce the VNC data send to
  websocket proxy (uplink and downlink symmetry), but QEMU never drop
  any frames and still sends a lot of data to websockify, the client has
  no capacity to accept so much data, more and more data are accumulated
  in the websockify, then it crashes.

  Expected results:
  -------------------------
  When the client's network is poor (WAN), QEMU will reduce the VNC data se=
nd to websocket proxy.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1725707/+subscriptions

