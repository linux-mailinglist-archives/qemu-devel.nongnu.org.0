Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD5C31B6C6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 10:55:42 +0100 (CET)
Received: from localhost ([::1]:55676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBabV-0005sS-8E
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 04:55:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaYM-0001w8-Bw
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:52:26 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaYI-0008A9-QS
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:52:26 -0500
Received: by mail-wr1-x42f.google.com with SMTP id g6so8075203wrs.11
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 01:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fysyuv0TkI83z1xdjJPJLYIZaN43N5vklLiL8M2DyT0=;
 b=bQ+DI+Zz9+NhTNluiNBzgbblDz6KTh7B3jRDYDFiQ1BRuY64c8Gv++jJmv9i/Up4fN
 6bRujz8mt2NXjfP1ZSO/hO15atONlKRF28n5y1tOKTeT1jG7xcgtM20de7FwqXGd9gg3
 OrUceruGHq1ELDxCjlVn9mUlt/vhNZ75uPJ3zTuVwvHeRpxL0mR00J/ZzPGQ8GbGv/Pm
 pGvoVQbdP8WlqOZphcauKy3MkLaS2R0E7GKnpFxSmFUu6qkxOAx8nijtiLNs5rtIUepl
 J5MnA1dSAribaJEc6zYYiyKA0k7rPP2Tdoy6Vz4/GsfII5d5+9zvPCN3loe6ZicbREKW
 Sdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fysyuv0TkI83z1xdjJPJLYIZaN43N5vklLiL8M2DyT0=;
 b=XgYKsEocPhGOR/qjTC4pa8SHSkh5uGMzCX9OVySVEndDXA4wo8YqZEg2VfIHgN7E4C
 dDyIGDcmx8MgbolbLD703wLU1JJCwYktBqn072+q4LphBIsDHMETt1ADkdDFK+19vY4E
 uBYWrdx5hKET6YDtGlY6EVQ2YXC5ohv3SXDLw5uHkq5MBNeTg9wPSG/YDvLdYkghdXH2
 Qhf/zmFqi6H/y9c+q9SGTxgBu6oFhSRaOuekdtXJgPNJJF8PHjPr0CjD6CRCutYVtTxM
 bKwWfwVd9qOCI0AosEGquwBPEeC4BA9tVcNVtZn2XuRTLjOJ5u5y3fWwVnmjTXzmcRM1
 w8OA==
X-Gm-Message-State: AOAM533lEkdFp5Xv6aiCs+nhyfdNjCsHeZlD7DKqrbPfQ5rfwAw1J1JI
 mMVrZz2lWH4HopmQr7zCUNhyjA==
X-Google-Smtp-Source: ABdhPJyH8Y01w5YoetE6V0ljYS8KJEsyxJsnZ4kNKr6OOrNt38zgy3EOzrsPpG3flndmTW81+EV7Hw==
X-Received: by 2002:a5d:6148:: with SMTP id y8mr17897990wrt.238.1613382740926; 
 Mon, 15 Feb 2021 01:52:20 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e16sm29195786wrt.36.2021.02.15.01.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 01:52:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DF1321FF99;
 Mon, 15 Feb 2021 09:42:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 10/15] target/sh4: Drop use of gdb_get_float32() and ldfl_p()
Date: Mon, 15 Feb 2021 09:42:39 +0000
Message-Id: <20210215094244.12716-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215094244.12716-1-alex.bennee@linaro.org>
References: <20210215094244.12716-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

We used to make a distinction between 'float64'/'float32' types and
the 'uint64_t'/'uint32_t' types, requiring special conversion
operations to go between them.  We've now dropped this distinction as
unnecessary, and the 'float*' types remain primarily for
documentation purposes when used in places like the function
prototypes of TCG helper functions.

This means that there's no need for a special gdb_get_float32()
function to write a float32 value to the GDB protocol buffer; we can
just use gdb_get_reg32().

Similarly, for reading a value out of the GDB buffer into a float32
we can use ldl_p() and need not use ldfl_p().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210208113428.7181-2-peter.maydell@linaro.org>
Message-Id: <20210211122750.22645-11-alex.bennee@linaro.org>

diff --git a/target/sh4/gdbstub.c b/target/sh4/gdbstub.c
index 34ad3ca050..3488f68e32 100644
--- a/target/sh4/gdbstub.c
+++ b/target/sh4/gdbstub.c
@@ -58,9 +58,9 @@ int superh_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
         return gdb_get_regl(mem_buf, env->fpscr);
     case 25 ... 40:
         if (env->fpscr & FPSCR_FR) {
-            return gdb_get_float32(mem_buf, env->fregs[n - 9]);
+            return gdb_get_reg32(mem_buf, env->fregs[n - 9]);
         }
-        return gdb_get_float32(mem_buf, env->fregs[n - 25]);
+        return gdb_get_reg32(mem_buf, env->fregs[n - 25]);
     case 41:
         return gdb_get_regl(mem_buf, env->ssr);
     case 42:
@@ -119,9 +119,9 @@ int superh_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
         break;
     case 25 ... 40:
         if (env->fpscr & FPSCR_FR) {
-            env->fregs[n - 9] = ldfl_p(mem_buf);
+            env->fregs[n - 9] = ldl_p(mem_buf);
         } else {
-            env->fregs[n - 25] = ldfl_p(mem_buf);
+            env->fregs[n - 25] = ldl_p(mem_buf);
         }
         break;
     case 41:
-- 
2.20.1


