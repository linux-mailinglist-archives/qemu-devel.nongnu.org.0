Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C4F1F3837
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 12:40:04 +0200 (CEST)
Received: from localhost ([::1]:35010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jibfn-0000jJ-Qe
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 06:40:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jibe3-0007Zk-GN
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 06:38:15 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jibe2-0004N5-8w
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 06:38:15 -0400
Received: by mail-wr1-x436.google.com with SMTP id l11so20724905wru.0
 for <qemu-devel@nongnu.org>; Tue, 09 Jun 2020 03:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w3tU0oQT5iXZ75VzNmUziXK2vuiXpZ8kg2IAT1OBASY=;
 b=ms/DOMYHzBkJkfSCtPb62tbYYllhfKrqIrKk/v52fWiMAkFz6YJLbLjZ4H2w7mzvbQ
 Q64RfkOEBeKVq+eKKo8+PkPxu2K5F+LivHy3IAZirPnzaWgL9wPwXBBmY2w+wykwXkRn
 6LB75s9YPY1es7UzPJpLBiWOOT2nAVvU7sKIWdnA4ecExcw+HN11/Y2CAdVXS1WRbNQ6
 Alf5fAXw+c5p4Cfty7IhbPh8uDfpnm1UVhgjBo61ghGNNjwREJH/u+1NPNJ4NrRU8lyH
 5aApnqRmHj0gtO69fMgQ1VGdygeLow7WlqZS/zfM8CtaBb70Z+uRvCyQXr8CiE0Zeuy5
 chbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w3tU0oQT5iXZ75VzNmUziXK2vuiXpZ8kg2IAT1OBASY=;
 b=atwzf75S1vzFtEgUP0Lhys1Up+7Q14EMuZxxNOouLi97Sl0Cntv6JlYjxvddmUbUWI
 SVrYIqeioMoB2QkhfLjG8XEknTWdRKYPxY0LrW7EYl6cN2lWH5/a8i6l7b81fFb9xK6G
 W3r+vjlu+NRRX28hVePPka+uD3cJQC839pnHua2oZ7Z8u7KyH5RwLx60NqD0bobgGbxa
 VOn0FHgKwszLtc0KGPdKMvP7i/Y0uD8XeTZVJG/frUhyBMEZcW8eT/DUIvlLJbG8hPM8
 2jtqUmQvI8tdoKPcYyhHAGMYkbCWbspCBoLLz/HaDSqI55TPZ6JFFBeI+CZCOvnKf3Sx
 ERCA==
X-Gm-Message-State: AOAM531FwFTp1W4pzM32wPPyj9sqjqpDGzVL64w2pMrArBB9GpAIaLNK
 lD/NQPXFY2y9dNh1OtuukLPdVg==
X-Google-Smtp-Source: ABdhPJwQDRwZJ1z5FJt9Z6mh8xULt8kef3Xu4Xw8J+b/+lPI10np+2IhtghgajwgJtjIq5Aak91+zA==
X-Received: by 2002:adf:f450:: with SMTP id f16mr3693578wrp.307.1591699092874; 
 Tue, 09 Jun 2020 03:38:12 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q11sm2879776wrv.67.2020.06.09.03.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 03:38:10 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 13F011FF87;
 Tue,  9 Jun 2020 11:38:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 01/17] qemu-plugin.h: add missing include <stddef.h> to define
 size_t
Date: Tue,  9 Jun 2020 11:37:53 +0100
Message-Id: <20200609103809.23443-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200609103809.23443-1-alex.bennee@linaro.org>
References: <20200609103809.23443-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200524202427.951784-1-cota@braap.org>
Message-Id: <20200605154929.26910-2-alex.bennee@linaro.org>

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


