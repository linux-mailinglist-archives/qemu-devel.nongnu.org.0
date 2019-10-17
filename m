Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A08DAE9E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 15:40:40 +0200 (CEST)
Received: from localhost ([::1]:48132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL619-000307-DZ
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 09:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34052)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iL5do-0008Bz-Bh
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:16:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iL5dn-0005WO-7Q
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:16:32 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36632)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iL5dm-0005Vd-UE
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 09:16:31 -0400
Received: by mail-wr1-x434.google.com with SMTP id w18so1754265wrt.3
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 06:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wkKvV4m59QNrxbn2cShYQVtK2L5V4Z2RfTcq3RzCI+A=;
 b=rTa1X6lBDRkyP2/hDTmolWJCZfeklme2HvJmd1b/uTAIMlnWIEGSJ6Q+XgnHyI42Dl
 hte8dTv9c5T2T/QbbvkHqd1g2LCWJMVoCj+0Xd7AZZsQK/3As9msCyjGqEsVGdfCjrZX
 7yrvt0DtP9FxwHquBEMX4vDEuD7iGcvnG1eYf/RkgVcEmecNNv3ZXas3LrahiIVUhhbU
 J4Xph/E66dWCVJRTgM41PA1WZVPz5uNO+GfFrBIi6hLM7hG/hmcgJmjtQnrfNCraH2J/
 pidZElsXp698d8jUWgKxtMc0bTSW486kRDpL0DZi0z53NyDN98ozLY/KYhkTItbEJ7mZ
 XI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wkKvV4m59QNrxbn2cShYQVtK2L5V4Z2RfTcq3RzCI+A=;
 b=j6qArK51oApEAo4p3q31gFGreJOHcM+Ms5HhhUv+2eL8cDXdK5bOOVBlgXYt7phgOZ
 TvDmYm8NuD58k7EynBCsKJsMMNZxScLdX0/SBYugstdem6gQsD4sCIFKaVMgT+DvJhoG
 ERSKG18qMvX5l9xkpn85XleQVQy5iRWp3ZeIm7KHXBi17a78CI4af+HIqt3ptdTjvfuk
 NZa7E7LaFiuK5U+PKvGBlMvOQAzwR52ivh4o2ZwsjzXaCGg094TRhSwI+fUNeDUz5YI4
 Z6ksU7yNkehu6VSOwtVQraits7DKQwjEL8klqbbU0RoTLaLWYWWEmtrpLsml6tZxqbKt
 SKtg==
X-Gm-Message-State: APjAAAXvXZKM2IPx/WYCadfqs9IkA0026NAE/EGSYeEwNZeZfSvDN7+0
 w1LGA14gIJL8nyxBc4iv3zXDsg==
X-Google-Smtp-Source: APXvYqybejQqQEzNyKLag9CiUUo/PcOCkGxL/YYDvaKLPVssEInd9jjN4t2wKTthEytH9Nz+8d5wSw==
X-Received: by 2002:a5d:56ca:: with SMTP id m10mr2939156wrw.369.1571318189782; 
 Thu, 17 Oct 2019 06:16:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r3sm3243066wre.29.2019.10.17.06.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 06:16:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3472C1FFAC;
 Thu, 17 Oct 2019 14:16:18 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v6 24/54] target/ppc: fetch code with translator_ld
Date: Thu, 17 Oct 2019 14:15:45 +0100
Message-Id: <20191017131615.19660-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191017131615.19660-1-alex.bennee@linaro.org>
References: <20191017131615.19660-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::434
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
Cc: robert.foley@futurewei.com,
 Richard Henderson <richard.henderson@linaro.org>, peter.puhov@futurewei.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/ppc/translate.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index adb8fd516f..f5fe5d0611 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7853,11 +7853,9 @@ static void ppc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     LOG_DISAS("nip=" TARGET_FMT_lx " super=%d ir=%d\n",
               ctx->base.pc_next, ctx->mem_idx, (int)msr_ir);
 
-    if (unlikely(need_byteswap(ctx))) {
-        ctx->opcode = bswap32(cpu_ldl_code(env, ctx->base.pc_next));
-    } else {
-        ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
-    }
+    ctx->opcode = translator_ldl_swap(env, ctx->base.pc_next,
+                                      need_byteswap(ctx));
+
     LOG_DISAS("translate opcode %08x (%02x %02x %02x %02x) (%s)\n",
               ctx->opcode, opc1(ctx->opcode), opc2(ctx->opcode),
               opc3(ctx->opcode), opc4(ctx->opcode),
-- 
2.20.1


