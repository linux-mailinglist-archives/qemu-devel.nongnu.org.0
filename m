Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A54E03E3B4A
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 18:10:23 +0200 (CEST)
Received: from localhost ([::1]:38846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mClNW-0007M0-Nz
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 12:10:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mClMB-0005H3-2a
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 12:08:59 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mClM9-0001EZ-Mh
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 12:08:58 -0400
Received: by mail-wr1-x42a.google.com with SMTP id h14so18006110wrx.10
 for <qemu-devel@nongnu.org>; Sun, 08 Aug 2021 09:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4UKxjg0cT9vcMkWe9T+oshU7X1oj+8I3wVKETV+/f8c=;
 b=GWXwN4KAxKHBRLM9LyV2g61CWPrWvdp33eP9GPz8GqZxJgSYY1WXikw9hLoIBXVGo7
 xDkcsPhpbO7olpeo5QZFguIcoi7XxSgzMZ6Y8ZqF+teGc023Osv743kjTY2jKC7pD3BA
 3b0/VoohT1fA8gdtFY4ZtnAHm2C2dM3lEfgcVs2RD5pttEBLhkgXT4VuCb3LvOEWAZAr
 HIZOLxiu8FZHgfglqV3cx93/y0gg/kXjAzr/yJObyIBRG/Ik4QycE+MmvCXXjM0vt+fA
 /QbCIuOMoekKR2tV8qCYt5/lBvS1+U2bjpfkwO+yvU8dWG1nHs/kihCa5LWWkr4646XX
 SMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4UKxjg0cT9vcMkWe9T+oshU7X1oj+8I3wVKETV+/f8c=;
 b=nJYkU9lZXH0TB4QhIL04sn3KSVgx1PTxm58ITXDzYKcoYUxYgVQdZntJYYXh/b0ac6
 JNvhPhLhF5EsTb7RQy29rML11iGRaNA/smBPp2vTbHF8/SCZEuMpUDPhC+mQbrYYMb0o
 KuQ0/Nmi6ZlbUPqcXwxNVthWHCnjSVn3dPGAl+9oMtvqIbnKWf56V53QxK7MQ4NIFrjM
 gzCtkzh3e6uxu6uzh9IKs8UwSTU9RY3UMLWlFpEH8Qq8udPZSQrbA2TXL/AQSLQj3ujt
 oEZMYcTmT/rxrek6jNdBzmwXmGFkCzX5LvC7ZcKdwGtRh5bzn0Rr2m55mI9kixXGO0pU
 lm0Q==
X-Gm-Message-State: AOAM530synUQZPS+Whkpp5mh5zLACCGWjEYP769GgMQQwW9m/l3TNzVy
 AK0seyB02xmUf7RF7wFxcFm6PVLYnv0=
X-Google-Smtp-Source: ABdhPJyvj4/j9MkKPnvbe7r6zCz/coNvbKEjIJXQj0sFZhclBmhhDvsmXcsIrJEbIvsLSi5Q4By83w==
X-Received: by 2002:a05:6000:1863:: with SMTP id
 d3mr21130543wri.200.1628438935828; 
 Sun, 08 Aug 2021 09:08:55 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 d15sm17682800wri.96.2021.08.08.09.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 09:08:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 2/2] target/mips/mxu: Use tcg_constant_i32()
Date: Sun,  8 Aug 2021 18:08:43 +0200
Message-Id: <20210808160843.84957-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210808160843.84957-1-f4bug@amsat.org>
References: <20210808160843.84957-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Replace uses of tcg_const_i32() with the allocate and free close together.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/mxu_translate.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/mips/tcg/mxu_translate.c b/target/mips/tcg/mxu_translate.c
index f52244e1b2b..85eb7857d36 100644
--- a/target/mips/tcg/mxu_translate.c
+++ b/target/mips/tcg/mxu_translate.c
@@ -1101,7 +1101,7 @@ static void gen_mxu_D16MAX_D16MIN(DisasContext *ctx)
         uint32_t XRx = XRb ? XRb : XRc;
         /* ...and do half-word-wise max/min with one operand 0 */
         TCGv_i32 t0 = tcg_temp_new();
-        TCGv_i32 t1 = tcg_const_i32(0);
+        TCGv_i32 t1 = tcg_constant_i32(0);
 
         /* the left half-word first */
         tcg_gen_andi_i32(t0, mxu_gpr[XRx - 1], 0xFFFF0000);
@@ -1126,7 +1126,6 @@ static void gen_mxu_D16MAX_D16MIN(DisasContext *ctx)
         /* finally update the destination */
         tcg_gen_or_i32(mxu_gpr[XRa - 1], mxu_gpr[XRa - 1], t0);
 
-        tcg_temp_free(t1);
         tcg_temp_free(t0);
     } else if (unlikely(XRb == XRc)) {
         /* both operands same -> just set destination to one of them */
@@ -1198,7 +1197,7 @@ static void gen_mxu_Q8MAX_Q8MIN(DisasContext *ctx)
         uint32_t XRx = XRb ? XRb : XRc;
         /* ...and do byte-wise max/min with one operand 0 */
         TCGv_i32 t0 = tcg_temp_new();
-        TCGv_i32 t1 = tcg_const_i32(0);
+        TCGv_i32 t1 = tcg_constant_i32(0);
         int32_t i;
 
         /* the leftmost byte (byte 3) first */
@@ -1227,7 +1226,6 @@ static void gen_mxu_Q8MAX_Q8MIN(DisasContext *ctx)
             tcg_gen_or_i32(mxu_gpr[XRa - 1], mxu_gpr[XRa - 1], t0);
         }
 
-        tcg_temp_free(t1);
         tcg_temp_free(t0);
     } else if (unlikely(XRb == XRc)) {
         /* both operands same -> just set destination to one of them */
-- 
2.31.1


