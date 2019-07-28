Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 933D977E4F
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Jul 2019 08:45:13 +0200 (CEST)
Received: from localhost ([::1]:43780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hrcvg-0005Om-RP
	for lists+qemu-devel@lfdr.de; Sun, 28 Jul 2019 02:45:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42380)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgibson@ozlabs.org>) id 1hrcub-0003xH-NX
 for qemu-devel@nongnu.org; Sun, 28 Jul 2019 02:44:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgibson@ozlabs.org>) id 1hrcua-0000wx-Ku
 for qemu-devel@nongnu.org; Sun, 28 Jul 2019 02:44:05 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:40513 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
 id 1hrcuZ-0000wD-NW; Sun, 28 Jul 2019 02:44:04 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 45xCvz1ZJDz9sBF; Sun, 28 Jul 2019 16:43:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1564296239;
 bh=gsfN9YMBR30Lwl2A8/cY+d4qZIy8SVO57ggWAIp8UlU=;
 h=From:To:Cc:Subject:Date:From;
 b=eJWd+jTIj/83BBzsG75RqQi0D/xOfVnd+DnR+QN8qrD2VK3KZBrb5j1Zxupnj/AFS
 Zj2MZWgjTERswHZjuJ/Ast2ANBbZYvStCRakp9DVBxsZBXDXjcZ4V8DSX0m18QIzSW
 PkqG+YipOEOZ5G4f9C6m8g+DYjyUoG+s1R1UYuDQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Date: Sun, 28 Jul 2019 16:43:53 +1000
Message-Id: <20190728064355.2605-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
Subject: [Qemu-devel] [PULL 0/2] ppc-for-4.1 queue 20190728
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: aik@ozlabs.ru, qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit fff3159900d2b95613a9cb75fc3703e67a6747=
29:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-201=
90726' into staging (2019-07-26 16:23:07 +0100)

are available in the Git repository at:

  git://github.com/dgibson/qemu.git tags/ppc-for-4.1-20190728

for you to fetch changes up to 8d216d8c5370495fc416bb8ac573299779867aad:

  xics/kvm: Fix fallback to emulated XICS (2019-07-28 11:50:26 +1000)

----------------------------------------------------------------
ppc patch queue (for 4.1) 2019-07-28

Here's a pull request for qemu-4.1, which I hope will be the last from
the ppc tree.  This applies a couple of last minute fixes for the XIVE
code.

----------------------------------------------------------------
Greg Kurz (2):
      spapr/irq: Inform the user when falling back to emulated IC
      xics/kvm: Fix fallback to emulated XICS

 hw/intc/xics_kvm.c | 11 -----------
 hw/ppc/spapr_irq.c |  1 +
 2 files changed, 1 insertion(+), 11 deletions(-)

