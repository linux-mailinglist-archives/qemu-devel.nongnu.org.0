Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 330E537393B
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 13:22:43 +0200 (CEST)
Received: from localhost ([::1]:41934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leFc1-0004oi-GA
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 07:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leFaM-0003Gj-OS
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:20:58 -0400
Received: from indium.canonical.com ([91.189.90.7]:48066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1leFaK-0007fx-QB
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:20:58 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1leFaI-0000B6-Kl
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 11:20:54 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 9907B2E8135
 for <qemu-devel@nongnu.org>; Wed,  5 May 2021 11:20:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 May 2021 11:11:01 -0000
From: Thomas Huth <1813307@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: christophe-lyon th-huth
X-Launchpad-Bug-Reporter: Christophe Lyon (christophe-lyon)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154842583020.19428.9970935732154630086.malonedeb@gac.canonical.com>
Message-Id: <162021306151.14445.9366041459240896494.malone@soybean.canonical.com>
Subject: [Bug 1813307] Re: util/path.c/follow_path() does not handle "/" well
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d6ba96cccb3d3e356754af3137c6128a6c17e2a8"; Instance="production"
X-Launchpad-Hash: df3e5527ed497739dca9ec95a54e00dce7c04dc0
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
Reply-To: Bug 1813307 <1813307@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/162


** Changed in: qemu
       Status: New =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #162
   https://gitlab.com/qemu-project/qemu/-/issues/162

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1813307

Title:
  util/path.c/follow_path() does not handle "/" well

Status in QEMU:
  Expired

Bug description:
  Hello,

  I noticed that qemu does not handle "/" very well in follow_path().

  Specifically, I was trying to run gdbserver under qemu, and it failed
  inside its implementation of __getcwd.

  Indeed it does something like
    if (__lstat ("/", &st) < 0)
  .....
  and then loops from current dir toward the top using lstat("..")

  On qemu side, lstat forwards the request to follow_path() in util/path.c,=
 and when passed "/", it returns the path in QEMU_LD_PREFIX (which was the =
top of my sysroot).
  OTHT, the series of lstat("..") finally reaches the real device root beca=
use it's not recognized as "/" in follow_path(), so this is inconsistent an=
d __getcwd fails.

  I suppose there's a good reason for returning QEMU_LD_PREFIX when
  asking for "/", but why is it so?

  If there's no good reason, maybe the behaviour could be changed to map
  "/" to "/" ?

  Thanks

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1813307/+subscriptions

