Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5AD2ADE1B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 19:20:14 +0100 (CET)
Received: from localhost ([::1]:36962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcYFZ-00005w-VW
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 13:20:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcYB3-0005iC-F5
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 13:15:34 -0500
Received: from indium.canonical.com ([91.189.90.7]:47674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1kcYB0-0005td-3q
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 13:15:33 -0500
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.86_2 #2 (Debian))
 id 1kcYAy-0002ta-MD
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 18:15:28 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id A70432E8019
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 18:15:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2020 17:57:22 -0000
From: Thomas Huth <1174654@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Incomplete; importance=High;
 assignee=None; 
X-Launchpad-Bug: distribution=ubuntu; sourcepackage=qemu; component=main;
 status=Invalid; importance=High; assignee=None; 
X-Launchpad-Bug-Tags: windows windows-xp
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: bonzini denc716 fgouget hexmode j1n-po5ias-xqt
 jbasila jyrgen katmeef laplandersan serge-hallyn th-huth varacanero
X-Launchpad-Bug-Reporter: Maxim Loparev (laplandersan)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <20130430080722.32341.54160.malonedeb@gac.canonical.com>
Message-Id: <160503104225.17829.4216071628629676015.malone@soybean.canonical.com>
Subject: [Bug 1174654] Re: qemu-system-x86_64 takes 100% CPU after host
 machine resumed from suspend to ram
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="e39939c02bd86af4202bc6e2123a7708215ec8ea"; Instance="production"
X-Launchpad-Hash: cb53222bfd9a6a35fd4e3caae3f1189affd27a15
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 08:35:46
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bug 1174654 <1174654@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project is currently considering to move its bug tracking to anoth=
er system. For this we need to know which bugs are still valid and which co=
uld be closed already. Thus we are setting older bugs to "Incomplete" now.
If you still think this bug report here is valid, then please switch the st=
ate back to "New" within the next 60 days, otherwise this report will be ma=
rked as "Expired". Or mark it as "Fix Released" if the problem has been sol=
ved with a newer version of QEMU already. Thank you and sorry for the incon=
venience.


** Changed in: qemu
       Status: Confirmed =3D> Incomplete

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1174654

Title:
  qemu-system-x86_64 takes 100% CPU after host machine resumed from
  suspend to ram

Status in QEMU:
  Incomplete
Status in qemu package in Ubuntu:
  Invalid

Bug description:
  I have Windows XP SP3  inside qemu VM. All works fine in 12.10. But
  after upgraiding to 13.04 i have to restart the VM each time i
  resuming my host machine, because qemu process starts to take CPU
  cycles and OS inside VM is very slow and sluggish. However it's still
  controllable and could be shutdown by itself.

  According to the taskmgr any active process takes 99% CPU. It's not
  stuck on some single process.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1174654/+subscriptions

