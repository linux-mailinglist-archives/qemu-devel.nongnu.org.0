Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2752B5C5C
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 10:57:48 +0100 (CET)
Received: from localhost ([::1]:35468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kexkB-00029j-8U
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 04:57:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kexi8-0000s8-Pp
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:55:41 -0500
Received: from indium.canonical.com ([91.189.90.7]:52444)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kexi5-0002iS-NL
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 04:55:39 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kexi2-0006UO-TW
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 09:55:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CCDEA2E8130
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 09:55:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2020 09:41:53 -0000
From: Thomas Huth <1054558@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=New; importance=Wishlist; assignee=None; 
X-Launchpad-Bug: distribution=debian; sourcepackage=None; component=None;
 status=Confirmed; importance=Unknown; assignee=None; 
X-Launchpad-Bug-Tags: display resolution vga
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bozhan-abv javibarroso m13253 th-huth
X-Launchpad-Bug-Reporter: StarBrilliant (m13253)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
X-Launchpad-Bug-Duplicate: 1022023
References: <20120922120346.32541.66809.malonedeb@wampee.canonical.com>
Message-Id: <160560611335.28731.4103671877339417498.malone@gac.canonical.com>
Subject: [Bug 1054558] Re: 1366x768 resolution missing
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a2ee2035671f86427804714f331b9ff7fecaef7e"; Instance="production"
X-Launchpad-Hash: e2211a62eca19596c431d74367b7c0900f9481e3
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 04:35:40
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
Reply-To: Bug 1054558 <1054558@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

*** This bug is a duplicate of bug 1022023 ***
    https://bugs.launchpad.net/bugs/1022023

I noticed that we have multiple tickets for more resolutions opened.
Let's consolidate all in https://bugs.launchpad.net/qemu/+bug/1022023
and close this one here as duplicate.

** This bug has been marked a duplicate of bug 1022023
   vga/std lacks few wide screen modes.

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1054558

Title:
  1366x768 resolution missing

Status in QEMU:
  New
Status in Debian:
  Confirmed

Bug description:
  I use ArchLinux with QEMU 1.2.0.
  I found that 1366x768 resolution is missing, even if I use -vga std or -v=
ga vmware.
  I think that it is necessary to patch it into the source.
  Also, why not add a command-line option to specify custom resolutions wit=
hout patching the source? (I know that VirtualBox has a hidden option to ad=
d any resolution.)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1054558/+subscriptions

