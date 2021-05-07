Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 997D8375EA6
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 04:02:25 +0200 (CEST)
Received: from localhost ([::1]:52582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lepou-0003t5-4d
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 22:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lepni-0003RH-VQ
 for qemu-devel@nongnu.org; Thu, 06 May 2021 22:01:10 -0400
Received: from indium.canonical.com ([91.189.90.7]:54542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lepng-0007tM-IP
 for qemu-devel@nongnu.org; Thu, 06 May 2021 22:01:10 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lepnd-0005kU-Vr
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 02:01:06 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A51EA2E8186
 for <qemu-devel@nongnu.org>; Fri,  7 May 2021 02:01:05 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 May 2021 01:55:38 -0000
From: xuan <1877015@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: luoyonggang th-huth xavier-ding
X-Launchpad-Bug-Reporter: xuan (xavier-ding)
X-Launchpad-Bug-Modifier: xuan (xavier-ding)
References: <158873300816.14142.15664636500998863138.malonedeb@gac.canonical.com>
Message-Id: <162035253955.32459.10594295945806398569.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1877015] Re: virtio only support packed ring size power of 2
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: b2006cb22e4b6d73aeb80d0b04725cec1fe90fb5
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
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
Reply-To: Bug 1877015 <1877015@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Incomplete =3D> New

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1877015

Title:
  virtio only support packed ring size power of 2

Status in QEMU:
  New

Bug description:
  Issue discription=EF=BC=9A
  When QEMU starts with "-device virtio-net-pci,netdev=3Dnetdev0,mac=3D52:5=
4:00:00:00:01,disable-modern=3Dfalse,mrg_rxbuf=3Don,rx_queue_size=3D1025,tx=
_queue_size=3D1025,mq=3Don,vectors=3D15,packed=3Don"

  It raises error: Invalid rx_queue_size (=3D 1025), must be a power of 2
  between 256 and 1024

  Analysis:
  According to virtio1.1 spec, the packed queue size value does not have to=
 be a power of 2.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1877015/+subscriptions

