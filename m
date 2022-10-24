Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0611B60AD8E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:26:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omxmO-0003bG-3P; Mon, 24 Oct 2022 09:46:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1omxm2-0003ZL-Uw
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:45:51 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1omxm0-0007Wa-JB
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 09:45:50 -0400
Received: from scripts-1.lp.internal (scripts.lp.internal [10.131.66.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 5784A416F0
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 13:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1666619142;
 bh=0red62TbDrmtiI1ngxUxKtCoJEBk0DPo1JNiPZKHqpI=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=blwTe1ZOEQSdfdsSnhxvJWC9nBxRg7X+uG9aK9Pb6eA5eMEFIi7klF45cNBsRdiIK
 KeMELnTLo1jFOQV+4bQK5xD87gF6XGoSCoNoeQoCGWkc4pm+0qnAqC2YiIMW7J5w5U
 PXA1pMnGdXt2xPbqsGfM9siswlTHrwSzCE1kZ+xUC4M15vqXLPHMgmHfpQY0B56Dob
 dNZVKfUwgOE1aaukvMSI3HxuGBlA47Xng0xupnoTtVdrzvKcDkxhUa//7OGabn1+9j
 R5eK99gkP+DzEbqq+GB/hxiYzly/DZFuXbi0bOXIJYv+1GchnkiYbTpwMPhboObYuJ
 +05XHmX8wlg+w==
Received: from
 juju-4112d9-prod-launchpad-manual-servers-36.openstack.prodstack5.lan
 (localhost [127.0.0.1])
 by scripts-1.lp.internal (Postfix) with ESMTP id 20B664084A
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 13:45:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Oct 2022 13:37:08 -0000
From: Thomas Huth <1994002@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=cloud-archive; status=New; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: product=cloud-archive; productseries=ussuri; status=New;
 importance=Undecided; assignee=brett.milford@canonical.com; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=focal; sourcepackage=qemu;
 component=main; status=New; importance=Undecided;
 assignee=brett.milford@canonical.com; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=jammy; sourcepackage=qemu;
 component=main; status=New; importance=Undecided;
 assignee=brett.milford@canonical.com; 
X-Launchpad-Bug: distribution=ubuntu; distroseries=kinetic; sourcepackage=qemu;
 component=main; status=New; importance=Undecided; assignee=None; 
X-Launchpad-Bug-Tags: patch
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: brettmilford crichton th-huth
X-Launchpad-Bug-Reporter: Brett Milford (brettmilford)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <166659440525.2803.16352024231081465383.malonedeb@angus.canonical.com>
Message-Id: <166661862866.22998.10158432107119198638.malone@gac.canonical.com>
Subject: [Bug 1994002] Re: [SRU] migration was active, but no RAM info was set
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="083267bcef06a439af1c3ee2507b2333659521d4"; Instance="production"
X-Launchpad-Hash: 04231cfcc74fa48bdebba8473c90e339a29bbc69
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1994002 <1994002@bugs.launchpad.net>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

If you need something from upstream QEMU, please use the new bug tracker
here: https://gitlab.com/qemu-project/qemu/-/issues

** No longer affects: qemu

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1994002

Title:
  [SRU] migration was active, but no RAM info was set

Status in Ubuntu Cloud Archive:
  New
Status in Ubuntu Cloud Archive ussuri series:
  New
Status in qemu package in Ubuntu:
  New
Status in qemu source package in Focal:
  New
Status in qemu source package in Jammy:
  New
Status in qemu source package in Kinetic:
  New

Bug description:
  While live-migrating many instances concurrently, libvirt sometimes retur=
n internal error: migration was active, but no RAM info was set:
  ~~~
  2022-03-30 06:08:37.197 7 WARNING nova.virt.libvirt.driver [req-5c3296cf-=
88ee-4af6-ae6a-ddba99935e23 - - - - -] [instance: af339c99-1182-4489-b15c-2=
1e52f50f724] Error monitoring migration: internal error: migration was acti=
ve, but no RAM info was set: libvirt.libvirtError: internal error: migratio=
n was active, but no RAM info was set
  ~~~

  From upstream bug: https://bugzilla.redhat.com/show_bug.cgi?id=3D2074205

  [Impact]

   * Effects of this bug are mostly observed in large scale clusters with a=
 lot of live migration activity.
   * Has second order effects for consumers of migration monitor such as li=
bvirt and openstack.

  [Test Case]
  Steps to Reproduce:
  1. live evacuate a compute
  2. live migration of one or more instances fails with the above error

  N.B Due to the nature of this bug it is difficult consistently
  reproduce.

  [Where problems could occur]
   * In the event of a regression the migration monitor may report an incon=
sistent state.

To manage notifications about this bug go to:
https://bugs.launchpad.net/cloud-archive/+bug/1994002/+subscriptions


