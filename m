Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D52F3D9E19
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 09:09:44 +0200 (CEST)
Received: from localhost ([::1]:53550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m90Ao-0003tn-7K
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 03:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m903F-00045B-1d; Thu, 29 Jul 2021 03:01:53 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:33987 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m9037-0002iM-Ry; Thu, 29 Jul 2021 03:01:52 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Gb1fX2pW3z9sWd; Thu, 29 Jul 2021 17:01:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1627542100;
 bh=+0UCsUI+A1i0J1BHicDFLlgIrnq5euygqhWDA3Ne85g=;
 h=From:To:Cc:Subject:Date:From;
 b=VRlt2CRRYwBPXNTSJ5ZgZ9mBNEiAg7mgtB2H8R7aXmihjOMW5UmIQF7cBi08vYjkE
 rLG/RPDUdHnQ4gRN1U8UHg0mzfy7nPyaaaLR94Dgjqy9oSXZA8Kcej0NlehoTitYeb
 Pna8jPoc2y3EO8EIw0eggev2jYqAI965nnts3xb0=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 0/5] ppc-for-6.1 queue 20210729
Date: Thu, 29 Jul 2021 17:01:30 +1000
Message-Id: <20210729070135.422262-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 groug@kaod.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 69ea12b19a15ae006521cd5cc0f627f27f738746:

  Merge remote-tracking branch 'remotes/armbru/tags/pull-misc-2021-07-27' into staging (2021-07-28 13:32:12 +0100)

are available in the Git repository at:

  https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.1-20210729

for you to fetch changes up to 380e49297c302fdcf8e5d56abdbe07868d3af8d8:

  kvm: ppc: Print meaningful message on KVM_CREATE_VM failure (2021-07-29 10:59:49 +1000)

----------------------------------------------------------------
ppc patch queue 2021-07-29

Here's a small batch of bufixes for the ppc target to go into qemu-6.1.

----------------------------------------------------------------
Alexey Kardashevskiy (1):
      ppc/vof: Fix Coverity issues

BALATON Zoltan (2):
      ppc/pegasos2: Fix spurious warning with -bios
      i2c/smbus_eeprom: Add feature bit to SPD data

Fabiano Rosas (1):
      kvm: ppc: Print meaningful message on KVM_CREATE_VM failure

Matheus Ferst (1):
      target/ppc: Ease L=0 requirement on cmp/cmpi/cmpl/cmpli for ppc32

 accel/kvm/kvm-all.c                        |   6 ++
 hw/i2c/smbus_eeprom.c                      |   2 +-
 hw/ppc/pegasos2.c                          |   2 +-
 hw/ppc/trace-events                        |   4 +-
 hw/ppc/vof.c                               | 139 +++++++++++++++--------------
 include/hw/ppc/vof.h                       |   2 +
 target/ppc/translate/fixedpoint-impl.c.inc |  58 +++++++++++-
 7 files changed, 142 insertions(+), 71 deletions(-)

