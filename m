Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFD23BC5A8
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 06:41:47 +0200 (CEST)
Received: from localhost ([::1]:40344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0cu2-0007OK-HO
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 00:41:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cff-0000KZ-Cj
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:55 -0400
Received: from indium.canonical.com ([91.189.90.7]:52676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1m0cfd-0003RA-Ud
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 00:26:55 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1m0cfQ-0004xA-9t
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 04:26:40 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 820AE2E8342
 for <qemu-devel@nongnu.org>; Tue,  6 Jul 2021 04:26:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Jul 2021 04:17:28 -0000
From: Launchpad Bug Tracker <1870477@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor kionias th-huth
X-Launchpad-Bug-Reporter: Donghun Kwak (kionias)
X-Launchpad-Bug-Modifier: Launchpad Janitor (janitor)
References: <158589020097.22925.10247032490435356173.malonedeb@wampee.canonical.com>
Message-Id: <162554504864.7821.14784809438404768117.malone@loganberry.canonical.com>
Subject: [Bug 1870477] Re: qemu-arm hangs when golang running test
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="fe01712f453e3d8fdd7cfee725621d71a8ae3628"; Instance="production"
X-Launchpad-Hash: bb9bfa8ec604f07ae547621cbfca0409459c1a8a
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
Reply-To: Bug 1870477 <1870477@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Expired for QEMU because there has been no activity for 60 days.]

** Changed in: qemu
       Status: Incomplete =3D> Expired

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1870477

Title:
  qemu-arm hangs when golang running test

Status in QEMU:
  Expired

Bug description:
  =

  1. Environment:
  Ubuntu 16.04.5 X86_64
  qemu-arm version 4.2.0
  go version go 1.14.1 linux/arm

  2. Summary:
  Sometimes "go run test.go" command hang

  =

  3. Reproduction Method (Attempts: 500 Occurred: 1 ): Frequency: 1/500

  =

  test.go
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
  package main
  import "fmt"
  func main(){
          for i:=3D0; i<1000; i++ {
                  fmt.Printf("[%d] Hello world\n", i)
          }
  }
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

  i tested "go run test.go" command called  500 times at qemu arm env.
  qemu hangs about 200~300.

  attached strace log.

  please check.
  thanks

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1870477/+subscriptions

