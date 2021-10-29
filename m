Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 699C4440158
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 19:39:01 +0200 (CEST)
Received: from localhost ([::1]:35998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgVqG-0006jj-HP
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 13:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mgVAM-0008E9-Rd
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:55:45 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:59228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mgVAJ-0006D9-7Y
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:55:42 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 8CA313F8D3
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 16:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1635526535;
 bh=SNP6UcYVDM7k/OUIuoVz7X+RC/XxMrvcgXbyxmLNARo=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=AP0AHEWS2kjt22EoMBlT8ov26jsaGojSPO40p/deJFNTeZAyI32Fh6KCAvXPcMUrn
 TRxtbdlTJgVkIcOQ9mV3Ac4489ksgdr3vJpPD2y8a/K1s56V6zWTBm07Y/MnfIzQFR
 ovKDCjzKhQUnCQ1S6j90w/1YVLNs3Q0rybfvcyXTv5Skware145mdDWXzzMPdDfTb9
 x44PXzQsGdwIXBxvOq0R/WgrCicbpMj0BVOGJM5yX43B7QxRqHSGCR8Gi7u3bdLc5c
 hayWa+88GVF/maLJjmhlD7TTD1/l4rSziBNFnjwiX1evIzyKAgDknIIT+OlPV7ICxp
 mFNjggL3LoZOg==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EA1942E8188
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 16:55:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 Oct 2021 16:49:02 -0000
From: Thomas Huth <1802915@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: gtk ui
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: agentlecomputer cuser2 janitor jbiosca th-huth
X-Launchpad-Bug-Reporter: Chen Zhang (cuser2)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154202828346.10437.1411488850787353605.malonedeb@wampee.canonical.com>
Message-Id: <163552614253.4862.9762683609835707615.malone@gac.canonical.com>
Subject: [Bug 1802915] Re: GTK display refresh rate is throttled
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="0d8de2bfee2024772b3040d4d19f42f47395ac0d"; Instance="production"
X-Launchpad-Hash: 1042276de4c4dd34ed04be604992cde808289b0b
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
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
Reply-To: Bug 1802915 <1802915@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ticket has been re-opened here:

 https://gitlab.com/qemu-project/qemu/-/issues/700

... so let's keep this one here closed, please.

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #700
   https://gitlab.com/qemu-project/qemu/-/issues/700

** Changed in: qemu
       Status: Confirmed =3D> Invalid

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1802915

Title:
  GTK display refresh rate is throttled

Status in QEMU:
  Invalid

Bug description:
  Guest OS running with GL enabled GTK display shows a reduced refresh
  rate, e.g. moving cursor around with iGVT-g DMA Buf.

  Apparently, a default refresh interval GUI_REFRESH_INTERVAL_DEFAULT
  (30ms) is defined in include/ui/console.h, throttling the display
  refresh rate at 33Hz.

  To correct this throttle issue, a shorter interval (16 or 17
  milliseconds) should be applied to display change listener or the
  default value should be modified.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1802915/+subscriptions


