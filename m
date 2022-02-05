Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A698D4AA53D
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 02:09:44 +0100 (CET)
Received: from localhost ([::1]:51952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG9aB-0007Z2-29
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 20:09:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nG9Cl-0004X1-TD
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 19:45:31 -0500
Received: from [2607:f8b0:4864:20::c33] (port=45843
 helo=mail-oo1-xc33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nG9CE-0002nK-Si
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 19:45:00 -0500
Received: by mail-oo1-xc33.google.com with SMTP id
 u25-20020a4ad0d9000000b002e8d4370689so6532380oor.12
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 16:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O+UQgPTWo4oSI1lXL4qP4CNWV5vH/WcWtAOvp8yVUj8=;
 b=w17XdDKF1j0rYLuNdsuG075oPsqjU+JFepUG7YE84E2cbd4gBINzGq1SgKnrcClIzs
 3HH3aUa0T2F+IHo0y5FDAuxidr0b+/V0YleKm8Ukgc/zzxgUjzpm1gyQSEkyTw9quBdk
 eiHBeCmt4Ww8EDzrjiwPmJa4BF6onBCIJEdv+KSA3cj0ba1Onr8h0aQxJ6F087AKvgqj
 VeNfdGRtxNwmgs2Dry/F454sZHam8CD5EtGkypP550Y5rBjxK3t/BKUSDHjeLi5fdqjF
 FnAADby3AyEBf3WXXVyL4pFldgVaWqR0wqfVyzGDhUdGSZG3IOz9jdrSgp3XAR8A5H3t
 WmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O+UQgPTWo4oSI1lXL4qP4CNWV5vH/WcWtAOvp8yVUj8=;
 b=aCXjCLgqTezaXdhJ+yyCNSLZQq/+ULgVoHbxDZT0+CRuUEODHuVkDAsaZDVTj0lncn
 wbIhI2TbPe6/IFOS6w6whrGz20f1i99gidDuF58WWxegaFadp9ROJHQexzAlukU+j7rh
 5E65OPcdsrnmfqj7E9Ep9GuywHm5+z2FZBpV6i/9DJh3l+ppHQQ39qHwk7BZJhFwqXsc
 OdQ5Qd2biOCQn10Zm7YoeALUVNMjHtsIi2jyt0w2iT7Gc6QN1XPDLkYzGkeVQ5p+cHT6
 GOwWs/Z70K2YGH1aZ429EBkBGqGqyu7Q+qi0UuKkIJytudphcl1lcxS7f8NzmNRKel+G
 Ix/w==
X-Gm-Message-State: AOAM532ag3tatNypCS7gJgCXk5Df5nH3MNIsMW3Zv40sEmGSXvFM0mIz
 x7WRcbxw4RXLbAi5vvAlviT0bIf1zO+0C6iv
X-Google-Smtp-Source: ABdhPJxYtxPUmxf0rxfmsjQLVAFLHcgpKjtCDI0MUDmH+L5V5p3+Ct0bjIeEE8q4MvkP2Sczeo2gaA==
X-Received: by 2002:a05:6870:3845:: with SMTP id
 z5mr1380989oal.77.1644021416679; 
 Fri, 04 Feb 2022 16:36:56 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id c22sm1148888oao.43.2022.02.04.16.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 16:36:56 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/6] target/riscv: Add support for mconfigptr
Date: Fri,  4 Feb 2022 16:36:03 -0800
Message-Id: <20220205003605.1150143-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220205003605.1150143-1-atishp@rivosinc.com>
References: <20220205003605.1150143-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=atishp@rivosinc.com; helo=mail-oo1-xc33.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RISC-V privileged specification v1.12 introduced a mconfigptr
which will hold the physical address of a configuration data
structure. As Qemu doesn't have a configuration data structure,
is read as zero which is valid as per the priv spec.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index f96d26399607..89440241632a 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -148,6 +148,7 @@
 #define CSR_MARCHID         0xf12
 #define CSR_MIMPID          0xf13
 #define CSR_MHARTID         0xf14
+#define CSR_MCONFIGPTR      0xf15
 
 /* Machine Trap Setup */
 #define CSR_MSTATUS         0x300
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 25a0df498669..4366e5e95ce8 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3020,6 +3020,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MARCHID]   = { "marchid",   any,   read_zero    },
     [CSR_MIMPID]    = { "mimpid",    any,   read_zero    },
     [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid },
+    [CSR_MCONFIGPTR]   = { "mconfigptr", any, read_zero,
+                                         .min_priv_ver = PRIV_VERSION_1_12_0 },
 
     /* Machine Trap Setup */
     [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,     write_mstatus, NULL,
-- 
2.30.2


