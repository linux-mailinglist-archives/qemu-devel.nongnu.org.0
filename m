Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62465407862
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 15:36:54 +0200 (CEST)
Received: from localhost ([::1]:50792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP3Bd-0003AL-2b
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 09:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mP3AO-0002OX-FZ
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 09:35:36 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:35722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mP3AL-0005vn-IL
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 09:35:36 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id A90B23F59C
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 13:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1631367327;
 bh=ouNEhSUBrfgZFBsJV7OhxX+uqbmYAlQ6aHEbdyMN0fA=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=ZrhcsP+nBvFRz7WLNQYvmKcBKlepifyxqlKARXuFArHG/MSi3zC/261OO521SPWY4
 A5z88hQ6OXpoSH1pSo12cuBSmBXarbp3hG4RO5n3p+dp25qy9UMYl0w83LGd+81cFv
 xfW0lfWtVdKJZrRSzPfJjzKxQcEZUkqzy2nRvMMp8MFJLKWFK+UEGCr2njxTJv3X7s
 lTMSaALzvEMi1wThyPu2qHbnP9ZQ0vyBQMtBjL5c5mSXknibxg6JH5fMZ/jntJYc73
 YUb9VNaOs7giXeG1D4gUqZnyJhvBlFF6L3SsxGsZuZ3tYaEksV2sQbI9FuO2GXQ339
 LE9oulID+cqJQ==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5CEF82E813C
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 13:35:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Sep 2021 13:30:10 -0000
From: Chris Pinnock <1914117@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: chrispinnock th-huth
X-Launchpad-Bug-Reporter: Chris Pinnock (chrispinnock)
X-Launchpad-Bug-Modifier: Chris Pinnock (chrispinnock)
References: <161221293549.4659.2173832767419505412.malonedeb@chaenomeles.canonical.com>
 <162987588882.30796.5359758770282043674.launchpad@wampee.canonical.com>
Message-Id: <871E2304-D368-4C5B-A3EA-0CAD3DD72CAD@mac.com>
Subject: Re: [Bug 1914117] Short files returned via FTP on Qemu with various
 architectures and OSes
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="aca2013fd8cd2fea408d75f89f9bc012fbab307d"; Instance="production"
X-Launchpad-Hash: 0bd7829ba9f81272ea28759f9041024fb6d90065
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1914117 <1914117@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I tested Qemu 6.1 (MacOS using brew to install) with guest OS NetBSD/i386. =
The bind distribution file downloaded fine by FTP.
Libslurp has a workaround for MacOS and it looks like its gone in.
I think this one can be closed.
Sorry for the delay
Kind regards
Chris


> On 25 Aug 2021, at 08:18, Thomas Huth <1914117@bugs.launchpad.net> wrote:
>=20
> ** Changed in: qemu
>       Status: Fix Committed =3D> Fix Released
>=20
> --=20
> You received this bug notification because you are subscribed to the bug
> report.
> https://bugs.launchpad.net/bugs/1914117
>=20
> Title:
>  Short files returned via FTP on Qemu with various architectures and
>  OSes
>=20
> Status in QEMU:
>  Fix Released
>=20
> Bug description:
>=20
>  Qemu 5.2 on Mac OS X Big Sur.
>=20
>  I originally thought that it might be caused by the home-brew version of=
 Qemu, but this evening I have removed the brew edition and compiled from s=
cratch (using Ninja & Xcode compiler).=20
>  Still getting the same problem,.
>=20
>  On the following architectures:=20
>  arm64, amd64 and sometimes i386 running NetBSD host OS;=20
>  i386 running OpenBSD host OS:
>=20
>  I have seen a consistent problem with FTP returning short files. The
>  file will be a couple of bytes too short. I do not believe this is a
>  problem with the OS. Downloading the perl source code from CPAN does
>  not work properly, nor does downloading bind from isc. I've tried this
>  on different architectures as above.
>=20
>  (Qemu 4.2 on Ubuntu/x86_64 with NetBSD/i386 seems to function fine. My
>  gut feel is there is something not right on the Mac OS version of Qemu
>  or a bug in 5.2 - obviously in the network layer somewhere. If you
>  have anything you want me to try, please let me know - happy to help
>  get a resolution.)
>=20
> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1914117/+subscriptions
>

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1914117

Title:
  Short files returned via FTP on Qemu with various architectures and
  OSes

Status in QEMU:
  Fix Released

Bug description:
 =20
  Qemu 5.2 on Mac OS X Big Sur.

  I originally thought that it might be caused by the home-brew version of =
Qemu, but this evening I have removed the brew edition and compiled from sc=
ratch (using Ninja & Xcode compiler).=20
  Still getting the same problem,.

  On the following architectures:=20
  arm64, amd64 and sometimes i386 running NetBSD host OS;=20
  i386 running OpenBSD host OS:

  I have seen a consistent problem with FTP returning short files. The
  file will be a couple of bytes too short. I do not believe this is a
  problem with the OS. Downloading the perl source code from CPAN does
  not work properly, nor does downloading bind from isc. I've tried this
  on different architectures as above.

  (Qemu 4.2 on Ubuntu/x86_64 with NetBSD/i386 seems to function fine. My
  gut feel is there is something not right on the Mac OS version of Qemu
  or a bug in 5.2 - obviously in the network layer somewhere. If you
  have anything you want me to try, please let me know - happy to help
  get a resolution.)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1914117/+subscriptions


