Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CF042225B
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 11:33:35 +0200 (CEST)
Received: from localhost ([::1]:46434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXgpJ-0001DK-Op
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 05:33:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mXgmt-0000Hd-3q
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 05:31:03 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:43328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mXgmp-0002h1-Fs
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 05:31:01 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id 6365C3F5F3
 for <qemu-devel@nongnu.org>; Tue,  5 Oct 2021 09:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1633426254;
 bh=odkAypL2ezmYlGiDDyhwunZnFlpeMzywHbs6PBRvUzA=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=TXDTFEuvi8f/IE+tgBzNS4quaPORiAKJECPxxwPMSI+5LLFAkUALo17ifD6eQhAzQ
 b+7T33DmCETgUOXj3k3yQMHK/+IVh1lq8B6PXXup0EYKwo5gZ7LcaHjmPvEg4vyxao
 gIbN0Y75tQeRBXwmWfrtlu9d1pQsVul7QyHObVFAdz0V7HjllKcXmbfYPplDYEKazh
 BBsP50BN2rN8CpWj1RpveSa7sbWBuP5NFxk9WojJdBCFBoiMoE0U9Hf64/2nSLY6cB
 58T/0yFWevDv83A3huqE/SVUscYtYrRZo17JeB10QQLIzKULZe9W/JPLGsweyrn2cu
 MvsqlCcL1NV2Q==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 5E8632E816E
 for <qemu-devel@nongnu.org>; Tue,  5 Oct 2021 09:30:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 05 Oct 2021 09:20:36 -0000
From: Waheed <1884169@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Opinion; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: judahh schoenebeck waheedi
X-Launchpad-Bug-Reporter: Judah Holanda Correia Lima (judahh)
X-Launchpad-Bug-Modifier: Waheed (waheedi)
References: <159252498136.16858.459210330047675680.malonedeb@chaenomeles.canonical.com>
Message-Id: <163342563704.17036.4334250264582521461.malone@chaenomeles.canonical.com>
Subject: [Bug 1884169] Re: There is no option group 'fsdev' for OSX
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="d41d323cd49b34518b2141c77ec7b2f852e5f261"; Instance="production"
X-Launchpad-Hash: 60075ee01ed73090e8e6a006e3ae87d4ef4b1c46
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
Reply-To: Bug 1884169 <1884169@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

But actually OS X (macOS) supports 9pfs and it does have its own
AppleVirtIO9PVFS which makes things a bit strange, would not that be a
good workaround, to use the AppleVirtIO9PVFS?

All my best,

Waheed

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1884169

Title:
  There is no option group 'fsdev' for OSX

Status in QEMU:
  Opinion

Bug description:
  When I try to use -fsoption on OSX I receive this error:

  -fsdev local,security_model=3Dmapped,id=3Dfsdev0,path=3Ddevel/dmos-exampl=
e:
  There is no option group 'fsdev'

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1884169/+subscriptions


