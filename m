Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5387E1EBF51
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jun 2020 17:48:22 +0200 (CEST)
Received: from localhost ([::1]:60566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jg99J-0005Ce-A0
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 11:48:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jg97W-0003VY-62
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 11:46:30 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jg97V-0007cR-AF
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 11:46:29 -0400
Received: by mail-wr1-x42b.google.com with SMTP id x6so3854097wrm.13
 for <qemu-devel@nongnu.org>; Tue, 02 Jun 2020 08:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tRdpUcQhIJndhkGIh7lOShh9mZ16AUqZ+rVZ66b8A6w=;
 b=hbzcYpCUBmW9hGtiScsLFOc8rCdSX33sD+5yGjR3d/hakP7Dc2CujLcUgKrcLxgKfD
 LISb7wlPAWtpBCVtu+Q4nBIKCN0pk6nt6vWl1sbPw+/QfGy4NDAX/sy7mGskFkW/g7ka
 q4Q6WlNI7DuVcVDdG6pUv/+t3fXg2A6osRSMTmhCR7LkeXjC3uTCms2rrO3dsEfDFUop
 2ZyfKmWCb1PU13u2XKMMT8fdElrdwlWKySdBZWqltjYIAU8DPt+zW9No3U5Gb01azrX6
 xBdrHVxDpsyv+AytJZwbbAKEqsFyGQ6H0Be9JuDwtblqgEU4ZejEj0EVIdZLm+TvuMEk
 Tv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tRdpUcQhIJndhkGIh7lOShh9mZ16AUqZ+rVZ66b8A6w=;
 b=FrUFaQTlx9FSRXF1TcukSW3WiA+hIm18zOD9N9SFrXzlR8rWAmwom5yu46Ih9ppzkk
 CEnYymfnW5CsndUotL9Ba+Tt+YL/+2Ea6qCjrYRfn9a1EuLR6yDZbuyFi9MqBiJ1icwN
 YWmOgcGHHbdCWZMyHI9vRp072lSgqvN7FKp+KHq5oSKvpn4Rge6uSDWUY3CCL+qjl3zs
 FSjDI5cRbR02hpwIwCnKhe+WDqWkIe2i1u++DUy0QcnEuAflyvijuAJHfOQwhz4jYflP
 vuXiQYbTPuyd+/hq4frqkeYNWuGNE1Mdn1duif+OhGR21Ft1VXyip/xMOU3fXqkmluET
 j0YQ==
X-Gm-Message-State: AOAM532ufYQlFlHvRiYrP6PJc57C5nkSHOchPZm1n2PlFYRudGDWQieH
 IHH6PSoYX9tBkxtJDmGlM5EmGA==
X-Google-Smtp-Source: ABdhPJyDJQUcrFzr8SRiQOXcycxkWmsCGfRviuRi4k6fuxh5F+lC7mMtLdYajd29rtj+UkOzk8LUFw==
X-Received: by 2002:adf:e749:: with SMTP id c9mr29200751wrn.25.1591112787738; 
 Tue, 02 Jun 2020 08:46:27 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s5sm120100wme.37.2020.06.02.08.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 08:46:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6AF731FF8C;
 Tue,  2 Jun 2020 16:46:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/9] qemu-plugin.h: add missing include <stddef.h> to
 define size_t
Date: Tue,  2 Jun 2020 16:46:17 +0100
Message-Id: <20200602154624.4460-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200602154624.4460-1-alex.bennee@linaro.org>
References: <20200602154624.4460-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: robert.foley@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 robhenry@microsoft.com, aaron@os.amperecomputing.com, cota@braap.org,
 kuhn.chenqun@huawei.com, peter.puhov@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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


