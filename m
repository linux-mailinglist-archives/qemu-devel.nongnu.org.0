Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F0BD60E5
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 13:05:53 +0200 (CEST)
Received: from localhost ([::1]:47262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJyAi-0004kc-AO
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 07:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45362)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iJy23-0006TP-It
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 06:56:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iJy22-00050T-F2
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 06:56:55 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:34903)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iJy22-0004za-8Q
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 06:56:54 -0400
Received: by mail-wm1-x343.google.com with SMTP id y21so16283819wmi.0
 for <qemu-devel@nongnu.org>; Mon, 14 Oct 2019 03:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ouhbdjwj8mfD0TiFH/h8tXJayT2ifkgem8zqWo4b7jU=;
 b=v9WBT6g9jwv5whm8VpF8ZW63fhYRq2OUCbxJ/bzgG04sSQbzSbQ7uloTcvJ0BCryfY
 3j5f2NT/rX7W7NN1nH81Eex7M1HZt1IWzzqY91Lbq2OT9/1+VP8ge8snLqPK3pWxekCx
 XwlUEwDxsgYP6iJJxraWpXqn1mrop3hWZVnCBFCQUO/ts3JpkF8Sa+AQ5JsGLb9BYpv3
 TUy+jVB5MvnPkiBb0idzqDjKmQzlZJ7ddXFoMg4Nnq9KgNsH1Ee5q6LxzUtz4KzG+Rw5
 x6KHlwR0lhj8zfnDJfOzwa5KNPeODamMd424UbheNtoxXx6Em8TYRLlXCak7T5hgVtcK
 tJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ouhbdjwj8mfD0TiFH/h8tXJayT2ifkgem8zqWo4b7jU=;
 b=NLhihYkM/gqnrfUJ6gOmMWRnDPpGgRdH1KH9KwNRBS10JMFuaIhCdjMZirGUJ8rsKS
 u+iOqUQyDg7VrqREC0mbvkxxQy0x4HgCC1zqDKxU0XatT1+Bjf9Fpt47n/DwCkndGjOb
 06KREjBzBFdj4r8pZR21WEqqHKe8DmR24PCGNPApjBp1570kqv898ZnsolylsdKobmpc
 xvuDs9Ca8XUS2ExrooOj7CD3B7eGOvpWw6lf2bp3D9CSSH0v9kctG0ewvxAaO13A+2Ml
 l5NPlDQgdotWdFaTM8WIU/KPtKso8keYWRxhlWn/7sC+Ly4cnBBzz9vrdB6GT2kTO6ZU
 QhZQ==
X-Gm-Message-State: APjAAAVOr+Uxp6LGxpvsrels1yvaJT/41mCDlPO/be/akR9i6CZ1/9kC
 YCBIE5RQ4K5hlSuJoiBjKuZRAg==
X-Google-Smtp-Source: APXvYqw+Sy+2GOVxnqGLB+VwMOkIf0a2n785ax5TTMMbu2QiA0Mb8FEE/QeJv+BYH9DZvRX1aFHwyQ==
X-Received: by 2002:a1c:e404:: with SMTP id b4mr15499090wmh.90.1571050613042; 
 Mon, 14 Oct 2019 03:56:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r2sm40163867wma.1.2019.10.14.03.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 03:56:52 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 91ABD1FF87;
 Mon, 14 Oct 2019 11:49:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v5 33/55] target/xtensa: fetch code with translator_ld
Date: Mon, 14 Oct 2019 11:49:26 +0100
Message-Id: <20191014104948.4291-34-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191014104948.4291-1-alex.bennee@linaro.org>
References: <20191014104948.4291-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
 Max Filippov <jcmvbkbc@gmail.com>, aaron@os.amperecomputing.com,
 cota@braap.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/xtensa/translate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index d20e60ce77..a99f5296e2 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -859,7 +859,7 @@ static int arg_copy_compare(const void *a, const void *b)
 static void disas_xtensa_insn(CPUXtensaState *env, DisasContext *dc)
 {
     xtensa_isa isa = dc->config->isa;
-    unsigned char b[MAX_INSN_LENGTH] = {cpu_ldub_code(env, dc->pc)};
+    unsigned char b[MAX_INSN_LENGTH] = {translator_ldub(env, dc->pc)};
     unsigned len = xtensa_op0_insn_len(dc, b[0]);
     xtensa_format fmt;
     int slot, slots;
@@ -883,7 +883,7 @@ static void disas_xtensa_insn(CPUXtensaState *env, DisasContext *dc)
 
     dc->base.pc_next = dc->pc + len;
     for (i = 1; i < len; ++i) {
-        b[i] = cpu_ldub_code(env, dc->pc + i);
+        b[i] = translator_ldub(env, dc->pc + i);
     }
     xtensa_insnbuf_from_chars(isa, dc->insnbuf, b, len);
     fmt = xtensa_format_decode(isa, dc->insnbuf);
-- 
2.20.1


