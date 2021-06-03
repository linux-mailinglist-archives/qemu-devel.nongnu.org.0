Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A57399CB8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:38:46 +0200 (CEST)
Received: from localhost ([::1]:42360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loisH-0002g0-4D
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loid5-0006bW-N8; Thu, 03 Jun 2021 04:23:03 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:37967 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loid3-00006m-9L; Thu, 03 Jun 2021 04:23:03 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5m3zpZz9ssP; Thu,  3 Jun 2021 18:22:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708556;
 bh=1WCJYZ50Pe+A8r1Fv9ah67jWoC8sPscr5xxPRWW5WPA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EUF086VrqIVfz6Hlj40pQ3EsOLD/qfScV1Bi1Y6PBA/IdHU5nX5CVXDXWGZexVKIh
 B34Emi/BYFtST/pteKl0um4KH2LYHDBYQqcJva1oH613LTNx8zzHVXHH/rKCLYlrGm
 M/SEJKKUFJv+odVecpem6aw50rGzRdCql4hjJmuQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 18/42] monitor: removed cpustats command
Date: Thu,  3 Jun 2021 18:22:07 +1000
Message-Id: <20210603082231.601214-19-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Luis Pires <luis.pires@eldorado.org.br>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>

Since ppc was the last architecture to collect these statistics and
it is currently phasing this collection out, the command that would query
this information is being removed.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
Message-Id: <20210526202104.127910-5-bruno.larsen@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hmp-commands-info.hx | 13 -------------
 monitor/misc.c       | 11 -----------
 2 files changed, 24 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index ab0c7aa5ee..b2347a6aea 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -500,19 +500,6 @@ SRST
     Show the current VM UUID.
 ERST
 
-    {
-        .name       = "cpustats",
-        .args_type  = "",
-        .params     = "",
-        .help       = "show CPU statistics",
-        .cmd        = hmp_info_cpustats,
-    },
-
-SRST
-  ``info cpustats``
-    Show CPU statistics.
-ERST
-
 #if defined(CONFIG_SLIRP)
     {
         .name       = "usernet",
diff --git a/monitor/misc.c b/monitor/misc.c
index f3a393ea59..1539e18557 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -369,17 +369,6 @@ static void hmp_info_history(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void hmp_info_cpustats(Monitor *mon, const QDict *qdict)
-{
-    CPUState *cs = mon_get_cpu(mon);
-
-    if (!cs) {
-        monitor_printf(mon, "No CPU available\n");
-        return;
-    }
-    cpu_dump_statistics(cs, 0);
-}
-
 static void hmp_info_trace_events(Monitor *mon, const QDict *qdict)
 {
     const char *name = qdict_get_try_str(qdict, "name");
-- 
2.31.1


