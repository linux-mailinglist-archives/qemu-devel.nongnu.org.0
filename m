Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC2A9DA6D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Aug 2019 02:13:19 +0200 (CEST)
Received: from localhost ([::1]:58640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2P6s-00052k-32
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 20:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33713)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i2P1n-00089u-Rg
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 20:08:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i2P1m-00078b-N2
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 20:08:03 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:33118)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i2P1m-00078H-Gm
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 20:08:02 -0400
Received: by mail-pg1-x543.google.com with SMTP id n190so11577636pgn.0
 for <qemu-devel@nongnu.org>; Mon, 26 Aug 2019 17:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZtsqWpvSD+DKF2WQwylbdGPEuaZnKjKrH4S2YIgOqBE=;
 b=aXYeiDbbag7XbEtIoHOG7EN6XWyHT9XZMFNUyl3VlVlIMmppXB5olNM7InoHGb4ofS
 WlLUkVjy2s3lPchYDtP+E4sWGTWIp8YTGLTKzhm3GiP4Y4Ym/H6qbXsOHmyizaExMvbP
 iG8yOeF3ykcPO8xGgMM3nK8dfjjlTVbQ2nq5xFmhS3/bblGh2aK06/mWeeeZJW74OuLE
 zl5CTvTlFptyO1AJN02ODpEz8h0t8LeqdIICmVsJWushGmtGi28Br9pSdTqzCsPklCKO
 OKWG11uBGrL3i/d86kxTvLbIl6ATHCueyjCo1yvqq1/W5n+O9Uugi3NswBqlgx8Bf0mp
 R5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZtsqWpvSD+DKF2WQwylbdGPEuaZnKjKrH4S2YIgOqBE=;
 b=juF3nzhwz60fzdbETGVs+xwZH+qpuRyi3d3i3ph7NgLWQowrTnENbRgh6GRgxBMRyL
 Gp8sVacU0qmUiVdGNN4yq+G+kCil1wbp4IwcW9Qd+BuIjnpR01uGun8fwBbm2iOcMPR3
 DZQ8pIsjvUuwHVG+aABHYEm/4EEwU7GgyCT+1DJ1mstnEbfgCiU3WdonLsLArAYxvBvV
 ePWWPJJcY/gjFIeZnMP9xut0FvcHhS60AL3lTWglKFZ+VNgo4BybG/SEQ2yPE1eP4b8p
 RX/3hM6o0ioYIjrr6xgobK4DFK9Ni04RjZ0KKk2IL81kxF4bd8inBAq0cyMrAy60tIfh
 mkCw==
X-Gm-Message-State: APjAAAUD6+HsZ30lSKGfJXnpG5wfVaAPfS81+ib0fTqu3gEHotHH4qTw
 nkp3tiJi4WV0jcMnci1xHY4XTBB/Wv8=
X-Google-Smtp-Source: APXvYqyFS1biR7O3n6/I8j0gMo/2WL5fBzKh6MyaudVZOt+4bj6k9rGZO/Ocm4n51LvIwatReb1C8g==
X-Received: by 2002:a65:534c:: with SMTP id w12mr18795123pgr.51.1566864481232; 
 Mon, 26 Aug 2019 17:08:01 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id e189sm11691067pgc.15.2019.08.26.17.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 17:08:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 26 Aug 2019 17:07:44 -0700
Message-Id: <20190827000745.19645-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190827000745.19645-1-richard.henderson@linaro.org>
References: <20190827000745.19645-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-devel] [PATCH 12/13] target/openrisc: Implement l.adrp
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
Cc: shorne@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This was added to the 1.3 spec.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/openrisc/disas.c      |  1 +
 target/openrisc/translate.c  | 13 +++++++++++++
 target/openrisc/insns.decode |  2 ++
 3 files changed, 16 insertions(+)

diff --git a/target/openrisc/disas.c b/target/openrisc/disas.c
index e51cbb24c6..ce112640b9 100644
--- a/target/openrisc/disas.c
+++ b/target/openrisc/disas.c
@@ -98,6 +98,7 @@ INSN(sw,     "%d(r%d), r%d", a->i, a->a, a->b)
 INSN(sb,     "%d(r%d), r%d", a->i, a->a, a->b)
 INSN(sh,     "%d(r%d), r%d", a->i, a->a, a->b)
 INSN(nop,    "")
+INSN(adrp,   "r%d, %d", a->d, a->i)
 INSN(addi,   "r%d, r%d, %d", a->d, a->a, a->i)
 INSN(addic,  "r%d, r%d, %d", a->d, a->a, a->i)
 INSN(muli,   "r%d, r%d, %d", a->d, a->a, a->i)
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index 024218ebeb..bd2f29e272 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -799,6 +799,19 @@ static bool trans_l_nop(DisasContext *dc, arg_l_nop *a)
     return true;
 }
 
+static bool trans_l_adrp(DisasContext *dc, arg_l_adrp *a)
+{
+    if (!check_v1_3(dc)) {
+        return false;
+    }
+    check_r0_write(dc, a->d);
+
+    tcg_gen_movi_i32(cpu_R(dc, a->d),
+                     (dc->base.pc_next & TARGET_PAGE_MASK) +
+                     ((target_long)a->i << TARGET_PAGE_BITS));
+    return true;
+}
+
 static bool trans_l_addi(DisasContext *dc, arg_rri *a)
 {
     TCGv t0;
diff --git a/target/openrisc/insns.decode b/target/openrisc/insns.decode
index 71e0d740db..0d6f7c29f8 100644
--- a/target/openrisc/insns.decode
+++ b/target/openrisc/insns.decode
@@ -102,6 +102,8 @@ l_maci          010011 ----- a:5 i:s16
 l_movhi         000110 d:5 ----0 k:16
 l_macrc         000110 d:5 ----1 00000000 00000000
 
+l_adrp          000010 d:5 i:s21
+
 ####
 # Arithmetic Instructions
 ####
-- 
2.17.1


