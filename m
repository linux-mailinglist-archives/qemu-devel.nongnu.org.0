Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA7346731
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 20:12:11 +0200 (CEST)
Received: from localhost ([::1]:53988 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbqgN-0003M5-28
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 14:12:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34123)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hbq0N-00076x-A9
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:28:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hbq0K-000452-EZ
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:28:45 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:56036)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hbq0I-0003yB-Q2
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 13:28:43 -0400
Received: by mail-wm1-x343.google.com with SMTP id a15so3145708wmj.5
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 10:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j/CmdxYOGc9bGjlEPT/VLtkTFw4z76NfPGE78+zNw14=;
 b=z3ZbT0GUtX5OwM6uRBuEDG/RTBK15MjFe6skn6MeONPNFc/kyHqOsUUjfAmmPrJvYd
 SJLF5UWgaWFTO58SKZWBR09r+9JrgIrUlRvuDy4or+DO+vv7FulfQOCZLyS/pH3VsyHo
 v4pT78XQs0BgSxxurZIMAEEIqQ8BtIO+ob5JTakc+/SPIS4f9pgCxv2XgDxddE8mPW/W
 i7tw+BPxZVuB9tr/QGpUl310AoT5jJhkYktn6GIocFzhrFNZog44x/SubCkUVX1z679A
 wPg4D7/cLhLgzIJdjlARvgSA+ZdmUoYVweKKAZhNk4mIG4+LQl13iiQuFothbZDUFN51
 8zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j/CmdxYOGc9bGjlEPT/VLtkTFw4z76NfPGE78+zNw14=;
 b=a5DJooKlcY/HSYmO5vFwkVhCQVMjAihl58bxWChYhUynotyjl3C+iDtNtvQEj3Fzxh
 rgjgAIVffDVUQoXMhMa9koTDofST0uFE9GNUVIPuS3X3d2Hu8fPSlG3QwwybbWThtw+7
 wKLHkEVUU0Q9pb2oGKgcqXojspIJiYENO7o5THZOZcZod3LxGmwgm1e+B3oAo0clpRFK
 XHNK23bEBAOqp7ChtIavBllkx5nEABfufIIhUoN4/8GI/a/HKRoBvhCoekMAb9j5Ka91
 f9sikwbzHl10Scvq7IicBa5qCZU6yUBVxxxAHGNTm2hq22Vs3zmZRkqFtcpnbJJx/zoD
 I5bQ==
X-Gm-Message-State: APjAAAWP9DQ125zEOGLWHpmFYz+lm7mEagG1qoyHSlall5xQkbLepLGG
 E5kEYN4QvJAAAnT+tUSI4/5PwbS1RiA=
X-Google-Smtp-Source: APXvYqytXUg2PDOj/GmEuDip87jfeD5HQVRvfx2+JYKWbbWtyzfOgQ6dVy361Uwdswbvi4DEnBwVLQ==
X-Received: by 2002:a1c:968c:: with SMTP id y134mr8267656wmd.122.1560533319750; 
 Fri, 14 Jun 2019 10:28:39 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id t14sm2431462wrr.33.2019.06.14.10.28.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 10:28:36 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2C3EB1FFB4;
 Fri, 14 Jun 2019 18:12:03 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 14 Jun 2019 18:11:40 +0100
Message-Id: <20190614171200.21078-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614171200.21078-1-alex.bennee@linaro.org>
References: <20190614171200.21078-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-devel] [PATCH v3 30/50] target/hppa: fetch code with
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
Cc: "Emilio G. Cota" <cota@braap.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
---
 target/hppa/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 188fe688cb..36a784e293 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -4217,7 +4217,7 @@ static void hppa_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     {
         /* Always fetch the insn, even if nullified, so that we check
            the page permissions for execute.  */
-        uint32_t insn = cpu_ldl_code(env, ctx->base.pc_next);
+        uint32_t insn = translator_ldl(env, ctx->base.pc_next);
 
         /* Set up the IA queue for the next insn.
            This will be overwritten by a branch.  */
-- 
2.20.1


