Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D034CF043
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 04:32:47 +0100 (CET)
Received: from localhost ([::1]:44118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR473-0002N8-N3
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 22:32:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1nR45M-0001D8-Ba
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 22:31:00 -0500
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:47604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1nR45J-00028x-Nx
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 22:30:59 -0500
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 8C20643523
 for <qemu-devel@nongnu.org>; Mon,  7 Mar 2022 03:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1646623853;
 bh=KJYOiC1Srn6cXOCEL1wUcftDIKCLvA5grx4Y6hrftxE=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=cTEdiv9QUAnmSfXKydGwgfDKCo8rAEgmZY31ZbqkJsrZeysCECsdaaG8R8J1q+YVb
 b7i+JpsSvp14ZE26YGuMgED5LoHb0O/akxGhkgtd8S+wwN/UqBCXcMrbrrum6R9iKO
 jgbkrgKYqmIlS84hJt9zWvt94KyLBEWNhWKUDlsKz5p3BYRgE6vrUX0awpP1DHhTPI
 CtzGkpC9dd0jLg2Y+f8CFi7ci5oO6Kj3EpswAESpsoZYTv3wR1lxG0bPk2m4GRQfkz
 qThTf53N+I01/SkBwmPrXbt38JfvR3PImJWj5wz0ftXnbcigPtDqAZCEwUItejhTsV
 HIy033lq1ft8A==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D552F2E822B
 for <qemu-devel@nongnu.org>; Mon,  7 Mar 2022 03:30:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Mar 2022 03:24:53 -0000
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
Message-Id: <164662349346.12004.1889470566106368680.malone@daniels.internal>
Subject: [Bug 1735049] Re: Need MTTCG support for x86 guests
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="61f4697954ab70d633d14d8ceecff69a20b08a6b"; Instance="production"
X-Launchpad-Hash: 1a7e857fe3ff4889f9be1a65dea2ae28cd8541bf
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

Looks like support for this was not fully added; my apologies for
closing this bug too early.

Adding full support for strong-on-weak emulation would be simple, at
least when it comes to memory ordering. The slowdown would be huge
though, see Figure 12 in
http://www.cs.columbia.edu/~cota/pubs/cota_cgo17.pdf (i.e. ~2x hmean
overhead for SPEC).

The good news is that with hardware support this overhead is ~0 (see SAO
in that figure).

The other feature that is not yet implemented in upstream QEMU is the
correct emulation of LL/SC, although for most code out there this
shouldn't be an issue in practice given that most parallel code relies
on cmpxchg, not on LL/SC pairs.

I'm reopening this bug an Cc'ing a few people who are more familiar with
the current code than I am in case I missed anything.

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


