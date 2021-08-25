Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E1A3F705F
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:26:25 +0200 (CEST)
Received: from localhost ([::1]:55628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInIm-00073T-Ed
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInDf-0001h1-61
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:21:07 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:43536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInDb-0000GX-RG
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:21:06 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 95D363F6AA
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629876062;
 bh=OK37Ghz4IMDaoMtBYkLMXKroPLofZz2nV7EyPAaX7oM=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=hpF85IsjyBTsfVh/iT3+pcuHGzM7fMxxbWEflVm5XDlSHgjJRQACzgwLzR172oGqZ
 VLcJIAsy8KeduJ2nS9dnpOJ4qcriUOaTvinpakPLeyaLNzo/a39H0Vu+W7MrQCGJBm
 iJ1q2zGP8jljggJYLpp+ORzWin5KW3y/08v+aTx7xXCSKIakZEVUufTnGpwvNrDhPU
 RNpDGGrEz+I1lwN5Tsq4FhleJICT9jJuj3ycgMgPJVrFxq3tAHJBWsAS+5A6jUFpEl
 x0T6c6X/szCxvnbWY0HTGtFE2lF5I7Ow3czmvwkmWhcCdoIXU8rmQPMHEdOmNH1Dpp
 8TyVnPihuq3WA==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 8CACB2E813C
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:21:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Aug 2021 07:11:37 -0000
From: Thomas Huth <1620660@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: nicholasbishop pmaydell th-huth
X-Launchpad-Bug-Reporter: Nicholas Bishop (nicholasbishop)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20160906145727.27103.84778.malonedeb@gac.canonical.com>
Message-Id: <162987549906.23433.9879354654360435845.launchpad@soybean.canonical.com>
Subject: [Bug 1620660] Re: man page is missing suboptions for "-display"
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7edb2d45353e030166106ae05838b77ab406edcd"; Instance="production"
X-Launchpad-Hash: d57b760f422ea959128a3efae1cf896cf272c42b
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
Reply-To: Bug 1620660 <1620660@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

** Changed in: qemu
       Status: Expired =3D> Fix Released

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1620660

Title:
  man page is missing suboptions for "-display"

Status in QEMU:
  Fix Released

Bug description:
  Some of the display options have suboptions, for example:

  > -display gtk[,grab_on_hover=3Don|off][,gl=3Don|off]

  None of these suboptions are currently documented in qemu-options.hx
  (checked git@f04ec5a)

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1620660/+subscriptions


