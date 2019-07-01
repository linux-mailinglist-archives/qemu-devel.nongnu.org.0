Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA2D2DE18
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 15:26:36 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54319 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVybD-0002Mh-AS
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 09:26:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hVyaH-00020N-3N
	for qemu-devel@nongnu.org; Wed, 29 May 2019 09:25:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bounces@canonical.com>) id 1hVyaG-0002uX-5n
	for qemu-devel@nongnu.org; Wed, 29 May 2019 09:25:37 -0400
Received: from indium.canonical.com ([91.189.90.7]:46262)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bounces@canonical.com>)
	id 1hVyaG-0002tx-1F
	for qemu-devel@nongnu.org; Wed, 29 May 2019 09:25:36 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
	by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
	id 1hVyaD-0004aR-W7
	for <qemu-devel@nongnu.org>; Wed, 29 May 2019 13:25:34 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
	by loganberry.canonical.com (Postfix) with ESMTP id E99C22E80CB
	for <qemu-devel@nongnu.org>; Wed, 29 May 2019 13:25:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 May 2019 13:18:06 -0000
From: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF?= <1830821@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=intel; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
X-Launchpad-Bug-Tags: intel-virt-19.10 qemu-19.10
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: quanxian-wang
X-Launchpad-Bug-Reporter: quanxian (quanxian-wang)
X-Launchpad-Bug-Modifier: =?utf-8?q?Christian_Ehrhardt_=EE=83=BF_=28paelzer?=
	=?utf-8?q?=29?=
References: <155909595152.12810.1489513977238974514.malonedeb@soybean.canonical.com>
Message-Id: <155913588688.12854.895623960239775243.launchpad@soybean.canonical.com>
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com); Revision="18968";
	Instance="launchpad-lazr.conf"
X-Launchpad-Hash: 0337c6040da7a8fde91e1b5dae9090a317f74504
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 91.189.90.7
Subject: [Qemu-devel] [Bug 1830821] Re: Expose ARCH_CAP_MDS_NO in guest
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1830821 <1830821@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Tags added: qemu-19.10

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1830821

Title:
  Expose ARCH_CAP_MDS_NO in guest

Status in intel:
  New
Status in QEMU:
  New

Bug description:
  Description:

  MDS_NO is bit 5 of ARCH_CAPABILITIES. Expose this bit to guest.

  Target Qemu: 4.1

To manage notifications about this bug go to:
https://bugs.launchpad.net/intel/+bug/1830821/+subscriptions

