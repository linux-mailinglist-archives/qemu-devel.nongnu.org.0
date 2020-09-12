Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D48267A47
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Sep 2020 14:28:08 +0200 (CEST)
Received: from localhost ([::1]:41350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kH4dS-0006q6-LE
	for lists+qemu-devel@lfdr.de; Sat, 12 Sep 2020 08:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kH4b7-0004dX-Fq
 for qemu-devel@nongnu.org; Sat, 12 Sep 2020 08:25:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:46554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kH4b5-0006NS-As
 for qemu-devel@nongnu.org; Sat, 12 Sep 2020 08:25:41 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kH4b3-0004Up-3v
 for <qemu-devel@nongnu.org>; Sat, 12 Sep 2020 12:25:37 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1B2F92E80DB
 for <qemu-devel@nongnu.org>; Sat, 12 Sep 2020 12:25:37 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2020 12:18:55 -0000
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
Message-Id: <159991313605.17714.17160212534824636320.malone@soybean.canonical.com>
Subject: [Bug 1895219] Re: qemu git -vnc fails due to missing en-us keymap
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="83bdf6c8a3a5f87722c8927e54838522f3e57504"; Instance="production"
X-Launchpad-Hash: 66efa6619e9271c5694ea90adc819226abd865e4
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/12 08:25:37
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Reply-To: Bug 1895219 <1895219@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A work around to get vnc enabled for those that need it until this is
fixed is to manually copy from source tree pc-bios/keymaps/* to qemu-
data keymaps directory, usually installed at /usr/share/qemu/keymaps or
/usr/local/share/qemu/keymaps (default prefix).

Commit that broke the install of keymaps is either
https://github.com/qemu/qemu/commit/09db9b9db38e82acbc1fd4fa4661ac19c387380c
(commit hash 09db9b9db38e82acbc1fd4fa4661ac19c387380c)

or
https://github.com/qemu/qemu/commit/ddcf607fa3d6881cf0286a9b88a40fde265cbe37
(commit hash ddcf607fa3d6881cf0286a9b88a40fde265cbe37)

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

