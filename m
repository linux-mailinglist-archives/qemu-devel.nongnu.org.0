Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EAF318B18
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 13:48:53 +0100 (CET)
Received: from localhost ([::1]:37968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lABOu-0006Ph-PA
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 07:48:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lABBg-0003Wr-3N
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:35:16 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:35415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lABBe-0006qf-Ie
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 07:35:11 -0500
Received: by mail-wm1-x330.google.com with SMTP id n10so3706218wmq.0
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 04:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eEkBUwSW8IrSA602NYTa31NYQltmUAywbOzfT8fIKVM=;
 b=BcJeLVh8+5fuVJ/s/i28/vjB7VE14Ec+8xSbifqBDE+IcZj58dffMtAnnFB3Xz+uLe
 UtKNZz2WtjdwY2F5ik4FC0coUpnqYofXmVMm2rGzpn2w+7GqaZkvJ/JJI0N7VO6DMGMB
 fxJPDZK1xUOBlEUs0gkdmuOdtbEefZjYpvoB38EFIjrGYfvRzChs4KvvqIAWrTmKUMSw
 6jPPoJO0zXZY3eACfbJEn//lE484urXtVTTMrE+TdWQfeqwFp5MD5Vy7/hTxjck12EUu
 ueDYjPJ3K6nKfBuArxEvBvXVtFWC236Fo8g8nhCoxSqj7XgQcolPCg9AkJMqsx2/M/Ui
 uaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eEkBUwSW8IrSA602NYTa31NYQltmUAywbOzfT8fIKVM=;
 b=DLOiHASTaBvL4rGwaynFAz5EG4dHbYmH4lm+s5wP5JjqrzwrSv9Nt9S7vakG2kmkPX
 AX8n07SLRJDl3KVKxwjuPWL8aRhwhjAoVVrk/Z1kF7DTWHyCCdCeXf9OBNmbNtx4wIM0
 fSQrK6cLSb2nfBFk6/IB4GorhLQL/P/7HvWhHg2cfcYDoZ8JkQ026jI6lTCWb+U4cjP1
 qQZo+XKbXAr6PKw2UTpBuSpjLngc3ntzRgk1lBaOY95EHlVhS5FPlwHpcyiDoxAk5Ujk
 ce/VXkKE9FogoIXQ/N5iTtQzOXzj0MofaMJWYjh3zX/ZI/Kc5+OsmaM5GKD5so0/MyHu
 cx5A==
X-Gm-Message-State: AOAM530W+XykCukXOsdiC8vEHYfLEvo4IGglEME6ymmTnKCC2BA3N57w
 LUe4GPAwMcOyNdFhqUcO5hVRrg==
X-Google-Smtp-Source: ABdhPJw9pmmf2igJyNH98qkTw7hJ33pAyqwCpx8Iymce3+WDek7uG6sf2NayJ50826bI3VEIux9TaA==
X-Received: by 2002:a1c:720d:: with SMTP id n13mr4840305wmc.103.1613046908627; 
 Thu, 11 Feb 2021 04:35:08 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u14sm9194549wmq.45.2021.02.11.04.35.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 04:35:07 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7C4041FF7E;
 Thu, 11 Feb 2021 12:27:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 15/15] tests/tcg: fix silent skipping of softmmu gdb tests
Date: Thu, 11 Feb 2021 12:27:50 +0000
Message-Id: <20210211122750.22645-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210211122750.22645-1-alex.bennee@linaro.org>
References: <20210211122750.22645-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org, cota@braap.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/multiarch/system/Makefile.softmmu-target | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/multiarch/system/Makefile.softmmu-target b/tests/tcg/multiarch/system/Makefile.softmmu-target
index 4657f6e4cf..625ed792c6 100644
--- a/tests/tcg/multiarch/system/Makefile.softmmu-target
+++ b/tests/tcg/multiarch/system/Makefile.softmmu-target
@@ -27,5 +27,9 @@ run-gdbstub-memory: memory
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/memory.py, \
 	"softmmu gdbstub support")
 
-MULTIARCH_RUNS += run-gdbstub-memory
+else
+run-gdbstub-%:
+	$(call skip-test, "gdbstub test $*", "need working gdb")
 endif
+
+MULTIARCH_RUNS += run-gdbstub-memory
-- 
2.20.1


