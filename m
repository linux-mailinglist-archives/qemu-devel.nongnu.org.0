Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E58C2ECEAB
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 12:22:36 +0100 (CET)
Received: from localhost ([::1]:37438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxTND-0004TJ-28
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 06:22:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxTLX-0003ib-2e
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 06:20:51 -0500
Received: from indium.canonical.com ([91.189.90.7]:55280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kxTLV-0008V4-5E
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 06:20:50 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kxTLT-0005rv-4J
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 11:20:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1F65E2E8137
 for <qemu-devel@nongnu.org>; Thu,  7 Jan 2021 11:20:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 07 Jan 2021 11:13:07 -0000
From: Gerd Hoffmann <1908266@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kraxel-redhat tom-ty89
X-Launchpad-Bug-Reporter: Tom Yan (tom-ty89)
X-Launchpad-Bug-Modifier: Gerd Hoffmann (kraxel-redhat)
References: <160803597538.5351.1615822414009397747.malonedeb@gac.canonical.com>
Message-Id: <161001798750.5732.4028577635928243699.malone@chaenomeles.canonical.com>
Subject: [Bug 1908266] Re: spice unnecessary forces nographic
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="34b3ffd45c9543b7f7aa5aa313925241e9e7ca3f"; Instance="production"
X-Launchpad-Hash: 83af7ead8fe5dd70546c032acfb990042e4f7b97
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
Reply-To: Bug 1908266 <1908266@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Try "qemu -display spice-app", then go to menu -> view -> displays in
virt-viewer.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1908266

Title:
  spice unnecessary forces nographic

Status in QEMU:
  Incomplete

Bug description:
  When spice is enabled, qemu does not give the graphical window. It
  should not imply -nographic but only -display none.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1908266/+subscriptions

