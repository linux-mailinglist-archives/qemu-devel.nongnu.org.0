Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1966518F09
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:38:15 +0200 (CEST)
Received: from localhost ([::1]:33694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzHi-0007Ck-Kl
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZT-0007jb-CH
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:32 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:55202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZR-0006DT-Mh
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:31 -0400
Received: by mail-pj1-x102d.google.com with SMTP id fv2so16244353pjb.4
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=OuPQ5G9+kppu3GspUe2XHyinl3n08DHsjMhXklSdxDY=;
 b=CafpJ52OJRi616BOkfEVqfnuOE/xZg6qkgWPVJSRereVqMVVZC1khsJITQ4/SB3xMK
 o3kqWUCgnIKTKLjwkaFiCp4t/MKECW6zlM/kc5T3A7/SW1cdaXa1eiHvGeMJ2Y1iNMX1
 fZD4fRSGlZ0Lqdc58WXMSFgEK0d0vpmUIgKP1mzsgsZdzB5M8YA8R+RT7IrQ2BMCEM/b
 I5w8g62LKrQQskFB/XmbiQx/vC9TxznBCGV3F4s1vydqzNu3vT8iQWaGaUBqIrNgZw14
 mpTTOmctOSqkutB/SZReLbXjfx4VmJacZKZHJuab+tM3ijppNn1tnvVhrJWBtlm3uK6s
 +mbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OuPQ5G9+kppu3GspUe2XHyinl3n08DHsjMhXklSdxDY=;
 b=c1K3oLybqxUAo6ar2rwvlPbG4Nw2LtO8rGY+N0TBltDvPfQ1YNLEPw+ou5axIIA6hw
 VAGBXSBcwKpcChPKI/eqdbxv+/JnMen6jUP/HrP6xkE6yq6+oGBNIN5vyJXE0x/5nFJj
 5uLm2JM6E+nYe6IUsGlDWiYNB3eSvBMgXRBGNeoQG8QPqKtNdHUPo5aHPQx4actLNzJf
 qbLUhxDfbQExJEvLB47N1C+jyNvHz7gTTXq+FtJt7XfQNFtsxoqvjq7g6VNzDggI3JTK
 eJyTlrFUIKqUz0eL5j/PLdQ2uTShxNnVpCcgIh32/jO9ShIuHNzQFxms/EYmDVgIpyGt
 IoaQ==
X-Gm-Message-State: AOAM530XydXv0ds30FGlZ6YnB4Ju6tPZwpbzBBsXxT5pdAEgpE/GFt0v
 7HZqltT7lhgueEAt8oMckqBlCrSHx+S1pw==
X-Google-Smtp-Source: ABdhPJySOJTm2zFQ0wFhfeZ6huphzMsjRy1zgeTrksZgldn66NgqDjYRjAhe7b2/egWg0ZRY/zeGhw==
X-Received: by 2002:a17:902:da90:b0:15e:bcf0:cf25 with SMTP id
 j16-20020a170902da9000b0015ebcf0cf25mr2914727plx.40.1651607548358; 
 Tue, 03 May 2022 12:52:28 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 43/74] semihosting: Use console_out_gf for SYS_WRITEC
Date: Tue,  3 May 2022 12:48:12 -0700
Message-Id: <20220503194843.1379101-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 34d635006d..430cb4167b 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -230,6 +230,15 @@ static void common_semi_cb(CPUState *cs, uint64_t ret, int err)
     common_semi_set_ret(cs, ret);
 }
 
+/*
+ * Use 0xdeadbeef as the return value when there isn't a defined
+ * return value for the call.
+ */
+static void common_semi_dead_cb(CPUState *cs, uint64_t ret, int err)
+{
+    common_semi_set_ret(cs, 0xdeadbeef);
+}
+
 /*
  * SYS_READ and SYS_WRITE always return the number of bytes not read/written.
  * There is no error condition, other than returning the original length.
@@ -332,8 +341,7 @@ static const uint8_t featurefile_data[] = {
  * The specification always says that the "return register" either
  * returns a specific value or is corrupted, so we don't need to
  * report to our caller whether we are returning a value or trying to
- * leave the register unchanged. We use 0xdeadbeef as the return value
- * when there isn't a defined return value for the call.
+ * leave the register unchanged.
  */
 void do_common_semihosting(CPUState *cs)
 {
@@ -410,8 +418,12 @@ void do_common_semihosting(CPUState *cs)
         break;
 
     case TARGET_SYS_WRITEC:
-        qemu_semihosting_console_outc(env, args);
-        common_semi_set_ret(cs, 0xdeadbeef);
+        /*
+         * FIXME: the byte to be written is in a target_ulong slot,
+         * which means this is wrong for a big-endian guest.
+         */
+        semihost_sys_write_gf(cs, common_semi_dead_cb,
+                              &console_out_gf, args, 1);
         break;
 
     case TARGET_SYS_WRITE0:
-- 
2.34.1


