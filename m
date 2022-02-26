Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF544C576D
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 19:26:59 +0100 (CET)
Received: from localhost ([::1]:54302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO1mT-0006ul-Vc
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 13:26:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1nO1lG-0006C0-51
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 13:25:42 -0500
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:52434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1nO1lD-0000zZ-Es
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 13:25:41 -0500
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id E397A3F4AC
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 18:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1645899933;
 bh=VYb4/YJbAtnVdkSPYXWjRY3NhPijZbkoae8pYGBJY6s=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=Y3ZxL3YV86fjJRvXUjDbKNCygp77Au4+hiQ8EHFhFjd616UpjwT9tKVI4etrruKVp
 ZvDBqns1D9/wZ098klh2CerbzOWSf2UVNpUInv4LIpxSCvFdf4U5dGOYHin9LYW8BB
 vcPFB+PDPz76Nr0PbQ4vZAZ0K4+y0QuF6ZFoX6bXc4RmCDa7b4QQfGkGknS1XPkHOQ
 KMMD3crMC6D+JVAjYCMq2sntHkTlvTNe4OZUgX0jZU1YKKktJkHxAOl4CUStHyL5Hr
 6q+MEkvM/uQpVlHTYPAXQ6EM8JcAxLUrxYwWglK81XfxoLJmGLjQqmycuBoxX/Cs5c
 LgIXCjoHCdAxw==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 902412E8211
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 18:25:33 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Feb 2022 18:16:25 -0000
From: Jim Kleckner <1735049@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cota jek-ubuntu kb9vqf
X-Launchpad-Bug-Reporter: Timothy Pearson (kb9vqf)
X-Launchpad-Bug-Modifier: Jim Kleckner (jek-ubuntu)
References: <151192504398.10243.14437635177032457733.malonedeb@wampee.canonical.com>
Message-Id: <164589938604.7550.4237225017809573349.malone@gac.canonical.com>
Subject: [Bug 1735049] Re: Need MTTCG support for x86 guests
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="131c1c72b6032652fb002ebff08e63a8deeb8d0a"; Instance="production"
X-Launchpad-Hash: 505c50cdb92182552da2fad02aabbf3ff4816b09
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
Reply-To: Bug 1735049 <1735049@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

See the discussion linked below that says that strong on weak is not
actually fully supported yet.

Is that discussion correct?

=3D=3D=3D

In short they explained to me that since the host arm64 is a weaker
memory order than the guest x86 they disabled mttcg because if they
would implement it would slow everything down but the good news is that
if the guest is the same memory order it is not disabled and if it is
weaker memory order it is not disabled also.

https://github.com/utmapp/UTM/issues/257#issuecomment-612675960

=3D=3D=3D

Right, that's what I figured from the code. So basically the launchpad
comment was incorrect. There is no MTTCG support for x86 on ARM64.

https://github.com/utmapp/UTM/issues/257#issuecomment-612689011

** Bug watch added: github.com/utmapp/UTM/issues #257
   https://github.com/utmapp/UTM/issues/257

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1735049

Title:
  Need MTTCG support for x86 guests

Status in QEMU:
  Fix Released

Bug description:
  MTTCG support is notably absent for x86_64 guests.  The last Wiki
  update on MTTCG was back in 2015, and I am having some difficulty
  determining the current status of the underlying requirements to
  enable this feature on x86 hosts.

  For instance, has support for strong-on-weak memory consistency been
  added into QEMU GIT at this point?

  Thanks!

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1735049/+subscriptions


