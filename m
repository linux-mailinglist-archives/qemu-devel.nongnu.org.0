Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 059681DE78F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 May 2020 15:02:46 +0200 (CEST)
Received: from localhost ([::1]:57248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jc7K1-00052c-2q
	for lists+qemu-devel@lfdr.de; Fri, 22 May 2020 09:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jc7II-0003ca-2B
 for qemu-devel@nongnu.org; Fri, 22 May 2020 09:00:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:36156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1jc7IG-0001UC-Px
 for qemu-devel@nongnu.org; Fri, 22 May 2020 09:00:57 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1jc7IE-00022Q-Os
 for <qemu-devel@nongnu.org>; Fri, 22 May 2020 13:00:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id AEF892E807D
 for <qemu-devel@nongnu.org>; Fri, 22 May 2020 13:00:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2020 12:51:32 -0000
From: Paul Goyette <1693649@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: paul-whooppee th-huth
X-Launchpad-Bug-Reporter: Paul Goyette (paul-whooppee)
X-Launchpad-Bug-Modifier: Paul Goyette (paul-whooppee)
References: <149575946555.18286.18117412791023512529.malonedeb@chaenomeles.canonical.com>
 <159012475963.7477.6476241369082913120.malone@gac.canonical.com>
Message-Id: <Pine.NEB.4.64.2005220550440.14012@speedy.whooppee.com>
Subject: Re: [Bug 1693649] Re: x86 pause misbehaves with -cpu haswell
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1f7bc749b40714a4cc10f5e4d787118a78037035";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: 04ceeb837c8ff76461ad44dc96eda2e0274ab198
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/22 09:00:55
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Reply-To: Bug 1693649 <1693649@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Seems ok now.

On Fri, 22 May 2020, Thomas Huth wrote:

> Can you still reproduce this issue with the latest version of QEMU
> (currently 5.0)?
>
> ** Changed in: qemu
>       Status: New =3D> Incomplete
>
> -- =

> You received this bug notification because you are subscribed to the bug
> report.
> https://bugs.launchpad.net/bugs/1693649
>
> Title:
>  x86 pause misbehaves with -cpu haswell
>
> Status in QEMU:
>  Incomplete
>
> Bug description:
>  Using qemu-2.9.0
>
>  When booting NetBSD using '-cpu haswell -smp 4', the system fails to
>  initialize the additional CPUs.  It appears as though the "application
>  processor" enters routine x86_pause() but never returns.
>
>  x86_pause() is simply two assembler instructions: 'pause; ret;'
>
>  Replacing the routine with 'nop; nop; ret;' allows the system to
>  proceed, of course without the benefit of the pause instruction on
>  spin-loops!
>
>  Additionally, booting with '-cpu phenom -smp 4' also works, although
>  the system does seem confused about the type of CPU being used.
>
> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1693649/+subscriptions
>
> !DSPAM:5ec7625658281532840571!
>
>

+--------------------+--------------------------+-----------------------+
| Paul Goyette       | PGP Key fingerprint:     | E-mail addresses:     |
| (Retired)          | FA29 0E3B 35AF E8AE 6651 | paul@whooppee.com     |
| Software Developer | 0786 F758 55DE 53BA 7731 | pgoyette@netbsd.org   |
+--------------------+--------------------------+-----------------------+

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1693649

Title:
  x86 pause misbehaves with -cpu haswell

Status in QEMU:
  Incomplete

Bug description:
  Using qemu-2.9.0

  When booting NetBSD using '-cpu haswell -smp 4', the system fails to
  initialize the additional CPUs.  It appears as though the "application
  processor" enters routine x86_pause() but never returns.

  x86_pause() is simply two assembler instructions: 'pause; ret;'

  Replacing the routine with 'nop; nop; ret;' allows the system to
  proceed, of course without the benefit of the pause instruction on
  spin-loops!

  Additionally, booting with '-cpu phenom -smp 4' also works, although
  the system does seem confused about the type of CPU being used.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1693649/+subscriptions

