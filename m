Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9170669CCF
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:48:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMGZ-0001s0-Sc; Fri, 13 Jan 2023 10:46:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMGX-0001rF-QK
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:46:49 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMGW-0006CN-0h
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:46:49 -0500
Received: by mail-wr1-x42f.google.com with SMTP id bk16so21432317wrb.11
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UbzdZb+OzerP2cRuuXtHruzXTN86VcNwiX22MbAg0J0=;
 b=m8mUDO0QIXanTl48+f6oFRQmAl2odzqX4xd7eCWIcFOmK3KnAsvBq4vX9ve4pcAss+
 YyciNvvnN54s0kHCt7gllC1niX0dODanS2Gk9FrfnM8E7spq1F0HSyhkCb1ZgJj00u/Q
 fEi4vUORMGT73Rc3Jw3JT04R0TKrhAwxUtlbb8UkP6Ec2tQ8loQ0QH+Bbxr+KZ5rG9WT
 hu8bAQzATl91kpAiZQTBlq6eGZrjq+q+Bw5miqoXejNZFaxhCPDHgupEBNmeQ2tfPmil
 2fpgCFFY0uLGF3enfWsFfHtPhj4yk0WbwvqCYWsKx4qFo6IuOLYyDi5DilChyFgH8/gy
 hbzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UbzdZb+OzerP2cRuuXtHruzXTN86VcNwiX22MbAg0J0=;
 b=DXKboUxR2UeI1yd0vO+vaY3OV9u3jV7GKzc4dAZ9ZwDlEdQ0RETKNJyVBkQXGyspxs
 MBt4N1SGhbusMieUz4lB6v8nDxSGrzflvGWg8PyD5FIymHE+oPBBa3k9GtFmZmUzBGBi
 sgKpJOPhQCv5IkzI2KHnnWGnl2x3r96rblYcbSINbANraWT/xF5HJ4K0AG73o2MGkLX0
 bwQftK+tOv01wmtoUkb1bPJZZri+zp9Xul7oa3zhkZr6gVObOizEQ7T8jCf36iJSHvEF
 4yVoC0TcB8yJ274gXAU0WSRXp3v3518KXwZHHWvloGJOiEZaBSGaOys70i7Id8lTRicD
 IPxQ==
X-Gm-Message-State: AFqh2krDRfLFByTcb6z9L3fkzzBXbbXGIDg57MqZWh1F1asO5Cxnzjpj
 pUvNUerO7EEn2WSC+xQF4E5UE401WyYDlsWB
X-Google-Smtp-Source: AMrXdXuA3T1KZ4f2K35mYgB5nnYLIS5kbUCLBwOEoDiHC/sBSQH/trxhNuq6uKrHQDFwfoqYXQEK7w==
X-Received: by 2002:a5d:640c:0:b0:29f:7c0c:5a46 with SMTP id
 z12-20020a5d640c000000b0029f7c0c5a46mr26091107wru.68.1673624806296; 
 Fri, 13 Jan 2023 07:46:46 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n6-20020adfe786000000b002bdbde1d3absm9021406wrm.78.2023.01.13.07.46.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:46:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 15/46] hw/mips/bootloader: Implement nanoMIPS SW opcode
 generator
Date: Fri, 13 Jan 2023 16:45:01 +0100
Message-Id: <20230113154532.49979-16-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221211204533.85359-4-philmd@linaro.org>
---
 hw/mips/bootloader.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
index 0035f37335..3e1e73360f 100644
--- a/hw/mips/bootloader.c
+++ b/hw/mips/bootloader.c
@@ -143,9 +143,27 @@ static void bl_gen_ori(void **p, bl_reg rt, bl_reg rs, uint16_t imm)
     bl_gen_i_type(p, 0x0d, rs, rt, imm);
 }
 
+static void bl_gen_sw_nm(void **ptr, bl_reg rt, uint8_t rs, uint16_t ofs12)
+{
+    uint32_t insn = 0;
+
+    assert(extract32(ofs12, 0, 12) == ofs12);
+    insn = deposit32(insn, 26, 6, 0b100001);
+    insn = deposit32(insn, 21, 5, rt);
+    insn = deposit32(insn, 16, 5, rs);
+    insn = deposit32(insn, 12, 4, 0b1001);
+    insn = deposit32(insn, 0, 12, ofs12);
+
+    st_nm32_p(ptr, insn);
+}
+
 static void bl_gen_sw(void **p, bl_reg rt, uint8_t base, uint16_t offset)
 {
-    bl_gen_i_type(p, 0x2b, base, rt, offset);
+    if (bootcpu_supports_isa(ISA_NANOMIPS32)) {
+        bl_gen_sw_nm(p, rt, base, offset);
+    } else {
+        bl_gen_i_type(p, 0x2b, base, rt, offset);
+    }
 }
 
 static void bl_gen_sd(void **p, bl_reg rt, uint8_t base, uint16_t offset)
-- 
2.38.1


