Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D441FB177
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 15:02:33 +0200 (CEST)
Received: from localhost ([::1]:34976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlBEW-00080U-VI
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 09:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jlB5u-0003pX-MJ
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 08:53:38 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jlB5s-00006d-VB
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 08:53:38 -0400
Received: by mail-wm1-x335.google.com with SMTP id y20so2949710wmi.2
 for <qemu-devel@nongnu.org>; Tue, 16 Jun 2020 05:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mRZQZj1Q9wEv2vot0r2LSgKuWpAPT3iQugKUo+0zSQY=;
 b=IC8IaV2fZgPwI979TOJquet7moYMCnsWS/l1sIEVkaU5vov5UlKaA4L/+YM4+SX3Rv
 1voPe2wP1QZwVRvy4Jz2PJFTDZ0417il9CJkjRx8LImMe5zqJoSfMLpqJqY6Hhlfz6LD
 qCGeksL61nvBiZ9OhrEXIEm3t85Kl2ncAAg5xC151dR3mQJcJfeRlUeAHbGG1aIQbeED
 gNNLl21tFlgohpzI5aPswbc6pOK4OlD+EcBrkMBzkfUvooVSJxJ2iIXMcuJibMa4aQaZ
 1hvYRHHxkNPSummoWc+eWPxh39+HK7chqCLIKmzG+eKHay8R2NZAVe96baaas+6I8L0z
 QjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mRZQZj1Q9wEv2vot0r2LSgKuWpAPT3iQugKUo+0zSQY=;
 b=b45kr5cA7JGzOi7EiN262y5dSPdQ9Fi08xzx6KWy7vP9vO9X4h7wbes0LSqLewOzqT
 L6UDKr52DMTda1P5PrNKtPGhc9ZYIt2fuYficFa9Lx+4xMGz12WjPz/F0pvq3Hl2SE5w
 sDvc4TZ+FQaj8Ywr66e4HleQtEb1cZ91IuCf2pT/b93HVDK6EKnM4h+5f0Sslb37x2a/
 sy2Jxv44mv4RhUldy/tJRTfvE5TzzJKp+QEHPXQZTR4w6li3vQ7LllRedJrbI1V64L2y
 VK3yxXJD30Q/DlsEtlnLLV0zeRJxmlmzu/Pq/qoQjArCjw30qodljFbrxvHeWZFgEGJt
 bYEw==
X-Gm-Message-State: AOAM5312Zvtdj8qFRSa6udvf2WpSsD9PxJXuDlkwaoG9tr4OAZb2hUBN
 xKSfOlZLqw05V+1Uv3OcGqvEcg==
X-Google-Smtp-Source: ABdhPJykkZTIhTHWZZ4g3o2YPIVd0pSMsUELASEQdukTf1E73wTvTqgW1AB5woCWXbMuiglZ9tsBUQ==
X-Received: by 2002:a1c:2044:: with SMTP id g65mr3420851wmg.16.1592312015594; 
 Tue, 16 Jun 2020 05:53:35 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b8sm29907419wrs.36.2020.06.16.05.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 05:53:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 11D5F1FF96;
 Tue, 16 Jun 2020 13:53:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 08/21] qht: call qemu_spin_destroy for head buckets
Date: Tue, 16 Jun 2020 13:53:11 +0100
Message-Id: <20200616125324.19045-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200616125324.19045-1-alex.bennee@linaro.org>
References: <20200616125324.19045-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Robert Foley <robert.foley@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Robert Foley <robert.foley@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
[AJB: add implied cota s-o-b c.f. github.com/cota/qemu/tree/tsan @ 1bd1209]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20200609200738.445-6-robert.foley@linaro.org>
Message-Id: <20200612190237.30436-9-alex.bennee@linaro.org>

diff --git a/util/qht.c b/util/qht.c
index aa51be3c52f..67e5d5b9163 100644
--- a/util/qht.c
+++ b/util/qht.c
@@ -348,6 +348,7 @@ static inline void qht_chain_destroy(const struct qht_bucket *head)
     struct qht_bucket *curr = head->next;
     struct qht_bucket *prev;
 
+    qemu_spin_destroy(&head->lock);
     while (curr) {
         prev = curr;
         curr = curr->next;
-- 
2.20.1


