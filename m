Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2CD2B9C83
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 22:06:31 +0100 (CET)
Received: from localhost ([::1]:33456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfr8P-0007be-W7
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 16:06:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfqxY-0000MN-Uy
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 15:55:17 -0500
Received: from indium.canonical.com ([91.189.90.7]:48604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kfqxW-0007sK-Nf
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 15:55:16 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kfqxU-0002O2-OG
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 20:55:12 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6C7C92E813F
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 20:55:12 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2020 20:43:37 -0000
From: Thomas Huth <1381846@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: agoode th-huth
X-Launchpad-Bug-Reporter: Adam Goode (agoode)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20141016024956.508.83550.malonedeb@gac.canonical.com>
Message-Id: <160581861782.32716.13037283515172305665.malone@soybean.canonical.com>
Subject: [Bug 1381846] Re: Data sent to parallel port in guest is lost if host
 buffer fills up
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c35ff22711d15549e2303ae18ae521fd91f6bf00"; Instance="production"
X-Launchpad-Hash: 1bb1874cf16a1b007550608828b00c13aa009eaa
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1381846 <1381846@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1381846

Title:
  Data sent to parallel port in guest is lost if host buffer fills up

Status in QEMU:
  Incomplete

Bug description:
  It appears that qemu will blindly write characters out to the chardev
  and drop them on the floor if a write fails with EAGAIN, without
  initiating flow control (via BUSY and ACK) back to the guest. If the
  host buffer is too small, or is talking to a hardware device that is
  too slow, data will be lost.

  I notice this problem when I run a DOS program with this on the qemu comm=
and line:
  -parallel /dev/usb/lp0

  I can work around this problem by buffering via a pipe, but this looks
  like a general problem. Is there a way to wire up the readiness of the
  output chardev to the parallel port ACK and BUSY lines, and signal an
  ISA interrupt? I don't know the code well enough to tell.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1381846/+subscriptions

