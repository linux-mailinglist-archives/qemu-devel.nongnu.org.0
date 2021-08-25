Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E224E3F705E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 09:26:24 +0200 (CEST)
Received: from localhost ([::1]:55548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInIm-000705-0Y
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 03:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInDP-0001Kt-DZ
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:20:51 -0400
Received: from smtp-relay-services-1.canonical.com ([185.125.188.251]:43366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1mInDL-0008V0-9U
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 03:20:51 -0400
Received: from loganberry.canonical.com (loganberry.canonical.com
 [91.189.90.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-1.canonical.com (Postfix) with ESMTPSA id 1E3293F7C9
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1629876046;
 bh=AC32CFSqZ9oQDF8LY9ETSorjjkM38eRKaoDNEJqKC3E=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=WKM7+ze0tW7yipbK66TB+xhLUHZa85rXz8+dOj3V9WVFe69htMmOTgGXyTK+gfVQB
 1PTmBJFcmML6aHiZl6fYpyMpPKjlWjFvGFsRqVgWrpZTO3xQCuN1wZSvn6yUVRwayf
 pQ3Qxo6AsbxoUqH4IbFB1eFQXAEgFoQi4FFZM9++UokAeDeBkBucowvME/stiYr01F
 VAIFHwHxdWanWwZy4sR2areVaMRA5KlSzJjn30X8rVMQk0BB8r0dTTsDM808dsQzR4
 rNoqetrJ3vUkbK4RgnRvk5xZGahUtW6aaohtBaOiO60ype3lvOrR9VXZCeHs/yMiXb
 qTdotxZsGnZaA==
Received: from loganberry.canonical.com (localhost [127.0.0.1])
 by loganberry.canonical.com (Postfix) with ESMTP id CEF6C2E81A2
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 07:20:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Aug 2021 07:15:08 -0000
From: Thomas Huth <1897568@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Fix Released; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: awik felix.von.s philmd th-huth
X-Launchpad-Bug-Reporter: Albert Wik (awik)
X-Launchpad-Bug-Modifier: Thomas Huth (th-huth)
References: <160129907003.10349.16133652474527618816.malonedeb@chaenomeles.canonical.com>
Message-Id: <162987570904.15762.10262268973580268952.malone@gac.canonical.com>
Subject: [Bug 1897568] Re: Strange keyboard behaviour in Vim editor
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="7edb2d45353e030166106ae05838b77ab406edcd"; Instance="production"
X-Launchpad-Hash: bebae0f66e19094041a078694bc99d3eb6b6e164
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
Reply-To: Bug 1897568 <1897568@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Felix, if you want to discuss the default behaviour, please get in touch wi=
th the author of the patch, since he might not read this bug tracker here.
Anyway, the patch has been released with QEMU 6.1, so I'm closing this tick=
et here now.

** Changed in: qemu
       Status: Fix Committed =3D> Fix Released

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1897568

Title:
  Strange keyboard behaviour in Vim editor

Status in QEMU:
  Fix Released

Bug description:
 =20
  I'm running MS-DOS 7.10 in a QEMU virtual machine, and there is a problem=
 with the keyboard in the Vim editor.  The arrow keys jump over a line, as =
if you had typed the key twice.  PgUp and PgDn are likewise affected.  Othe=
r applications are not affected, unless you shell out from Vim.

  The QEMU version is 5.0.0, and I'm using the "-k sv" option, but I've
  tried without it and it doesn't make a difference.

  I don't get this keyboard behaviour in the exact same VM under VMware
  Player or Bochs.

  -Albert.

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1897568/+subscriptions


