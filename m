Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7EA55281A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 01:20:12 +0200 (CEST)
Received: from localhost ([::1]:35568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Qgl-0004Sj-Jj
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 19:20:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1o3Qd2-000106-E6
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 19:16:21 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:34512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1o3Qd0-0006Rw-Eo
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 19:16:20 -0400
Received: by mail-pf1-x436.google.com with SMTP id t21so5223198pfq.1
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 16:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TAAKba7+x9m6ZmYN7qQgrB1GeGr1mMx1ryylIVw9JuI=;
 b=TbnkCYiN3ioBudYlvA0ZIZzNjuxNtFdUDApbFWpPlDW0F5fFMHHF6TPvZkSey4ZImx
 JcjCte0erPL/TmfeI2V8LDAtxQMLmDxnuK4NImP3ArWm2WrLQOsljsk51iNs/VFrDEUc
 WXmib0DCBpoKo1M+3MnKDuCBUOgS1vorfnWI2Q1xcBDvjv/k0T45kPn5t1GyoeL5oAO5
 imX959efGiT5foc6RjAVS/ccpmElBO0PGQyb6Tynm1MxiRwd+dMbLLjX/gX4jkR1r6nc
 vUOJejpE+PT3rhFxjQFKIzDk8hgNklpOog+n0m3Jt7EOAziBYa8iRUYJvXRIjve4dgfg
 jYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TAAKba7+x9m6ZmYN7qQgrB1GeGr1mMx1ryylIVw9JuI=;
 b=NsCsAdn5nWov0euGnIHb5C/C3h1aOcNUFE+1sjuTxqV//Mwh0K6jr++aVbth0UynC8
 d2H68j9XoJ4pQW8b8hQ3YZzJFGE/3aEL2rN7V8Q90BA3KGkfew/Vtl5QdAS+iqYm7Bpt
 JymUSPotMNEAvYyPfsqEwg8Rrl8P+LDSwByWA9Zh4J0w41c1Ed6UjlwVdvjgzyxjZNpZ
 9Ou6foynVB1NrANlb8kTgOpyJOaamLahXhiwR5Ksn85N9XgyJYCxmgPn6CLl0PnQxFzy
 CeGbK/oeBf4GKuW9Ufl7LwWI+qhwL7TQ4AV0utgQPi3HbqNBrOoWGL3fjopuF9Gg5Fmg
 yz/g==
X-Gm-Message-State: AJIora+7KSY3HYEoQAD+6fxlsEeM5ycXd8IO0WMglIkvVSor77bS+k19
 nt/od/Gkk/1otxI8Dhv/CfFSEq4WXkjZqw==
X-Google-Smtp-Source: AGRyM1s3QcYr1wrxfIdSn/23G2IZPhjNZ/S86h5W5hpy1GCEftrVKz8pF1kRtoH0OJdeC/LPUsOACw==
X-Received: by 2002:a05:6a00:179e:b0:518:9e1d:1cbd with SMTP id
 s30-20020a056a00179e00b005189e1d1cbdmr26866526pfg.12.1655766975539; 
 Mon, 20 Jun 2022 16:16:15 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a170902a40200b0015e8d4eb285sm9191008plq.207.2022.06.20.16.16.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 16:16:15 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 frank.chang@sifive.com
Subject: [PATCH v10 02/12] target/riscv: Implement PMU CSR predicate function
 for S-mode
Date: Mon, 20 Jun 2022 16:15:52 -0700
Message-Id: <20220620231603.2547260-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620231603.2547260-1-atishp@rivosinc.com>
References: <20220620231603.2547260-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=atishp@rivosinc.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Atish Patra <atish.patra@wdc.com>

Currently, the predicate function for PMU related CSRs only works if
virtualization is enabled. It also does not check mcounteren bits before
before cycle/minstret/hpmcounterx access.

Support supervisor mode access in the predicate function as well.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 46bd417cc182..58d07c511f98 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -79,6 +79,57 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    if (env->priv == PRV_S) {
+        switch (csrno) {
+        case CSR_CYCLE:
+            if (!get_field(env->mcounteren, COUNTEREN_CY)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_TIME:
+            if (!get_field(env->mcounteren, COUNTEREN_TM)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_INSTRET:
+            if (!get_field(env->mcounteren, COUNTEREN_IR)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
+            ctr_index = csrno - CSR_CYCLE;
+            if (!get_field(env->mcounteren, 1 << ctr_index)) {
+                return RISCV_EXCP_ILLEGAL_INST;
+            }
+            break;
+        }
+        if (riscv_cpu_mxl(env) == MXL_RV32) {
+            switch (csrno) {
+            case CSR_CYCLEH:
+                if (!get_field(env->mcounteren, COUNTEREN_CY)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_TIMEH:
+                if (!get_field(env->mcounteren, COUNTEREN_TM)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_INSTRETH:
+                if (!get_field(env->mcounteren, COUNTEREN_IR)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
+                ctr_index = csrno - CSR_CYCLEH;
+                if (!get_field(env->mcounteren, 1 << ctr_index)) {
+                    return RISCV_EXCP_ILLEGAL_INST;
+                }
+                break;
+            }
+        }
+    }
+
     if (riscv_cpu_virt_enabled(env)) {
         switch (csrno) {
         case CSR_CYCLE:
-- 
2.25.1


