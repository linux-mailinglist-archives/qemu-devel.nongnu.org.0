Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 667B036DE08
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:17:22 +0200 (CEST)
Received: from localhost ([::1]:33926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnoP-0002n5-EK
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbncX-0007u8-Gv
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:05:05 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbncV-0005vB-NN
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:05:05 -0400
Received: by mail-wr1-x429.google.com with SMTP id h15so11583121wre.11
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=81mtH9pgmG7PdH3lg91nxUZhPt4Fd55YXcDqmcN5kGI=;
 b=QjfVs81kGXoTnlok0YAqYAHt5jSKXiS6P/RWxr5HCIwMqXSm5sSbHMVsMatc9lDzh/
 TixdjG5eQw+TM/l9ki/EzpkNqC6sVfNOx/V5cBbVg1UYaZuNJhPIPCjdyr1gQHb+Iazp
 x/nRQi7/Huc8YuH+UudFb79ZlbEVJf8JaD/g6tf6PieHiInrLK7HhCqFL52X/jyCUbCJ
 kJL6Z78hUcrpNXBBfm+eNHZIbijG0KaWJRry+4uFv4Y2GVpKLMZ9y6ohkccGeKRwI8I2
 gJr4w/OcOiRFpSQnVTW0sCp6BmgMrgST9sX/G4HsLxAnKJ4vYOgO01mjG8bMwvIN5Yfb
 SYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=81mtH9pgmG7PdH3lg91nxUZhPt4Fd55YXcDqmcN5kGI=;
 b=XYmtFVPNOf2Bg8SvFdE7g/kHwJRE83FYYCD2Xbf0OC6yZcDLTKnY1kpUcTCHQjh0JP
 QumsJ4MFmJaSOBTpnu0hCAhCnRQvKG47g3UJAhln+yW2iXgL4vKEeJKZBZrHqFj7/RsJ
 0FMeFOGoP396bECqyQhVzSI+0b+grERoZWlLNiPRFnP23YltpCnGVpuQaWyyeoexX/fy
 EGhdczhSzz3DUpgPeBtsIXVlhDlnbHGYjZ3Fkhnw8TcW1pSxkSMJyFZeFgKrROdjrzbB
 oBRBIsyxzdqZ3kN5P+nzRmM+HebYcf08BBj6+HZkKY5oPFu+Alb8RvI/qGTjko4iG/cU
 YpHw==
X-Gm-Message-State: AOAM532xjpOx32ggnFlQ/sveHvDOGJVTfBxzYoboTO4qmkK5aGYNfQW1
 xousmUdARbK/f1ySaO4WmnZw4ggkKqHDbw==
X-Google-Smtp-Source: ABdhPJyWZfhniJfRdhXe4VW6ZGJYS2ThKT5rrI5sPRQXg/SMhJAbAB5e9PwGq+XF4aBkIqsST4LxeA==
X-Received: by 2002:a05:6000:18af:: with SMTP id
 b15mr38185828wri.71.1619629502155; 
 Wed, 28 Apr 2021 10:05:02 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id q16sm343815wmj.24.2021.04.28.10.05.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:05:01 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/30] target/mips: Turn printfpr() macro into a proper
 function
Date: Wed, 28 Apr 2021 19:03:47 +0200
Message-Id: <20210428170410.479308-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428170410.479308-1-f4bug@amsat.org>
References: <20210428170410.479308-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Turn printfpr() macro into a proper function: fpu_dump_fpr().

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v4: int -> bool is_fpu64 (rth)
---
 target/mips/cpu.c | 50 ++++++++++++++++++++++-------------------------
 1 file changed, 23 insertions(+), 27 deletions(-)

diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 232f701b836..8f76f4576f4 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -145,33 +145,31 @@ void cpu_mips_store_cause(CPUMIPSState *env, target_ulong val)
 
 #endif /* !CONFIG_USER_ONLY */
 
+static void fpu_dump_fpr(fpr_t *fpr, FILE *f, bool is_fpu64)
+{
+    if (is_fpu64) {
+        qemu_fprintf(f, "w:%08x d:%016" PRIx64 " fd:%13g fs:%13g psu: %13g\n",
+                     fpr->w[FP_ENDIAN_IDX], fpr->d,
+                     (double)fpr->fd,
+                     (double)fpr->fs[FP_ENDIAN_IDX],
+                     (double)fpr->fs[!FP_ENDIAN_IDX]);
+    } else {
+        fpr_t tmp;
+
+        tmp.w[FP_ENDIAN_IDX] = fpr->w[FP_ENDIAN_IDX];
+        tmp.w[!FP_ENDIAN_IDX] = (fpr + 1)->w[FP_ENDIAN_IDX];
+        qemu_fprintf(f, "w:%08x d:%016" PRIx64 " fd:%13g fs:%13g psu:%13g\n",
+                     tmp.w[FP_ENDIAN_IDX], tmp.d,
+                     (double)tmp.fd,
+                     (double)tmp.fs[FP_ENDIAN_IDX],
+                     (double)tmp.fs[!FP_ENDIAN_IDX]);
+    }
+}
+
 static void fpu_dump_state(CPUMIPSState *env, FILE *f, int flags)
 {
     int i;
-    int is_fpu64 = !!(env->hflags & MIPS_HFLAG_F64);
-
-#define printfpr(fp)                                                    \
-    do {                                                                \
-        if (is_fpu64)                                                   \
-            qemu_fprintf(f, "w:%08x d:%016" PRIx64                      \
-                         " fd:%13g fs:%13g psu: %13g\n",                \
-                         (fp)->w[FP_ENDIAN_IDX], (fp)->d,               \
-                         (double)(fp)->fd,                              \
-                         (double)(fp)->fs[FP_ENDIAN_IDX],               \
-                         (double)(fp)->fs[!FP_ENDIAN_IDX]);             \
-        else {                                                          \
-            fpr_t tmp;                                                  \
-            tmp.w[FP_ENDIAN_IDX] = (fp)->w[FP_ENDIAN_IDX];              \
-            tmp.w[!FP_ENDIAN_IDX] = ((fp) + 1)->w[FP_ENDIAN_IDX];       \
-            qemu_fprintf(f, "w:%08x d:%016" PRIx64                      \
-                         " fd:%13g fs:%13g psu:%13g\n",                 \
-                         tmp.w[FP_ENDIAN_IDX], tmp.d,                   \
-                         (double)tmp.fd,                                \
-                         (double)tmp.fs[FP_ENDIAN_IDX],                 \
-                         (double)tmp.fs[!FP_ENDIAN_IDX]);               \
-        }                                                               \
-    } while (0)
-
+    bool is_fpu64 = !!(env->hflags & MIPS_HFLAG_F64);
 
     qemu_fprintf(f,
                  "CP1 FCR0 0x%08x  FCR31 0x%08x  SR.FR %d  fp_status 0x%02x\n",
@@ -179,10 +177,8 @@ static void fpu_dump_state(CPUMIPSState *env, FILE *f, int flags)
                  get_float_exception_flags(&env->active_fpu.fp_status));
     for (i = 0; i < 32; (is_fpu64) ? i++ : (i += 2)) {
         qemu_fprintf(f, "%3s: ", fregnames[i]);
-        printfpr(&env->active_fpu.fpr[i]);
+        fpu_dump_fpr(&env->active_fpu.fpr[i], f, is_fpu64);
     }
-
-#undef printfpr
 }
 
 static void mips_cpu_dump_state(CPUState *cs, FILE *f, int flags)
-- 
2.26.3


