Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C5151E0EF
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 23:18:14 +0200 (CEST)
Received: from localhost ([::1]:49236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nn5L3-0008F0-0S
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 17:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dylan@rivosinc.com>)
 id 1nn1GI-0001wP-Qa
 for qemu-devel@nongnu.org; Fri, 06 May 2022 12:57:02 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:41955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dylan@rivosinc.com>)
 id 1nn1GH-0001vw-0W
 for qemu-devel@nongnu.org; Fri, 06 May 2022 12:57:02 -0400
Received: by mail-pl1-x62f.google.com with SMTP id s14so8000668plk.8
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 09:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vjFMwkzOm8q8FQjtwUt5drq44ZnFk8LSmvePpqG7hGo=;
 b=RBL48KIe5TLOpEE0SbvDMiz0lMejxmT/E0jnrXUCOboW+5LRVV2kA+RHdy5Hm8crs+
 TFEtqr9sYbdNOT0w3VJz/3atcZKAsRxEbFwWyoG5rKQkTo4J3V2PbdIX0aKtktERnDRj
 FoAZ1g/LSh/mS8qmyo/+GHGyyHAO6yjaEk7+vAoEOpxcA+NLb0ir4ClCiNG8DtnMMgEz
 /ZkTqWuRzBJCm1/5y0R1/TewoOsl9R4dmS0A+Czb9uMToaK94uyWaX6fuCmnxWNtbPuX
 11wIZGfs5hRhXzdG+4BpZvFjjEga8JqAX25G4lq1VTsdoKe/bkgvGH/HZw9u0UEkq0fl
 gxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vjFMwkzOm8q8FQjtwUt5drq44ZnFk8LSmvePpqG7hGo=;
 b=Dyn/hTT0eA8jtyc4VqkDPPVJu+ZBN2cJjBq9/aCuunNg+wLNIifKmvni/rOguekfhz
 trgak/3TxU/dmQklsbU84u1cVTz7h9xvrWmI5hCEG8TnhQztiprrNHUYdxm62+V9LTuT
 NmMJ3uYdKDvo8CXeJSaDpB6wNzH2vTayBy8EVlgiJX4ni4m/0e/oWhTChcPxx1zRXtmo
 PdVQCU1JVQZcbDLh/Kw1WjmVUQRMc3sXgEG7GyuEwwy3dHeaKf+S3ZMkba0NbIcAQPLW
 Di+XniTtBbNAB7iby978gCIYBrBTwwXsiMSU9KoB/te8m88UkxR2PWpRxrlUOqb5Ln75
 liVg==
X-Gm-Message-State: AOAM533L//bsAU1jCdm6x8Qd0r2+NhYxMimzroEqmefWOb0qRMulTpfA
 OqWaLDh6QF7RCEoU53kkVK6c4/v/sUGxAyMS
X-Google-Smtp-Source: ABdhPJx3sBaI9RFfpc9fGMf2QGMz6Ccotxu08qcB+k+0ZOBTK2ZFDtz5FDynCXUosWStnvGLn8aqCQ==
X-Received: by 2002:a17:903:1cd:b0:15e:8c4a:c543 with SMTP id
 e13-20020a17090301cd00b0015e8c4ac543mr4474146plh.126.1651856219049; 
 Fri, 06 May 2022 09:56:59 -0700 (PDT)
Received: from localhost.localdomain (c-73-222-83-91.hsd1.ca.comcast.net.
 [73.222.83.91]) by smtp.gmail.com with ESMTPSA id
 i13-20020a63584d000000b003c14af50606sm3414719pgm.30.2022.05.06.09.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 09:56:58 -0700 (PDT)
From: Dylan Reid <dylan@rivosinc.com>
X-Google-Original-From: Dylan Reid <dgreid@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 Dylan Reid <dgreid@rivosinc.com>
Subject: [PATCH] target/riscv: Fix VS mode hypervisor CSR access
Date: Fri,  6 May 2022 16:54:57 +0000
Message-Id: <20220506165456.297058-1-dgreid@rivosinc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=dylan@rivosinc.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 06 May 2022 17:16:01 -0400
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

VS mode access to hypervisor CSRs should generate virtual, not illegal,
instruction exceptions.

Don't return early and indicate an illegal instruction exception when
accessing a hypervisor CSR from VS mode. Instead, fall through to the
`hmode` predicate to return the correct virtual instruction exception.

Signed-off-by: Dylan Reid <dgreid@rivosinc.com>
---
 target/riscv/csr.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 3500e07f92..4ea7df02c9 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3141,13 +3141,13 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
 #if !defined(CONFIG_USER_ONLY)
     int effective_priv = env->priv;
 
-    if (riscv_has_ext(env, RVH) &&
-        env->priv == PRV_S &&
-        !riscv_cpu_virt_enabled(env)) {
+    if (riscv_has_ext(env, RVH) && env->priv == PRV_S) {
         /*
-         * We are in S mode without virtualisation, therefore we are in HS Mode.
+         * We are in either HS or VS mode.
          * Add 1 to the effective privledge level to allow us to access the
-         * Hypervisor CSRs.
+         * Hypervisor CSRs. The `hmode` predicate will determine if access
+         * should be allowed(HS) or if a virtual instruction exception should be
+         * raised(VS).
          */
         effective_priv++;
     }
-- 
2.30.2


