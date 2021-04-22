Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE4A367839
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 06:07:04 +0200 (CEST)
Received: from localhost ([::1]:41064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZQcJ-0000Pn-Eu
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 00:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZQaL-0006rD-Pr
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:05:01 -0400
Received: from indium.canonical.com ([91.189.90.7]:42050)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZQaH-0006Zt-PZ
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:05:01 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZQaG-0004wI-JP
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:04:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 91B402E815D
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:04:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 03:53:48 -0000
From: Thomas Huth <717929@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jiribb th-huth
X-Launchpad-Bug-Reporter: jiribb (jiribb)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20110212234034.2762.77476.malonedeb@wampee.canonical.com>
Message-Id: <161906362813.22765.13861786161670857451.malone@gac.canonical.com>
Subject: [Bug 717929] Re: Serial communication between VMs problematic
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: a820b38b59e2ad7d843d3572ca946596c2a591b8
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
Reply-To: Bug 717929 <717929@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/717929

Title:
  Serial communication between VMs problematic

Status in QEMU:
  Incomplete

Bug description:
  Hello,

  I want to setup serial communication between VM hosts but I have found
  it quite difficult...:

  ...because when trying unix sockets:

  - host A has serial device as unix socket (bind)
  - host B has serial device as client of unix socket
  - host A is down thus not unix socket does exist
  - host B can't be started because cannot read the socket:

  error: Failed to start domain opd1s02
  error: internal error Process exited while reading console log output: ch=
ar device redirected to /dev/pts/0
  connect(unix:/tmp/test.sock): Connection refused
  chardev: opening backend "socket" failed

  Can that work like the cable is not plugged in? So host B can start
  and when the socket would exist it would connect to it?

  ...and when using pty and host device combination one cannot predict
  pty device under /dev/pts, it would be nice if would be possible to
  define exact device name.

  Tested on Fedora 14.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/717929/+subscriptions

