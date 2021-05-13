Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1394F37F7CD
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 14:23:46 +0200 (CEST)
Received: from localhost ([::1]:35120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhANU-0000Pg-On
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 08:23:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhAFw-0008Tc-Nn
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:15:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:42874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lhAFl-0007L9-8F
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:15:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lhAFi-0005HW-12
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 12:15:42 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E92CF2E8197
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 12:15:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 May 2021 12:02:27 -0000
From: Thomas Huth <1915794@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: windows
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: phil-opp th-huth ubuntu-weilnetz
X-Launchpad-Bug-Reporter: Philipp Oppermann (phil-opp)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <161346747703.23365.3708625175581048243.malonedeb@chaenomeles.canonical.com>
Message-Id: <162090734808.16933.6093167650578349803.malone@soybean.canonical.com>
Subject: [Bug 1915794] Re: could not load PC BIOS 'bios-256k.bin' on latest
 Windows exe (*-20210203.exe)
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="6b3403d85f09252210977b936e821c0b00dbe016"; Instance="production"
X-Launchpad-Hash: e21d3300c0091bef477fdf1878921b114ef10545
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_HI=-5,
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
Reply-To: Bug 1915794 <1915794@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefan's patch got merged here:
https://gitlab.com/qemu-project/qemu/-/commit/342e3a4f20653c2d419
... thus closing this issue now.

** Changed in: qemu
       Status: Confirmed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1915794

Title:
  could not load PC BIOS 'bios-256k.bin' on latest Windows exe
  (*-20210203.exe)

Status in QEMU:
  Fix Released

Bug description:
  I'm using https://scoop.sh/ to install QEMU on a Windows CI job, which
  is run daily. Since today, the job is failing with an `could not load
  PC BIOS 'bios-256k.bin'` error thrown by QEMU.

  The version that causes this error is: https://qemu.weilnetz.de/w64/2021/=
qemu-w64-setup-20210203.exe#/dl.7z
  The previous version, which worked fine, was: https://qemu.weilnetz.de/w6=
4/2020/qemu-w64-setup-20201124.exe#/dl.7z

  Both CI runs build the exact same code. You can find the full logs at
  https://github.com/rust-
  osdev/x86_64/runs/1908137213?check_suite_focus=3Dtrue (failing) and
  https://github.com/rust-
  osdev/x86_64/runs/1900698412?check_suite_focus=3Dtrue (previous).

  (I hope this is the right place to report this issue.)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1915794/+subscriptions

