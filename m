Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE1837775E
	for <lists+qemu-devel@lfdr.de>; Sun,  9 May 2021 17:37:12 +0200 (CEST)
Received: from localhost ([::1]:44232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lflUV-0005mv-Hl
	for lists+qemu-devel@lfdr.de; Sun, 09 May 2021 11:37:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lflSq-0003sw-OM
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:35:28 -0400
Received: from indium.canonical.com ([91.189.90.7]:56876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bounces@canonical.com>)
 id 1lflSp-00082s-1g
 for qemu-devel@nongnu.org; Sun, 09 May 2021 11:35:28 -0400
Received: from loganberry.canonical.com ([91.189.90.37])
 by indium.canonical.com with esmtp (Exim 4.93 #5 (Debian))
 id 1lflSn-0002Nj-FQ
 for <qemu-devel@nongnu.org>; Sun, 09 May 2021 15:35:25 +0000
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id 73C462E8135
 for <qemu-devel@nongnu.org>; Sun,  9 May 2021 15:35:25 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 May 2021 15:28:08 -0000
From: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <1920767@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Invalid; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: ci
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: philmd
X-Launchpad-Bug-Reporter: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
X-Launchpad-Bug-Modifier: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9_=28philmd?=
 =?utf-8?q?=29?=
References: <161641988124.23901.567824159263223382.malonedeb@chaenomeles.canonical.com>
Message-Id: <162057408897.6280.14536106271041563314.malone@gac.canonical.com>
Subject: [Bug 1920767] Re: build-tools-and-docs-debian job waste cycles
 building pointless things
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="dccd804998035922efb3da0a725ecc923e2255f3"; Instance="production"
X-Launchpad-Hash: be05bdc1411bbe892e572433f98ffb368cc7e568
Received-SPF: none client-ip=91.189.90.7; envelope-from=bounces@canonical.com;
 helo=indium.canonical.com
X-Spam_score_int: -66
X-Spam_score: -6.7
X-Spam_bar: ------
X-Spam_report: (-6.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Reply-To: Bug 1920767 <1920767@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an automated cleanup. This bug report has been moved to QEMU's
new bug tracker on gitlab.com and thus gets marked as 'invalid' now.
Please continue with the discussion here:

 https://gitlab.com/qemu-project/qemu/-/issues/229


** Changed in: qemu
       Status: New =3D> Invalid

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #229
   https://gitlab.com/qemu-project/qemu/-/issues/229

-- =

You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1920767

Title:
  build-tools-and-docs-debian job waste cycles building pointless things

Status in QEMU:
  Invalid

Bug description:
  The build-tools-and-docs-debian job waste CI cycles building softfloat:
  https://gitlab.com/qemu-project/qemu/-/jobs/1117005759

  Possible fix suggested on the list:
  https://www.mail-archive.com/qemu-devel@nongnu.org/msg793872.html

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1920767/+subscriptions

