Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32621373102
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 21:47:10 +0200 (CEST)
Received: from localhost ([::1]:39394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1le10f-00011R-91
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 15:47:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1le0zI-00005l-BK
 for qemu-devel@nongnu.org; Tue, 04 May 2021 15:45:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:45712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1le0zG-0000PB-Nq
 for qemu-devel@nongnu.org; Tue, 04 May 2021 15:45:44 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1le0zF-00058R-Ej
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 19:45:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5945E2E8085
 for <qemu-devel@nongnu.org>; Tue,  4 May 2021 19:45:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 May 2021 19:39:20 -0000
From: Thomas Huth <1892081@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ahmedkrmn rth th-huth
X-Launchpad-Bug-Reporter: Ahmed Karaman (ahmedkrmn)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159777580973.2034.8843080316751302000.malonedeb@chaenomeles.canonical.com>
Message-Id: <162015716037.767.15114834005928521728.malone@chaenomeles.canonical.com>
Subject: [Bug 1892081] Re: Performance improvement when using "QEMU_FLATTEN"
 with softfloat type conversions
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 0a57ac6deae8ae10a6d8bb8f8d5951ad4110a532
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
Reply-To: Bug 1892081 <1892081@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/134


** Changed in: qemu
       Status: In Progress =3D> Expired

** Changed in: qemu
     Assignee: Richard Henderson (rth) =3D> (unassigned)

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #134
   https://gitlab.com/qemu-project/qemu/-/issues/134

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1892081

Title:
  Performance improvement when using "QEMU_FLATTEN" with softfloat type
  conversions

Status in QEMU:
  Expired

Bug description:
  Attached below is a matrix multiplication program for double data
  types. The program performs the casting operation "(double)rand()"
  when generating random numbers.

  This operation calls the integer to float softfloat conversion
  function "int32_to_float_64".

  Adding the "QEMU_FLATTEN" attribute to the function definition
  decreases the instructions per call of the function by about 63%.

  Attached are before and after performance screenshots from
  KCachegrind.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1892081/+subscriptions

