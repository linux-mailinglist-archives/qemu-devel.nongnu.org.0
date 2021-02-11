Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51187318A9A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:32:34 +0100 (CET)
Received: from localhost ([::1]:33404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAB97-00005o-Bk
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:32:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAB4s-00034p-Jf
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:28:10 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAB4q-0003uB-Jf
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:28:10 -0500
Received: by mail-wr1-x42d.google.com with SMTP id g6so3952850wrs.11
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r/KTynis7rZSXV4lF8cKxJg2SgNT0zTWC2dECjua/lg=;
 b=a5iNE14LgWhI7weexCA40cJBXhMKV7v7ZunXcMNNi3A8Gy3AHkZhyEhlQkT2ZVosIT
 St8SBqLcW2SLwHt+ecKuCc30X6+nXPsjyCSXJ4zUAJd2c2A9j1ofw9+sg1oMVdp04G80
 iys1g1d7q2BRxRFhMA2Hd9O/c5fSfOADHlTpREffn9R2NSY/ab9Vkva92cgcELJeaoAu
 qJj+Emww/3u/YgGeBE5bOGtzw4LpcuiG3i2XFwqeondf5/IBzqv2XPs9SdMiZwlzsAnk
 /p2Fmk/khMS+Sy2AWILkBN/KVlfBgidB8vfHsxK2EqR3MCbiRFny8B/4qfsyhbR+mUpK
 H+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r/KTynis7rZSXV4lF8cKxJg2SgNT0zTWC2dECjua/lg=;
 b=MuGDlkL2ixWvbR9AZnyjOVEwaa5aqvWe9tamTfp5YIRR5TF4+RRjgPsVVRp5fkVGh+
 4oo3F2bhRE7ImZecUGjd66hHZ2uoJOoOtfw0tcKhC8WVtSR3Z7hIRqsS1LHu2oIouh9z
 pJy24HbDzEDSXI1IBilYx14fmwuGQjxTQ7J3wq1EM5rXg0oTCioRinG8eSqfWoOcRfob
 oFkg3oZNarKJd46TpkX0n1PmshN0C2d5WXjnFyFGgUNZBbhksdhoOr3Sv23SzZA9yiZj
 IrjqXms9wdFPw526MMat4LGMRzFmyiUcFnJ68nFm7opZU1rupy/nmS7mid1wlGevLKaW
 gcjg==
X-Gm-Message-State: AOAM531tylb1F8gcRffQAsWijt+aVBMbIUcF6Wy3zf8XTy0vFPed7N4d
 4VDYoWeHr8ex2VKNrIO63SWMSQ==
X-Google-Smtp-Source: ABdhPJwLwNf9gdwm93GQG6gQRYey01q9oQwnhlX7uue1nn6dBLLcYqZ5Co1BJQ57YKQIyUNcmiz8UA==
X-Received: by 2002:adf:9bd7:: with SMTP id e23mr5509082wrc.48.1613046487256; 
 Thu, 11 Feb 2021 04:28:07 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l2sm9666838wmf.15.2021.02.11.04.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:28:04 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1AB551FF9A;
 Thu, 11 Feb 2021 12:27:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 11/15] target/m68k: Drop use of gdb_get_float64() and
 ldfq_p()
Date: Thu, 11 Feb 2021 12:27:46 +0000
Message-Id: <20210211122750.22645-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211122750.22645-1-alex.bennee@linaro.org>
References: <20210211122750.22645-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
 berrange@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Laurent Vivier <laurent@vivier.eu>,
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

This means that there's no need for a special gdb_get_float64()
function to write a float64 value to the GDB protocol buffer; we can
just use gdb_get_reg64().

Similarly, for reading a value out of the GDB buffer into a float64
we can use ldq_p() and need not use ldfq_p().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210208113428.7181-3-peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/m68k/helper.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 3ff5765795..09f0391d50 100644
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


