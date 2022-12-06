Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0D36449C1
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 17:54:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2bBk-0003St-KS; Tue, 06 Dec 2022 11:53:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1p2bBh-0003Sa-2j
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 11:52:57 -0500
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1p2bBe-0002Ef-Oz
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 11:52:56 -0500
Received: from scripts-1.lp.internal (scripts.lp.internal [10.131.66.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 687CA40A50
 for <qemu-devel@nongnu.org>; Tue,  6 Dec 2022 16:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1670345566;
 bh=G2CTa1TAc880Delz1j/8GBVq6gqvC/0RXfCTrRhMM14=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=fQGn1Y4GxM+wYfWOyMTLL7L83ke+qYy5r0MbJ5mDev1xGAwjJOfELvD81PzZ6Ur3j
 ipNpI+hygFR9OYrFzrOb7AUBZpZy/2N38Ge6exMm0Gv+WN/cUZCcVBucqYacI3ofcd
 9ILu2cc/ZDBD7HeSbbAsdzVzprL0Lp7E50gqYnv6IWqtBVVCpSiTYaV0Q4ozku22Ks
 +76h1iRtnpauAoQ3cceBN0uBMekJ5MijWlZmfdED/5xsCxFn53VtXzJbV+7oszHfq0
 y4mXksT/VUtf5BcRxie6FxAsy/6alw85MtASXdB95myRG8/fWnl4S9Y5zq25QF+1YE
 Vf26sFhCBxdOw==
Received: from
 juju-4112d9-prod-launchpad-manual-servers-36.openstack.prodstack5.lan
 (localhost [127.0.0.1])
 by scripts-1.lp.internal (Postfix) with ESMTP id 84CF04074D
 for <qemu-devel@nongnu.org>; Tue,  6 Dec 2022 16:51:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Dec 2022 16:33:29 -0000
From: Yury Bushmelev <1903470@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: janitor jay7x magicaltux marcandre-lureau
X-Launchpad-Bug-Reporter: =?utf-8?q?Mark_Karpel=C3=A8s_=28magicaltux=29?=
X-Launchpad-Bug-Modifier: Yury Bushmelev (jay7x)
References: <160488704585.18602.6390058369473747228.malonedeb@soybean.canonical.com>
Message-Id: <167034440930.17236.13091371875111086862.malone@gac.canonical.com>
Subject: [Bug 1903470] Re: qemu 5.1.0: Add UNIX socket support for netdev
 socket
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="41e7553f8097ce3a683f90e835708cbe7bf0006c"; Instance="production"
X-Launchpad-Hash: cf5f36acb8208f07f364aecff2f493ae483cbf94
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1903470 <1903470@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

JFYI I miss the ability to use Unix socket right now.. I'm trying to use
vagrant + vagrant-qemu + socket_vmnet on Macbook m1. It'd be MUCH easier
to connect QEMU to the socket_vmnet' Unix socket directly w/o any
wrappers..

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1903470

Title:
  qemu 5.1.0: Add UNIX socket support for netdev socket

Status in QEMU:
  Expired

Bug description:
  Note: this is a feature request.

  qemu has a way to connect instances using a socket:

  -netdev socket,id=3Dstr[,fd=3Dh][,listen=3D[host]:port][,connect=3Dhost:p=
ort]

  This can also be used to connect a qemu instance to something else
  using a socket connection, however there is no authentication or
  security to the connection, so rather than using a port which can be
  accessed by any user on the machine, having the ability to use or
  connect to UNIX sockets would be helpful, and adding this option
  should be fairly trivial.

  UNIX sockets can be found in various parts of qemu (monitor, etc) so I
  believe having this on network would make sense.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1903470/+subscriptions


