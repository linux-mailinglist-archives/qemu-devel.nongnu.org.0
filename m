Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 260C531733D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 23:22:00 +0100 (CET)
Received: from localhost ([::1]:40868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9xrz-0006Su-6m
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 17:21:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xhZ-00067X-HY
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:11:13 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:37464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l9xhW-0003HN-9Y
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 17:11:12 -0500
Received: by mail-wm1-x32a.google.com with SMTP id m1so3299133wml.2
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 14:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qsAlB8eC1+WOxOlJ6bcLRTNHUdtdlZsz5JZgZPTBx5w=;
 b=m2lyRN5Reh9Dj22oLqBx3id4+wVDwzL4KB5tbf/Ly6ahdITvQxJU8Eii45iufhj1rB
 ocTYIRH+QJV8s6qZEm7w+zNtZSPCJKI1XYiWdR0VUwuvLdaR1f68IUiOmhoTaZ7n3QEa
 mM7/XjOUbmL7/anZg7aUyrPangkRfJljYIJdS1qSbtUZw++WD/9avwiZQ+eseDHzufoB
 fhGsIbCDO5e/urBMQ3d2huyZjMxo1EnVtfS3FSwkVnCanJc7wu1T3EO5+Wu/Bk3wLVHj
 AZxwta/slRfo5259d+jmhylsOiCisFB6At3AXeOmNYXMyU/H4kiMadP4Dqon5Y3FeARm
 3PHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qsAlB8eC1+WOxOlJ6bcLRTNHUdtdlZsz5JZgZPTBx5w=;
 b=eUanQ+aWOZ426N23wkR+Cm8bR0y5xC8WEJhQe64gxVdoL/mrR0PVwWtO7kRdXWmr0M
 6qzVGwrdbaSOMw76CUPrSxWzzXeManIfu/moXAlDGyK47NFbBYGjosCNH0XFbhIGUNdp
 h4dm3AeVv/8wkGdzNP9rMIa3BDxRcyyWEdc5ePiYXVlqWUh/EXVzr20WkQTvW8TCQvQA
 yqEsxlBsPxHBXTkgA2F+H6ZKzq5IU4/Bn6kK+3dG1wFVRKEFbRtuTtP39wb9py2vvA7r
 9Pe5x7crC4ABMc0aRzxWMRPfFvNgyx3oYhIg7ygOlJIhqtCdfTS8bJzYZpbxvTMA48LW
 Mkyw==
X-Gm-Message-State: AOAM533CM+ry3Z30nT2YCryiHxMzPRzywNElodOQjWMSfZOa9XS6LsJu
 BQBiIUpSHFrisJaMyMBNfrM9D8saG0+AOYxW
X-Google-Smtp-Source: ABdhPJwGUuzZ92zgTCJj28UWIWtKlbq7zZ2ybIQeWAzEUfX0qP2725uBCnQg+i75OtlSc+7bGctckA==
X-Received: by 2002:a1c:f415:: with SMTP id z21mr1194592wma.114.1612995068912; 
 Wed, 10 Feb 2021 14:11:08 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z185sm5427790wmb.0.2021.02.10.14.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:10:58 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 093551FF91;
 Wed, 10 Feb 2021 22:10:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 05/21] contrib: Fix some code style problems,
 ERROR: "foo * bar" should be "foo *bar"
Date: Wed, 10 Feb 2021 22:10:37 +0000
Message-Id: <20210210221053.18050-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210210221053.18050-1-alex.bennee@linaro.org>
References: <20210210221053.18050-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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


