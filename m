Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182B1171393
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 10:02:00 +0100 (CET)
Received: from localhost ([::1]:55656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7F3P-0005gh-6D
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 04:01:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35066)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1j7F2M-0005Et-11
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 04:00:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1j7F2K-0005Al-3j
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 04:00:53 -0500
Received: from indium.canonical.com ([91.189.90.7]:60654)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1j7F2I-0005AY-VD
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 04:00:52 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1j7F2H-0006S0-G8
 for <qemu-devel@nongnu.org>; Thu, 27 Feb 2020 09:00:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 43AB82E806B
 for <qemu-devel@nongnu.org>; Thu, 27 Feb 2020 09:00:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Feb 2020 08:52:37 -0000
From: Patrick Schleizer <adrelanos@riseup.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: adrelanos philmd
X-Launchpad-Bug-Reporter: Patrick Schleizer (adrelanos)
X-Launchpad-Bug-Modifier: Patrick Schleizer (adrelanos)
References: <158278309128.18853.6534515173893863136.malonedeb@chaenomeles.canonical.com>
Message-Id: <158279355744.19252.5850362454839178636.malone@chaenomeles.canonical.com>
Subject: [Bug 1864955] Re: bundle QEMU installer with HAXM accelerator for
 Windows
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="9eff1c37c1740693bdcba94d8f8c608164af5689";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: dc8f0ddf872735b085726eab88c4a33594b162e5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1864955 <1864955@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I think licensing is a non-issue.

That is probably a quote from the github license summary at
https://github.com/intel/haxm/blob/master/LICENSE

> A permissive license similar to the BSD 2-Clause License, but with a
3rd clause that prohibits others from using the name of the project or
its contributors to promote derived products without written consent.

I would ignore whatever github says "This is not legal advice. Learn
more about repository licenses." Their summary might have good
intentions but cause confusion. Only github mentions "project". The
actual license text does not.

The actual text of the third clause in the license being:

> Neither the name of the copyright holder nor the names of its
contributors may be used to endorse or promote products derived from
this software without specific prior written permission.

This should be easy to comply with.

One could would wrap that clause into quotes (") to put it into a google
search engine.

This clause is OSI approved since included in BSD-3-Clause license:

https://opensource.org/licenses/BSD-3-Clause

Debian takes being Free / Libre / Open Source very serious too. Search
term:

> site:debian.org "Neither the name of the copyright holder nor the
names of its contributors may be used to endorse or promote products
derived from this software without specific prior written permission."

https://ftp-master.debian.org/licenses/good/bsd/

FSF also does not have an issue with it.

> site:fsf.org "Neither the name of the copyright holder nor the names
of its contributors may be used to endorse or promote products derived
from this software without specific prior written permission."

3 authorities don't have an issue with modified BSD license (without
advertising clause).

Rather, the QEMU installer doesn't need to have HAXM in its file name.

It may or may not be good idea to make HAXM an opt-in or opt-out in the
installer. I'd argue opt-out if anything. But ideally for usability
there is no need to mention HAXM. Things would just work out of the box.

As a role model for usability I'd recommend VirtualBox. Their installer
also doesn't ask/show "enable acceleration" or "VirtualBox includes
QEMU" or other components in prominent places.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1864955

Title:
  bundle QEMU installer with HAXM accelerator for Windows

Status in QEMU:
  New

Bug description:
  As you probably know HAXM is an accelerator for Windows.

  https://www.qemu.org/2017/11/22/haxm-usage-windows/

  Currently it is required to first install QEMU and then install HAXM.

  For a better out of the box user experience on the Windows platform it
  would be nice if QEMU and HAXM would be installed by the same
  installer.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1864955/+subscriptions

