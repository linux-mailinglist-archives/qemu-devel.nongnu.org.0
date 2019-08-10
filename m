Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A898887D6
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Aug 2019 06:15:08 +0200 (CEST)
Received: from localhost ([::1]:34794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hwImZ-00026t-Ny
	for lists+qemu-devel@lfdr.de; Sat, 10 Aug 2019 00:15:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34718)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jan.bobek@gmail.com>) id 1hwIkq-0005Tt-9Z
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1hwIkp-0004IH-8j
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:20 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:44991)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1hwIkp-0004Gr-49
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:19 -0400
Received: by mail-ot1-x341.google.com with SMTP id b7so90233506otl.11
 for <qemu-devel@nongnu.org>; Fri, 09 Aug 2019 21:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=asidY1pQnxUGRio46lMssjxV36QIyDmNgONa9nVKDss=;
 b=LCl5bVEMtE0B6Y4Gj0jw/s274sdfq64UcjGjnsDjO40okufyYjWHZVzbqJwMsYcHAa
 XRF4dybGY3zObfca68KGMXrioGBW+60BqGB2szmmfutlxPjwwsl5ANLQZVszu/eFjYYw
 LJwf4kXj5MpOR7anwtVoVmp4p4cIdXGelP7S/SI2Chv87gT6MxLsAXJFgX70fbqr5gdD
 iDlHHFmbcXBY6YFy3STg7DrPYPqTcqMCXyPXeYezmnySPmxCwYGv5zOoP2+jCHmhRjJy
 7s3lBzCj4CF1EiDcmfF9uX+YcsRSw8SPEL8nuinzB5mKIQl/y1ujZq2E8TP+GnHcbxyx
 RhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=asidY1pQnxUGRio46lMssjxV36QIyDmNgONa9nVKDss=;
 b=oAhweOf4AgRuXtY55O9VmmTTlpwN0IBsagcbldcxnMflhD1w0bwX7WStiSQujuxvJi
 i/rkkRWOctvrALiChsq+EIYE3tzqMDB2pb5Aw4mB5E6uprThnpLMTwccUEDB6G1Vsu2H
 GtFK+NlKzOlzQx8Y2kF8hPHU+kTGDLTW+WjfO343jzt1gMpB4FBYPiOT1Lc0UK/Z/F7x
 0LHg+6razQ0fovX3WMwJ9VKOOgzID27Lwo1xDqAy+mAWhNPep3hBvzkB1boFhR03uaxh
 wmszVwki5fyRPAHh0yKWh/FbFQGsD7gj1dovICm/U+/JFXZhRBOwy10oiISwLkVjBzd9
 KBUQ==
X-Gm-Message-State: APjAAAXdu3NnW0UAJGU23TolybMn3by6NnwoH3N9iLa2/pAwiBbkKQBb
 Z6A83mIbjsJzYmD+mf8PlLUR2vJW
X-Google-Smtp-Source: APXvYqwCPo5vFBQ405GNA++InLa/OZHMU/gtpPzpqnDxZQebCRz2pccCVcT2gAw9QNaqdQZSUIyl1g==
X-Received: by 2002:aca:3158:: with SMTP id x85mr7686618oix.93.1565410398398; 
 Fri, 09 Aug 2019 21:13:18 -0700 (PDT)
Received: from dionysus.attlocal.net
 (69-222-133-165.lightspeed.tukrga.sbcglobal.net. [69.222.133.165])
 by smtp.gmail.com with ESMTPSA id f84sm33383540oig.43.2019.08.09.21.13.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 21:13:18 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 Aug 2019 00:12:27 -0400
Message-Id: <20190810041255.6820-12-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190810041255.6820-1-jan.bobek@gmail.com>
References: <20190810041255.6820-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: [Qemu-devel] [RFC PATCH v2 11/39] target/i386: introduce gen_(ld,
 st)d_env_A0
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
Cc: Jan Bobek <jan.bobek@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similar in spirit to the already present gen_(ld,st)(q,o)_env_A0, it
will prove useful in later commits for smaller-sized vector loads.

Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
---
 target/i386/translate.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index c5ec309fe2..258351fce3 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -2652,6 +2652,18 @@ static void gen_jmp(DisasContext *s, target_ulong eip)
     gen_jmp_tb(s, eip, 0);
 }
 
+static inline void gen_ldd_env_A0(DisasContext *s, int offset)
+{
+    tcg_gen_qemu_ld_i32(s->tmp2_i32, s->A0, s->mem_index, MO_LEUL);
+    tcg_gen_st_i32(s->tmp2_i32, cpu_env, offset);
+}
+
+static inline void gen_std_env_A0(DisasContext *s, int offset)
+{
+    tcg_gen_ld_i32(s->tmp2_i32, cpu_env, offset);
+    tcg_gen_qemu_st_i32(s->tmp2_i32, s->A0, s->mem_index, MO_LEUL);
+}
+
 static inline void gen_ldq_env_A0(DisasContext *s, int offset)
 {
     tcg_gen_qemu_ld_i64(s->tmp1_i64, s->A0, s->mem_index, MO_LEQ);
-- 
2.20.1


