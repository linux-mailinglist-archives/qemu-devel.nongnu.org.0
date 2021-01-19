Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A090F2FB1EE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 07:50:12 +0100 (CET)
Received: from localhost ([::1]:35946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1kqB-0002pT-O4
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 01:50:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l1kQy-0001Wh-J3; Tue, 19 Jan 2021 01:24:08 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:40235 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l1kQs-0000ar-VF; Tue, 19 Jan 2021 01:24:05 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4DKdrb4ZB7z9sxS; Tue, 19 Jan 2021 17:23:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1611037407;
 bh=wG3k4vvD+OJELcn2svuHMUF0VgofMWSORdUpb3pvDjo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ECkS7zKWT2IwnyG8MDazdC6nhhfQCWuWCrhHL81sJkgQDKcndbNluLIseToyRXQYP
 2mJedJpZcp0u7QAURwX51YOroN0DCIz5fYgsAcmhQgOaonM6Z4JSz22MOcn0/rcqA2
 xq9XS81biJ0zO4LmqCLD/C+myZrihLTT7xC2hldg=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 12/13] spapr_rtas.c: fix identation of rtas_ibm_suspend_me()
 args
Date: Tue, 19 Jan 2021 17:23:17 +1100
Message-Id: <20210119062318.13857-13-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119062318.13857-1-david@gibson.dropbear.id.au>
References: <20210119062318.13857-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210114180628.1675603-5-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_rtas.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 513c7a8435..8a79f9c628 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -219,9 +219,9 @@ static void rtas_stop_self(PowerPCCPU *cpu, SpaprMachineState *spapr,
 }
 
 static void rtas_ibm_suspend_me(PowerPCCPU *cpu, SpaprMachineState *spapr,
-                           uint32_t token, uint32_t nargs,
-                           target_ulong args,
-                           uint32_t nret, target_ulong rets)
+                                uint32_t token, uint32_t nargs,
+                                target_ulong args,
+                                uint32_t nret, target_ulong rets)
 {
     CPUState *cs;
 
-- 
2.29.2


