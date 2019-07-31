Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C767C8A0
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Jul 2019 18:27:34 +0200 (CEST)
Received: from localhost ([::1]:42728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsrRt-0001To-U0
	for lists+qemu-devel@lfdr.de; Wed, 31 Jul 2019 12:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45059)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hsrPh-0004l2-Nb
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:25:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hsrPg-0000Hc-NU
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:25:17 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:36972)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hsrPg-0000FU-HE
 for qemu-devel@nongnu.org; Wed, 31 Jul 2019 12:25:16 -0400
Received: by mail-wr1-x443.google.com with SMTP id n9so45294692wrr.4
 for <qemu-devel@nongnu.org>; Wed, 31 Jul 2019 09:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JKs278UKgH4oI2AFtIL9RfBZue/0oRf2Q9p+k2Ejw74=;
 b=eWzP6JfGc/TdhIDLLu3kHnqQ+rheOQSCb3pKHq/N9m/ssu6FjF3l3O/0+wi6DSJQp/
 cluN+FpQ6n6mq/czY0vzk21mkaD+733XZzj+nHnuQT/6mN2BfXUm0qPuCG/s+0ZtaxdY
 HuY5JsxfcP4o/ByMZwiDwJ2OCDRUoYH4GEeAMkfC4SZ3zjZNJbtFxVcJzfmbc10NDp33
 o+Q9gskb1LEebSufpmhlFswqCUHx4BSDMuPINzTUYC6PrwnRbNIKho5ikgULfin9bYkb
 idc9ksUr5Q0CU5D6N2Q7NVpvrVhAHBFjbfV1ZzYRfOstwF4mr+LWGh99TaUoZ2+aOcuC
 k3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JKs278UKgH4oI2AFtIL9RfBZue/0oRf2Q9p+k2Ejw74=;
 b=JEay9ugG+ghNXoktUPt6EGz1ulXfJ9cqpwIgvPbqSzVO2NNjLjjwbJZn68dehiGGz6
 tSBNqzeuqNtUqDrbzPBuH0g70Qj/eLpcBP0cAgGNVbgr3XBD+ftu0JP+nusjSm2yOAXD
 PQSawfKgsEDQDLlt1KaHVi/bCMmCn6c+jZ9KbLr/MW11Dvxeugma3Zy1LZxLlrGb/GFJ
 pCDyFk1tAUMYFzKz7KMrwdNSqnBHdxtzH2bv0AJSZ6Cy461uToq2PfY1kpY2zDqeKmdF
 Rk2Zcdkos1JjiSV5ZWbTe50x04qgHgApA9QZdQmnMatSdZom93OCm58X61XSdNmQwe70
 wqyQ==
X-Gm-Message-State: APjAAAV/guuz487cgHaOXRbjvcbWeJgIuBnanBjITAuSvmUhBru6D+yr
 jrzeYYKNVTd52G7P8ztEq2ImlQ==
X-Google-Smtp-Source: APXvYqxZ2dof9W93CZDoCyrWkvL+ATntb2jP3O3IDDxWtTATIVVd65J1w2vk5tFtGHkAclLcbPFjpg==
X-Received: by 2002:adf:efd2:: with SMTP id
 i18mr133031558wrp.145.1564590314549; 
 Wed, 31 Jul 2019 09:25:14 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id f2sm66260974wrq.48.2019.07.31.09.25.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 09:25:12 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D56A31FFBB;
 Wed, 31 Jul 2019 17:07:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 31 Jul 2019 17:07:01 +0100
Message-Id: <20190731160719.11396-37-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731160719.11396-1-alex.bennee@linaro.org>
References: <20190731160719.11396-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PATCH v4 36/54] target/m68k: fetch code with
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, aaron@os.amperecomputing.com,
 cota@braap.org, bobby.prani@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/m68k/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 60bcfb7bd0c..92785befaac 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -384,7 +384,7 @@ static TCGv gen_ldst(DisasContext *s, int opsize, TCGv addr, TCGv val,
 static inline uint16_t read_im16(CPUM68KState *env, DisasContext *s)
 {
     uint16_t im;
-    im = cpu_lduw_code(env, s->pc);
+    im = translator_lduw(env, s->pc);
     s->pc += 2;
     return im;
 }
-- 
2.20.1


