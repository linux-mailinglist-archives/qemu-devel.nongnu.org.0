Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC031C122
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 06:00:18 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38630 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQObx-0002nt-1i
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 00:00:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36751)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hQOar-0002W6-SB
	for qemu-devel@nongnu.org; Mon, 13 May 2019 23:59:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hQOaq-0003f8-Qu
	for qemu-devel@nongnu.org; Mon, 13 May 2019 23:59:09 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:38009)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hQKxg-0003hH-0C
	for qemu-devel@nongnu.org; Mon, 13 May 2019 20:06:28 -0400
Received: by mail-pg1-x52e.google.com with SMTP id j26so7598243pgl.5
	for <qemu-devel@nongnu.org>; Mon, 13 May 2019 17:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=FH8HIUisgKxx/wO5rpgn7QNUU9WJqnDYvJ4xHC9+spw=;
	b=x5xwk29ZL+7vqT3GgQxBoj/4VOc1XPju6PBEcsc8Eqv3XDhGGnkhpkgCpvamxTXd1J
	Cx0rNBEuubgxMAyw6mFd9Q5CJD95kgyzFkw7/HDuqMPPeTskFTCVaAaH+jVtVimjI558
	hJ2pC9wLje2XitkE3qBtjFIxZ36euZtSP//gFw1Cw00hpKpH64f4X1ElxGhP6RQOKvaV
	YKeTT6USHEgt/1qSQMXDq6qNqyJtBs878svnZZ8u6xOGO16mXmTI06Y3tJuTptIGNP1z
	HvyRffbwDirGwcAuIhN47y9MyQ8MUFrEDNMlY6ChPnCz4kx903qM4awoFHFLMPd9H2Ft
	YpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FH8HIUisgKxx/wO5rpgn7QNUU9WJqnDYvJ4xHC9+spw=;
	b=mlrSxC+D+ZLwhIvATDETUQTLvlh0Tb5DODRPjHhg3J/q0smQDZNcLZh5ET2WWGGrnI
	kejchTEdXqvYLDhZ1Hfw1elLw2jo8TwZgNGq18PjxdeEQGBtmzE4SF3uJcuR3qsPQxVH
	o7O7nbF7mosa0shEeYEFDohKOPTJEeP8BYHmvfTofzzEQgMLEYl4nc6euPRUQafLocHy
	eIVI5QnhhlpccsWFpd5SRvLbbxjQDVM+dfhqd3b8fEfhQPZaM2XJ9soUZOi3k7rKM1oi
	Sx0P+0CyG9yD3mIQyOpvKjMDRA6YwfZqttKxfER9OeB8MXJFOUnkPyswUVgkkOA6enOO
	o7SA==
X-Gm-Message-State: APjAAAWGCl/g8ftQybSP+5y0wbySDh0cZESxrrfsk+Lg7LuAPyghbqHe
	/xgPns32ACM0WWawsEzFX+bNOprirHk=
X-Google-Smtp-Source: APXvYqxzQQa36EShhQexzfLJHP9KKtGQi8SQh/c1nMYCo6xtwX3eXxpwUYEE2HHQynEHITQhUu9fhA==
X-Received: by 2002:a63:5443:: with SMTP id e3mr34425763pgm.265.1557792376633; 
	Mon, 13 May 2019 17:06:16 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231])
	by smtp.gmail.com with ESMTPSA id u3sm238151pfn.29.2019.05.13.17.06.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 May 2019 17:06:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 13 May 2019 17:05:35 -0700
Message-Id: <20190514000540.4313-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190514000540.4313-1-richard.henderson@linaro.org>
References: <20190514000540.4313-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52e
Subject: [Qemu-devel] [PULL 26/31] target/ppc: Use tcg_gen_abs_i32
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linux.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20190423102145.14812-2-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate/spe-impl.inc.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/target/ppc/translate/spe-impl.inc.c b/target/ppc/translate/spe-impl.inc.c
index 7ab0a29b5f..36b4d5654d 100644
--- a/target/ppc/translate/spe-impl.inc.c
+++ b/target/ppc/translate/spe-impl.inc.c
@@ -126,19 +126,7 @@ static inline void gen_##name(DisasContext *ctx)                              \
     tcg_temp_free_i32(t0);                                                    \
 }
 
-static inline void gen_op_evabs(TCGv_i32 ret, TCGv_i32 arg1)
-{
-    TCGLabel *l1 = gen_new_label();
-    TCGLabel *l2 = gen_new_label();
-
-    tcg_gen_brcondi_i32(TCG_COND_GE, arg1, 0, l1);
-    tcg_gen_neg_i32(ret, arg1);
-    tcg_gen_br(l2);
-    gen_set_label(l1);
-    tcg_gen_mov_i32(ret, arg1);
-    gen_set_label(l2);
-}
-GEN_SPEOP_ARITH1(evabs, gen_op_evabs);
+GEN_SPEOP_ARITH1(evabs, tcg_gen_abs_i32);
 GEN_SPEOP_ARITH1(evneg, tcg_gen_neg_i32);
 GEN_SPEOP_ARITH1(evextsb, tcg_gen_ext8s_i32);
 GEN_SPEOP_ARITH1(evextsh, tcg_gen_ext16s_i32);
-- 
2.17.1


