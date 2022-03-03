Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44E34CC5AD
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:09:23 +0100 (CET)
Received: from localhost ([::1]:41480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPqpG-0006bg-El
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:09:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPqbK-0007Uo-12
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:54:58 -0500
Received: from [2607:f8b0:4864:20::c2a] (port=37577
 helo=mail-oo1-xc2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPqbI-0001uV-Gg
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:54:57 -0500
Received: by mail-oo1-xc2a.google.com with SMTP id
 x6-20020a4a4106000000b003193022319cso6826464ooa.4
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 10:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/tS8r6MLk9Ys/DbcleIob127V9NYv9KycItEsxaklD8=;
 b=F1JDBHzBMIK0U/4m5qJk6zYTebgB9PELFz3b/qjqaWyFTKZGGH4iSGIZHmEgMdzohG
 N9+ixkBXvjay+mKOn0btsO1kHvA5EpbY8VElnFfznBYnQX8EL+2RqDTWncpOpdqtg4kZ
 naEDI6pSzzpLv4aKkTByKG7Fmsbeg2jHWmlv0+TVnR0CbVNO4MrUoez/R+aPJPM7mBOp
 eSJC8VGbLn+h8hrKiRRGXI5raVCaXOc04IZCd+VMGgU1AkIPG7pAXB7GyM5Q6ueWlUfK
 xezDfjOkaU/r0lGifuqhFGIIKpo7vbY+OR3eMXkA5gwFloqBFIMq+Am3Ye6sgWRMeOYc
 Mkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/tS8r6MLk9Ys/DbcleIob127V9NYv9KycItEsxaklD8=;
 b=lvyO3zxj2Nb17RrufPSpfOl4rEKN7AbHvPqeGgE32hG5OZxrfBEvig0ygaXfFZ4QL0
 0L9iKR/lQASCys+OXb6SkghwEB5CPw+uaqo32Zs9UUffUmOKUex8CTTKunIInQZWFOyL
 GFOYokFVyIJlKbHPhEZWhCpQ9USObAesIrKZJHifzRwpszrkRXABJ0NBMDmtlxyFpgAk
 duULxBGFRMY5l0ILLXfDfP7zfqygjrSeieNp3FIXmyF1SpnS+lmGCvvrtbli6jatIRa0
 jOIPNaH5JgyluG/uUd5O+OmAx6CvMuQpiqm9AQQm2sHG8vvaA4IibAGcAUswV1OF3+WG
 w9JQ==
X-Gm-Message-State: AOAM532D+IeqV0oyZ6Aj+ec6rI7IIWxDBKKbWVtNDtWtEkOep8D7W7oH
 lVrLMt8zgUdmboWNlExA2dwg9vktlLBpXg==
X-Google-Smtp-Source: ABdhPJzGW29hc70GAUKLV3jekc71n2hCm6cz6pwLb1P2FNUYZ0SWjJeKHX23EIGuIE3OAz0rgrl+fw==
X-Received: by 2002:a05:6870:a686:b0:d7:91:e56b with SMTP id
 i6-20020a056870a68600b000d70091e56bmr5169651oam.86.1646333695037; 
 Thu, 03 Mar 2022 10:54:55 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 u24-20020a4ae698000000b0031c286f2e0csm1331052oot.29.2022.03.03.10.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 10:54:54 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 4/6] target/riscv: Add support for mconfigptr
Date: Thu,  3 Mar 2022 10:54:38 -0800
Message-Id: <20220303185440.512391-5-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220303185440.512391-1-atishp@rivosinc.com>
References: <20220303185440.512391-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=atishp@rivosinc.com; helo=mail-oo1-xc2a.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RISC-V privileged specification v1.12 introduced a mconfigptr
which will hold the physical address of a configuration data
structure. As Qemu doesn't have a configuration data structure,
is read as zero which is valid as per the priv spec.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu_bits.h | 1 +
 target/riscv/csr.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 0fe01d7da57f..48d92a81c3ee 100644
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
index ec41a5363f6b..699d72b6c6f1 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3107,6 +3107,8 @@ riscv_csr_operations csr_ops[CSR_TABLE_SIZE] = {
     [CSR_MIMPID]    = { "mimpid",    any,   read_zero    },
     [CSR_MHARTID]   = { "mhartid",   any,   read_mhartid },
 
+    [CSR_MCONFIGPTR]  = { "mconfigptr", any,   read_zero,
+                                        .min_priv_ver = PRIV_VERSION_1_12_0 },
     /* Machine Trap Setup */
     [CSR_MSTATUS]     = { "mstatus",    any,   read_mstatus,     write_mstatus, NULL,
                                                read_mstatus_i128                   },
-- 
2.30.2


