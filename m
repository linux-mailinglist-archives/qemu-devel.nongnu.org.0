Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A71872D1FAE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 01:58:12 +0100 (CET)
Received: from localhost ([::1]:60932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmRKV-0003BE-Oj
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 19:58:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmR1K-0004ZB-Vn
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:38:23 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:34487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmR1I-0001Sz-EG
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 19:38:22 -0500
Received: by mail-ej1-x644.google.com with SMTP id g20so22223544ejb.1
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 16:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VlrFjWtMkM6uUa/WdAt5ZGBwVseuDv9UZLscN2Lc6YE=;
 b=BTbC8sfgwcLErcE9Hgftpej+TdCf0CU7Xd+fKx9k+aNXF/+eqfoMap7579RGKkP+6P
 Vi3Ejna5DpRoseSrKcFya/SmRPRfHKMUuG5U01E+MYE8usNGlpOLXv8sQ/bhgsEnaB1I
 MW+j7dnMN8/03LrWNA1vUK0PIMc4qgBi9W3coF1Hw1kzDd3/eD/KzhyUOGeXnvCMMGSa
 OvIZWgd74s9I3/ckLr3Yzxh15nG6ES77Jqj+iJ/60piaGA3Hps8MoMTJqoCGjV43qju/
 8dHbcHyah3i5XdY6NTUbqRIqdOzMNt+dUs1HNowb1TV8/God8Fe3npTyqBbmh6ZkJwkN
 66kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VlrFjWtMkM6uUa/WdAt5ZGBwVseuDv9UZLscN2Lc6YE=;
 b=szQtzi6FgOrGZJf+Otd7Pl2gTuB4H9nE8DC8qa5s2ObxNn0dUx2Ws53qtQ9nWn9fAj
 TOOudFRxJGUtEu/hDH3i92FiRma16km4BRdmBj4gJoVfKDwTMw/vlYZ+1AbRt4gENCCk
 8aupyGGs1cHQ0+l7pFzCrc/3mk4Eb027K/5ibx08yX6uJAfsiU4pHbgJP6UCLjNA/hmN
 1shxQk7EcDv+T7CdKDH2yUqPM/X/ZLiLbOp/tb7VCeVIEZsbHJJoIqyKZOMTqMoHHSsJ
 +hhvhLeC0bNLgDzorYEY1sK29ebEeIZdNxReI5L9KyRiOVc6TRq9p+35qrW1PPF8L90T
 wLcg==
X-Gm-Message-State: AOAM533ZzNIsL6PQN4IC8e3zDdbFhmKIyMXH8Idi3QqGEP2epesa9u4o
 lt8LH0SpYUW/zHOPXUptC/PAAHmzqb0=
X-Google-Smtp-Source: ABdhPJwCIJGZcoYl8+1xDZoULgzVXnjluO077d61/nE3jbLEV0gRpRVHtJ8udlI5N1u2qZkBLWuhrw==
X-Received: by 2002:a17:906:c244:: with SMTP id
 bl4mr20250819ejb.430.1607387898842; 
 Mon, 07 Dec 2020 16:38:18 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id q4sm11590147ejc.78.2020.12.07.16.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 16:38:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/17] target/mips: Declare gen_msa/_branch() in 'translate.h'
Date: Tue,  8 Dec 2020 01:36:59 +0100
Message-Id: <20201208003702.4088927-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208003702.4088927-1-f4bug@amsat.org>
References: <20201208003702.4088927-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x644.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make gen_msa() and gen_msa_branch() public declarations
so we can keep calling them once extracted from the big
translate.c in the next commit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.h | 2 ++
 target/mips/translate.c | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/mips/translate.h b/target/mips/translate.h
index 765018beeea..c26b0d9155d 100644
--- a/target/mips/translate.h
+++ b/target/mips/translate.h
@@ -82,5 +82,7 @@ extern TCGv bcond;
 
 /* MSA */
 void msa_translate_init(void);
+void gen_msa(DisasContext *ctx);
+void gen_msa_branch(DisasContext *ctx, uint32_t op1);
 
 #endif
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 8b1019506fe..d8553c626f3 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28668,7 +28668,7 @@ static bool gen_msa_BxZ(DisasContext *ctx, int df, int wt, int s16, bool if_not)
     return true;
 }
 
-static void gen_msa_branch(DisasContext *ctx, uint32_t op1)
+void gen_msa_branch(DisasContext *ctx, uint32_t op1)
 {
     uint8_t df = (ctx->opcode >> 21) & 0x3;
     uint8_t wt = (ctx->opcode >> 16) & 0x1f;
@@ -30444,7 +30444,7 @@ static void gen_msa_vec(DisasContext *ctx)
     }
 }
 
-static void gen_msa(DisasContext *ctx)
+void gen_msa(DisasContext *ctx)
 {
     uint32_t opcode = ctx->opcode;
 
-- 
2.26.2


