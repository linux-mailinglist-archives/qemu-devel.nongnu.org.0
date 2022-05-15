Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B8D5274DC
	for <lists+qemu-devel@lfdr.de>; Sun, 15 May 2022 03:42:01 +0200 (CEST)
Received: from localhost ([::1]:34006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nq3Gi-0005U9-Ef
	for lists+qemu-devel@lfdr.de; Sat, 14 May 2022 21:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nq3F7-0003K6-IH
 for qemu-devel@nongnu.org; Sat, 14 May 2022 21:40:23 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:33666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1nq3F3-0002hL-PX
 for qemu-devel@nongnu.org; Sat, 14 May 2022 21:40:19 -0400
Received: by mail-pg1-x533.google.com with SMTP id r71so10618718pgr.0
 for <qemu-devel@nongnu.org>; Sat, 14 May 2022 18:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4yG9LUo6ACH0FVGSSXuYuNUnXAuJpS2Sf77zj4LlmBQ=;
 b=myi5+Og2GI3OwpyOmQEqFgQjqjMyJjNCYq3aDNYkqVvt99+kJkMZ4ql7vBkERAS22y
 Ma/f90m+VhVvG7EQLySb3gYvp4iybPQUsUmr+BNkRJ1erlSD5Uush9S+Aj3pc+diMOyT
 OCXe+bncuE+9Bme7jSpVNPLLQjlJfo4pvR/xTgJBdDUQkPPFz6lLzA/wSsuDHQ2NL3fj
 P79FPtPHzFwjqAttmUNwJVM8pYR5rwWGSgio8sm+6aJYuiYPJ/sNzPqNhXIdiqlWzKpm
 kfI+LMdCmkDTxpHXRBAaDjbDRTC4z9czOM71H+lOWlIK/9B1LkMnyidytP8De/i1Gd/A
 ZWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4yG9LUo6ACH0FVGSSXuYuNUnXAuJpS2Sf77zj4LlmBQ=;
 b=WSwAEof8soNEIdhy7kmPzHee/m12hYqS/+iVUCJE3ogPq3A+Jb6ZDlm9ipyPET+iec
 /ge4qiMrTYj82liXntvJ157Peh91ZBwm/XGwMVBRDHTitY6nLdAEf4egFRrjjIRXYuks
 D/CAcxYpdQEP6UeWI503C3GxJOfq0fCrtVYCffHa2+B+H4GuNGybuGF033PQzHOr5Pw+
 fYON8vu6woYyC9n1pyJ9UGNvhLP8mG5CgFcZsXi1Bpb8XEtSy9t6/9SgA9xTKvw2hl8P
 5oLLszsWDFChc1YnmORV/GMxnkEWeiXB2CFb6ywJ9mQa/Te6MQCHqAgXJ8AMZaQXTGx/
 wY2A==
X-Gm-Message-State: AOAM532fhpJw8PmhY9cwUD0B+fIr1kykg2OQ+Khp3UR/HqDtOLQzN0YS
 smhsy83x1P64p8q9EgiRu4cfeizmz5Y=
X-Google-Smtp-Source: ABdhPJwAHE2XEH06GA78Ysn8v38JzzGSMznZSpSMfGHF3TcRzcOa+NKoeAdTSWh720tG+umoMAJClQ==
X-Received: by 2002:a05:6a00:1903:b0:4fa:fa9e:42e6 with SMTP id
 y3-20020a056a00190300b004fafa9e42e6mr11303108pfi.1.1652578816046; 
 Sat, 14 May 2022 18:40:16 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a1709029a8c00b0015e8d4eb2b7sm4214388plp.257.2022.05.14.18.40.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 18:40:15 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Stafford Horne <shorne@gmail.com>,
 Jia Liu <proljc@gmail.com>
Subject: [PULL 3/4] hw/openrisc: use right OMPIC size variable
Date: Sun, 15 May 2022 10:39:47 +0900
Message-Id: <20220515013948.2993495-4-shorne@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220515013948.2993495-1-shorne@gmail.com>
References: <20220515013948.2993495-1-shorne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=shorne@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

This appears to be a copy and paste error. The UART size was used
instead of the much smaller OMPIC size. But actually that smaller OMPIC
size is wrong too and doesn't allow the IPI to work in Linux. So set it
to the old value.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
[smh:Updated OR1KSIM_OMPIC size to use OR1KSIM_CPUS_MAX]
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 hw/openrisc/openrisc_sim.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index 6873124f74..35adce17ac 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -82,7 +82,7 @@ static const struct MemmapEntry {
     [OR1KSIM_DRAM] =      { 0x00000000,          0 },
     [OR1KSIM_UART] =      { 0x90000000,      0x100 },
     [OR1KSIM_ETHOC] =     { 0x92000000,      0x800 },
-    [OR1KSIM_OMPIC] =     { 0x98000000,         16 },
+    [OR1KSIM_OMPIC] =     { 0x98000000, OR1KSIM_CPUS_MAX * 8 },
 };
 
 static struct openrisc_boot_info {
@@ -418,7 +418,7 @@ static void openrisc_sim_init(MachineState *machine)
 
     if (smp_cpus > 1) {
         openrisc_sim_ompic_init(state, or1ksim_memmap[OR1KSIM_OMPIC].base,
-                                or1ksim_memmap[OR1KSIM_UART].size,
+                                or1ksim_memmap[OR1KSIM_OMPIC].size,
                                 smp_cpus, cpus, OR1KSIM_OMPIC_IRQ);
     }
 
-- 
2.31.1


