Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B92711D8879
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 21:49:43 +0200 (CEST)
Received: from localhost ([::1]:53830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jalle-0003P2-MW
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 15:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jalee-0002zk-89
 for qemu-devel@nongnu.org; Mon, 18 May 2020 15:42:29 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:45440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aleksandar.qemu.devel@gmail.com>)
 id 1jaled-0004cS-JE
 for qemu-devel@nongnu.org; Mon, 18 May 2020 15:42:27 -0400
Received: by mail-lj1-x242.google.com with SMTP id z18so2957773lji.12
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 12:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HYRUeAwktwnZJjXPTxlxiB/3mxTEsXooJ/Wo/+9Cf9s=;
 b=T/yYhxAvoJ421ys94mTJoVNhe6oMWBuoj94v98mTu1F1AxEPmxvjuy7d89jHGQg9Ou
 Fxnp5+xTkxiEUq7FpOiagQmgfnijtj5g8VNhgUGb0+2W26nmotXorkfAfjJIfgGxWGT8
 CJ9Ye4K5uWAE/Q52N0uWaknduUm6yiuuFnZgb26qhk1YNbzNObLkNzcaFmXA/PtvLGPZ
 8BFDxYtkNLuIk3qFHUWyWJ5hCK0jHWroHwooQs1c3pZID8mkqX9BGDKV7UPjEFOcA1Fw
 MF0AKf9+UnogbS5AFSXuJN5bIqW/4qESgzZPtctLTEtXFk16G5EUqLqUj3VDACJcPMrj
 wBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HYRUeAwktwnZJjXPTxlxiB/3mxTEsXooJ/Wo/+9Cf9s=;
 b=frJpp/xGJMrN16NV34IZ3yMwIAImv442osboCod8MjFHRDZy4wwIYspV8xsNgA6X3D
 j1Nfk6Del3uGRfMDNvPylPFEdmN2eFbxsAVXIfzwY9Yz4iU5rddjUeCNkX4Ijz+AxSvK
 M2kTk+Sa6sgcfNqkJjbOMxEfSfhfZ/uVjrcxvVK094w6Z6s/OwGDcZ7TEdRc4jXNlclj
 gWmAf9Odhr+D00f/NYySC74RevcWQfeHfyZmGI+DuLqv6lijDvz4h0RsQz+KcJ6ldgcM
 q5fHiixlWxjnwnjxrgPVmHaVV86pySb84oQKY1m+N+/9xiyrB8/I6KJ3p2IhdFsqiBs+
 JcKA==
X-Gm-Message-State: AOAM533p0cX0qGgtmCN+8+vE28moJ+rPLO3lJ2Lz+B21lNldapGEDewM
 VgaYfXLbeByZt3K1ALfMH6kwuHEKBm0=
X-Google-Smtp-Source: ABdhPJy9tS1rsF/30XWmFWSYiIne82mHFZTHfhqS5sVUMgZywLFIt/LH+WjPX7eq14793JYv2x/wbg==
X-Received: by 2002:a05:651c:3c6:: with SMTP id
 f6mr7658511ljp.138.1589830945772; 
 Mon, 18 May 2020 12:42:25 -0700 (PDT)
Received: from localhost.localdomain ([109.245.227.98])
 by smtp.gmail.com with ESMTPSA id r15sm7593128lfp.34.2020.05.18.12.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 12:42:25 -0700 (PDT)
From: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 13/22] target/mips: fpu: Remove now unused FLOAT_CLASS macro
Date: Mon, 18 May 2020 21:41:40 +0200
Message-Id: <20200518194149.16281-14-aleksandar.qemu.devel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200518194149.16281-1-aleksandar.qemu.devel@gmail.com>
References: <20200518194149.16281-1-aleksandar.qemu.devel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::242;
 envelope-from=aleksandar.qemu.devel@gmail.com; helo=mail-lj1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: aleksandar.rikalo@syrmia.com,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After demacroing CLASS.<D|S>, this macro is not needed anymore.

Reviewed-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Signed-off-by: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
---
 target/mips/fpu_helper.c | 39 ---------------------------------------
 1 file changed, 39 deletions(-)

diff --git a/target/mips/fpu_helper.c b/target/mips/fpu_helper.c
index b3903f5357..e227e53f70 100644
--- a/target/mips/fpu_helper.c
+++ b/target/mips/fpu_helper.c
@@ -1128,45 +1128,6 @@ FLOAT_RINT(rint_d, 64)
 #define FLOAT_CLASS_POSITIVE_SUBNORMAL 0x100
 #define FLOAT_CLASS_POSITIVE_ZERO      0x200
 
-#define FLOAT_CLASS(name, bits)                                      \
-uint ## bits ## _t float_ ## name(uint ## bits ## _t arg,            \
-                                  float_status *status)              \
-{                                                                    \
-    if (float ## bits ## _is_signaling_nan(arg, status)) {           \
-        return FLOAT_CLASS_SIGNALING_NAN;                            \
-    } else if (float ## bits ## _is_quiet_nan(arg, status)) {        \
-        return FLOAT_CLASS_QUIET_NAN;                                \
-    } else if (float ## bits ## _is_neg(arg)) {                      \
-        if (float ## bits ## _is_infinity(arg)) {                    \
-            return FLOAT_CLASS_NEGATIVE_INFINITY;                    \
-        } else if (float ## bits ## _is_zero(arg)) {                 \
-            return FLOAT_CLASS_NEGATIVE_ZERO;                        \
-        } else if (float ## bits ## _is_zero_or_denormal(arg)) {     \
-            return FLOAT_CLASS_NEGATIVE_SUBNORMAL;                   \
-        } else {                                                     \
-            return FLOAT_CLASS_NEGATIVE_NORMAL;                      \
-        }                                                            \
-    } else {                                                         \
-        if (float ## bits ## _is_infinity(arg)) {                    \
-            return FLOAT_CLASS_POSITIVE_INFINITY;                    \
-        } else if (float ## bits ## _is_zero(arg)) {                 \
-            return FLOAT_CLASS_POSITIVE_ZERO;                        \
-        } else if (float ## bits ## _is_zero_or_denormal(arg)) {     \
-            return FLOAT_CLASS_POSITIVE_SUBNORMAL;                   \
-        } else {                                                     \
-            return FLOAT_CLASS_POSITIVE_NORMAL;                      \
-        }                                                            \
-    }                                                                \
-}                                                                    \
-                                                                     \
-uint ## bits ## _t helper_float_ ## name(CPUMIPSState *env,          \
-                                         uint ## bits ## _t arg)     \
-{                                                                    \
-    return float_ ## name(arg, &env->active_fpu.fp_status);          \
-}
-
-#undef FLOAT_CLASS
-
 uint64_t float_class_d(uint64_t arg, float_status *status)
 {
     if (float64_is_signaling_nan(arg, status)) {
-- 
2.20.1


