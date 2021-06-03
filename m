Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B372D399C80
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:25:30 +0200 (CEST)
Received: from localhost ([::1]:46122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loifR-0001Ln-PF
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loicv-000679-1F; Thu, 03 Jun 2021 04:22:55 -0400
Received: from ozlabs.org ([203.11.71.1]:60975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loicr-0008Mu-4l; Thu, 03 Jun 2021 04:22:52 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5l36wlz9sW7; Thu,  3 Jun 2021 18:22:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708555;
 bh=NWB1xy/sFRdzmWQdFVAiLtnVWqABzqojU0A/qxH6WcA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H1nez9ZyCaOWi5vPED7i7iiQARGOaui7YDteKi1dixPA9IeBjGTOL9+IHfDWBG7J8
 kdb91oVqJY2DSczO1V8mxP84+ZBMi4c6kpxYndwLH4hp2lrjTd1rNRwspiQUAt1A8s
 M6z5FDz3nAp9rH6OYWFGd4M307/Uuf4ma85XvH7U=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 04/42] target/ppc: removed unnecessary inclusion of
 helper-proto.h
Date: Thu,  3 Jun 2021 18:21:53 +1000
Message-Id: <20210603082231.601214-5-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

These files included helper-proto.h, but didn't use or declare any
helpers, so the #include has been removed

Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210521201759.85475-6-bruno.larsen@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu_init.c    | 1 -
 target/ppc/gdbstub.c     | 1 -
 target/ppc/mmu-hash32.c  | 1 -
 target/ppc/mmu-radix64.c | 1 -
 4 files changed, 4 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 7bdb443114..310dfbd26a 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -43,7 +43,6 @@
 #include "fpu/softfloat.h"
 #include "qapi/qapi-commands-machine-target.h"
 
-#include "exec/helper-proto.h"
 #include "helper_regs.h"
 #include "internal.h"
 #include "spr_tcg.h"
diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
index 9339e7eafe..308b98fc90 100644
--- a/target/ppc/gdbstub.c
+++ b/target/ppc/gdbstub.c
@@ -20,7 +20,6 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/gdbstub.h"
-#include "exec/helper-proto.h"
 #include "internal.h"
 
 static int ppc_gdb_register_len_apple(int n)
diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
index 744a763f44..9f0a497657 100644
--- a/target/ppc/mmu-hash32.c
+++ b/target/ppc/mmu-hash32.c
@@ -21,7 +21,6 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
-#include "exec/helper-proto.h"
 #include "sysemu/kvm.h"
 #include "kvm_ppc.h"
 #include "internal.h"
diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 7972153f23..b6d191c1d8 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -20,7 +20,6 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/exec-all.h"
-#include "exec/helper-proto.h"
 #include "qemu/error-report.h"
 #include "sysemu/kvm.h"
 #include "kvm_ppc.h"
-- 
2.31.1


