Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4123532224E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 23:44:56 +0100 (CET)
Received: from localhost ([::1]:58652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEJwl-0006fb-Aw
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 17:44:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEJrE-0000sL-7z
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 17:39:12 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:42415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEJrC-0005MZ-VV
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 17:39:12 -0500
Received: by mail-ej1-x62a.google.com with SMTP id lu16so31722265ejb.9
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 14:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KE7Pv3FR29RHJNt2Ewyj6WvD7fKOv1MAXLDq1W60PP8=;
 b=A/MrfTmxZ74Y3a/v338lU+obhWjPBSWfrz5+B4FiPAATAUwRRcltfeuV4/pGwkVfy0
 YIbw/+W8+Cx7KJOZeGRsnF7u4uOV1jupRCjO7DRMbBZNlEGKX9LMOsrKF0mSZ31zgK2d
 j3CZB87L+rNKSgvVnoJauI7wI5jT6h6HrYpg2PGitd+FFZI8R6+jeFt9fMbeUM96zswY
 FloL+yRY19+Wge1tQIH9AueqQ7VHQp7UM1KfqTTTEGrSrURZkYJPks2oZjRIrWetIpAL
 +/uSzQs5UHEEe6iW7Dcv2dSM8pgi8Nm2+UzlIe+fWvVZ7zIhKwh72lC+0FU3cs3oLNQL
 DpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KE7Pv3FR29RHJNt2Ewyj6WvD7fKOv1MAXLDq1W60PP8=;
 b=CEW9zyNvDFzr6ld6HUzfQo7piDlwKtpK8a2r/OllPLiGaz46218z1gLEqBplhhXOUp
 xxPCOk2FPcjzzIeKQe3mL0pwRXvcsC8759SYQ6+IShfdh35B6777MD8ZjjTj+7DCsX5R
 XzbC8o23GzovWZjYHpB0qC/PHLzj2YvC66C1mMkFgZ9iwIpX8Bg3RoTNfzKr8YCHxaZq
 m+HzU4S5gOQDTY8GuRfDnjGRMo7Sa5JNqn1gMprOmmE0KraG7xtm8UhoWCtDuI2hFQQd
 fWOkw4FsG+iXDCkNyvpj6187zxfJVSL9zpXx2KAGBYBP8HAiEuMVy7T3xaiOZm+YGSwX
 nR2w==
X-Gm-Message-State: AOAM530tJuQB7gPlXMuXbEYdJ/rtPPeYs/PGwlp9FuWWU0WRZjxwRoFo
 p8SYoUIYeHsrJtedrI7KR0NZUPtQ5SI=
X-Google-Smtp-Source: ABdhPJzChzvdS3YB8sE1fkJkzHZ/3jk0+shyqB9me3TptSd2YBkebsmNd4UOkJpCAh/lQx71EjYzag==
X-Received: by 2002:a17:906:d8c3:: with SMTP id
 re3mr11717768ejb.82.1614033549316; 
 Mon, 22 Feb 2021 14:39:09 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g10sm10964772ejk.88.2021.02.22.14.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 14:39:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/10] target/mips: Rewrite complex ifdef'ry
Date: Mon, 22 Feb 2021 23:38:52 +0100
Message-Id: <20210222223901.2792336-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210222223901.2792336-1-f4bug@amsat.org>
References: <20210222223901.2792336-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No need for this obfuscated ifdef'ry, KISS.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 70891c37cdd..1f1c5f33c87 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28276,13 +28276,16 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
 #if defined(TARGET_MIPS64)
         if ((ctx->insn_flags & INSN_R5900) && (ctx->insn_flags & ASE_MMI)) {
             decode_mmi(env, ctx);
-#else
+            break;
+        }
+#endif
+#if !defined(TARGET_MIPS64)
         if (ctx->insn_flags & ASE_MXU) {
             decode_opc_mxu(env, ctx);
-#endif
-        } else {
-            decode_opc_special2_legacy(env, ctx);
+            break;
         }
+#endif
+        decode_opc_special2_legacy(env, ctx);
         break;
     case OPC_SPECIAL3:
 #if defined(TARGET_MIPS64)
-- 
2.26.2


