Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6F33FAD56
	for <lists+qemu-devel@lfdr.de>; Sun, 29 Aug 2021 19:17:02 +0200 (CEST)
Received: from localhost ([::1]:43864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKOQX-00017l-0l
	for lists+qemu-devel@lfdr.de; Sun, 29 Aug 2021 13:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mKOPF-00006T-OA
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 13:15:41 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:35754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mKOPC-0004xW-D0
 for qemu-devel@nongnu.org; Sun, 29 Aug 2021 13:15:41 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id AE25A3F597
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 17:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1630257332;
 bh=K+p5HreHqoM++cfkJpkzb945TPRJYFbX571Z64ckWiE=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=vSP6xAM1QxXK2ZcBO2Q8RtIwnH46/pM+GInmvgycWYtVMVb+JYb8w0m+tRpll4xES
 Oiy3/BfVIlNJ4JhaGb4mhhIPnquGTBgbaLj38L3OWYhJaXCH02wezOFtvDeQKGVvwt
 Cg8JIO9DVw3XMQBw8OLX3FyTvJ5NZEEYpbGXZc6pI7XGpYPlDWZ6xW9SRs+xmYMTg8
 1ePKKtyPlbtnPjPuQy0vW1Gj0Sk2eMb3I3zT/gUDFZjZg+xfT3zqSKqhy/mUGH0Gjn
 YdfFJ71qYa7dI18AJ4/d/KItv0FGbEhPyLHD5ubKhIltUFNR2buVn+NVXoFtkhU5Yo
 XO1YDyUWd78Kw==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 966982E8135
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 17:15:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 29 Aug 2021 17:07:11 -0000
From: Thomas Huth <1819289@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: mttcg
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cbparker curryrice71 dgilbert-h philmd pmaydell
 th-huth
X-Launchpad-Bug-Reporter: John M (curryrice71)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <155216177409.9624.16357609956497374456.malonedeb@gac.canonical.com>
Message-Id: <163025683118.5840.1007725191442021742.malone@gac.canonical.com>
Subject: [Bug 1819289] Re: Windows 95 and Windows 98 will not install or run
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="76ef73296f01d64cdfe5c48bfc4daf35cdfde808"; Instance="production"
X-Launchpad-Hash: fa6678d6835ffc06583d10006106b2dcecbaf57f
Received-SPF: pass client-ip=185.125.188.251;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-1.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1819289 <1819289@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since there is some unclear information in here (which version is
working? which is not?), could you please open a new ticket on gitlab
instead, with a proper description what is not working with which
version?

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1819289

Title:
  Windows 95 and Windows 98 will not install or run

Status in QEMU:
  Fix Released

Bug description:
  The last version of QEMU I have been able to run Windows 95 or Windows
  98 on was 2.7 or 2.8. Recent versions since then even up to 3.1 will
  either not install or will not run 95 or 98 at all. I have tried every
  combination of options like isapc or no isapc, cpu pentium  or cpu as
  486. Tried different memory configurations, but they just don't work
  anymore.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1819289/+subscriptions


