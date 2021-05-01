Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC583708A4
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 21:04:57 +0200 (CEST)
Received: from localhost ([::1]:46566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcuvA-0002RS-I4
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 15:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuav-00005h-Mz
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:44:01 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:46651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuaa-00009G-6g
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:44:01 -0400
Received: by mail-pg1-x52b.google.com with SMTP id q9so822063pgl.13
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 11:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UdUcyujGpauXTdAtiBYYXQP2ZLdHxofdS+1N9npM370=;
 b=seAeEaysSIoFwvdPVYfmq67UdDIwtDln0GTddotClzQC8qleZs4B1BSJ2wyG6vgEcf
 ADwS3k9ydZOVB0hYIkx4lC0LnG0twp/eJQn5C/FcYuYNeFomdbF9FvKKDIpRym6YL6Hb
 Xc7vLfS1NFqLN+63Sm+qUOAkIeHu+ZBpbSpJIIw1MvpJ2DnuEL86jSmayot/PyAUwun7
 61Oxr0f0cw4StiguTl3J9M2WdsEyV8ih6q7Eu4fyACBJbe5eotaMoXThNrggguZcqr4e
 80shO3By7JY0GaRNxOXhf1psPbEjN6sZBxrScrqsKLiy3vVmhwb4vQxdqQ195hHsJvIl
 gAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UdUcyujGpauXTdAtiBYYXQP2ZLdHxofdS+1N9npM370=;
 b=IJm3BCOYtQrctMLWzEYCAIfAFsFMDoRFF/4MPAODDyc+s4mFhtmuwi3Kb7oixBR0e9
 RQN0fz2KTEho/bPQ2x2vFKKpHNzQM2JR0cI3SUUNw1rWdgNvr6d6b+5ePlaZq4qCbZEl
 gbVbyI+8tByrsgDG7z+pwoLNVrszgVSI391iYdiE7uYrUfNBra1Ae0ZRaS7136p8z691
 /mJnrrVoq9kgAH7hiObmWtbyDnTjyE4UX6XK0wRIacobYHczpkbtkzvihC012HOzj24X
 iCM81x8RLF1Jr/j2sTU14BvaL4ONHBc7KdvbWcjwJbB3X6UKs20jGANBYLM4gApBbrnF
 D4mA==
X-Gm-Message-State: AOAM532CdBPgMtvoI0ekqbbJddlpkvQMmPtwkdwRaA7MOoni1z9r3eYl
 9Ug1N4slFa89kUTpvSA9bIWuvD/DI7mGmw==
X-Google-Smtp-Source: ABdhPJySxQLzxD8aXPgBMrMGO2zO4NcJbgklAjHmWrKT3q25OGFZxh2IVbGXlLpoi5B2xep35A8ZuA==
X-Received: by 2002:a65:52c3:: with SMTP id z3mr10394387pgp.338.1619894618208; 
 Sat, 01 May 2021 11:43:38 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id i11sm5309088pfa.108.2021.05.01.11.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 11:43:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/31] Hexagon (target/hexagon) move QEMU_GENERATE to only be
 on during macros.h
Date: Sat,  1 May 2021 11:43:13 -0700
Message-Id: <20210501184324.1338186-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210501184324.1338186-1-richard.henderson@linaro.org>
References: <20210501184324.1338186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1617930474-31979-16-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/genptr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 6b74344795..b87e264ccf 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -15,7 +15,6 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#define QEMU_GENERATE
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "cpu.h"
@@ -24,7 +23,9 @@
 #include "insn.h"
 #include "opcodes.h"
 #include "translate.h"
+#define QEMU_GENERATE       /* Used internally by macros.h */
 #include "macros.h"
+#undef QEMU_GENERATE
 #include "gen_tcg.h"
 
 static inline TCGv gen_read_preg(TCGv pred, uint8_t num)
-- 
2.25.1


