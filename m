Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1052F2709
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 05:28:14 +0100 (CET)
Received: from localhost ([::1]:54152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzBHx-0001LW-HS
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 23:28:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzBFc-00085O-IK
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:25:49 -0500
Received: from indium.canonical.com ([91.189.90.7]:51892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kzBFa-0000rU-6N
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 23:25:48 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kzBFX-0004Tz-F2
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:25:43 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 285E62E8144
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:25:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Jan 2021 04:17:17 -0000
From: Launchpad Bug Tracker <1796816@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor th-huth tjcw
X-Launchpad-Bug-Reporter: Chris Ward (tjcw)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <153907284198.23615.17821186357944149368.malonedeb@chaenomeles.canonical.com>
Message-Id: <161042503781.10246.5671697386866020211.malone@loganberry.canonical.com>
Subject: [Bug 1796816] Re: Wrong keyboard in QEMU Windows for OpenSUSE PowerPC
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe617ea08df036edd5c842aded2b315e1c090677"; Instance="production"
X-Launchpad-Hash: 6c381723b0324eff207b8cb8ad37e32606e5afe0
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
Reply-To: Bug 1796816 <1796816@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1796816

Title:
  Wrong keyboard in QEMU Windows for OpenSUSE PowerPC

Status in QEMU:
  Expired

Bug description:
  I am trying to run an OpenSUSE PowerPC Little Endian system under Microso=
ft Windows. I have an English UK keyboard. The keyboard is basically correc=
t (I get a 'pound' sign when I press shift-3) but some of the keys are rend=
ered incorrectly. The wrong keys are
  \ renders as # (just right of left hand shift key)
  | renders as ~ (shift-\)
  ' renders as ` (2 keys right of l)
  @ renders as =C2=AC (shift-')
  # renders as ' (3 keys right of l)
  ~ renders as @ (shift-#)

  QEMU command line was
  >"\Program Files\qemu\qemu-system-ppc64.exe" -hda opensuse.qcow2

  OpenSUSE was installed from
  download.opensuse.org/ports/ppc/tumbleweed/iso/openSUSE-Tumbleweed-
  DVD-ppc64le-Current.iso .

  I am running OpenSUSE in runlevel 3 (no X11).

  I don't really know whether the problem is with QEMU, the Windows port
  of QEMU, or with OpenSUSE Tumbleweed.

  This is with QEMU for Windows 3.0.0 from https://qemu.weilnetz.de/w64/

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1796816/+subscriptions

