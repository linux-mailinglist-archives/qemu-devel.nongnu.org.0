Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E81EB538A2F
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 05:23:04 +0200 (CEST)
Received: from localhost ([::1]:56458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvsTH-0006AI-Jw
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 23:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nvsRS-0004oD-5S
 for qemu-devel@nongnu.org; Mon, 30 May 2022 23:21:10 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:39815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nvsRO-0005Ab-Ew
 for qemu-devel@nongnu.org; Mon, 30 May 2022 23:21:09 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 q12-20020a17090a304c00b001e2d4fb0eb4so1142255pjl.4
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 20:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2XdNrw6jjPQZS1G0m2FflaEfvXHDOD5bt0DVKmeqREg=;
 b=YLER3mHJnjFMQv5b0BAvFJkJeJ18gBTe/D3IN/Fjp0KY94oiboY6ZsxOa90INZj2f+
 9FPAh2MsBrEephaJvMwznHxMSc+v7L+PFJ+Zlnvrxx8SUxUOKeJP8xt6QSE1j3YekMff
 AZsndQ0OMMm5tzzDBxF73EJ8LI6Y6vqKVqZQ9r1qiY35UGN3BsxYvGcP9wej4arMGOQ2
 zuyQl/JLvdy4i05S8ZCaprwx8hfEM97mYDx2Ui7xj4rKO6C9OIsCF9WjpKRvirODoPLd
 cyzYyxXeUvJ21mRQNR76suviYztPogDXk0bT2lgyDXWgpeSl8D6JGFSyB8QMUySR/gzu
 puTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2XdNrw6jjPQZS1G0m2FflaEfvXHDOD5bt0DVKmeqREg=;
 b=uQPnEGgT9Fbvo1R8EQC24s7qLkJgkGp8Gv9Ob8pbqucWkwSEwo4aohtFNuhqfXNxMo
 PqTeZJHuCItTKdvH9eiHT7BwgJBVGhzSJONyqVeb9SHTwHNfuySFATDRsmk3zCmYDRlY
 3njNzOyQtmWnlmU4LLq0XSXclo7mjp4T07NVkbUoo2JvZDtXNBGpUFOBq5+9DwzPyVAo
 9VKvxrCtSNQ1yk3F3W1YAleGj9rheTj5eOBIWihTbRzwDtH6YbWKNctDMfq/nS8bkGao
 56Ne79Vgnr66XgUc1KjSYnZ5kfedME9J09m4HRdvQjXeeQPR9XNEAme+7c9g6ZZnT0ov
 ibTA==
X-Gm-Message-State: AOAM531b4uR0wb5U4a/Ci3WwNTcD5KEHru61YPU+OmoV3Ro5/r+9G6WZ
 wNiKytPwZ82GhM5hiezAjkeXgV0PDbwRdQ==
X-Google-Smtp-Source: ABdhPJwfoMHQN4PdiDDrbs+rB22Dh+iZ5YXGMM2199+wIac5cipJEiXsXIHtZgchmnFDSZvHDjULVg==
X-Received: by 2002:a17:902:8a96:b0:161:d9ca:85c9 with SMTP id
 p22-20020a1709028a9600b00161d9ca85c9mr58047062plo.94.1653967264369; 
 Mon, 30 May 2022 20:21:04 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:b854:be6e:eb63:5d95])
 by smtp.gmail.com with ESMTPSA id
 144-20020a621896000000b0050dc76281ddsm9437275pfy.183.2022.05.30.20.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 20:21:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH] tcg: Add tcg_gen_mov_ptr
Date: Mon, 30 May 2022 20:21:03 -0700
Message-Id: <20220531032103.406203-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Add an interface to perform moves between TCGv_ptr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---

This will be required for target/arm FEAT_SME.

r~

---
 include/tcg/tcg-op.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index b09b8b4a05..209e168305 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -1288,6 +1288,11 @@ static inline void tcg_gen_addi_ptr(TCGv_ptr r, TCGv_ptr a, intptr_t b)
     glue(tcg_gen_addi_,PTR)((NAT)r, (NAT)a, b);
 }
 
+static inline void tcg_gen_mov_ptr(TCGv_ptr d, TCGv_ptr s)
+{
+    glue(tcg_gen_mov_,PTR)((NAT)d, (NAT)s);
+}
+
 static inline void tcg_gen_brcondi_ptr(TCGCond cond, TCGv_ptr a,
                                        intptr_t b, TCGLabel *label)
 {
-- 
2.34.1


