Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C30034ED0B8
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 02:10:46 +0200 (CEST)
Received: from localhost ([::1]:53992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZiOj-00062w-Pn
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 20:10:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nZiFy-0004zb-Q9
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 20:01:42 -0400
Received: from [2607:f8b0:4864:20::1036] (port=40677
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nZiFv-0005Tv-Sh
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 20:01:42 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 mp6-20020a17090b190600b001c6841b8a52so1134326pjb.5
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 17:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FauS6aO6ShODF6e0cVTZEoHKUpqRmmNNl9H6Jnv03Iw=;
 b=VV6EaXqkliYzdOrAiV1RrwpbdzMKj8tQDwjHb78trwQYIsZ4jIeAdI5No8MwsYxA8b
 J5tEpN0k+SDGc1XpTXIA7nP42vd2G+K9cP41NbB/54GBusQFjm3WdeEeWpOcY9H9l45B
 jWp6E28qrAuba7F1+BbRD/ogpzG02zKGSW2NEwI/pjV2E0RxJaJ+PTwPY41GYxa9foO9
 aGK2vvQpVm/n7KwPI0jTZqcvDG/jSzkP0tMe/M7GjuKw4WaMeqDUbzYrGIKpH48fh8dE
 tZ39w5nWMljCoPJWpHdKNXTrF4CqjDqj0RgXVcWplBQy6Bs8foFapO5c3x4j16HKqJpd
 F17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FauS6aO6ShODF6e0cVTZEoHKUpqRmmNNl9H6Jnv03Iw=;
 b=ZTFmzOG+xHZP9NJTTLkq1CQ2xMIlvMDfXep6PquD+MZZvM3cKM23g1zNabwvjydVDH
 sGdeXjUDEgPbavN7DfHAEJebOH87fDpVt3+NPtPTlVUO6ta2H/nrp5B1Hl+996z4H7aW
 QW3H1FM93qM0bcrfOV2Uesy6WsNSM8tYiOS66qE8J86wWRjaiOAAWH6jWqkx5kECNZfe
 pBWjHpQPI+nQFbazb/LrychTNEJyLuiLWwVqhoGz3pqDFbW+e4JqsHw+XmhdJHiVvBqy
 ZL0W9drpzgYN+YUJq1nekYDrcSCAX912aBVF3H68rPfKqTOI6t6DpTa/FkbujVKzMmch
 p89Q==
X-Gm-Message-State: AOAM531KaYghnbsjMGUug9YnPjxwzYULTKHgjuttCP8OEBaqZr4vNR2O
 oe9uVaDgjFGdMKU6kC1XOc4JWcXDA5UlCg==
X-Google-Smtp-Source: ABdhPJwMLrJYFbXoo4IJxY5RCHzU/3gF3DNOW4MdNb6kmM6Y5ZJVQ1pFidBXh90Ph0ENLEf7QXWlzw==
X-Received: by 2002:a17:90a:8d85:b0:1b8:a215:e3e4 with SMTP id
 d5-20020a17090a8d8500b001b8a215e3e4mr2630168pjo.175.1648684898256; 
 Wed, 30 Mar 2022 17:01:38 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 ij17-20020a17090af81100b001c67c964d93sm8891669pjb.2.2022.03.30.17.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 17:01:37 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 01/12] target/riscv: Fix PMU CSR predicate function
Date: Wed, 30 Mar 2022 17:01:15 -0700
Message-Id: <20220331000127.2107823-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331000127.2107823-1-atishp@rivosinc.com>
References: <20220331000127.2107823-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Atish Patra <atishp@rivosinc.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Atish Patra <atish.patra@wdc.com>

The predicate function calculates the counter index incorrectly for
hpmcounterx. Fix the counter index to reflect correct CSR number.

Fixes: e39a8320b088 ("target/riscv: Support the Virtual Instruction fault")

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 4934420d6e20..254bab3715b7 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -70,6 +70,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
 #if !defined(CONFIG_USER_ONLY)
     CPUState *cs = env_cpu(env);
     RISCVCPU *cpu = RISCV_CPU(cs);
+    int ctr_index;
 
     if (!cpu->cfg.ext_counters) {
         /* The Counters extensions is not enabled */
@@ -97,8 +98,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
             }
             break;
         case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
-            if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3)) &&
-                get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3))) {
+            ctr_index = csrno - CSR_CYCLE;
+            if (!get_field(env->hcounteren, 1 << ctr_index) &&
+                 get_field(env->mcounteren, 1 << ctr_index)) {
                 return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
             }
             break;
@@ -124,8 +126,9 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
                 }
                 break;
             case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
-                if (!get_field(env->hcounteren, 1 << (csrno - CSR_HPMCOUNTER3H)) &&
-                    get_field(env->mcounteren, 1 << (csrno - CSR_HPMCOUNTER3H))) {
+                ctr_index = csrno - CSR_CYCLEH;
+                if (!get_field(env->hcounteren, 1 << ctr_index) &&
+                     get_field(env->mcounteren, 1 << ctr_index)) {
                     return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
                 }
                 break;
-- 
2.25.1


