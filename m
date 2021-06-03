Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD70E399C86
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:27:13 +0200 (CEST)
Received: from localhost ([::1]:54724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loih6-000751-Jp
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loicz-0006AW-On; Thu, 03 Jun 2021 04:22:57 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:58953 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loicx-0008Tj-PJ; Thu, 03 Jun 2021 04:22:57 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5l65VJz9sXV; Thu,  3 Jun 2021 18:22:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708555;
 bh=sV1nyvqyCazrSF5zy1tSEA2VCATIJy7QY9YGurieNrk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FkuTtk+npVgS8CWm9y0dSpeQBAEYd9Qe9Ce4t610X1CqZxsHO7bQPRUzTHpAmGLOS
 fdd7Zkwe37WOrfkNmh9tZZkOugxQUNXyKp9BzVpd1l+pv1eIEfFRrR69o0uQof2OFg
 FyneGhBEnlwLiPQMw8bqHaxXf0/jw23mRMaHV/Uc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 10/42] spapr: Remove stale comment about power-saving LPCR bits
Date: Thu,  3 Jun 2021 18:21:59 +1000
Message-Id: <20210603082231.601214-11-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nicholas Piggin <npiggin@gmail.com>

Commit 47a9b551547 ("spapr: Clean up handling of LPCR power-saving exit
bits") moved this logic but did not remove the comment from the
previous location.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Message-Id: <20210526091626.3388262-2-npiggin@gmail.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_rtas.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 03355b4c0a..63d96955c0 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -164,7 +164,6 @@ static void rtas_start_cpu(PowerPCCPU *callcpu, SpaprMachineState *spapr,
     env->msr = (1ULL << MSR_SF) | (1ULL << MSR_ME);
     hreg_compute_hflags(env);
 
-    /* Enable Power-saving mode Exit Cause exceptions for the new CPU */
     lpcr = env->spr[SPR_LPCR];
     if (!pcc->interrupts_big_endian(callcpu)) {
         lpcr |= LPCR_ILE;
-- 
2.31.1


