Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54E85820AA
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 09:05:52 +0200 (CEST)
Received: from localhost ([::1]:48716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGb79-0007V3-RJ
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 03:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oGarG-0002rF-AS
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 02:49:26 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:42893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oGarE-0003E7-93
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 02:49:26 -0400
Received: by mail-pg1-x529.google.com with SMTP id q22so9997052pgt.9
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 23:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ThpLPET2Eini7rQ0D0JXvPWeNVDY+aGeRs+Dr2K+CnQ=;
 b=jwU+pAdFs8r0KYc+UP1g6a+QZdTrnBFHQbT4NlYZ1guCTB60I6TeR4LdtTCsXjeNUz
 BrIFBEAc/El8tKFy30dTzjymhtamoqa67Srajh/jqZVgfZ0pJ35+BOQQGcwoAacVfPTK
 LohTN5HLXU12ewZVP7jaxrk7F72cQUK6J7N4mSB0xVUCV4LFpog54vySNNrIj263PiCj
 MEwWDnJiF65xmRiYtuTyVkIMiokUWV14f96guIN9McffnDYoRgIaJzDJUnXurElQHT3I
 6PcSdoQ9KXss7rJZnpunCvgiRi82kEIci6ur6PD1Fr1/kMe8JSkTGKrK0yX6fEzSa53M
 oTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ThpLPET2Eini7rQ0D0JXvPWeNVDY+aGeRs+Dr2K+CnQ=;
 b=62dloLyA54dSY+o30We0gbbPRP7rz3JVTjtCxx1qAez8dLyiL8UVja2Pl2F0+abw7Q
 dMt31cLBS+uUQ8L8iFpp7smzoEB+IPnitfBaYL2bffn03l69mjptzd1obSbVjPK8GY5/
 VPRIVnWUp37wpjVBJgTQC0pyUpneAFmHLDvVZh+wZPkgUfaHTC8oH0opzIj/sequosiW
 88FRONNkn4XeIlSBFXSxtXOBfGSvRdiKTHnQQ2qLHEG5NXN5OnjFLDYdHX+TLl4sZFPn
 8AaCBzwMi+aCLEY2y3AOiUuLC5ZzzYQFgXgMwGayafCFb68BHWCfHkyasUjlnYnHazsz
 TwQA==
X-Gm-Message-State: AJIora8YobIkDd7OhTw5RQsfS+kmWUi7K9THHTQkzlA2+9h7IypBe9aY
 cIXj5t+x8w/QkSJ8Rz9NUgFl/gJDu7BpFw==
X-Google-Smtp-Source: AGRyM1tmRmR4H1JSay0RMgvUN0/v4t8D4E4gn3CAYSGYMnlLYYewq4Tbq01hWG6pq8JSWAEVn27IaA==
X-Received: by 2002:a65:5789:0:b0:41a:4a7c:635d with SMTP id
 b9-20020a655789000000b0041a4a7c635dmr17184257pgr.60.1658904562899; 
 Tue, 26 Jul 2022 23:49:22 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a170902ab9000b0016d2d2c7df1sm12764851plr.188.2022.07.26.23.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 23:49:22 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atishp@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v11 6/6] target/riscv: Remove additional priv version check
 for mcountinhibit
Date: Tue, 26 Jul 2022 23:49:13 -0700
Message-Id: <20220727064913.1041427-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727064913.1041427-1-atishp@rivosinc.com>
References: <20220727064913.1041427-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x529.google.com
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

With .min_priv_version, additiona priv version check is uncessary
for mcountinhibit read/write functions.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ec6d7f022ad5..eac003d6b950 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -1484,10 +1484,6 @@ static RISCVException write_mtvec(CPURISCVState *env, int csrno,
 static RISCVException read_mcountinhibit(CPURISCVState *env, int csrno,
                                          target_ulong *val)
 {
-    if (env->priv_ver < PRIV_VERSION_1_11_0) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
     *val = env->mcountinhibit;
     return RISCV_EXCP_NONE;
 }
@@ -1498,10 +1494,6 @@ static RISCVException write_mcountinhibit(CPURISCVState *env, int csrno,
     int cidx;
     PMUCTRState *counter;
 
-    if (env->priv_ver < PRIV_VERSION_1_11_0) {
-        return RISCV_EXCP_ILLEGAL_INST;
-    }
-
     env->mcountinhibit = val;
 
     /* Check if any other counter is also monitoring cycles/instructions */
-- 
2.25.1


