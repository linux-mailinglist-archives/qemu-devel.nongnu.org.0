Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6C43818C3
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 14:37:27 +0200 (CEST)
Received: from localhost ([::1]:38714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhtXq-0004lh-4D
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 08:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhtW2-0002j1-7v
 for qemu-devel@nongnu.org; Sat, 15 May 2021 08:35:35 -0400
Received: from indium.canonical.com ([91.189.90.7]:36924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhtVy-0007Zg-2j
 for qemu-devel@nongnu.org; Sat, 15 May 2021 08:35:33 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhtVv-0002uI-Rr
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 12:35:27 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AAEF02E8186
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 12:35:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 May 2021 12:29:35 -0000
From: Chris Pinnock <1914117@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: chrispinnock th-huth
X-Launchpad-Bug-Reporter: Chris Pinnock (chrispinnock)
X-Launchpad-Bug-Modifier: Chris Pinnock (chrispinnock)
References: <161221293549.4659.2173832767419505412.malonedeb@chaenomeles.canonical.com>
 <162107575749.21341.5739333515299336205.malone@soybean.canonical.com>
Message-Id: <038394B2-6300-4495-9A49-D7BB87FE527D@mac.com>
Subject: Re: [Bug 1914117] Re: Short files returned via FTP on Qemu with
 various architectures and OSes
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5321c3f40fa4d4b847f4e47fb766e7b95ed5036c"; Instance="production"
X-Launchpad-Hash: 5faeb6d1264d5c51a81a8dbbc7be2dea8fbcfad3
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
Reply-To: Bug 1914117 <1914117@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If it=E2=80=99s included in qemu when one downloads the sources I=E2=80=99m=
 happy.

Sent from my iPhone

> On 15 May 2021, at 11:55, Thomas Huth <1914117@bugs.launchpad.net> wrote:
> =

> =EF=BB=BFCould we close this ticket now if there is a workaround in libsl=
irp now?
> =

> ** Changed in: qemu
>       Status: New =3D> Incomplete
> =

> -- =

> You received this bug notification because you are subscribed to the bug
> report.
> https://bugs.launchpad.net/bugs/1914117
> =

> Title:
>  Short files returned via FTP on Qemu with various architectures and
>  OSes
> =

> Status in QEMU:
>  Incomplete
> =

> Bug description:
> =

>  Qemu 5.2 on Mac OS X Big Sur.
> =

>  I originally thought that it might be caused by the home-brew version of=
 Qemu, but this evening I have removed the brew edition and compiled from s=
cratch (using Ninja & Xcode compiler). =

>  Still getting the same problem,.
> =

>  On the following architectures: =

>  arm64, amd64 and sometimes i386 running NetBSD host OS; =

>  i386 running OpenBSD host OS:
> =

>  I have seen a consistent problem with FTP returning short files. The
>  file will be a couple of bytes too short. I do not believe this is a
>  problem with the OS. Downloading the perl source code from CPAN does
>  not work properly, nor does downloading bind from isc. I've tried this
>  on different architectures as above.
> =

>  (Qemu 4.2 on Ubuntu/x86_64 with NetBSD/i386 seems to function fine. My
>  gut feel is there is something not right on the Mac OS version of Qemu
>  or a bug in 5.2 - obviously in the network layer somewhere. If you
>  have anything you want me to try, please let me know - happy to help
>  get a resolution.)
> =

> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1914117/+subscriptions

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1914117

Title:
  Short files returned via FTP on Qemu with various architectures and
  OSes

Status in QEMU:
  Incomplete

Bug description:
  =

  Qemu 5.2 on Mac OS X Big Sur.

  I originally thought that it might be caused by the home-brew version of =
Qemu, but this evening I have removed the brew edition and compiled from sc=
ratch (using Ninja & Xcode compiler). =

  Still getting the same problem,.

  On the following architectures: =

  arm64, amd64 and sometimes i386 running NetBSD host OS; =

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

