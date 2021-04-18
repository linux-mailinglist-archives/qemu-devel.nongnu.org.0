Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4296536384F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 00:53:22 +0200 (CEST)
Received: from localhost ([::1]:58206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYGI5-0004AZ-9k
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 18:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGGF-0002Yu-FR
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:51:27 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:44702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGGD-0000Sy-Ta
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 18:51:27 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 f195-20020a1c1fcc0000b029012eb88126d7so7078141wmf.3
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 15:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jK+gaco4qgdVhboeMerJ/bnvg6dnQ6kpU1z6QqW9e3M=;
 b=qDTKSS3yYHKeZqLSa02acBoYEFSwxIuxF8Og9DtujA78Ia0yEv6CqtrslinYEYiQ1Y
 Nsh4QyMLMf1mTr8nHhainDeHdZfjolgdMHBXaXUNMjnESwTVs0+q74jw+hpnDjg1zOIc
 4ZvSd1PyPsYUeTJ7yVAZAV7KAHLLpK+SQmJTZUQSO5rJTUINtBzjkriPxl8vUEtvKCVA
 LzhvcoTcsubc6Pvyr0U/fMJJRFk8HnOinDBbSDMkOSOJ0cld8IIf3QZoKd0JBDay/7TP
 GwiK5AkTEp0BR3ODFveBCAHQPfFOkvDXGBTdoMU/KlaHummgVJ8PHYwRXkMH7ayHlE+I
 IFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jK+gaco4qgdVhboeMerJ/bnvg6dnQ6kpU1z6QqW9e3M=;
 b=oVr8m+Pyp8mOOc6l2ZBbgobdFfP9BBhqmPTqJ06u7RXfwKYeHwF3+WWZ7/n2Tb3bxW
 gNnmF4J2bDFdpzZogj1OV4Q94YRKMlaIo38QjE3JBLIYFQHezuWoMNuPWoMIclGpGcYP
 9mUqfh9ke+anzCv5+zjYYqctEnjksjDP6EjEzrijaLPi0UDaUQkW7BoW+wJpRUbvbU+r
 VNU+aRItZoM2QrQJLOanvOkLfxAgSB3uop4j2up/2TJXKQLu3H6laKPVwwFqMOWKiatr
 N2VF5yKEJwKp1/wwuk52+f6JlmAv5x+TNIhUqr2X5XquyWGzJ3Np8+o89r+0zSPjuLMd
 fAPg==
X-Gm-Message-State: AOAM530betJ1KvdvJ3+x1HAAg8+JxhWVuuY0YzOGYyGsV0SIpVdUbeqx
 FKs3D5lZO6PBI4aLSdR4LKpsk92Gh74JJg==
X-Google-Smtp-Source: ABdhPJzPZn1+qznD7pxRmhhGaKGxbfSkFQvS3abcU3jW1pv4y7JqS5NQ42P8SMQohdMT+8FRZOGPfA==
X-Received: by 2002:a7b:c14a:: with SMTP id z10mr18127602wmi.75.1618786284406; 
 Sun, 18 Apr 2021 15:51:24 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id s8sm20078938wrn.97.2021.04.18.15.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 15:51:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/29] target/mips: Optimize CPU/FPU regnames[] arrays
Date: Mon, 19 Apr 2021 00:50:34 +0200
Message-Id: <20210418225058.1257014-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418225058.1257014-1-f4bug@amsat.org>
References: <20210418225058.1257014-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since all entries are no more than 4 bytes (including nul
terminator), can save space and pie runtime relocations by
declaring regnames[] as array of 4 const char.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h | 4 ++--
 target/mips/cpu.c      | 2 +-
 target/mips/fpu.c      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index a8644f754a6..37f54a8b3fc 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -71,8 +71,8 @@ struct mips_def_t {
     int32_t SAARP;
 };
 
-extern const char * const regnames[32];
-extern const char * const fregnames[32];
+extern const char regnames[32][4];
+extern const char fregnames[32][4];
 
 extern const struct mips_def_t mips_defs[];
 extern const int mips_defs_number;
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index f354d18aec4..ed9552ebeb7 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -35,7 +35,7 @@
 #include "qapi/qapi-commands-machine-target.h"
 #include "fpu_helper.h"
 
-const char * const regnames[32] = {
+const char regnames[32][4] = {
     "r0", "at", "v0", "v1", "a0", "a1", "a2", "a3",
     "t0", "t1", "t2", "t3", "t4", "t5", "t6", "t7",
     "s0", "s1", "s2", "s3", "s4", "s5", "s6", "s7",
diff --git a/target/mips/fpu.c b/target/mips/fpu.c
index 1447dba3fa3..c7c487c1f9f 100644
--- a/target/mips/fpu.c
+++ b/target/mips/fpu.c
@@ -17,7 +17,7 @@ const FloatRoundMode ieee_rm[4] = {
     float_round_down
 };
 
-const char * const fregnames[32] = {
+const char fregnames[32][4] = {
     "f0",  "f1",  "f2",  "f3",  "f4",  "f5",  "f6",  "f7",
     "f8",  "f9",  "f10", "f11", "f12", "f13", "f14", "f15",
     "f16", "f17", "f18", "f19", "f20", "f21", "f22", "f23",
-- 
2.26.3


