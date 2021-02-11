Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3699318AD1
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:39:32 +0100 (CET)
Received: from localhost ([::1]:49184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABFr-0007QU-MZ
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:39:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAB4t-00037f-DH
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:28:11 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAB4r-0003uR-MU
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:28:11 -0500
Received: by mail-wr1-x42e.google.com with SMTP id l12so4023536wry.2
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GIbE/qLv653vgs2uzn3n69u8JtE57yItTNm6pSzkbH8=;
 b=t1pygzljX8TvOTUTVDcG0ckUEpMnRlnV7gXX/YGOAqjHOypJBZOSZ2ge9fdo671cVA
 pXs0aDXT/TT/vc9KzWL0Qu4LX6XHLiyI3nwMsS6OnC2/J7qknxkmnz3MxsmkOA/cZd08
 WBoR8YU5VhYE+4Z9CWE+jdFU2uhUxfpZY3zTG6A6d6tsblISTlcuk8GjTGvcNQIjYhrY
 nQrkbaMlQHtxJDl0qXpxP5Ulsrog/lbxYHOE01DVQdWeWAAVzgTzDP/Y7sBAhqvrLaem
 jJcXmT9FuBAW0CUVxHUkVJLJI4YoPnk2q0oYQu5DMwvPtaIV2/6OrD0oY/QeQW2T1Jc6
 O2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GIbE/qLv653vgs2uzn3n69u8JtE57yItTNm6pSzkbH8=;
 b=orozDvMxEF7qMHVDp0wE02KfMYXGjJ+vMArQzOAooZ8B+PMP4OMBfHFrbkxAd98JJf
 nbl+YUpq6txfQZ1m4P3hmcLH3lU1i8GPBYu66fW1ec5VT5qZlHelNo5DNfJx7Hffkbcg
 ZTzt4Zd9AHZLI4uoQhaXj/D91HVzFrox5bCxa+6I8WxGu0DJdPzSoJC4nbjoPyWFDk9N
 kfBHaxHJMQmdzEYDSjViIzsras1ehrh2Vv58z7UcxDjIFkIfzJGV5nS/pXhFhjuPbwzE
 6XAnmO78mwoGjOYfpHk1C6FKwCuhc559PcmJwsc6kSW6+dN10OambyvpKelFVj+/6t2z
 LFdA==
X-Gm-Message-State: AOAM530N709fgYGL3MPk2c5eeb+Yg2uDoF1lO9wIuD2piCE8rPrTDZwl
 wdjj3JVMAnavAZ1HfztoZ4ZNrg==
X-Google-Smtp-Source: ABdhPJx+udqioyegNJFOPgCHprRckGJ+WW0CZZxB+A+eqOYaW/IuUt/ArzVfepTtLia1eDqVwhvxwA==
X-Received: by 2002:adf:a1c4:: with SMTP id v4mr5537450wrv.104.1613046488337; 
 Thu, 11 Feb 2021 04:28:08 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j71sm10205808wmj.31.2021.02.11.04.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:28:04 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 053EB1FF99;
 Thu, 11 Feb 2021 12:27:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 10/15] target/sh4: Drop use of gdb_get_float32() and
 ldfl_p()
Date: Thu, 11 Feb 2021 12:27:45 +0000
Message-Id: <20210211122750.22645-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211122750.22645-1-alex.bennee@linaro.org>
References: <20210211122750.22645-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 berrange@redhat.com, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, cota@braap.org,
 aurelien@aurel32.net
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210208113428.7181-2-peter.maydell@linaro.org>
---
 target/sh4/gdbstub.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

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


