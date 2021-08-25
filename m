Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEAF3F7095
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:42:35 +0200 (CEST)
Received: from localhost ([::1]:46946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInYQ-0006hi-7b
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInWu-0004ne-8d
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:41:00 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:46594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInWs-0000ur-EE
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:40:59 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 9CCDB3F824
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629877254;
 bh=YM/69qbrSmCJjHUucNCGnAvUzUXhdfW263mvIjGigfI=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=XbnI7i71BhDwNrneqy5REUBx7WYDy2mh8ykUTUZHMNxO/4RMKfREz1TjA0SrvxO8v
 J9SafS9nOQGQsGwUyWV++1L//EXPFhRy235yPFvu05irfx8YrzfHBSRIbv6SnajO9M
 vGHLxC2lyvb+pa2VYbZyYLf/7WTxRxt7uYGYFi6TbpnsN2Xel1CuDhGE9ju06QuSXB
 OfoUsUm80ouC7q18bz53I9QSinGKYgkLqU5tuvne1w7OXgkxoxb8mh0bScOtMxtrTQ
 1gEhPQO9h8ux3/LT3EELe9C7BRZotOCdenvpjK5ffVtNa9rQCZ/667YZ32bNypRvA5
 lM8uCDiyuRQww==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 794BD2E813C
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:40:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Aug 2021 07:31:08 -0000
From: Thomas Huth <1819182@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jnsnow smoser th-huth
X-Launchpad-Bug-Reporter: Scott Moser (smoser)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155205925919.27918.10336996226499931700.malonedeb@soybean.canonical.com>
Message-Id: <162987666863.21562.3065058239029241911.malone@gac.canonical.com>
Subject: [Bug 1819182] Re: info does not recognize file format of vpc with
 subformat=fixed
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7edb2d45353e030166106ae05838b77ab406edcd"; Instance="production"
X-Launchpad-Hash: 89e55a85a48b172bc64063aa6257750250d64da0
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1819182 <1819182@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'expired' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/559


** Changed in: qemu
       Status: In Progress =3D> Expired

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #559
   https://gitlab.com/qemu-project/qemu/-/issues/559

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1819182

Title:
  info does not recognize file format of vpc with subformat=3Dfixed

Status in QEMU:
  Expired

Bug description:
  After creating or converting an image to vpc with 'subformat=3Dfixed'
  'qemu-img info' incorrectly identifies the image as 'raw' format.

  $ qemu-img --version
  qemu-img version 2.11.1(Debian 1:2.11+dfsg-1ubuntu7.10)
  Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers

  $ qemu-img create -f vpc -o subformat=3Dfixed my.vpc 2G
  Formatting 'my.vpc', fmt=3Dvpc size=3D2147483648 subformat=3Dfixed

  $ qemu-img info my.vpc
  image: my.vpc
  file format: raw
  virtual size: 2.0G (2147992064 bytes)
  disk size: 4.0K

  $ qemu-img info -f vpc my.vpc
  image: my.vpc
  file format: vpc
  virtual size: 2.0G (2147991552 bytes)
  disk size: 4.0K

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1819182/+subscriptions


