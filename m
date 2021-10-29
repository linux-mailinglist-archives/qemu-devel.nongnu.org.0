Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC3943F83C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 09:53:00 +0200 (CEST)
Received: from localhost ([::1]:51410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgMh9-0005YD-RO
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 03:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mgMfB-0004o2-ST
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:50:58 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:41720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mgMf9-0005QN-8T
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 03:50:57 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id CBA97402E0
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 07:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1635493846;
 bh=g1y12lKDeOvx+P5ki+hz+uVsWyMM2CBQiABOruv/nB8=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=oqlRe7C3f07JwKDvJr0Jn5mwDoq0mOrweD07L/X135W+zvl5xtzDXAVOjpx1iDV2e
 mlU0mz5shOa/tw4yeb39S+Ewsd7xrCFGy8otO3MVK0xd16Us3T+i5pYMj947WBOkNn
 mDZhT9j8USisqjy7cskP/IKrMmvZqZmtY6c7t/9ClKymgwI9bRz/K7KePm/sQY6eQb
 IL4i9oIYv+VJ31K4uSxG8dxZh9Gw+TkaZeZei49KkD99DYMfiTXVHJEzssXzchtQR3
 M4UbYOCdFTraNspyksedp4Bg6pBHLtMa7jXbskMLcIW20WoDd3KHewNgWFzK+U3zol
 Z+iBjxpkGcS5g==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id EB8AC2E8206
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 07:50:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 Oct 2021 07:41:35 -0000
From: Jose Biosca <1802915@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: gtk ui
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: agentlecomputer cuser2 janitor jbiosca th-huth
X-Launchpad-Bug-Reporter: Chen Zhang (cuser2)
X-Launchpad-Bug-Modifier: Jose Biosca (jbiosca)
References: <154202828346.10437.1411488850787353605.malonedeb@wampee.canonical.com>
Message-Id: <163549329569.23145.16527584327447359664.malone@soybean.canonical.com>
Subject: [Bug 1802915] Re: GTK display refresh rate is throttled
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="0d8de2bfee2024772b3040d4d19f42f47395ac0d"; Instance="production"
X-Launchpad-Hash: 054a96005841beb5146333caca2ae2b41b4820f5
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
Reply-To: Bug 1802915 <1802915@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The bug is still here.

People are simply modifying the code and recompiling.. It only needs to
change the code cap from 30ms (10 years old cap) to 16ms, and we got a
smooth gui capable of gaming.

Please, don't ignore us. Recompiling qemu only for one number is very
annoying.

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1802915

Title:
  GTK display refresh rate is throttled

Status in QEMU:
  Expired

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


