Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CFF36101C
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 18:26:41 +0200 (CEST)
Received: from localhost ([::1]:55986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX4pD-0000jD-Mz
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 12:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lX4nn-0008TS-Fb
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:25:12 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:42920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lX4ng-0002OZ-DB
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:25:11 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 y5-20020a05600c3645b0290132b13aaa3bso948643wmq.1
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 09:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RrBWvHbtpJ5HCw1fDsuB0LpVuHZA9osvk4UFlgu7o2Y=;
 b=m24ZWoP6ex7JTnP56rh82RrrEkHxCLHXf2xaar6of0CoPWiPcdjwtkM5UN66m4hICU
 zOTPUXzc/GwU6WXMbSaeN8l8swu47HtKfJmYqwLsMP0RoW8Y+8oxdHkj4MLWWrdjrPsX
 4kRafQ37+vAa73zeJ431uuiBZzX7ewfxegKVapeKbf1wbw+ZWVu5XQtJfPkbgEbt1KYQ
 +e/oqgYIqEZDtpY2+X+bLJETtMl2ez9k0WBiaz8izZZKtfOHMgx4AuvbDgWjKlPjWfSp
 ItTV4NzSe7FplbG68/TLyj2Gvh9ELqbGeIyDRMwkIGr3bKZlAQ5T3TmS/rWUpdCG7uPE
 Ox2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RrBWvHbtpJ5HCw1fDsuB0LpVuHZA9osvk4UFlgu7o2Y=;
 b=FmXOH3S7RGL/HAUAV9Jqby6MweAFVebmHmefmvx0gBNkANgQZYVymjVjURmmzuG91w
 gmG5a6rzQTHvperytozNWQubqyc5bGQEugVX6K4IBv3YmHZWf4eoOHHSTIwvbgxs6Jpb
 u4dcWfg1VJhgoNFfGMy6VCGBhGJILmEDesiau25lxka2yPcOUp8EWqQPOCr6Aetb+hGw
 fE4R1kh/BZ10owwiRhQRftDK68WVU7y9IWIt7IfL2atjJjB+8khRcEJ8zc2jcBpmphTD
 w7idqY2yNwdptVcZYSlB1CkkTSovH/SfLnNygM/2CgU0GQOlwp0e7aZ46jQZp3uHRCcD
 gGSA==
X-Gm-Message-State: AOAM5333ozNct5bTNSUslUbzxJoOwJRpBhgJgs2teolTNjNU+evfYHpm
 CcXNUOrKhs4/7gZFJMEo4QcxUA==
X-Google-Smtp-Source: ABdhPJzsMY0REOYkM3EKjC15quvxT2LNChh6VTZPnJJvPCNnL74XGLGTN7SeA5BZO7eWropv30tJ3Q==
X-Received: by 2002:a1c:4045:: with SMTP id n66mr3898525wma.94.1618503902341; 
 Thu, 15 Apr 2021 09:25:02 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u3sm3619900wmg.48.2021.04.15.09.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 09:25:01 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 97E841FF7E;
 Thu, 15 Apr 2021 17:25:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] accel/tcg: avoid re-translating one-shot instructions
Date: Thu, 15 Apr 2021 17:24:53 +0100
Message-Id: <20210415162454.22056-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: peter.maydell@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By definition a single instruction is capable of being an IO
instruction. This avoids a problem of triggering a cpu_io_recompile on
a non-recorded translation which then fails because it expects
tcg_tb_lookup() to succeed unconditionally. The normal use case
requires a TB to be able to resolve machine state.

The other users of tcg_tb_lookup() are able to tolerate a missing TB
if the machine state has been resolved by other means - which in the
single-shot case is always true because machine state is synced at the
start of a block.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/translate-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index ba6ab09790..b12d0898d0 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1863,7 +1863,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 
     if (phys_pc == -1) {
         /* Generate a one-shot TB with 1 insn in it */
-        cflags = (cflags & ~CF_COUNT_MASK) | 1;
+        cflags = (cflags & ~CF_COUNT_MASK) | CF_LAST_IO | 1;
     }
 
     max_insns = cflags & CF_COUNT_MASK;
-- 
2.20.1


