Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A591625226F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 23:06:40 +0200 (CEST)
Received: from localhost ([::1]:34564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAg9P-0007lX-Ld
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 17:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAg3Y-0007lv-Eb
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 17:00:36 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:40620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kAg3U-0001q7-KO
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 17:00:35 -0400
Received: by mail-pg1-x541.google.com with SMTP id h12so7673776pgm.7
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 14:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3uXgbXQfxy84sZbsepYGP345y9mJ6wAlQjnYKexGZh0=;
 b=U6NI2YUYCyqjFRUoNz/8cGOq27lqwwIWJftj0+xjNJHiehzZHU/Jk/Bs5oqrOXqYnx
 Qvu+wXv0Nz6eibB5afsHpTdh7yTJKEXx+J5Zgb1EQ/kJR41ugonMLK4+6CDaXOyyDq93
 QONA39XPy65v5IYPoZ4fgL94NhSt5YRLiJ067sFwRlkT26+YaujiwJi4wf/m3DR2UWfs
 BjB/ra6eC+gXg83s0BjXgINxcrJ5pHwgdcy7MOv6c/OFFr+hMeNqMCdTjsweafKBM5Zm
 CC/QXTZAQKKyQ3k64WhDYw10jcdGTIq4g5JGJNI+W+BSXfTctA3HJ4mHiR/iCSja5puU
 ZV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3uXgbXQfxy84sZbsepYGP345y9mJ6wAlQjnYKexGZh0=;
 b=Dfjo3DC4JkVVIc8IpnYMuEWTSGHIrIuxqEaZwlBSvU2fyTup1tUjHVjC2kWbEHn15T
 N3LvT4+FZ7YuJWb5t3PdIMlmezisY8k6tnSaei8aALVzRbVhsQcnnTjSKbCeTR1LKKtm
 rcO1zF3BMpQ9yO95wf6tAwOfPfTM13P59VszAgWCK2lgZeYVwX/x40xWZJNduCwcc+vJ
 sbSPLix+VtjE+55eey1e8Zh4puITOFl8eeLQESaVLFWY4h4S2GLsCImPa6TEiZgfUsjQ
 E6ZtG2s4r1+8QVKhu+kwxmAbgnE70vIOEOoZ9vFGw4Bvt73orhZ0eiqb4rw21n2HUcUH
 wdbA==
X-Gm-Message-State: AOAM531LQTodBqo6B3JB5Fs0SBtf5KLLyK9y3dDosCjAKCebNasNJsjC
 XnEL5rqi0SLqg+qxLA27HaKCrBdk7J7Dng==
X-Google-Smtp-Source: ABdhPJyLrKrgzVF9CffAw/DOeYll6IRw+oiqpn3WbiwbB3BSEae27yViYA7U34FJEzgcZm+xnXcrGA==
X-Received: by 2002:aa7:8f04:: with SMTP id x4mr9495584pfr.199.1598389230564; 
 Tue, 25 Aug 2020 14:00:30 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id k4sm16074pgr.87.2020.08.25.14.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 14:00:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 30/77] target/microblaze: Remove SIM_COMPAT
Date: Tue, 25 Aug 2020 13:59:03 -0700
Message-Id: <20200825205950.730499-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200825205950.730499-1-richard.henderson@linaro.org>
References: <20200825205950.730499-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 6a9710d76d..a90e56a17f 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -34,10 +34,9 @@
 #include "exec/log.h"
 
 
-#define SIM_COMPAT 0
 #define DISAS_GNU 1
 #define DISAS_MB 1
-#if DISAS_MB && !SIM_COMPAT
+#if DISAS_MB
 #  define LOG_DIS(...) qemu_log_mask(CPU_LOG_TB_IN_ASM, ## __VA_ARGS__)
 #else
 #  define LOG_DIS(...) do { } while (0)
@@ -1749,11 +1748,9 @@ static void mb_tr_tb_stop(DisasContextBase *dcb, CPUState *cs)
 static void mb_tr_disas_log(const DisasContextBase *dcb, CPUState *cs)
 {
 #ifdef DEBUG_DISAS
-#if !SIM_COMPAT
     qemu_log("IN: %s\n", lookup_symbol(dcb->pc_first));
     log_target_disas(cs, dcb->pc_first, dcb->tb->size);
 #endif
-#endif
 }
 
 static const TranslatorOps mb_tr_ops = {
-- 
2.25.1


