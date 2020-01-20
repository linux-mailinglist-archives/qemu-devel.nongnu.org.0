Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BA6142E5B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 16:07:05 +0100 (CET)
Received: from localhost ([::1]:38312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itYds-0006GS-IA
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 10:07:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46677)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1itYck-0005Zn-0h
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 10:05:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1itYcg-000678-Av
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 10:05:53 -0500
Received: from indium.canonical.com ([91.189.90.7]:41976)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1itYcg-00066L-57
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 10:05:50 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1itYcd-0004JO-VV
 for <qemu-devel@nongnu.org>; Mon, 20 Jan 2020 15:05:47 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D54BA2E80C9
 for <qemu-devel@nongnu.org>; Mon, 20 Jan 2020 15:05:47 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jan 2020 14:59:18 -0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: asiagaming samuel-thibault
X-Launchpad-Bug-Reporter: jusunLee (asiagaming)
X-Launchpad-Bug-Modifier: Peter Maydell (pmaydell)
References: <154785010249.1233.12902128942224805447.malonedeb@gac.canonical.com>
Message-Id: <157953235907.4103.17498647773657714964.launchpad@soybean.canonical.com>
Subject: [Bug 1812451] Re: In windows host,
 tftp arbitrary file read vulnerability
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="f1052173880d8dae43faa7c2fc45da1b42227143";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 21aaa923d09d0386baa08e977b972893a82ef663
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Reply-To: Bug 1812451 <1812451@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Information type changed from Private Security to Public

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1812451

Title:
  In windows host, tftp arbitrary file read vulnerability

Status in QEMU:
  New

Bug description:
  https://github.com/qemu/qemu/blob/master/slirp/tftp.c#L343

  =C2=A0=C2=A0if (!strncmp(req_fname, "../", 3) ||
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0req_fname[strlen(req_fname) - 1] =3D=
=3D '/' ||
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0strstr(req_fname, "/../")) {
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tftp_send_error(spt, 2, "Access viola=
tion", tp);
  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return;
  =C2=A0=C2=A0}

  There is file path check for not allowing escape tftp directory.
  But, in windows, file path is separated by "\" backslash.
  So, guest can read arbitrary file in Windows host.

  This bug is variant of CVE-2019-2553 - Directory traversal
  vulnerability.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1812451/+subscriptions

