Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C86C5136AA2
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 11:09:37 +0100 (CET)
Received: from localhost ([::1]:43456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iprEW-0000Le-Jy
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 05:09:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34295)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bounces@canonical.com>) id 1iprBo-0005n6-JB
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 05:06:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bounces@canonical.com>) id 1iprBn-0003ZA-Fu
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 05:06:48 -0500
Received: from indium.canonical.com ([91.189.90.7]:42224)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bounces@canonical.com>)
 id 1iprBn-0003Uc-8k
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 05:06:47 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1iprBk-0004KP-Vk
 for <qemu-devel@nongnu.org>; Fri, 10 Jan 2020 10:06:45 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A10752E80D4
 for <qemu-devel@nongnu.org>; Fri, 10 Jan 2020 10:06:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jan 2020 09:57:57 -0000
From: Richard Jones <rjones@redhat.com>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: ehabkost pmaydell rjones-redhat th-huth
X-Launchpad-Bug-Reporter: Richard Jones (rjones-redhat)
X-Launchpad-Bug-Modifier: Richard Jones (rjones-redhat)
References: <20170117063435.21322.40478.malonedeb@gac.canonical.com>
Message-Id: <157865027864.27812.7249520388988056532.launchpad@chaenomeles.canonical.com>
Subject: [Bug 1657010] Re: RFE: Please implement -cpu best or a CPU fallback
 option
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="bceb5ef013b87ef7aafe0755545ceb689ca7ac60";
 Instance="production-secrets-lazr.conf"
X-Launchpad-Hash: f2e2a2298ef4b72dd91d7e7cf3982220393e7e1c
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.189.90.7
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
Reply-To: Bug 1657010 <1657010@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Incomplete =3D> Fix Released

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1657010

Title:
  RFE: Please implement -cpu best or a CPU fallback option

Status in QEMU:
  Fix Released

Bug description:
  QEMU should implement a -cpu best option or some other way to make
  this work:

  qemu -M pc,accel=3Dkvm:tcg -cpu best

  qemu -M pc,accel=3Dkvm:tcg -cpu host:qemu64

  See also:

  https://bugzilla.redhat.com/show_bug.cgi?id=3D1277744#c6

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1657010/+subscriptions

