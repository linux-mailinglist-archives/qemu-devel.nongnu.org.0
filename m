Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 408211EFD0F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jun 2020 17:55:26 +0200 (CEST)
Received: from localhost ([::1]:37944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jhEgn-0003PU-7X
	for lists+qemu-devel@lfdr.de; Fri, 05 Jun 2020 11:55:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jhEbD-0003W6-GY
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 11:49:39 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:39478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jhEbC-0004JS-Lo
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 11:49:39 -0400
Received: by mail-wm1-x32f.google.com with SMTP id k26so9608291wmi.4
 for <qemu-devel@nongnu.org>; Fri, 05 Jun 2020 08:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tRdpUcQhIJndhkGIh7lOShh9mZ16AUqZ+rVZ66b8A6w=;
 b=b0xa3+dIGMNHm9VVf930wKq8TQXVrRkmUSsINv+R3c/F3b896oial8BKM1fvq4xkL2
 xOzO4sf1ox35yE/v78kxCCtJpKHOO7RyPjtyy4kRPAe5w5CMyxDN6jjYm38eJ4k8lclN
 /U+UK7z7a3w5BLwR4DhNV4I9033OwCjQq++nAqcznNHLWv34WvFbB+BA7d6BRzEWRSxP
 EPZhI89D/iKNoab4fBTF9fLzEoMsaYw//ECwsAHq4na8qykv4Mgs2H1ij0+TSGY59BkT
 sx5bSor1kwx/3K/2/Xrq8Hc9L3TLdq7pZDTjnnUIaVpSjQFZXE3GlVd3fOtHyYY7lneV
 YMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tRdpUcQhIJndhkGIh7lOShh9mZ16AUqZ+rVZ66b8A6w=;
 b=cfDE2wXHfML0mhz6dSPQ34yzcG/OExYXstNnNtoCAHlt2bKZLllP5MMEVqeEAEB/oR
 bAdSDbb6th5KtTOwt28aCY1S9oMkIWIKpfpnl0gnJ8K1kqTw4g1G1/TOITb+MZhyEuB0
 I/yQtb9Lu7NAVbnfVvRO64B8sh+OcwEpEfXAMJ8kaN/9pp7upaOY3TMuWvWuzen7/SH1
 dhYHFVKEWE6sXkq+vIOmE2c/NBdvnjUQkAyKs/YAANAiQDOvCkLDmmWVbA1jb1oGV7VE
 DZ/10OXrMr5MZV7LQdkP2Otfw9YnvfjQbSH+XqvEetu5+TKdlaySOrxhMm+zx6Krcpah
 IoJw==
X-Gm-Message-State: AOAM533G75F0A9ENLEHfus3Nc8ELdEJ3UkkRsP7oMzP6MPjwsO4G8IQb
 TJ+9Zelqk/QTaEQk7ZD0PupdjK7L9g8=
X-Google-Smtp-Source: ABdhPJw0STcqxjjNfVO2jzA7mxO4DebpN94MN8KnmnVlyoeIKD0Y4Fzng/GIbQoYi2lBFzHY04pbag==
X-Received: by 2002:a1c:7305:: with SMTP id d5mr3423664wmb.85.1591372177268;
 Fri, 05 Jun 2020 08:49:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m129sm12591419wmf.2.2020.06.05.08.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 08:49:35 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 340F41FF87;
 Fri,  5 Jun 2020 16:49:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 01/14] qemu-plugin.h: add missing include <stddef.h> to
 define size_t
Date: Fri,  5 Jun 2020 16:49:16 +0100
Message-Id: <20200605154929.26910-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200605154929.26910-1-alex.bennee@linaro.org>
References: <20200605154929.26910-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: "Emilio G. Cota" <cota@braap.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200524202427.951784-1-cota@braap.org>
---
 include/qemu/qemu-plugin.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 89ed579f559..bab8b0d4b3a 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -12,6 +12,7 @@
 
 #include <inttypes.h>
 #include <stdbool.h>
+#include <stddef.h>
 
 /*
  * For best performance, build the plugin with -fvisibility=hidden so that
-- 
2.20.1


