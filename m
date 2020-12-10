Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB67A2D5775
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 10:44:33 +0100 (CET)
Received: from localhost ([::1]:46146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knIUz-0008WS-1G
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 04:44:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knIIC-0006DR-6C
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:31:20 -0500
Received: from indium.canonical.com ([91.189.90.7]:38220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1knIIA-000269-6J
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 04:31:19 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1knII8-0000HU-NF
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:31:16 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A30072E8144
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:31:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Dec 2020 09:20:42 -0000
From: Thomas Huth <1826200@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=berrange@redhat.com; 
X-Launchpad-Bug-Tags: feature-request
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: berrange jnsnow lersek th-huth
X-Launchpad-Bug-Reporter: Laszlo Ersek (Red Hat) (lersek)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155610584995.13565.1262636932024040431.malonedeb@wampee.canonical.com>
Message-Id: <160759204274.16241.18218135677296007782.malone@chaenomeles.canonical.com>
Subject: [Bug 1826200] Re: RFE: populate "OEM Strings" (type 11) SMBIOS table
 strings from regular files
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="4853cb86c14c5a9e513816c8a61121c639b30835"; Instance="production"
X-Launchpad-Hash: c57d2402d8bb9f5c89343cf5699b1ed319a26e45
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
Reply-To: Bug 1826200 <1826200@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Released with QEMU v5.2.0.

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1826200

Title:
  RFE: populate "OEM Strings" (type 11) SMBIOS table strings from
  regular files

Status in QEMU:
  Fix Released

Bug description:
  The feature added in

  https://git.qemu.org/?p=3Dqemu.git;a=3Dcommitdiff;h=3D2d6dcbf93fb01b4a7f4=
5a93d276d4d74b16392dd

  and exposed by libvirt as

    https://libvirt.org/formatdomain.html#elementsSysinfo

  allows the user to specify up to 255 strings in the unofmatted area of
  the Type 11 SMBIOS table, where each string may be of arbitrary
  length. This feature is useful for exposing arbitrary text to
  arbitrary guest components (in particular when strings are prefixed
  with "application identifiers").

  Right now, strings can only be specified on the QEMU command line,
  which limits the amount of data that can be passed. Please enable
  users to pass data from regular files too.

  For example:

    $QEMU -smbios
  type=3D11,value=3DHello,txtfile=3Dfile1.txt,txtfile=3Dfile2.txt

  where "file1.txt" and "file2.txt" could be text files containing ASCII
  application prefixes, followed by base64-encoded binary data.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1826200/+subscriptions

