Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAEE38754E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:38:55 +0200 (CEST)
Received: from localhost ([::1]:58342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liwBj-0004Zc-0e
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livpE-00058N-2G
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:15:40 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:42716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livp2-00014H-AT
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:15:39 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 f75-20020a1c1f4e0000b0290171001e7329so1053865wmf.1
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D5Inb5L/9oK+/2nTuHYzlDm1Dd5BgSxGl3J/R/np3c0=;
 b=yThcQAjHPXzskrS/7h8G3qn4/jTFlwwzQAMB9Tw3YFMSZxXIGowYlCEUxe9W/NZxww
 IdHfkM3WeJUcnxbEgbQ1qeFC8XJPyxAsHmpJy6lrTV/ITL4BLXbQ0iWZIc5DiQuXIGU/
 Wy3eTnUS6SnDW+EcJguq98/he2fAqlChypLQSaAzZ44qRRTfPDAgre+LNdUIWaawxdEm
 5cfqo1pl4zIvEhIdDs1RP27c7HwTunJZRVCo0iWVfDprozAYBZcFHZmVOxJ1Ew9NvNSA
 N6A1EedvcOjiyzwbfneuk7o28HWhDi+l/5QuHJSTGIiFdKQIIPCLEiMl5dzYAy5gbzJm
 Balg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D5Inb5L/9oK+/2nTuHYzlDm1Dd5BgSxGl3J/R/np3c0=;
 b=jy+krfAWMFXl5T8ElpubKa1jx/1y6oh09k8I+axrbJVCgfzg4xyuJSryNNypJFDJFu
 WXapOQsctiYUrImV4H8cnIVlMaVQErT72Q+I1UBdAVbFW02M4o6FBIS+QGf0rVLYCZdv
 z4w8cGW54DeI6ak3EcTIOrvrP/mrmgrbS1d+WXl8mqpSrvj1FhUOE5ZItI1ExrknmZ6j
 Ihhh+E2Sz03+xfehP7fy8d19iwaqekWGCIeZz/ACZra5sVNhMCztOj3mrzpeAHTH39iG
 Lz+YXmBsqKARJey3wGv7BeRiMuxsiGxaFiSsCP2euW+93QN6Uro4pGv2se/vLfUZ/R46
 pG8g==
X-Gm-Message-State: AOAM532rP8MY3Tv3FKO63iOaI1woyWsLUyOzCIPegATUX26hZEAJiH7+
 eUXos324EGm7+cY7n/8Nu1t6UA==
X-Google-Smtp-Source: ABdhPJwyBye6Z5JlL9/bC3d9uS6jb3q8rQE6wWmZa8OgMd1e7H+VzdKCp0FllMCGc6GJdYM6SdBBhw==
X-Received: by 2002:a1c:638b:: with SMTP id x133mr3854378wmb.182.1621329325818; 
 Tue, 18 May 2021 02:15:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a16sm8843047wrw.62.2021.05.18.02.15.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:15:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 84B761FFB3;
 Tue, 18 May 2021 10:07:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 27/29] tests/tcg: fix missing return
Date: Tue, 18 May 2021 10:07:18 +0100
Message-Id: <20210518090720.21915-28-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
References: <20210518090720.21915-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This was picked up when clang built the test.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210512102051.12134-30-alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

diff --git a/tests/tcg/multiarch/system/memory.c b/tests/tcg/multiarch/system/memory.c
index eb0ec6f8eb..41c7f66e2e 100644
--- a/tests/tcg/multiarch/system/memory.c
+++ b/tests/tcg/multiarch/system/memory.c
@@ -326,6 +326,7 @@ static bool do_unsigned_test(init_ufn fn)
         fn(i);
         ok = do_unsigned_reads(i);
     }
+    return ok;
 #else
     fn(0);
     return do_unsigned_reads(0);
-- 
2.20.1


