Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BFF367843
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 06:11:58 +0200 (CEST)
Received: from localhost ([::1]:53890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZQh4-0005pc-3Z
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 00:11:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZQf9-0004sg-LQ
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:09:59 -0400
Received: from indium.canonical.com ([91.189.90.7]:42348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZQf7-0001Kr-Lt
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 00:09:59 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZQf3-0005av-9E
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:09:53 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 3A7FD2E815D
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 04:09:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 03:58:17 -0000
From: Thomas Huth <1272252@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Wishlist;
 assignee=None; 
X-Launchpad-Bug-Tags: optimisation qemu-img
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: o-launchpad-net-q th-huth
X-Launchpad-Bug-Reporter: Mr J (o-launchpad-net-q)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20140124101150.11988.40603.malonedeb@wampee.canonical.com>
Message-Id: <161906389748.32357.7068718821625125051.malone@soybean.canonical.com>
Subject: [Bug 1272252] Re: qemu-img ftp/http convert
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: d65b909b962b1c5978af3ad95d25f5ac3f41547b
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
Reply-To: Bug 1272252 <1272252@bugs.launchpad.net>
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
https://bugs.launchpad.net/bugs/1272252

Title:
  qemu-img ftp/http convert

Status in QEMU:
  Incomplete

Bug description:
  Converting images with ftp or http as source could be done a lot
  faster. The way it works now (qemu 1.7.50) is significantly slower
  than the optimal way.

  FTP - how it works now
  1. Connect and login to ftp-server. Ask for size of file.
  2. Get a chunk of data using rest+retr
  3. Goto step 1 again in a loop until all data is retrieved

  FTP - better solution
  1. Connect and login to ftp-server. Dont ask for size of file.
  2. Retrieve all remaining data
  3. Goto step 1 again if disconnected/io error (max NN errors etc)

  =

  Http - how it works now
  1. Connect to webserver and ask for size of file / http HEAD.
  2. Get a chunk of data using http Range.
  3. Goto step 1 again in a loop until all data is retrieved.

  Http - better solution
  1. Connect to webserver.
  2. Retrieve all remaining data.
  3. Goto step 1 again if disconnected/io error (max NN errors).

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1272252/+subscriptions

