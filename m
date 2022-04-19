Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77160506701
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Apr 2022 10:34:35 +0200 (CEST)
Received: from localhost ([::1]:42196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngjJi-0003mV-1l
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 04:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1ngjGH-0002vd-Kj
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 04:31:03 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:44108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1ngjGD-0002DM-Bu
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 04:30:59 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 32F0A403FC
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 08:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1650357051;
 bh=q7BjoJAU6KnOXLsldKHz+4O38QW1NKQmuEt4PM9AQgc=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=Keb2eTZd3HcwiT5ZBJVz5QQuxGOfbylKXPr8ZG/meawpIKAXwqXayD3KBbs871hBy
 mNlnOWgaciNZdFJlUecG8MQxrtGwMDJix21uq5Z9gDYe/IVEfGh/ad3uPwy5rzc2xz
 KFb5BvFmYA4nFa33F1qmZrOlHnhbrxvx4dVUOAoztGLTZau0R6cRqoWHrlRL3ioO52
 hdKfk8llhTWZDG45lMfFfKKEh9QEo7MlrlBVvV8cVYaH37LvhRPjfJQphIjgxcWypC
 hI3SgvYSRlTWRS5F3FSLazB40hzfHpyVfvmCoDSjNp8wt8YcGSPcyRCXnUBfmTI2yq
 lDrHKMHFf+eIw==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CF06D2E8236
 for <qemu-devel@nongnu.org>; Tue, 19 Apr 2022 08:30:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 Apr 2022 08:23:00 -0000
From: Thomas Huth <1795799@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor th-huth uli-rgbg
X-Launchpad-Bug-Reporter: 1448412 (uli-rgbg)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <153854876970.8093.8281977753870845379.malonedeb@soybean.canonical.com>
Message-Id: <165035658061.63639.15498415580847091507.malone@dale.canonical.com>
Subject: [Bug 1795799] Re: Cirrus video, graphical corruption, bad fonts
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5cc3bd61c85a328825183f316ddd801c0f7d7ef2"; Instance="production"
X-Launchpad-Hash: e7f13b3c9a3930f5ed0cba6469aeb6bc8962737d
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1795799 <1795799@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FWIW, issue has been re-opened here: https://gitlab.com/qemu-
project/qemu/-/issues/988

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #988
   https://gitlab.com/qemu-project/qemu/-/issues/988

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1795799

Title:
  Cirrus video, graphical corruption, bad fonts

Status in QEMU:
  Expired

Bug description:
  The error
  =3D=3D=3D

  I started qemu by

  `shell
  $ ./qemu-system-i386 -serial stdio -cdrom /dev/cdrom -vga cirrus
  S1111111111S1111111111S1111111111S1111111111=E2=96=92*n*n*n*n
  `

  with the original suse7.0 cd 1 in the cdrom drive (I think
  https://archive.org/details/suse-7.0_release_i386 has the image).
  After some console output (that uses a vga framebuffer which seems to
  work fine) the suse installer is started. It is displayed mostly
  correct, but several text passages are completely garbled.

  I noticed the same type of corruption when trying to run an old XF86
  SVGA Server on a SuSE 6.2 System using the `-vga cirrus` option.

  Therefore I think that the cirrus emulation might not work as intended
  any more.

  Qemu version
  =3D=3D=3D

  I used  qemu-w64-setup-20180815.exe provided by
  https://qemu.weilnetz.de/w64/

  ./qemu-system-i386 -version
  QEMU emulator version 3.0.0 (v3.0.0-11723-ge2ddcc5879-dirty)
  Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers

  Hope you can fix it.

  Best regards!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1795799/+subscriptions


