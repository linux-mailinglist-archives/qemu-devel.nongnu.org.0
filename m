Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 491273E434A
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:52:12 +0200 (CEST)
Received: from localhost ([::1]:33624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1x5-0003YU-B6
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:52:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mD1vc-0001FA-8s
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:50:40 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:52550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mD1va-0003BV-Ap
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:50:40 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id AEEE740643
 for <qemu-devel@nongnu.org>; Mon,  9 Aug 2021 09:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1628502635;
 bh=qpjPBJMclqY33A/225llJQ/tnvNPbnZLV6FBH2/v2yM=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=YU9j2NEmy49ejUXthOWkNuzHor4iuQ4z8fovel4a05NfzUwlNM61BkrlH+dmcUZ++
 M8XeGf/6vQgdxWkUkVZjwjlBelOPgaKlTd31wKR7ROJwMjQLr687vcSFvSFTgc+4+E
 jqL65RA2m4t2F6DiR0ndE+btonFy/n8Kkmf4eGUFNJDvn0k/bWbvdH8s6+LmNGmWOn
 GyHK4cF4c7PrefS9WpDsO/aXFT2uE0qgbTZiDWVht3O/cxD7WJtTOhKYo0glT/XYRn
 AgSQ6wpyq+cz6MnMOAZEgIkxNA2U2ADfNwqtNx6rmG2efMycowwPC7Zi6hc9nuQPXD
 PSKNCfdUTHr+w==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 92D442E8187
 for <qemu-devel@nongnu.org>; Mon,  9 Aug 2021 09:50:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Aug 2021 09:43:53 -0000
From: Thomas Huth <1813045@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor michele.schillaci th-huth
X-Launchpad-Bug-Reporter: Michele Schillaci (michele.schillaci)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <154826325670.29740.8985180444326228276.malonedeb@soybean.canonical.com>
Message-Id: <162850223325.6656.9395560679307938292.malone@wampee.canonical.com>
Subject: [Bug 1813045] Re: qemu-ga fsfreeze crashes the kernel
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="c08a1e23be9b835a8d0e7a32b2e55270fac05933"; Instance="production"
X-Launchpad-Hash: 57a44a5b18225c044ef29e4cd2d14022557ec5a8
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1813045 <1813045@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

See also https://gitlab.com/qemu-project/qemu/-/issues/520

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #520
   https://gitlab.com/qemu-project/qemu/-/issues/520

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1813045

Title:
  qemu-ga fsfreeze crashes the kernel

Status in QEMU:
  Expired

Bug description:
  We use mainly Cloudlinux, Debian and Centos.
  We experienced many crashes on our qemu instances based on Cloudlinux dur=
ing a snapshot.
  The issue is not related to CloudLinux directly, but to Qemu agent, which=
 does not freeze the file system(s) correctly. What is actually happening:

  When VM backup is invoked, Qemu agent freezes the file systems, so no sin=
gle change will be made during the backup. But Qemu agent does not respect =
the loop* devices in freezing order (we have checked its sources), which le=
ads to the next situation:=20
  1) freeze loopback fs
                ---> send async reqs to loopback thread
  2) freeze main fs
  3) loopback thread wakes up and trying to write data to the main fs, whic=
h is still frozen, and this finally leads to the hung task and kernel crash=
.=20

  I believe this is the culprit:

  /dev/loop0 /tmp ext3 rw,nosuid,noexec,relatime,data=3Dordered 0 0
  /dev/loop0 /var/tmp ext3 rw,nosuid,noexec,relatime,data=3Dordered 0 0

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1813045/+subscriptions


