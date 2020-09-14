Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E20C268C69
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 15:43:25 +0200 (CEST)
Received: from localhost ([::1]:50058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHolQ-0002pi-5F
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 09:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kHojO-0000tW-OJ
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 09:41:18 -0400
Received: from indium.canonical.com ([91.189.90.7]:49606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kHojM-0002sm-Is
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 09:41:18 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kHojJ-00012h-Gb
 for <qemu-devel@nongnu.org>; Mon, 14 Sep 2020 13:41:13 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 667BB2E80EC
 for <qemu-devel@nongnu.org>; Mon, 14 Sep 2020 13:41:13 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2020 13:27:58 -0000
From: Darren Blaber <1895219@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: keymaps vnc
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: dmbtech
X-Launchpad-Bug-Reporter: Darren Blaber (dmbtech)
X-Launchpad-Bug-Modifier: Darren Blaber (dmbtech)
References: <159978635021.22139.4037516560250644869.malonedeb@wampee.canonical.com>
Message-Id: <160009007915.15025.5721686079641285935.launchpad@gac.canonical.com>
Subject: [Bug 1895219] Re: qemu git -vnc fails due to missing en-us keymap
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="83bdf6c8a3a5f87722c8927e54838522f3e57504"; Instance="production"
X-Launchpad-Hash: a8da99c539587b9f932977124bee6942031c5888
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 05:55:43
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1895219 <1895219@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Branch unlinked: lp:envbot/0.0.1

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1895219

Title:
  qemu git -vnc fails due to missing en-us keymap

Status in QEMU:
  New

Bug description:
  If trying to run qemu with -vnc :0, it will fail with:
  ./qemu-system-x86_64 -vnc :2
  qemu-system-x86_64: -vnc :2: could not read keymap file: 'en-us'

  share/keymaps is missing en-us keymap and only has sl and sv,
  confirmed previous stable versions had en-us.

  Tried with multiple targets, on arm64 and amd64

  Git commit hash: 9435a8b3dd35f1f926f1b9127e8a906217a5518a (head)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1895219/+subscriptions

