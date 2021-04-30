Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6820B36F743
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 10:40:54 +0200 (CEST)
Received: from localhost ([::1]:33034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcOhg-0002tz-PL
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 04:40:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcOYn-0003E5-FG
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 04:31:41 -0400
Received: from indium.canonical.com ([91.189.90.7]:49272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lcOYg-0005SY-Oy
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 04:31:40 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lcOYd-0002PR-27
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:31:31 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 02F382E815D
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 08:31:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Apr 2021 08:23:59 -0000
From: Thomas Huth <1774412@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: gson pmaydell th-huth
X-Launchpad-Bug-Reporter: Andreas Gustafsson (gson)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <152777147120.26392.10770421701015705321.malonedeb@wampee.canonical.com>
Message-Id: <161977104005.4503.4684208489237811560.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1774412] Re: -icount sleep=on|off documentation is confusing
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="02afa4875ac52c169f5cddf0d1bcdd6e149a3754"; Instance="production"
X-Launchpad-Hash: aaea8b448f935878cef56196e8aac074ee2e3e40
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
Reply-To: Bug 1774412 <1774412@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1774412

Title:
  -icount sleep=3Don|off documentation is confusing

Status in QEMU:
  Fix Released

Bug description:
  The documentation for the -icount option in the qemu man page says:

  "When the virtual cpu is sleeping, the virtual time will advance at
  default speed unless sleep=3Don|off is specified. With sleep=3Don|off, the
  virtual time will jump to the next timer deadline instantly whenever
  the virtual cpu goes to sleep mode and will not advance if no timer is
  enabled."

  Taking this literally and specifying "sleep=3Don|off" on the command line=
 does not work, so presumably the two instances of "sleep=3Don|off" should =
be either "sleep=3Don" or "sleep=3Doff",
  whichever is correct :)

  Also, the synopsis line "-icount
  [shift=3DN|auto][,rr=3Drecord|replay,rrfile=3Dfilename,rrsnapshot=3Dsnaps=
hot"
  fails to mention the sleep keyword at all.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1774412/+subscriptions

