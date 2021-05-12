Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C9337C29B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 17:12:43 +0200 (CEST)
Received: from localhost ([::1]:49582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgqXS-0004YW-6n
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 11:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgqVz-00036L-8e
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:11:12 -0400
Received: from indium.canonical.com ([91.189.90.7]:51462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lgqVr-0004Zl-Ag
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:11:11 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lgqVn-0007XG-26
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 15:10:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A73232E8193
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 15:10:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 May 2021 15:02:13 -0000
From: Thomas Huth <1910540@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: stefanha th-huth xiangjzh123456
X-Launchpad-Bug-Reporter: xiangjzh (xiangjzh123456)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161002468026.7039.7388884162638063038.malonedeb@soybean.canonical.com>
Message-Id: <162083173344.30410.11759732417368328168.malone@gac.canonical.com>
Subject: [Bug 1910540] Re: where the trace file  "trace-*"  
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="37ef8bff8cdf61b994f9b61bc9239663cb29cec9"; Instance="production"
X-Launchpad-Hash: 3fcb28e434df638cd20a35256b1b9d7c92c09b67
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
Reply-To: Bug 1910540 <1910540@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

You can find the trace-event files in the source tree, if you were
talking about those. Anyway, this does not really sound like a bug, so
I'm closing this ticket now. If you need general help, please use the
qemu-discuss mailing list or the #qemu channel on OFTC IRC instead.

** Changed in: qemu
       Status: New =3D> Invalid

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1910540

Title:
  where the trace file  "trace-*"

Status in QEMU:
  Invalid

Bug description:
  I compile qemu-system-aarch64 with  --enable-trace-backends=3Dsimple
  option, then start qemu with -trace nvme*  , qemu start successful but
  I cann't find the trace file  "trace-*" at qemu started  directory.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1910540/+subscriptions

