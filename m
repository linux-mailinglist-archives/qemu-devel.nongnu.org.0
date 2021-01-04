Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2189D2E9FF9
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jan 2021 23:25:49 +0100 (CET)
Received: from localhost ([::1]:48060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwYIO-00026r-64
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 17:25:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwY5n-0007Ho-SG
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 17:12:47 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwY5m-0007z2-FF
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 17:12:47 -0500
Received: by mail-wr1-x42b.google.com with SMTP id a12so33619216wrv.8
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 14:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R7Zokvaf4P4DDS/Ik2Al7Dbfod5TeXUavdYyR3ya+5E=;
 b=MZbkZF26uB+3tr8PXNXP86R9z7n3OhJf14S1iZdw0jwtsK3Pid2k7rcwZuSiGXSyTL
 bXe/csqdQ0T4Tcn8/gyCXArnUvQn6pmz6l+49h0wYvmCohTBoHMERcvGOXor7VjpsknG
 FUeL1tsB8WyjYb4fLKWFb/c+KOzLrBhA0/QkJE/uVCwIWyNSAgHZjMR60oKXu0+ipdKX
 QNUTZKudWyP3LMpYwtTope6lqQIz8GsOp9D95i0s/BWzZnqaiC/ekmAn6fKfJUKLvbVh
 14r10igKs3V2tkp9ztwBIjoSraYBvsnIb67G6SHpAKPlp4WFoQqJdG9Mzg7VwuHHUn06
 tqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=R7Zokvaf4P4DDS/Ik2Al7Dbfod5TeXUavdYyR3ya+5E=;
 b=dFPJXwMia+OCWPQym/KHN2XSmGQvcGWc394dIOr6ubGIeKuFZXBJH45l41lTVdU2sq
 Zdy4K2tFAK+JAiFoK4N2VyAfEZNCz87xJqejfq3427txOVn/J8L5fLH2ERg0FPfBPO1J
 xgZtCQy2QGdXafs5tNws7Zu7iC6j/rxJ8px+ycd1gxqalgUSK42AOqSH1FV9wA+3ug/3
 F5JKS2QFudmTGnqzsmY6gVhHoiW5zhB/0u+aSJVJ6S1rKNY6pooQ7BkXRk44/M/UQs8J
 dvrXws2fZPMeKhPLYh/jCtFhAW4uZyi6vreWavXWnle432Z0lRum2FvoaEzjEHoCEnYl
 jKeg==
X-Gm-Message-State: AOAM533u51EVt9Mg3kYO+X4l8A78DjtvoEPyyuqUWSVnCQEthdTzYtT7
 H/AvQviiLNwlnOqUl2+nnojB4WL7hHc=
X-Google-Smtp-Source: ABdhPJwAis58vSm7ZKecqPQC0BZoKBIV3xFktINRlCsnNue7ZCk9QhLMBkSo1iuMj8UgVpUqBG35dw==
X-Received: by 2002:adf:9467:: with SMTP id 94mr84116673wrq.235.1609798364989; 
 Mon, 04 Jan 2021 14:12:44 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id u26sm1148256wmm.24.2021.01.04.14.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 14:12:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/15] target/mips/mips-defs: Use ISA_MIPS32R5 definition
 to check Release 5
Date: Mon,  4 Jan 2021 23:11:48 +0100
Message-Id: <20210104221154.3127610-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210104221154.3127610-1-f4bug@amsat.org>
References: <20210104221154.3127610-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
 Paul Burton <paulburton@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the single ISA_MIPS32R5 definition to check if the Release 5
ISA is supported, whether the CPU support 32/64-bit.

For now we keep '32' in the definition name, we will rename it
as ISA_MIPS_R5 in few commits.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/mips-defs.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index ccdde0b4a43..b71127ddd7c 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -20,7 +20,6 @@
 #define ISA_MIPS32R2      0x0000000000000040ULL
 #define ISA_MIPS32R3      0x0000000000000200ULL
 #define ISA_MIPS32R5      0x0000000000000800ULL
-#define ISA_MIPS64R5      0x0000000000001000ULL
 #define ISA_MIPS32R6      0x0000000000002000ULL
 #define ISA_MIPS64R6      0x0000000000004000ULL
 #define ISA_NANOMIPS32    0x0000000000008000ULL
@@ -84,7 +83,7 @@
 
 /* MIPS Technologies "Release 5" */
 #define CPU_MIPS32R5    (CPU_MIPS32R3 | ISA_MIPS32R5)
-#define CPU_MIPS64R5    (CPU_MIPS64R3 | CPU_MIPS32R5 | ISA_MIPS64R5)
+#define CPU_MIPS64R5    (CPU_MIPS64R3 | CPU_MIPS32R5)
 
 /* MIPS Technologies "Release 6" */
 #define CPU_MIPS32R6    (CPU_MIPS32R5 | ISA_MIPS32R6)
-- 
2.26.2


