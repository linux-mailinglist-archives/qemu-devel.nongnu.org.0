Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD927887D2
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Aug 2019 06:14:07 +0200 (CEST)
Received: from localhost ([::1]:34772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hwIla-0006pi-UN
	for lists+qemu-devel@lfdr.de; Sat, 10 Aug 2019 00:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34626)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jan.bobek@gmail.com>) id 1hwIki-0005AT-H8
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jan.bobek@gmail.com>) id 1hwIkh-0004CM-KE
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:12 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:37148)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jan.bobek@gmail.com>) id 1hwIkh-0004BT-Fk
 for qemu-devel@nongnu.org; Sat, 10 Aug 2019 00:13:11 -0400
Received: by mail-ot1-x343.google.com with SMTP id f17so5087907otq.4
 for <qemu-devel@nongnu.org>; Fri, 09 Aug 2019 21:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WFpvXIDyuG9TPH/GD9uG23x87TyOtajUpKaxr9QGUcU=;
 b=RpaTyTmVKcGAIM1HX21JZOZBOh8UEOX0ZsJIuPKhkHGE/WmYpsgwVzEtVg9+/19kBK
 b1OIyKwcIKaJvw2qOJX1sb1qDb3hHfcYNtxE7C8Kb92fa+pizIhFrcF1CzcsmfyXC26Z
 Leeu9q4/HNJ0Zm8h/IkXUac3GKpt3dnFTzz/lmbtSf/0nH0TV3tbuBbKqppyz4DMeCub
 PiAFvqUZGFnA+c1Ld4PjGQn/w/E3D6M4sKjJ1mMSe/JqQM7QfkjWDyfMPrdEkhrNJETv
 u4hqUcUhJxOYvpaANkHHkR54t3nkHmJiRVkDmUxZla1joHkirnOeilsixqMa+dJnlCow
 6Rdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WFpvXIDyuG9TPH/GD9uG23x87TyOtajUpKaxr9QGUcU=;
 b=NOOioP8Xun84XVhGleO0CfVSLWhpHOEiDbA5ZP6OGj4bNGulHgu76X5tMQTAWToYWa
 c166uq6w+ShNC2aQgepXqWGWlfLpQ2uauVPcvmFg5RABZcCg/ZgXHf47QOZdE632clee
 oh3w1vid80tPwPp+KRiyFx3+Y+UbTLSjGntuZbFASz0vIWfvhlEtsXu/7LK/q0IsCxkG
 BjkCcCLsXj1MDBDQ1QooAmJlLcpVFVWgn5U+2/T9O75KtafEPMtSI+4mGZZ/5f7TyFBt
 hD8bXNFW3Bu9Cu90XhKtXa8flfGw+N05lGS+ksEOfVVU8Zy+ZQbip0DZ4ASM9FsFsatd
 62Qg==
X-Gm-Message-State: APjAAAWQc8aUHhURtE8OMphpaR5KY9k8bI1cfmgb7ElsU6lqxVbfUCU4
 dkURua8gox/r7LsfSKjfJm9E16aH
X-Google-Smtp-Source: APXvYqzR9J3UCrQYP49IHAu+drLfiRs0XY3yyJ5VCGfx+0f57SW3Jn9hoi3M5aAFyGV4t/C+jwP4aw==
X-Received: by 2002:a05:6830:4b:: with SMTP id
 d11mr7533790otp.106.1565410390716; 
 Fri, 09 Aug 2019 21:13:10 -0700 (PDT)
Received: from dionysus.attlocal.net
 (69-222-133-165.lightspeed.tukrga.sbcglobal.net. [69.222.133.165])
 by smtp.gmail.com with ESMTPSA id f84sm33383540oig.43.2019.08.09.21.13.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 21:13:10 -0700 (PDT)
From: Jan Bobek <jan.bobek@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat, 10 Aug 2019 00:12:19 -0400
Message-Id: <20190810041255.6820-4-jan.bobek@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190810041255.6820-1-jan.bobek@gmail.com>
References: <20190810041255.6820-1-jan.bobek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: [Qemu-devel] [RFC PATCH v2 03/39] target/i386: reduce scope of
 variable aflag
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
Cc: Jan Bobek <jan.bobek@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The variable aflag is not used in most of disas_insn; make this clear
by explicitly reducing its scope to the block where it is used.

Suggested-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
---
 target/i386/translate.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/i386/translate.c b/target/i386/translate.c
index c0866c2797..bda96277e4 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -4493,11 +4493,14 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     CPUX86State *env = cpu->env_ptr;
     int b, prefixes;
     int shift;
-    TCGMemOp ot, aflag, dflag;
+    TCGMemOp ot, dflag;
     int modrm, reg, rm, mod, op, opreg, val;
     target_ulong next_eip, tval;
     target_ulong pc_start = s->base.pc_next;
 
+    {
+    TCGMemOp aflag;
+
     s->pc_start = s->pc = pc_start;
     s->override = -1;
 #ifdef TARGET_X86_64
@@ -4657,6 +4660,7 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     s->prefix = prefixes;
     s->aflag = aflag;
     s->dflag = dflag;
+    }
 
     /* now check op code */
  reswitch:
-- 
2.20.1


