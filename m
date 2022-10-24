Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC67609EC7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 12:12:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omsvq-0000xo-Or; Mon, 24 Oct 2022 04:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1omsvn-0000xY-AY
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 04:35:35 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1omsvi-0003LY-Ih
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 04:35:35 -0400
Received: from scripts-1.lp.internal (scripts.lp.internal [10.131.66.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id B162541447
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 08:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1666600521;
 bh=936GF9HkqjOfcvQDTjOn0GkcSU2oBCW7Ww/tSpzbyyo=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=qhIiwJ1swceJCgJh+H4krJojXVHhL109w2d7bUaf56GLYnxpKLfSA7uNP/YgGwjL6
 sTrKnOmXVa0cDvelS+Ku3O5OqekGUBMrahNTKZ+96CanE9eyTsrMnj12JWmh+8VFSL
 iiegu6A1Zvyu2mli8szvtl7U3v2ah0QI08dWnS4ZIOYPEXkwjnkTuye16srExzfYES
 jnM8PHCBloPUpvlP8PjdQW9x52yHrbvag4dxRuZB9eBLLsq06XMqhcMvjOKjPfq2pi
 KKiQUmP3uuCA9M7PxpEv+EhUiUADQQZFrkKx4SfMZSVzEUc981wNgBDfLH18NDHYii
 zQpU9Nn8LVHPg==
Received: from
 juju-4112d9-prod-launchpad-manual-servers-36.openstack.prodstack5.lan
 (localhost [127.0.0.1])
 by scripts-1.lp.internal (Postfix) with ESMTP id 003B63FF86
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 08:35:19 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Oct 2022 08:28:47 -0000
From: Ubuntu Foundations Team Bug Bot <1994002@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=cloud-archive; status=New; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug: product=cloud-archive; productseries=ussuri; status=New;
 importance=Undecided; assignee=brett.milford@canonical.com; 
X-Launchpad-Bug: product=qemu; status=New; importance=Undecided; assignee=None;
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
X-Launchpad-Bug-Commenters: brettmilford crichton
X-Launchpad-Bug-Reporter: Brett Milford (brettmilford)
X-Launchpad-Bug-Modifier: Ubuntu Foundations Team Bug Bot (crichton)
References: <166659440525.2803.16352024231081465383.malonedeb@angus.canonical.com>
Message-Id: <166660012773.26568.15461618472130908781.malone@dale.canonical.com>
Subject: [Bug 1994002] Re: [SRU] migration was active, but no RAM info was set
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="083267bcef06a439af1c3ee2507b2333659521d4"; Instance="production"
X-Launchpad-Hash: fb959b63f891912f68e8188105a1efe45348df36
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

The attachment "lp1994002-qemu-ussuri.debdiff" seems to be a debdiff.
The ubuntu-sponsors team has been subscribed to the bug report so that
they can review and hopefully sponsor the debdiff.  If the attachment
isn't a patch, please remove the "patch" flag from the attachment,
remove the "patch" tag, and if you are member of the ~ubuntu-sponsors,
unsubscribe the team.

[This is an automated message performed by a Launchpad user owned by
~brian-murray, for any issue please contact him.]

** Tags added: patch

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
Status in QEMU:
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


