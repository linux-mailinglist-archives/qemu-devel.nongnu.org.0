Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B471C2054F9
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 16:39:47 +0200 (CEST)
Received: from localhost ([::1]:46236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnk5S-0008Cl-8B
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 10:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jnk1r-0003Jj-Jz
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 10:36:04 -0400
Received: from indium.canonical.com ([91.189.90.7]:38720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jnk1n-0008Hx-WA
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 10:36:03 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jnk1k-0007Rm-LY
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 14:35:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 82E642E810B
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 14:35:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2020 14:29:29 -0000
From: Stefan Hajnoczi <1883400@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: stefanha toddandmargo-n
X-Launchpad-Bug-Reporter: Toddandmargo-n (toddandmargo-n)
X-Launchpad-Bug-Modifier: Stefan Hajnoczi (stefanha)
References: <159209820759.11242.7518482343283209679.malonedeb@soybean.canonical.com>
Message-Id: <20200623142929.GN36568@stefanha-x1.localdomain>
Subject: Re: [Bug 1883400] [NEW] Windows 10 extremely slow and unresponsive
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1cbd0aa39df153c901321817f9b57cf3f232b507";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 75b745ac1f1a5c46ba8bb58c72031f33abe9b100
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 09:11:11
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1883400 <1883400@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jun 14, 2020 at 01:30:07AM -0000, Toddandmargo-n wrote:
> Public bug reported:
> =

> Hi,
> =

> Fedora 32, x64
> qemu-5.0.0-2.fc32.x86_64
> =

> https://www.microsoft.com/en-us/software-download/windows10ISO
> Win10_2004_English_x64.iso
> =

> Windows 10 is excruciatingly slow since upgrading to 5.0.0-2.fc32.
> Disabling your repo and downgrading to 2:4.2.0-7.fc32 and corrects the
> issue (the package in the Fedora repo).
> =

> You can duplicate this off of the Windows 10 ISO (see above) and do not
> even have to install Windows 10 itself.

Could this be a duplicate of
https://bugs.launchpad.net/qemu/+bug/1877716?

Stefan

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1883400

Title:
  Windows 10 extremely slow and unresponsive

Status in QEMU:
  New

Bug description:
  Hi,

  Fedora 32, x64
  qemu-5.0.0-2.fc32.x86_64

  https://www.microsoft.com/en-us/software-download/windows10ISO
  Win10_2004_English_x64.iso

  Windows 10 is excruciatingly slow since upgrading to 5.0.0-2.fc32.
  Disabling your repo and downgrading to 2:4.2.0-7.fc32 and corrects the
  issue (the package in the Fedora repo).

  You can duplicate this off of the Windows 10 ISO (see above) and do
  not even have to install Windows 10 itself.

  No such problem with Windows 7.

  And the clipboard works better under 2L4.2.0-07 too

  Please fix,

  Many thanks,
  -T

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1883400/+subscriptions

