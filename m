Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C60A52EAD2B
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 15:13:12 +0100 (CET)
Received: from localhost ([::1]:51132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwn5D-0003hs-BM
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 09:13:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kwn3F-0002r3-Ch
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 09:11:09 -0500
Received: from indium.canonical.com ([91.189.90.7]:48276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kwn3C-0006FW-Q6
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 09:11:09 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kwn3A-0006q0-L0
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 14:11:04 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 982942E8088
 for <qemu-devel@nongnu.org>; Tue,  5 Jan 2021 14:11:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 05 Jan 2021 13:59:15 -0000
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
Message-Id: <160985515566.4456.6305263560690661425.malone@soybean.canonical.com>
Subject: [Bug 1908266] Re: spice unnecessary forces nographic
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="34b3ffd45c9543b7f7aa5aa313925241e9e7ca3f"; Instance="production"
X-Launchpad-Hash: dbf27dd3278e388377259aadfc1d1c5035440d90
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

Yes, display devices show up on both UI and spice/vnc,
and right now there is no way to contigure that.

Using spice fot the vga and gtk for serial/monitor
is rather unusual though.  Any reason for this?

I'd suggest to simply use the gtk ui instead.
It works with opengl (-display gtk,gl=3Don).
You also can show stuff side-by-side in
separate windows, via menu -> view -> detach tab.

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

