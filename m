Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FAD23EAD0
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 11:47:21 +0200 (CEST)
Received: from localhost ([::1]:59756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3yy8-0004qY-Bj
	for lists+qemu-devel@lfdr.de; Fri, 07 Aug 2020 05:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k3yws-0003MV-LJ
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 05:46:02 -0400
Received: from indium.canonical.com ([91.189.90.7]:47316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1k3ywq-0004j6-L6
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 05:46:02 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1k3ywp-0000Ok-7d
 for <qemu-devel@nongnu.org>; Fri, 07 Aug 2020 09:45:59 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 344922E808D
 for <qemu-devel@nongnu.org>; Fri,  7 Aug 2020 09:45:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2020 09:32:44 -0000
From: Thomas Huth <1245543@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: p12 th-huth
X-Launchpad-Bug-Reporter: Povilas Kanapickas (p12)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20131028155324.10487.34334.malonedeb@wampee.canonical.com>
Message-Id: <159679276424.2493.8504790804558340570.malone@gac.canonical.com>
Subject: [Bug 1245543] Re: Wrong implementation of SSE4.1 pmovzxbw and similar
 instructions
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="a24057fea7e4c6a98c0220d5f878da0f3c783699";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: e4ea47bc38f05a5fc73b22792d0a6527039eaa2a
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/07 01:41:01
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
Reply-To: Bug 1245543 <1245543@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looking through old bug tickets... is this still an issue with the
latest version of QEMU? Or could we close this ticket nowadays?

** Changed in: qemu
       Status: New =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1245543

Title:
  Wrong implementation of SSE4.1 pmovzxbw and similar instructions

Status in QEMU:
  Incomplete

Bug description:
  QEMU 1.5.0 (and git version, as far as I can tell from the source
  code) has incorrect implementation of pmovzxbw and similar SSE4.1
  instructions. The instruction zero-extends the first 8 8-bit elements
  of a vector to 16bit vector and puts them to another vector. The
  current implementation applies this operation only to the first
  element and zeros out the rest.

  To verify, compile the attached program for SSE4.1 (g++ -msse4.1
  cvtint.cc). On real hardware, it produces the following output:

  $ ./a.out
  1 0 2 0 3 0 4 0 5 0 6 0 7 0 8 0

  On QEMU, the output is as follows:

  $ ./a.out
  1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

  QEMU is invoked as:

  qemu-system-x86_64 \
      -M pc -cpu Haswell,+sse4.1,+avx,+avx2,+fma,enforce -m 512 \
      -serial stdio -no-reboot \
      -kernel vmlinuz -initrd initrd.img \
      -netdev user,id=3Duser.0 -device rtl8139,netdev=3Duser.0  -redir tcp:=
2222::22 \
      -hda ubuntu-amd64.ext3 \
      --append "rw console=3Dtty root=3D/dev/sda"

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1245543/+subscriptions

