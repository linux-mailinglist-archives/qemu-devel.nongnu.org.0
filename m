Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DAD6F7A7B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:15:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujw5-0001BH-1Y; Thu, 04 May 2023 21:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujvS-00011C-6S
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:59 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujvQ-00086q-AK
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:07:57 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-52c6f8ba7e3so1040759a12.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248871; x=1685840871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ULqMf+DmHpGYNoo8G2xP3dFFiX1NCkBJ2cATdvrFXCY=;
 b=UFpTT5t34Xg5CEAuNdq4XtN+GCTTgBcfGpiyVBwva1i1hA9UsLq+P7BNyyp5NqdoHG
 v6uLEIrH/N+5hm+Jiaar4U0tSdv8YLISPU0uKwd3usLFaU3mPWByL+rJeIypvSeGmBIq
 Eqa2d/UJlniTTDyu+HWeI3x1TDjyzlCp4Enp1SlKjMSTF950ftgfWM91GAzKeWJxU9hb
 0iP6JnvlChy35/Ir4d7ZlH9JWQvqys7cqy+g9kux4kQmZRuqscs4FX2FSHwQcxBm+jNF
 fDaWmyUbXB74L5NzjQX24CtD950TNEKIQfeLYihdmDn59y1EDzoKODtB4QOYV9sDHF+O
 l9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248871; x=1685840871;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ULqMf+DmHpGYNoo8G2xP3dFFiX1NCkBJ2cATdvrFXCY=;
 b=CTl8rTPnee4NmQyk/cLw4hWQ/r3vodLluHFFYJmhUhTLdeN7zQtHlSY7oV/XYOiyhs
 3qYEIt/D6SS3irLHNNCmMurhtf8Oep2DXZ0BOwS3Bxz4Fp8z9srgrUd1hqcNrYFIuqL5
 f4X9ljBZL03nW70fXIEED57e+W0lpxNUclZHkJSzb4xsG6ys6CjyT53METZDj3a78+yC
 8YKDz6rph9IKzPVtxWVF7VgTXyX9o3CsV1QiMHeLVX3p9Mgfykn5AB8mnmWUdOJIWzr8
 DTbk7R6Tg0w9Iss7DQH/45wCdoaWhyygN8VMzsbBjf4sei6zyN5NBnWhFSGQpUUqDClx
 tfzQ==
X-Gm-Message-State: AC+VfDxZNhT+djsjzFO5IkeXjZLQVyf4Ox19sEGWaycZ1oysalHxsvH/
 x6RudDiqGx4sTmFU35Wd1gnzPk+DHIOLlA==
X-Google-Smtp-Source: ACHHUZ6Qh7X9HxiCTNG91udP0O2/421N8g/BcOeX0F15bCrvbB/bfq/zWBDGRf1RsQGv1mSqVYxEbg==
X-Received: by 2002:a17:902:e54b:b0:1a6:9f9b:1327 with SMTP id
 n11-20020a170902e54b00b001a69f9b1327mr6782305plf.45.1683248871524; 
 Thu, 04 May 2023 18:07:51 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:07:50 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 79/89] target/riscv: Merge checks for reserved pte flags
Date: Fri,  5 May 2023 11:02:31 +1000
Message-Id: <20230505010241.21812-80-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Message-Id: <20230325105429.1142530-24-richard.henderson@linaro.org>
Message-Id: <20230412114333.118895-24-richard.henderson@linaro.org>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 9a2b944990..c7c384bae3 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -962,14 +962,14 @@ restart:
         /* Reserved without Svpbmt. */
         return TRANSLATE_FAIL;
     }
-    if ((pte & (PTE_R | PTE_W | PTE_X)) == PTE_W) {
-        /* Reserved leaf PTE flags: PTE_W */
-        return TRANSLATE_FAIL;
-    }
-    if ((pte & (PTE_R | PTE_W | PTE_X)) == (PTE_W | PTE_X)) {
-        /* Reserved leaf PTE flags: PTE_W + PTE_X */
+
+    /* Check for reserved combinations of RWX flags. */
+    switch (pte & (PTE_R | PTE_W | PTE_X)) {
+    case PTE_W:
+    case PTE_W | PTE_X:
         return TRANSLATE_FAIL;
     }
+
     if ((pte & PTE_U) &&
         ((mode != PRV_U) && (!sum || access_type == MMU_INST_FETCH))) {
         /*
-- 
2.40.0


