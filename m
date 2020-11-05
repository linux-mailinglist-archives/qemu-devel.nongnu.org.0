Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EB42A763D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 04:53:12 +0100 (CET)
Received: from localhost ([::1]:41972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kaWKl-0000QG-Qw
	for lists+qemu-devel@lfdr.de; Wed, 04 Nov 2020 22:53:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kaWHO-0005Nu-Tc; Wed, 04 Nov 2020 22:49:42 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:54123 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kaWHL-0003wU-9x; Wed, 04 Nov 2020 22:49:42 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4CRTzb0dJvz9sSs; Thu,  5 Nov 2020 14:49:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1604548171;
 bh=ShwGE9a6j/zaaNG45GqUr/FwKBxuiYtc5xIEfuLi5iU=;
 h=From:To:Cc:Subject:Date:From;
 b=HuyS2VjJ6zUmyat3nmmDAkLnCt3JJiLqG7Gb7U+aNl088ym5tdzzI5tOVUjP+BDRo
 AFP1x3nn1Fnh5ixWME4JZDAoudwVF9kTHneEsVzE34HXjGPaLGXUnB3V8y0ghtDl7+
 XR+zz9BOA0pro2LmWvbSyQQHoLJNcRI6eAha4WqQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 0/3] ppc-for-5.2 patch queue 2020-11-05
Date: Thu,  5 Nov 2020 14:49:16 +1100
Message-Id: <20201105034919.393653-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 3c8c36c9087da957f580a9bb5ebf7814a753d1c6:

  Merge remote-tracking branch 'remotes/kraxel/tags/ui-20201104-pull-request' into staging (2020-11-04 16:52:17 +0000)

are available in the Git repository at:

  https://gitlab.com/dgibson/qemu.git tags/ppc-for-5.2-20201105

for you to fetch changes up to f29b959dc6871c9d8df781d1bedcfaebc76d5565:

  spapr: Convert hpt_prepare_thread() to use qemu_try_memalign() (2020-11-05 12:18:48 +1100)

----------------------------------------------------------------
ppc patch queue for 2020-11-05

A small PR this time, one bugfix, one removal of minor dead code, one
warning suppression.

----------------------------------------------------------------
Chen Qun (1):
      target/ppc/excp_helper: Add a fallthrough for fix compiler warning

Greg Kurz (2):
      spapr: Drop dead code in spapr_reallocate_hpt()
      spapr: Convert hpt_prepare_thread() to use qemu_try_memalign()

 hw/ppc/spapr.c           | 6 ------
 hw/ppc/spapr_hcall.c     | 2 +-
 target/ppc/excp_helper.c | 1 +
 3 files changed, 2 insertions(+), 7 deletions(-)

