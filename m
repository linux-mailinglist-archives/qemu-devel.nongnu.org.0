Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBC63E4359
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:54:22 +0200 (CEST)
Received: from localhost ([::1]:41202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1zB-0000B7-AU
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mD1va-00019u-PE
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:50:39 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:52432)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mD1vX-00038t-Og
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:50:38 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id A5949405B6
 for <qemu-devel@nongnu.org>; Mon,  9 Aug 2021 09:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1628502632;
 bh=/+DLFIbcFK7PqFIpSUBVhBabAh1HQgMToCNrnZtyntE=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=dm+x3e6hHg+Aq8xMro9nRDfzI6h44oyRQxiZE1pzP37NjfmM/bySHXHMBLQtrptzg
 cHLA6j2dVc0CGwxKhbhu+o52Ep2PdvP6bKfFJPzSN9lMzj5s6gL+EjoTsunI/IvnEq
 ViYnQJIxr5Z6W1Gr3lpHRf8KyJpGCvva8W22CRxJfjy0tX1TG+2XQD3L3+EVWiyENQ
 IDBAzCAqJRLQ6U6fj9sS9V10ohZUl5OwwWmDxfcdsUunmRDHfszhmywz8G1HZXFkzR
 LlCip4xWmMzQTmt+R04n40OUtXVx9D/u87lVL6MaXFi2CHTz0Hbs4Dtx0mMNbvalyZ
 KA3BSrCFiuzgA==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 6563C2E819E
 for <qemu-devel@nongnu.org>; Mon,  9 Aug 2021 09:50:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Aug 2021 09:42:53 -0000
From: Thomas Huth <1939179@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: alterman th-huth
X-Launchpad-Bug-Reporter: Arthur Lyubochenya (alterman)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <162828838699.17021.15925888753867381066.malonedeb@soybean.canonical.com>
Message-Id: <162850217350.14777.5450880833710001212.malone@soybean.canonical.com>
Subject: [Bug 1939179] Re: qemu-ga fsfreeze crashes the kernel
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c08a1e23be9b835a8d0e7a32b2e55270fac05933"; Instance="production"
X-Launchpad-Hash: 17767aefcd75d181c480d12c48f1c3c42d67c50b
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1939179 <1939179@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

https://gitlab.com/qemu-project/qemu/-/issues/520
... thanks!

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #520
   https://gitlab.com/qemu-project/qemu/-/issues/520

** Changed in: qemu
       Status: Incomplete =3D> Invalid

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1939179

Title:
  qemu-ga fsfreeze crashes the kernel

Status in QEMU:
  Invalid

Bug description:
  Hello,

  Still required your attention, duplicate from:
  https://bugs.launchpad.net/bugs/1807073
  https://bugs.launchpad.net/bugs/1813045

  We use mainly Cloudlinux, Debian and Centos.
  We experienced many crashes on our qemu instances based on Cloudlinux dur=
ing a snapshot.
  The issue is not related to CloudLinux directly, but to Qemu agent, which=
 does not freeze the file system(s) correctly. What is actually happening:

  When VM backup is invoked, Qemu agent freezes the file systems, so no sin=
gle change will be made during the backup. But Qemu agent does not respect =
the loop* devices in freezing order (we have checked its sources), which le=
ads to the next situation:
  1) freeze loopback fs
                ---> send async reqs to loopback thread
  2) freeze main fs
  3) loopback thread wakes up and trying to write data to the main fs, whic=
h is still frozen, and this finally leads to the hung task and kernel crash.

  Moreover, a lot of Proxmox users are complaining about the issue as well:
  https://forum.proxmox.com/threads/error-vm-100-qmp-command-guest-fsfreeze=
-thaw-failed-got-timeout.68082/
  https://forum.proxmox.com/threads/problem-with-fsfreeze-freeze-and-qemu-g=
uest-agent.65707/

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1939179/+subscriptions


