Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BC936593A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 14:49:44 +0200 (CEST)
Received: from localhost ([::1]:38660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYpp1-0004gy-8y
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 08:49:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYphM-0000bI-5u
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 08:41:48 -0400
Received: from indium.canonical.com ([91.189.90.7]:54186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lYphI-0000xB-2Y
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 08:41:47 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1lYphF-0007Wz-5i
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 12:41:41 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 441762E818B
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 12:41:39 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 20 Apr 2021 12:31:05 -0000
From: Thomas Huth <1819182@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Confirmed; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: jnsnow smoser th-huth
X-Launchpad-Bug-Reporter: Scott Moser (smoser)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155205925919.27918.10336996226499931700.malonedeb@soybean.canonical.com>
Message-Id: <161892186602.32310.803437717436543652.malone@soybean.canonical.com>
Subject: [Bug 1819182] Re: info does not recognize file format of vpc with
 subformat=fixed
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="1552fceb1603b3da6cfa437575d9c9fc4b2e683a"; Instance="production"
X-Launchpad-Hash: 356b9f6f65a4eabb33c82ee612e36d56765f52cc
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
Reply-To: Bug 1819182 <1819182@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Suggested patch:
https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg09422.html

** Changed in: qemu
       Status: New =3D> Confirmed

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1819182

Title:
  info does not recognize file format of vpc with subformat=3Dfixed

Status in QEMU:
  Confirmed

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

