Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A66894CF049
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 04:37:01 +0100 (CET)
Received: from localhost ([::1]:48306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR4BA-0005Nu-7L
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 22:37:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1nR49k-0004Zf-7t
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 22:35:33 -0500
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:45016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1nR49i-0002i7-6v
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 22:35:31 -0500
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id C3B5A44971
 for <qemu-devel@nongnu.org>; Mon,  7 Mar 2022 03:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1646624125;
 bh=svpdCoGZH3xn9Y5hq5P862gDSOqjCQr/oATpZfwLOUY=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=gMRc8lLuccXt7sajyU7rSNX+MJ5Ciq1lKaPfKZKNFVfoaTP8vbUbWQMpKyRbVBPVM
 KMIXE8O2qdxV2v2zSNb79MK+au6lYY1XCyZvgTGGXAJq3CIs/jX06Zb9N3ElJ85XJ7
 NCW3aDtYaBbbLqLmE3l/ZpiGbHc4IePy5bvoLoXmqn3D3YZkmSsMa5Q4A9kXvay4JG
 XN4AkAFBpzHPvZ0mKYa2xcK2OAIAEtnVfwwLmYnZCHED6yBLFHFlkTuEPVdQB0/xuC
 V6apu/+J4qTEto0RCCP9SAHL538DVIvkvPYtOi75x6hVyJwNLjFC3pRKkQp9P9ZRXo
 LJKnrx7X8o6Zg==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id B40142E8211
 for <qemu-devel@nongnu.org>; Mon,  7 Mar 2022 03:35:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Mar 2022 03:29:57 -0000
From: "Emilio G. Cota" <1735049@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cota jek-ubuntu kb9vqf
X-Launchpad-Bug-Reporter: Timothy Pearson (kb9vqf)
X-Launchpad-Bug-Modifier: Emilio G. Cota (cota)
References: <151192504398.10243.14437635177032457733.malonedeb@wampee.canonical.com>
Message-Id: <164662379777.29958.9138955061389056588.malone@gac.canonical.com>
Subject: [Bug 1735049] Re: Need MTTCG support for x86 guests
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="61f4697954ab70d633d14d8ceecff69a20b08a6b"; Instance="production"
X-Launchpad-Hash: 0054015c59867d535eec4bbc1b6843bf9d4d51b4
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
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

OK, looks like I cannot reopen the bug, probably because the bug tracker
moved to gitlab.

If you care about this feature, please file a bug over there:
https://gitlab.com/qemu-project/qemu/-/issues

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


