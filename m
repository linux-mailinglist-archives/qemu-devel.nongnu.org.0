Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F634A9E5F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 18:53:53 +0100 (CET)
Received: from localhost ([::1]:44146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG2mO-00015P-DD
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 12:53:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2gT-000464-Qr
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 12:47:45 -0500
Received: from [2a00:1450:4864:20::429] (port=42720
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nG2gS-0003nV-B1
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 12:47:45 -0500
Received: by mail-wr1-x429.google.com with SMTP id d15so3947477wrb.9
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 09:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GQXbzJRGCAzi7ppy9JRHchfsyush4KC9W9dGSjxVrXU=;
 b=vficyNrpaMIydVJ5oAUF3g2+4/TaY2UGa7tsxDJKUwE27Pq6BlTaG/V2uCZYpOYEd3
 jqrDKQwUz8tFwz4BASZkSIWRkkjv1ZdJTgpn+uSMXaMdroZfmHt8i7nmtWfaCCjOlsp/
 uoSQPo+juo6bNUqOy+MT6owB/+yIRwDLO2P8WDncK1ca11pwQNr/gBH8bDi/GgwdgG2U
 wgwbw8W4Ou/B1ZQzJmI03f5tBr5QWXRyYcBUubSq5aePFtYE0hkxsdmO1Fy4MzYh1SIM
 6cTLywq5wbcqao22OhYc/+tWf2JgwLA9/bf7rf5dNhpxwnjNz3SYa+v99fsj8JZB1LZI
 wJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GQXbzJRGCAzi7ppy9JRHchfsyush4KC9W9dGSjxVrXU=;
 b=W6mqtWsiPQVLDYcuk3A+1yeIwGqNyuKIdAoJGADBhltj7OKw7XTtJTsv1iffDibNCC
 KNDTaQwoBZ/toVQ4KH/QwEMpf3U+awkumIW6oT9U+ptHJlf6N2TILszQItipwBh8R9xi
 fTnWrvhzOsN+5efnKwlIRLA3StJCtPxLT9EkF+fKRRdscY3HYjQ7/91OCRfNFWydtQwH
 5wfvoS40MTolr18ZkjyKb9S1hIP28NwIFYek6EQdCjA5OhgnK61wLkCJDrFhUBwGh1wk
 5iCs5k6QUzW0etREO75BdXi6GFSgtbnQxRKN6FYCztJ8khGbyIUUw/NmPSt8AZqaFM+Q
 KOPw==
X-Gm-Message-State: AOAM533i9I6aPfHVkYaVno4gaq4an462iIoWSlv0qt9nu4n/3gBjWhMw
 xJRBFW2qyTBrn12SbrfOW3EdrZ315GICkA==
X-Google-Smtp-Source: ABdhPJyDQK6wibqWfv2U2aVY36pV62p+D+LFjisYJFaTxGMfdmpO2xHIqGky1DIRVSDERKMceQgOBQ==
X-Received: by 2002:a5d:6409:: with SMTP id z9mr3347169wru.587.1643996863038; 
 Fri, 04 Feb 2022 09:47:43 -0800 (PST)
Received: from localhost.localdomain ([122.167.157.188])
 by smtp.gmail.com with ESMTPSA id f13sm11381876wmq.29.2022.02.04.09.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 09:47:42 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Subject: [PATCH v9 06/23] target/riscv: Add AIA cpu feature
Date: Fri,  4 Feb 2022 23:16:42 +0530
Message-Id: <20220204174700.534953-7-anup@brainfault.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220204174700.534953-1-anup@brainfault.org>
References: <20220204174700.534953-1-anup@brainfault.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::429;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Anup Patel <anup@brainfault.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@atishpatra.org>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anup Patel <anup.patel@wdc.com>

We define a CPU feature for AIA CSR support in RISC-V CPUs which
can be set by machine/device emulation. The RISC-V CSR emulation
will also check this feature for emulating AIA CSRs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/cpu.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 283a3cda4b..8838c61ae4 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -78,7 +78,8 @@ enum {
     RISCV_FEATURE_MMU,
     RISCV_FEATURE_PMP,
     RISCV_FEATURE_EPMP,
-    RISCV_FEATURE_MISA
+    RISCV_FEATURE_MISA,
+    RISCV_FEATURE_AIA
 };
 
 #define PRIV_VERSION_1_10_0 0x00011000
-- 
2.25.1


