Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 112F331B6C5
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 10:55:19 +0100 (CET)
Received: from localhost ([::1]:54668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBab8-0005S6-4L
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 04:55:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaPE-00009L-79
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:43:00 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:55209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaPC-0004Pu-EQ
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:42:59 -0500
Received: by mail-wm1-x336.google.com with SMTP id w4so5598718wmi.4
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 01:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JH8erxJMdoMlYd+wD89DC22DAoNH9ScuyZZfWqH7tAw=;
 b=nLOJR2kXQ51RRSEogMjsKBo716a3D5Bl17u13zCevWiH4otwIM+GLrVDfe6rcK8A5v
 pNtJhCa6MX2YdyHuBcYz8QwX5mr9jXVG4YSPHBlnMr0ECKIe1e77N0tHgfbh+sWCcOzM
 ujn61WNyLm9YUXcKmWYNdHT/7RbWqajXoXYCwgOZKeLSM3pc5f/EZsAsuAD1O5R4vacj
 MPwjNoihXl7ulEm3Y/KtDrPWIuSrE7uDDMLmHv/ZKes0QdnhDEy1uB/CwEeO544KGCdw
 IxmSAbHbwrbwRXKRC7tpMXkTCuY8CwN2zt4M2yaVdfYla/jyQqUPCDnfxDuqZRTC0dZ7
 NZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JH8erxJMdoMlYd+wD89DC22DAoNH9ScuyZZfWqH7tAw=;
 b=OQiLQoK0mrd0XFTg07Of18rp2RP91KsIxHsUHqPvAQImblQI8BEVqqnoO2VVqxMRyX
 c5QmBVc0mtBhEJldLa/Idn/+cfl153gRAlput7BP/y7FyZ+frtH4Kv9XFyYJP2AAes7Z
 DNSR4a4x+CG4+NpHS4gcgZipYR+BO2PuLIh3KUT3LMs5TdjJ3Uh0zmSrd9fasHkS9zkG
 nkFSgyTTI1cCdfDBpGADk4Ml1kcB+hfFCS576WRqkgsdeQX6HXCV6kVUUg0A9mzOcKc8
 7XU7FlxiCK7gtsLLJBQZqElOXE9WDmzUwzqsRRJ01IVikLO1iSniIiFA35L76aUAXL3v
 XheA==
X-Gm-Message-State: AOAM532/ODi5FHWFdLlfKQAvr3uWY5y6fmzlYErfkjLd7SduJreIqYNR
 IVvvgQWZnwdHMXIX+2xHWYAenJiccZ0ZuINx
X-Google-Smtp-Source: ABdhPJxZXkyiAg1lHkH8DAhwBQcPWRsmQ9rxpyBJ7g+KGYyBwXSBt7B52XIj4vxZTcb+08+g/SPkLQ==
X-Received: by 2002:a1c:7f93:: with SMTP id
 a141mr13742312wmd.105.1613382177130; 
 Mon, 15 Feb 2021 01:42:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p12sm22169327wmq.1.2021.02.15.01.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 01:42:52 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 015CD1FF9A;
 Mon, 15 Feb 2021 09:42:46 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 11/15] target/m68k: Drop use of gdb_get_float64() and ldfq_p()
Date: Mon, 15 Feb 2021 09:42:40 +0000
Message-Id: <20210215094244.12716-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215094244.12716-1-alex.bennee@linaro.org>
References: <20210215094244.12716-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

We used to make a distinction between 'float64'/'float32' types and
the 'uint64_t'/'uint32_t' types, requiring special conversion
operations to go between them.  We've now dropped this distinction as
unnecessary, and the 'float*' types remain primarily for
documentation purposes when used in places like the function
prototypes of TCG helper functions.

This means that there's no need for a special gdb_get_float64()
function to write a float64 value to the GDB protocol buffer; we can
just use gdb_get_reg64().

Similarly, for reading a value out of the GDB buffer into a float64
we can use ldq_p() and need not use ldfq_p().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20210208113428.7181-3-peter.maydell@linaro.org>
Message-Id: <20210211122750.22645-12-alex.bennee@linaro.org>

diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 4185ca94ce..137a3e1a3d 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -72,8 +72,7 @@ static int cf_fpu_gdb_get_reg(CPUM68KState *env, GByteArray *mem_buf, int n)
 {
     if (n < 8) {
         float_status s;
-        return gdb_get_float64(mem_buf,
-                               floatx80_to_float64(env->fregs[n].d, &s));
+        return gdb_get_reg64(mem_buf, floatx80_to_float64(env->fregs[n].d, &s));
     }
     switch (n) {
     case 8: /* fpcontrol */
@@ -90,7 +89,7 @@ static int cf_fpu_gdb_set_reg(CPUM68KState *env, uint8_t *mem_buf, int n)
 {
     if (n < 8) {
         float_status s;
-        env->fregs[n].d = float64_to_floatx80(ldfq_p(mem_buf), &s);
+        env->fregs[n].d = float64_to_floatx80(ldq_p(mem_buf), &s);
         return 8;
     }
     switch (n) {
-- 
2.20.1


