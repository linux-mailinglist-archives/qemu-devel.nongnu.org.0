Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF263926E8
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 07:32:17 +0200 (CEST)
Received: from localhost ([::1]:34468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm8cy-0001rE-CI
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 01:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lm8We-0008U3-55
 for qemu-devel@nongnu.org; Thu, 27 May 2021 01:25:44 -0400
Received: from indium.canonical.com ([91.189.90.7]:46476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lm8Wa-0000Y3-Vr
 for qemu-devel@nongnu.org; Thu, 27 May 2021 01:25:43 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lm8WY-00028o-UO
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 05:25:38 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id E3D802E8010
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 05:25:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 May 2021 05:18:34 -0000
From: Albert Wik <1897568@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Committed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: awik philmd th-huth
X-Launchpad-Bug-Reporter: Albert Wik (awik)
X-Launchpad-Bug-Modifier: Albert Wik (awik)
References: <160129907003.10349.16133652474527618816.malonedeb@chaenomeles.canonical.com>
 <162209189915.3061.3446758831334954376.malone@gac.canonical.com>
Message-Id: <CALPW7mQCFARJ_6-L9DU8m8UpOU7mHJYXW1pmo+nd4KGbyrTsJQ@mail.gmail.com>
Subject: Re: [Bug 1897568] Re: Strange keyboard behaviour in Vim editor
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="802ed26817d1cdd050553dbe99cc8a3cad1a3bc7"; Instance="production"
X-Launchpad-Hash: 0285e048bcfe54c458a8ad6349616aa765b26e10
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
Reply-To: Bug 1897568 <1897568@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

thanks for letting me know.

I do plan to test this and report back, but that may take some time, as I
would first have to compile and install a new version of QEMU.

-aw

On Thu, 27 May 2021 at 05:10, Thomas Huth <1897568@bugs.launchpad.net>
wrote:

> The patch mentioned by Philippe has now been merged to the QEMU master
> branch (commit d1e45668d2128b064). Albert, could you maybe check the
> current git version to see whether this problem has been fixed now
> (using "-global i8042.kbd-throttle=3Don" to enable this new feature)?
>
> ** Changed in: qemu
>        Status: In Progress =3D> Fix Committed
>
> --
> You received this bug notification because you are subscribed to the bug
> report.
> https://bugs.launchpad.net/bugs/1897568
>
> Title:
>   Strange keyboard behaviour in Vim editor
>
> Status in QEMU:
>   Fix Committed
>
> Bug description:
>
>   I'm running MS-DOS 7.10 in a QEMU virtual machine, and there is a
> problem with the keyboard in the Vim editor.  The arrow keys jump over a
> line, as if you had typed the key twice.  PgUp and PgDn are likewise
> affected.  Other applications are not affected, unless you shell out from
> Vim.
>
>   The QEMU version is 5.0.0, and I'm using the "-k sv" option, but I've
>   tried without it and it doesn't make a difference.
>
>   I don't get this keyboard behaviour in the exact same VM under VMware
>   Player or Bochs.
>
>   -Albert.
>
> To manage notifications about this bug go to:
> https://bugs.launchpad.net/qemu/+bug/1897568/+subscriptions
>

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1897568

Title:
  Strange keyboard behaviour in Vim editor

Status in QEMU:
  Fix Committed

Bug description:
  =

  I'm running MS-DOS 7.10 in a QEMU virtual machine, and there is a problem=
 with the keyboard in the Vim editor.  The arrow keys jump over a line, as =
if you had typed the key twice.  PgUp and PgDn are likewise affected.  Othe=
r applications are not affected, unless you shell out from Vim.

  The QEMU version is 5.0.0, and I'm using the "-k sv" option, but I've
  tried without it and it doesn't make a difference.

  I don't get this keyboard behaviour in the exact same VM under VMware
  Player or Bochs.

  -Albert.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1897568/+subscriptions

