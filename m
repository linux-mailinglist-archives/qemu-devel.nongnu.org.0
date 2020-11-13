Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF832B1F5A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 16:57:41 +0100 (CET)
Received: from localhost ([::1]:36706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdbSG-0005QD-KD
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 10:57:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdbQX-00047W-8e
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 10:55:53 -0500
Received: from indium.canonical.com ([91.189.90.7]:43278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kdbQV-0000QN-Fb
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 10:55:52 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kdbQT-0003At-0C
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 15:55:49 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 007942E811E
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 15:55:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2020 15:47:14 -0000
From: Thomas Huth <1788701@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: kraxel-redhat metzengerstein th-huth
X-Launchpad-Bug-Reporter: Frederick Metzengerstein (metzengerstein)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <153505708215.4220.1958982030702670661.malonedeb@gac.canonical.com>
Message-Id: <160528243503.32050.14378888167595964935.malone@chaenomeles.canonical.com>
Subject: [Bug 1788701] Re: "Zoom to fit" doesn't work with -display gtk -vga
 virtio
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="38ebca4a151c7e484f2992f7b90f5a3ede13f97f"; Instance="production"
X-Launchpad-Hash: bd1d3ee917eb163143baba03e3a8e5bfe9274069
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/13 09:15:41
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
Reply-To: Bug 1788701 <1788701@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1788701

Title:
  "Zoom to fit" doesn't work  with -display gtk -vga virtio

Status in QEMU:
  Incomplete

Bug description:
  qemu version: 2.12.1, 3.0.0

  When using -display gtk for all -vga options (std,qxl,vmware,cirrus)
  the option "Zoom To Fit" is unchecked by default and thus auto-
  resizing of the window works well; except for -vga virtio: here "Zoom
  To Fit" is checked and auto-resizing doesn't work.

  Proposal: make "Zoom To Fit" unchecked by default for virtio as well
  Extended proposal: make GTK window options configurable via parameters

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1788701/+subscriptions

