Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 921774C0469
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 23:15:16 +0100 (CET)
Received: from localhost ([::1]:50484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMdRD-0004Hg-Jy
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 17:15:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nMdJY-0005lD-GL
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:07:20 -0500
Received: from [2607:f8b0:4864:20::c33] (port=42680
 helo=mail-oo1-xc33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nMdJU-0005LZ-JR
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:07:19 -0500
Received: by mail-oo1-xc33.google.com with SMTP id
 s203-20020a4a3bd4000000b003191c2dcbe8so19648061oos.9
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 14:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3g5GZ+uk3CMbwQHosVUdX40FGxQGNQFTnUC30jSO2R8=;
 b=qTEQtAbukFJZMj15HrOKM9ejlBYxkJjKDZ2W0ycz2OvsK3/i1M0AwzMuSM5jcWjo3M
 1b/mtfND4hAuBBGS67Ba+SCzGZ7nZGaemz++GNu2DzEITRQuojYcsGFhYfj8aDyRfUvm
 3KiPR9CqnsIuTBIh5lZSrcuKKRUsR/m5OYEDYjlWMlfkVIfggjYlK14r7va1C/TjgEdv
 2ngZZtdmaqtkttp6VvOBnv5N9VNbieus7tX1Y2p2Pk5J6BAa59HCbePbntbbsC5Mhwno
 yp4ri17/XLPIJVHv5IY0NkTP9MNGyDnKLJS6Tm6dBreToH2NVKHkOKbgBRpyAnCXazOq
 6C6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3g5GZ+uk3CMbwQHosVUdX40FGxQGNQFTnUC30jSO2R8=;
 b=3xchmVNCfHbvh7gmiSZHmvQTY0LGBbdVsogeF0QorUme6Z+1AvvFg+X9NacIjw2c2p
 2chEguVNrfqs5KTzYMj5t7difjqscjflL35dPE1fMedRttOwcqHhsnKZv9h8F6aI2LXB
 +LxrQPr0N9fqU/cZlKinBM8bZ+Ut6bspsOL2jc2FrKMG7kBZNvnqxTHtHjhhbKIE9skS
 HO/f0WIYVvuMhcqUZ2iK76NT//xj1oiZFVOibdpSaWMmW/I/N4ohdVRmHzzMRXosuZsP
 t6K3B8sCSCEMGt8PN7vMUq+jghxRmPb8qAdjf7JSq+59UZvpatJhlj62Z00IgamHKWWb
 bGlg==
X-Gm-Message-State: AOAM533qeTWt/EH42kaH0JIu7RMqb7bW1Acxqm+RwDOTohGrvMRTM1U2
 44scZAh5xoG58KEWH2sAid6U0FNNg0y5Hw==
X-Google-Smtp-Source: ABdhPJzzGlnsxVoUQHG+JSpuTHen+GjPm2PF4uYBy/8cauAULkQ+kQkabUdWFAs+NfYIjknUUotx3g==
X-Received: by 2002:a05:6870:5d88:b0:d3:112c:3e2e with SMTP id
 fu8-20020a0568705d8800b000d3112c3e2emr2710763oab.230.1645567629482; 
 Tue, 22 Feb 2022 14:07:09 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id n25sm4901913otq.78.2022.02.22.14.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 14:07:09 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/6] target/riscv: Define simpler privileged spec version
 numbering
Date: Tue, 22 Feb 2022 14:06:59 -0800
Message-Id: <20220222220704.2294924-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220222220704.2294924-1-atishp@rivosinc.com>
References: <20220222220704.2294924-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c33;
 envelope-from=atishp@rivosinc.com; helo=mail-oo1-xc33.google.com
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
Cc: qemu-riscv@nongnu.org, Atish Patra <atishp@rivosinc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, the privileged specification version are defined in
a complex manner for no benefit.

Simplify it by changing it to a simple enum based on.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9d24d678e98a..e5ff4c134c86 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -82,8 +82,11 @@ enum {
     RISCV_FEATURE_AIA
 };
 
-#define PRIV_VERSION_1_10_0 0x00011000
-#define PRIV_VERSION_1_11_0 0x00011100
+/* Privileged specification version */
+enum {
+    PRIV_VERSION_1_10_0 = 0,
+    PRIV_VERSION_1_11_0,
+};
 
 #define VEXT_VERSION_1_00_0 0x00010000
 
-- 
2.30.2


