Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 718AE443B31
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 03:03:16 +0100 (CET)
Received: from localhost ([::1]:46472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi5cR-0007DA-4f
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 22:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mi5aO-000669-Rt
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 22:01:09 -0400
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250]:34942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mi5aJ-0005YB-IN
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 22:01:07 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id C18DA3F86E
 for <qemu-devel@nongnu.org>; Wed,  3 Nov 2021 02:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1635904855;
 bh=FDmKLOWrq7Ta/YhAveOrHckFqKY3bVcO8LRVRmNns0s=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=c/Y3rNZx/1at/om8RhFQmDE/2yj60wyobTJ0ndkmBaj6qVdy/0n5HIIYNwOEQzgsX
 zFgEWfmi7RBTNScvoOR4UxB0c3BjgluA2Cv6uvmJMN8RsVAiJSG0Rn2lV0cCryOHt+
 Jgc8iwD0r9p34JeyCSa8PXnxRH1sY9GjQmaLzXO55hXcdF1fZ99BMPcOZ/RbNgjgWF
 INz0S1qBScwajiS8xoJTfLFTzNSJiDEOOiZ+pfuCu7kNtlJH3D2fh402X4SlFH7Dqy
 BdvYea7jLAmJ6Ze20d0KpIFrFZomJnkzhID3WR8Oeyx2/abZKbwPexVwLc7i7ABHnE
 bjqYKnKA4xnwA==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id D92C22E8189
 for <qemu-devel@nongnu.org>; Wed,  3 Nov 2021 02:00:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Nov 2021 01:51:12 -0000
From: Shi <1903712@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: beihaisuishe-239 berrange janitor tao1992
X-Launchpad-Bug-Reporter: Trudy McClendon (beihaisuishe-239)
X-Launchpad-Bug-Modifier: Shi (tao1992)
References: <160501447454.28833.9213355837708100022.malonedeb@chaenomeles.canonical.com>
Message-Id: <163590427216.21809.15683017458943438647.malone@wampee.canonical.com>
Subject: [Bug 1903712] Re: when ../configure, cannot find Ninjia
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="5c9d2c413ed946c4f70cb1ddd4149326eda16fc5"; Instance="production"
X-Launchpad-Hash: 23e3578ea0600ea97700d05dccdfb8194af2922c
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
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1903712 <1903712@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

1=E3=80=81install re2c=E3=80=82[url=EF=BC=9Ahttp://re2c.org/index.html]
tar -xvzf re2c-1.0.3.tar.gz
    cd re2c-1.0.3/
    autoreconf -i -W all
    ./configure
    make&&make install
2=E3=80=81git clone git://github.com/ninja-build/ninja.git && cd ninja
    ./configure.py --bootstrap
    cp ninja /usr/bin/

[root@aix7 ~]# ninja --version
1.10.2.git

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1903712

Title:
  when ../configure, cannot find Ninjia

Status in QEMU:
  Expired

Bug description:
  On unbuntu18.04, after finishing

  wget https://download.qemu.org/qemu-5.2.0-rc0.tar.xz
  tar xvJf qemu-5.2.0-rc0.tar.xz
  cd qemu-5.2.0-rc0

  when I input

  mkdir build
  cd build
  ../configure

  Return Error:
  cannot find Ninjia

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1903712/+subscriptions


