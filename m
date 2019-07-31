Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8407C8A1
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 18:27:45 +0200 (CEST)
Received: from localhost ([::1]:42730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsrS4-000234-Pq
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 12:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45038)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hsrPh-0004k9-37
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:25:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hsrPg-0000Ge-3X
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:25:17 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:36797)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hsrPf-0000Eb-UG
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:25:16 -0400
Received: by mail-wr1-x441.google.com with SMTP id n4so70447861wrs.3
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 09:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3KilUfW5qE8/qCyjKP1J8YJaC2amH5E2ZqjPJpVHgBQ=;
 b=tj7Eo6sqm2GcI0DJtEVG85i84SqjoykzrrEnT52+0xcOKzYKLkz+AB0JBDVKDoMI9v
 TGxYf1c25rKALLef4Tn3KF6jLEI9vEd1gZCdMP60aWR22I6M2yTES8+6AfVXOyHUAhpx
 bNJ5eCJoTUpEr7lzQ6Yc2n9VBC++ROgAjaDC+NE6Oy1GwhsA+4EMX9rQbqa0VbWh+Koz
 2ot0fA2FwuAg+07dlc56oOsW4jr9UeOc+rHMcBuMnvLcEWBFzW2lnt+82p2pGdQ01D12
 q4N8HdEL+zYdAlGmcrmDj3oi2S5oxaskz5E6x1svlmeLpL0XvwYu8lMpH5kfylQm1nt9
 n2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3KilUfW5qE8/qCyjKP1J8YJaC2amH5E2ZqjPJpVHgBQ=;
 b=eBfMdn3bBTLgwBNz7KY4eoOxQdPsTPRU3KPJCMwVtTpnXUcOTYRWndv3Eb5gr126kg
 d1IB40fobGVpEEiorGWiGJKqzBdAmQnPyC/lAl60UAdjcAOBSVnmIWrGyxSgbwqhslnG
 F0M9JoS+QULnhHQdOdjFvGyYah1tNYFLdk0Hlf8Nk6OfmqMXcMKXeqpB87dmmcomRkya
 TmnIPWK3yYVLfFRrCOfyn2nJqCoh9qz68B5rGWN3+6PlMlB6vPRQJbnQ9E1rOsbuwfUi
 5Z1gvtgz3BWeuEfnhWJL5tT/ZA5xJHjaKOtgsmU688i8sgb+dLMo63v+ZcmOgwO3TEan
 S58w==
X-Gm-Message-State: APjAAAVLyHAD09tJuOoTuwiwt+S3Ey+GqV1UFSIdW11eZLT67/snNjvk
 ImZAK0VS77KIhJB7NyFGQJrBxQ==
X-Google-Smtp-Source: APXvYqyJIUlDhKfWYo4qh3ESjQp2QpEacFk9TGgyRsVeGYmH/zJEx7DsSB3+mNkFcdRbLOWfi59z4w==
X-Received: by 2002:a5d:4e06:: with SMTP id p6mr54233807wrt.336.1564590313436; 
 Wed, 31 Jul 2019 09:25:13 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id w67sm89785102wma.24.2019.07.31.09.25.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 09:25:12 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0A82C1FF91;
 Wed, 31 Jul 2019 17:07:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 31 Jul 2019 17:07:03 +0100
Message-Id: <20190731160719.11396-39-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731160719.11396-1-alex.bennee@linaro.org>
References: <20190731160719.11396-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-devel] [PATCH v4 38/54] target/riscv: fetch code with
 translator_ld
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
Cc: "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>, aaron@os.amperecomputing.com,
 cota@braap.org, Alistair Francis <Alistair.Francis@wdc.com>,
 bobby.prani@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/riscv/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8d6ab732588..73cea63e4a2 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -796,7 +796,7 @@ static void riscv_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     DisasContext *ctx = container_of(dcbase, DisasContext, base);
     CPURISCVState *env = cpu->env_ptr;
 
-    ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
+    ctx->opcode = translator_ldl(env, ctx->base.pc_next);
     decode_opc(ctx);
     ctx->base.pc_next = ctx->pc_succ_insn;
 
-- 
2.20.1


