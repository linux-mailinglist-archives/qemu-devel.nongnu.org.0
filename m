Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 809793B9B84
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 06:31:38 +0200 (CEST)
Received: from localhost ([::1]:39254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzAq1-0008Py-Go
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 00:31:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lzAkm-0000VH-MQ
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 00:26:12 -0400
Received: from indium.canonical.com ([91.189.90.7]:43128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lzAkk-0002Vz-VO
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 00:26:12 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lzAkV-000534-S9
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 04:25:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B8E802E81A5
 for <qemu-devel@nongnu.org>; Fri,  2 Jul 2021 04:25:51 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Jul 2021 04:17:24 -0000
From: Launchpad Bug Tracker <1856027@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: harrymalaria janitor th-huth
X-Launchpad-Bug-Reporter: Tom Hanker (harrymalaria)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <157606475893.7537.4130147721731991147.malonedeb@soybean.canonical.com>
Message-Id: <162519944472.31921.11437559001789152762.malone@loganberry.canonical.com>
Subject: [Bug 1856027] Re: Suddenly no internet in guest system!
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c7d3f30bfe7d7b488c7f9d3c8d7880184b1d065e"; Instance="production"
X-Launchpad-Hash: f3e1275369dad87df9ee9a060dcb7f9891106f10
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
Reply-To: Bug 1856027 <1856027@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1856027

Title:
  Suddenly no internet in guest system!

Status in QEMU:
  Expired

Bug description:
  I use Opensuse 15.1 i have installed androidx86_64 as a guest system, it =
runs for over 3 years. i had a internetconnection, i could use apps etc. bu=
t since yesterday i can=C2=B4t connect to the internet with the guest syste=
m in the host system all works fine. What could be the reason? There haven=
=C2=B4t been an update and i haven=C2=B4t changed anything. =

  The settings in nic are: bridge br0: Hostdevice eth0
  devicemodel: e1000

  The qemu Version is from the opensuse repo: 3.1.1

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1856027/+subscriptions

