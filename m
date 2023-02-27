Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 873936A441C
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:18:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeAb-0001gr-S3; Mon, 27 Feb 2023 09:08:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeAa-0001aN-2k
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:08:00 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeAY-0000FS-9K
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:07:59 -0500
Received: by mail-wr1-x430.google.com with SMTP id l25so6371285wrb.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xWSTUmb++2mGiogMvXbqJJocrCykF9OSc1ggtSDBGQk=;
 b=KVWgdG2kE24e/aar+GrSettzPiMGN9m0BA3Gdu6FAbuk/+58aSiuz7ZnrGWtfDa8Lz
 OXLVQNqNnuMhvaH9kRaPa7eB0gUrUHXunYIEircwNPJtSbhx34kN6XyIGKPMREsYcVdo
 sbfR8WIM4obmm1wTaGV6EF+JUmTwVd5o7432loFWelGW/PUQrqT1v8J8mxR6b9reOHl+
 p4xNHwrY5Kx55hRC90eQsB6gPB3kpBTCWtx9ssTUqjcNJoa9DNS/ugRMBnjK9I1LhyF8
 QhgOwdQc4KLl5gIVSOjWo9FXx2Z3N8XvcvpjhU+/8ZX+NIkQYA5SGmsFaX0Sl+17hTpW
 6XNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xWSTUmb++2mGiogMvXbqJJocrCykF9OSc1ggtSDBGQk=;
 b=zu9IJPJaq1vQF0wYdmg7s6a1Uso+C5iAr/iAMeJbifkEXeHjzK1t6qHRCYBuhdLaIb
 +2EVwMU+63otXpJFZ75XtMJf/owFZwKhQL4fCoiSVJTnf/w6U+XiUaH0TEPgaQlMsOHy
 Gi6OL3QMh8eMERkG0TvWzYtQfFeZ7Mb1xohWpzxRMf47TE8r1Luld47l7HD5aq1yl51a
 +ODD3Svj8AgTd9vDE6Ah5ZKTZtpyiexJxtIYW1qYNly7n06QQfZJU7KMoFnXVK2fCPQp
 2uzUVKi6nZFrkBXA11uIxZpl7VJrq8g044Vts1ZyDXXlBxcVci5zCHbP3Y0tzpsnhmC7
 OJkQ==
X-Gm-Message-State: AO0yUKU6llbVBArp8wnPRLJZq/O5IWTi7UfLVYHkWMwmNxU3U/NDOInJ
 aUBGM3lsWGAKUubRTPc/e2J0Ff9VLMaxvUaD
X-Google-Smtp-Source: AK7set/NlVkftvCEjSXfABRPAaNYsdr1g+seO6fSvRX5Cj0+RfsyiSw6Soh1cyiW6nNV5753j0MJng==
X-Received: by 2002:adf:d089:0:b0:2cc:4dd4:b7f7 with SMTP id
 y9-20020adfd089000000b002cc4dd4b7f7mr932333wrh.63.1677506877330; 
 Mon, 27 Feb 2023 06:07:57 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a5d4d4e000000b002c57475c375sm7169011wru.110.2023.02.27.06.07.56
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:07:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 072/126] hw/audio/es1370: Replace container_of() by ES1370()
 QOM cast macro
Date: Mon, 27 Feb 2023 15:01:19 +0100
Message-Id: <20230227140213.35084-63-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230220131837.26292-4-philmd@linaro.org>
---
 hw/audio/es1370.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/audio/es1370.c b/hw/audio/es1370.c
index ea76c9a734..4f738a0ad8 100644
--- a/hw/audio/es1370.c
+++ b/hw/audio/es1370.c
@@ -843,7 +843,8 @@ static const VMStateDescription vmstate_es1370 = {
 
 static void es1370_on_reset(DeviceState *dev)
 {
-    ES1370State *s = container_of(dev, ES1370State, dev.qdev);
+    ES1370State *s = ES1370(dev);
+
     es1370_reset (s);
 }
 
-- 
2.38.1


