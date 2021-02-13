Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE4731AB95
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 14:17:11 +0100 (CET)
Received: from localhost ([::1]:43530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAunO-0002Vl-LZ
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 08:17:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaT-0001tI-Nw
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:49 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaG-000673-SB
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:46 -0500
Received: by mail-wr1-x42e.google.com with SMTP id n6so2883777wrv.8
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 05:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7zXt3jzNwWw+3XkTWB+TIN1h4jaU67PivzEIimKHeMs=;
 b=y9vxi1NV1rV6bJiPfiaHi3k9zRbILPa1xlfWr4TMWklv3MDGzYw0YlksjTq2J6qkiI
 nW9yOKvhSO0+8FtX4vBvh499ded/wMtLT5K2cq0cNaLVH5loipSGka0oY0hIkHMz43Bg
 Juba+hB4KqUEtwUYyY5rq8ieaDindgsXFDQ3nsjM3SX/SLVsmmK0O/XAYX35sqPD7Un1
 wvIVODV5PTLQcAzP1MB+gym5WKpS21qo37ZQqGXJSxPWszWNwt6oQ4cprbZsY+pV3B0h
 4U5VzZdAwzcFvzE4qeu2BRNYnPyluMX1MhauNYZAIyNk8oiFwRBLUHTiGwCRoAGHGIhq
 JpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7zXt3jzNwWw+3XkTWB+TIN1h4jaU67PivzEIimKHeMs=;
 b=qbqqDD8/YFhe2LL/qam6tZlzG06O5IITFhWjdWlL+Jhhz4RQw976R1eLXxlVuXtUvY
 txJQxaEft8Xw/7rAa0f9MAXVaaHzttLywzTvuIWqG5qG7e1ZuFOmjFBjmJdMQi9FhdZd
 bQH4Byl682YuN1xX7pupVLnGsZE1srnbq0X9VbwZ7CXBgL7gCpwIkssPIg5q2Bfdbal8
 IzUOFu9ww6K6G7KRh5iI+NW3BNOaxCHEIEGovbdDwj4LHCWtX1MD/eRY0fy6AL4vS9ZT
 7xDAS5YybuWC6sBAILuA3Y26QXpsSvKqGS2swHh9D6SDlZM/NisUQhJpf65zydK2peNB
 Yhuw==
X-Gm-Message-State: AOAM5321MGT8cSb4hq/chWiDDZKk7rQomSi20FAVG6fuDTZIflrD4nsg
 RCRocuwH0qWLexsRd71v1mjBgQ==
X-Google-Smtp-Source: ABdhPJwuhr4HRQVy5oEXeA2+qjEXMGJx6mG5Bnwzo5TsNM7u7HY4DCJNral7YwdPnH3Q40S+r7dUiw==
X-Received: by 2002:adf:f8cd:: with SMTP id f13mr8845843wrq.381.1613221415647; 
 Sat, 13 Feb 2021 05:03:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r124sm18265174wmr.16.2021.02.13.05.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 05:03:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 022F31FF91;
 Sat, 13 Feb 2021 13:03:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 05/23] contrib: Fix some code style problems,
 ERROR: "foo * bar" should be "foo *bar"
Date: Sat, 13 Feb 2021 13:03:07 +0000
Message-Id: <20210213130325.14781-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210213130325.14781-1-alex.bennee@linaro.org>
References: <20210213130325.14781-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: zhouyang <zhouyang789@huawei.com>, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: zhouyang <zhouyang789@huawei.com>

I am reading contrib related code and found some style problems while
check the code using checkpatch.pl. This commit fixs the issue below:
ERROR: "foo * bar" should be "foo *bar"

Signed-off-by: zhouyang <zhouyang789@huawei.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210118031004.1662363-3-zhouyang789@huawei.com>
Message-Id: <20210210221053.18050-6-alex.bennee@linaro.org>
---
 contrib/plugins/howvec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/plugins/howvec.c b/contrib/plugins/howvec.c
index 6e602aaccf..2f892da17d 100644
--- a/contrib/plugins/howvec.c
+++ b/contrib/plugins/howvec.c
@@ -235,7 +235,7 @@ static void vcpu_insn_exec_before(unsigned int cpu_index, void *udata)
     (*count)++;
 }
 
-static uint64_t * find_counter(struct qemu_plugin_insn *insn)
+static uint64_t *find_counter(struct qemu_plugin_insn *insn)
 {
     int i;
     uint64_t *cnt = NULL;
-- 
2.20.1


