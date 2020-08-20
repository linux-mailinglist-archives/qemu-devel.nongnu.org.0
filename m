Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BB424C229
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 17:27:37 +0200 (CEST)
Received: from localhost ([::1]:53872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8mTY-0006QM-FO
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 11:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k8mNF-0000w3-CE
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 11:21:05 -0400
Received: from indium.canonical.com ([91.189.90.7]:53252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k8mNA-0008B4-Qg
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 11:21:03 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k8mN6-0001n0-MD
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 15:20:56 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 1A63F2E8117
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 15:20:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Aug 2020 15:09:39 -0000
From: Thomas Huth <1881004@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: eblake philmd pmaydell
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159060681483.5838.13632051970488338647.malonedeb@wampee.canonical.com>
Message-Id: <159793617971.2296.10867525251858783838.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1881004] Re: fpu/softfloat.c: error: bitwise negation of a
 boolean expression
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="99c2d833c8d727fd05148486920aca032e908071"; Instance="production"
X-Launchpad-Hash: b254388cb131c7bc66a1b73a0c7760c7de56bbb4
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 10:50:55
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, HEADER_FROM_DIFFERENT_DOMAINS=1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1881004 <1881004@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1881004

Title:
  fpu/softfloat.c: error: bitwise negation of a boolean expression

Status in QEMU:
  Fix Released

Bug description:
  Last time I built QEMU was on commit d5c75ec500d96f1d93447f990cd5a4ef5ba2=
7fae,
  I just pulled to fea8f3ed739536fca027cf56af7f5576f37ef9cd and now get:
   =

    CC      lm32-softmmu/fpu/softfloat.o
  fpu/softfloat.c:3365:13: error: bitwise negation of a boolean expression;=
 did you mean logical negation? [-Werror,-Wbool-operation]
      absZ &=3D ~ ( ( ( roundBits ^ 0x40 ) =3D=3D 0 ) & roundNearestEven );
              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              !
  fpu/softfloat.c:3423:18: error: bitwise negation of a boolean expression;=
 did you mean logical negation? [-Werror,-Wbool-operation]
          absZ0 &=3D ~ ( ( (uint64_t) ( absZ1<<1 ) =3D=3D 0 ) & roundNeares=
tEven );
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                   !
  fpu/softfloat.c:3483:18: error: bitwise negation of a boolean expression;=
 did you mean logical negation? [-Werror,-Wbool-operation]
          absZ0 &=3D ~(((uint64_t)(absZ1<<1) =3D=3D 0) & roundNearestEven);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                   !
  fpu/softfloat.c:3606:13: error: bitwise negation of a boolean expression;=
 did you mean logical negation? [-Werror,-Wbool-operation]
      zSig &=3D ~ ( ( ( roundBits ^ 0x40 ) =3D=3D 0 ) & roundNearestEven );
              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              !
  fpu/softfloat.c:3760:13: error: bitwise negation of a boolean expression;=
 did you mean logical negation? [-Werror,-Wbool-operation]
      zSig &=3D ~ ( ( ( roundBits ^ 0x200 ) =3D=3D 0 ) & roundNearestEven );
              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              !
  fpu/softfloat.c:3987:21: error: bitwise negation of a boolean expression;=
 did you mean logical negation? [-Werror,-Wbool-operation]
                      ~ ( ( (uint64_t) ( zSig1<<1 ) =3D=3D 0 ) & roundNeare=
stEven );
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~
                      !
  fpu/softfloat.c:4003:22: error: bitwise negation of a boolean expression;=
 did you mean logical negation? [-Werror,-Wbool-operation]
              zSig0 &=3D ~ ( ( (uint64_t) ( zSig1<<1 ) =3D=3D 0 ) & roundNe=
arestEven );
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
                       !
  fpu/softfloat.c:4273:18: error: bitwise negation of a boolean expression;=
 did you mean logical negation? [-Werror,-Wbool-operation]
          zSig1 &=3D ~ ( ( zSig2 + zSig2 =3D=3D 0 ) & roundNearestEven );
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                   !
  8 errors generated.

  $ clang -v
  clang version 10.0.0-4ubuntu1 =

  Target: aarch64-unknown-linux-gnu

  $ lsb_release -a
  No LSB modules are available.
  Distributor ID: Ubuntu
  Description:    Ubuntu 20.04 LTS
  Release:        20.04
  Codename:       focal

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1881004/+subscriptions

