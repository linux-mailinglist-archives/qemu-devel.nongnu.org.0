Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 986824E4349
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 16:43:41 +0100 (CET)
Received: from localhost ([::1]:41366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWgfc-0004Pw-Kc
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 11:43:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nWgeO-0002lq-2f
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 11:42:24 -0400
Received: from [2607:f8b0:4864:20::436] (port=41762
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nWgeM-0001cP-NZ
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 11:42:23 -0400
Received: by mail-pf1-x436.google.com with SMTP id p8so18474122pfh.8
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 08:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Z8AP0uHw1Rv86KjAWyW3L4/MoLXbK4RQ98es20jgisk=;
 b=gurqfqdsy14K7+TNk4Orra0sRmi+o2N2CgMPBdg+Rz5xfmaF6V+aPY4k7/j0B3Bl5X
 /OSHc2kOVyRw1jTJ4gFmnShbUZjNRl4CK63x9itxAWox2P7DPfuOUQGqPVeW7cfo5imS
 SuLTcrEYYSStBJ8aRwiozwIyb3NabQyNcei6uUzgACklJnQ3jEnMnLAylgNOIxJDQONi
 Jdf9GJbGnQ7jZ/E7AcOnomva506uhuFLu42ndCcn+NDqajysYwd6vEVCoGlYLRRU/3S3
 GhUgNrcMi/zgQwQBt16Ry+ipIbb6oBWJSOPPz2YescbTmDDGoqQB+K0ZYNOi13GNzAs1
 n9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z8AP0uHw1Rv86KjAWyW3L4/MoLXbK4RQ98es20jgisk=;
 b=bcEZ5wN+JFq7+aYNCx7cxb1dSbDWRwY2Apv5IfQHGtHlZpIx8vBRcvwjQiHr+gf6xV
 O8sEn9N35R9qOa9h5Jbfz/A1FIfpFxXoBZiPd0QtLsJB+doIFux7hciTI9slToNklj6X
 rk45YUvdXJuYipg2hvgXTnlWOm84ebe7sHoFQ7emM3dr2zoaqeMSSzFDRpwr486TU++k
 OOQ1cJcB9o4xf3wSgVtuSuPGbbJApLkbD4jkvO3vySLbI03lclqhr/r+TRG5D3NfP+sC
 ioWDYkpfCELSbo/E0PNTTW3zKxrNysgArwGAk9qtYMwkywHPO123gDnoayorla916GMU
 owDg==
X-Gm-Message-State: AOAM530zBejXrkZoXP9/zGNAORL4bhBuhfsWCA2NLKfjqsBiFFNZ4xh8
 ztlmupC9Kl8HxsJYa2UsmGsEKgHGgXlU8A==
X-Google-Smtp-Source: ABdhPJyAUhqQBHjBNmMZtqO4eaAWTKuDtPDxdiMaicAwB2I4ueHW2IhjtVyGuzC1bTrqTWdu1bPGKA==
X-Received: by 2002:a63:6446:0:b0:382:6aff:7bff with SMTP id
 y67-20020a636446000000b003826aff7bffmr10637701pgb.318.1647963741356; 
 Tue, 22 Mar 2022 08:42:21 -0700 (PDT)
Received: from pek-vx-bsp2.wrs.com (unknown-176-192.windriver.com.
 [147.11.176.192]) by smtp.gmail.com with ESMTPSA id
 u4-20020a056a00158400b004fa0263cf5dsm24482136pfk.130.2022.03.22.08.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 08:42:20 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Subject: [PATCH 2/2] monitor/misc: Set current_cpu for memory dump
Date: Tue, 22 Mar 2022 23:42:13 +0800
Message-Id: <20220322154213.86475-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220322154213.86475-1-bmeng.cn@gmail.com>
References: <20220322154213.86475-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When accessing the per-CPU register bank of some devices (e.g.: GIC)
from the monitor context, a segfault occurs. This is due to current_cpu
is not set, as the context is not a guest CPU.

Let's set current_cpu before doing the acutal memory dump.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 monitor/misc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/monitor/misc.c b/monitor/misc.c
index b1839cb8ee..228f017b71 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -558,6 +558,7 @@ static void memory_dump(Monitor *mon, int count, int format, int wsize,
         break;
     }
 
+    current_cpu = cs;
     while (len > 0) {
         if (is_physical) {
             monitor_printf(mon, TARGET_FMT_plx ":", addr);
@@ -622,6 +623,7 @@ static void memory_dump(Monitor *mon, int count, int format, int wsize,
         addr += l;
         len -= l;
     }
+    current_cpu = NULL;
 }
 
 static void hmp_memory_dump(Monitor *mon, const QDict *qdict)
-- 
2.25.1


