Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAAD902C8
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 15:20:27 +0200 (CEST)
Received: from localhost ([::1]:55916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyc9Z-0005BC-JZ
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 09:20:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35179)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1hyc6m-0003KE-D4
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 09:17:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hyc6k-0005Os-Kv
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 09:17:32 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:38456)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hyc6k-0005MY-Cc
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 09:17:30 -0400
Received: by mail-wr1-x443.google.com with SMTP id g17so1528098wrr.5
 for <qemu-devel@nongnu.org>; Fri, 16 Aug 2019 06:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+7geKfR5wGno4Z7da3SKHjbpOfUvDDGS57I/22GElhY=;
 b=xypz4giSuUyR/ywOTfob5f1bII+VWBQciVolaLMsb4T2JcxasPd42+5IhZ8aXM3/hf
 Lk2RrcwtB1DJ1JZgtmZj4deQxLOM0DsIY2MNtQ3kFwCCDBxTWmWaXd0LZT3gJMGYtWhB
 FQwHYxH5wQqtR1hQzfxcnPSWcxoc7cuPLxRduiiRHceglvFtDvL3wpvekMmRDi59YC0B
 xSrueBmLlHGU110V7lzI5fX0JBbab1KRzBOjumvYlIMWNObQpnbUOs3tafRX1LSLU3/A
 20Bh4WLDd5k0JZ3RM4oM8lRlEaYhxddMlEkXr45dTD9WkCLTlvT7huE11nPF/dDUfrT+
 jP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+7geKfR5wGno4Z7da3SKHjbpOfUvDDGS57I/22GElhY=;
 b=GQk8Ms+D2QnriK3GhSlxpYAIEcO6MKGqbNqDMAU7F+KPxnt3x+K7DXNuyn3AbPuhm2
 51rW/KLHSrNnF51IBP7bnlO0lC4eIM/UrHkWm0GRrFglNbWz6fgFzt682o8KjDQEHIwH
 E/t8/1h+nP6Se+oEvBUX8Cj8ocCwSifIGsJ1vwdP1fuFMwcAG5CozsxG35pckVf4GTHY
 ij1XJieqr1WPLGBvC84ffEyGQNhgRuR8jFuiKwjfm+apnisusRhPd6D56PCDoo19Kg1o
 +UOznyJQj5/UaRw+yxDW1tIqPad4qHcDIiEGx7qpS9KlZFRW+BUfWmG9kgzZ5QPUMg30
 ftdg==
X-Gm-Message-State: APjAAAWPSAqRBZbeqF6xcDSPsI4saivhXt+YNin9g2GcCV1cesoIkyDe
 NyQqQ4U0tU75i1iJLDk7c5H4Btm48Sh5og==
X-Google-Smtp-Source: APXvYqwzvU1Stt1v393UlsJH27NVe338M130jNr18Cb2mjSUEOanihr99nGmC3wJVV6pBYdZLL74ag==
X-Received: by 2002:a5d:63d0:: with SMTP id c16mr11054379wrw.22.1565961447492; 
 Fri, 16 Aug 2019 06:17:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 4sm8705796wro.78.2019.08.16.06.17.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 06:17:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 16 Aug 2019 14:16:56 +0100
Message-Id: <20190816131719.28244-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190816131719.28244-1-peter.maydell@linaro.org>
References: <20190816131719.28244-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PULL 06/29] target/arm: Pass in pc to
 thumb_insn_is_16bit
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

This function is used in two different contexts, and it will be
clearer if the function is given the address to which it applies.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20190807045335.1361-2-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index b32508cd2f9..de941e6b3dc 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9246,11 +9246,11 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
     }
 }
 
-static bool thumb_insn_is_16bit(DisasContext *s, uint32_t insn)
+static bool thumb_insn_is_16bit(DisasContext *s, uint32_t pc, uint32_t insn)
 {
-    /* Return true if this is a 16 bit instruction. We must be precise
-     * about this (matching the decode).  We assume that s->pc still
-     * points to the first 16 bits of the insn.
+    /*
+     * Return true if this is a 16 bit instruction. We must be precise
+     * about this (matching the decode).
      */
     if ((insn >> 11) < 0x1d) {
         /* Definitely a 16-bit instruction */
@@ -9270,7 +9270,7 @@ static bool thumb_insn_is_16bit(DisasContext *s, uint32_t insn)
         return false;
     }
 
-    if ((insn >> 11) == 0x1e && s->pc - s->page_start < TARGET_PAGE_SIZE - 3) {
+    if ((insn >> 11) == 0x1e && pc - s->page_start < TARGET_PAGE_SIZE - 3) {
         /* 0b1111_0xxx_xxxx_xxxx : BL/BLX prefix, and the suffix
          * is not on the next page; we merge this into a 32-bit
          * insn.
@@ -11809,7 +11809,7 @@ static bool insn_crosses_page(CPUARMState *env, DisasContext *s)
      */
     uint16_t insn = arm_lduw_code(env, s->pc, s->sctlr_b);
 
-    return !thumb_insn_is_16bit(s, insn);
+    return !thumb_insn_is_16bit(s, s->pc, insn);
 }
 
 static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
@@ -12108,7 +12108,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
     }
 
     insn = arm_lduw_code(env, dc->pc, dc->sctlr_b);
-    is_16bit = thumb_insn_is_16bit(dc, insn);
+    is_16bit = thumb_insn_is_16bit(dc, dc->pc, insn);
     dc->pc += 2;
     if (!is_16bit) {
         uint32_t insn2 = arm_lduw_code(env, dc->pc, dc->sctlr_b);
-- 
2.20.1


