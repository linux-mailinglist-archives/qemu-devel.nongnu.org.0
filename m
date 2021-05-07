Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 719EA375EEE
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 04:56:48 +0200 (CEST)
Received: from localhost ([::1]:45604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leqfX-0007LG-0T
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 22:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leqek-0006rJ-Ks
 for qemu-devel@nongnu.org; Thu, 06 May 2021 22:55:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:58244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leqec-0001Dq-2j
 for qemu-devel@nongnu.org; Thu, 06 May 2021 22:55:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1leqeY-0002pX-FF
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 02:55:46 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6D83C2E8135
 for <qemu-devel@nongnu.org>; Fri,  7 May 2021 02:55:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 May 2021 02:50:16 -0000
From: Thomas Huth <1883784@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: ppc64le tcg testcase
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: laurent-vivier misterc nemequ th-huth
X-Launchpad-Bug-Reporter: Evan Nemerson (nemequ)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <159233926606.29237.7012634601262116409.malonedeb@chaenomeles.canonical.com>
Message-Id: <162035581657.3037.5824933304394018518.malone@gac.canonical.com>
Subject: [Bug 1883784] Re: [ppc64le] qemu behavior differs from ppc64le
 hardware
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: 7728f3e3bc6c2c377b86c2ec850c34bc4b4a31de
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
Reply-To: Bug 1883784 <1883784@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently moving its bug tracking to another system.
For this we need to know which bugs are still valid and which could be
closed already. Thus we are setting older bugs to "Incomplete" now.

If the bug has already been fixed in the latest upstream version of QEMU,
then please close this ticket as "Fix released".

If it is not fixed yet and you think that this bug report here is still
valid, then you have two options:

1) If you already have an account on gitlab.com, please open a new ticket
for this problem in our new tracker here:

    https://gitlab.com/qemu-project/qemu/-/issues

and then close this ticket here on Launchpad (or let it expire auto-
matically after 60 days). Please mention the URL of this bug ticket on
Launchpad in the new ticket on GitLab.

2) If you don't have an account on gitlab.com and don't intend to get
one, but still would like to keep this ticket opened, then please switch
the state back to "New" within the next 60 days (otherwise it will get
closed as "Expired"). We will then eventually migrate the ticket auto-
matically to the new system (but you won't be the reporter of the bug
in the new system and thus won't get notified on changes anymore).

Thank you and sorry for the inconvenience.


** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1883784

Title:
  [ppc64le] qemu behavior differs from ppc64le hardware

Status in QEMU:
  Incomplete

Bug description:
  I have some code which passes my test suite on PPC64LE hardware when
  compiled with GCC 10, but the saem binary fails with both qemu-ppc64le
  4.2 (on Fedora 32) and qemu-ppc64le-static 5.0.0 (Debian testing).

  I'm not getting any errors about illegal instructions or anything,
  like that; the results are just silently different on qemu.

  I've generated a reduced test case, which is attached along with the
  binaries (both are the same code, one is just statically linked).
  They should execute successufully on PPC64LE hardware, but on qemu
  they hit a __builtin_abort (because the computed value doesn't match
  the expected value).

  Without being familiar with PPC assembly I'm not sure what else I can
  do, but if there is anything please let me know.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1883784/+subscriptions

