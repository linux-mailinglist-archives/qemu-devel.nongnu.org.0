Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB543367B7C
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 09:52:31 +0200 (CEST)
Received: from localhost ([::1]:53762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZU8U-0001Wp-P8
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 03:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZU7J-0008Na-Lo
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:51:17 -0400
Received: from indium.canonical.com ([91.189.90.7]:44062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lZU7D-0000Er-Ln
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 03:51:17 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lZU7B-0000QG-MA
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:51:09 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A660A2E815B
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 07:51:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Apr 2021 07:40:14 -0000
From: Thomas Huth <1847467@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: amd64
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: th-huth ylhuillier
X-Launchpad-Bug-Reporter: Yves Lhuillier (ylhuillier)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <157061690442.756.9495451631448947331.malonedeb@chaenomeles.canonical.com>
Message-Id: <161907721466.31655.53862032308600735.malone@soybean.canonical.com>
Subject: [Bug 1847467] Re: qemu-x86_64 segment prefixes error
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 94b3d236c42266d07185e33775accf17563f0108
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
Reply-To: Bug 1847467 <1847467@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to
another system. For this we need to know which bugs are still valid
and which could be closed already. Thus we are setting older bugs to
"Incomplete" now.

If you still think this bug report here is valid, then please switch
the state back to "New" within the next 60 days, otherwise this report
will be marked as "Expired". Or please mark it as "Fix Released" if
the problem has been solved with a newer version of QEMU already.

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1847467

Title:
  qemu-x86_64 segment prefixes error

Status in QEMU:
  Incomplete

Bug description:
  qemu-x86_64 version 4.1.0 (qemu-x86_64 version 4.0.0 also have the
  issue)

  In 64-bit mode (x86_64) the DS, ES, SS or CS segment prefixes should
  be ignored; qemu-x86_64 does not ignore them.

  example: an x86_64 instructions preceded by FS DS (0x64 0x26) segment
  prefixes have the linear address of its memory reference flat-mapped
  (as if DS was in action) whereas it should be FS-mapped (offset by
  FS_base, because the DS, ES, SS or CS are just ignored).

  =

  I attach a small C++ program that shows this discrepancy.

  $ ./sample
  I'm not in QEMU

  $ qemu-x86_64 ./sample
  I'm in QEMU

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1847467/+subscriptions

