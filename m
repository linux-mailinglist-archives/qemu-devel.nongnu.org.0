Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F29392B07C5
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 15:47:40 +0100 (CET)
Received: from localhost ([::1]:48294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdDsy-0008AF-1p
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 09:47:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdDmR-0000nQ-GN
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:40:55 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:37438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdDmP-0003mO-QS
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:40:55 -0500
Received: by mail-wm1-x32f.google.com with SMTP id c16so5727477wmd.2
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 06:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EuoKVmiBbj6jZKyCWdSBhhtmz1pu6yZkNGkryXfbOD8=;
 b=pLY07iMfK45PHJ03ekWN9S7GeR9s9gIPiLydYcB82jvt+UcXMqBDcHD1JSYi62NJiW
 Nydi5iU/zcdMwxYKMR2q4tWgzjR+114bpnQwAucCctMdpd/8HvQ/BFIolKBTd3mAU8T0
 4n0GJbzr7rOvLsmUMA62T4tqX5mnJwPOC70bt2HOG+WFUxbJfIMcYdYCqfi9Kx09zz7F
 X8/T/epOlbMmgR6SBJJkvujUenny2E/McSTgoBIRjLIEuliIIydyp6t0kQ722YZSZ01r
 BV/ib9Zk3INSX3hZpdpkzSp2SgygAkgb+XdiTPW09roCwxVoMcTYovgd7m1qsEyGvC2r
 ptgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EuoKVmiBbj6jZKyCWdSBhhtmz1pu6yZkNGkryXfbOD8=;
 b=aOJbP8HPcQrl8n9IN+iZCjNIYtaW2wSc1gNo4dmdaJTOxhjZ1M8r9LkX63oN4gRBoH
 Z6liaWvUDdMRhut0MplW3vbGQDblCo0UCzB7njFyNCTdueD38kvzpPPy9pJagppfA88E
 qnYL1Gr9JPRQEVJl2ptG5SBrT+mZQVT7Xqp1mnwSY3/L83C9PC0CMTZxGkDhAJ+2c8oI
 MR93nXIbefCDQtWejt2KdQfTuNCXn58bGlUxMPUI/Vv8Gf2Y0qlHsCo7AYjGQjV6c1H5
 qH3VN8UBmUsicqfLCqd7dFlajrYdi7fRnzXYzJtHYxokUBSqkPfn0tgpMU1+Jx4LChI1
 9e3A==
X-Gm-Message-State: AOAM531yFcYBzcRukBvSfXaVJwMsAqxGb1cenBs0CwnSeLmoZRdnBcxp
 q9PRC3gZDXrI7spTlnMN8DaONAK1rpCM6A==
X-Google-Smtp-Source: ABdhPJy4DzZChTh2tBmpxXqWRgO0UOb+na6+q1jTOYTu2yedrx1mWClJ3CoKdusLjMaA1xuRPrlWhg==
X-Received: by 2002:a05:600c:2119:: with SMTP id
 u25mr9810665wml.53.1605192052179; 
 Thu, 12 Nov 2020 06:40:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id k16sm7410907wrl.65.2020.11.12.06.40.51
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 06:40:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [for-5.2 7/9] docs: Move pr-manager.rst into the system manual
Date: Thu, 12 Nov 2020 14:40:39 +0000
Message-Id: <20201112144041.32278-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201112144041.32278-1-peter.maydell@linaro.org>
References: <20201112144041.32278-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the pr-manager documentation into the system manual.
Some of it (the documentation of the pr-manager-helper tool)
should be in tools, but we will split it up after moving it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/index.rst            | 1 +
 docs/{ => system}/pr-manager.rst | 0
 2 files changed, 1 insertion(+)
 rename docs/{ => system}/pr-manager.rst (100%)

diff --git a/docs/system/index.rst b/docs/system/index.rst
index 2a5155c67dc..e5a35817a24 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -31,6 +31,7 @@ Contents:
    managed-startup
    cpu-hotplug
    virtio-pmem
+   pr-manager
    targets
    security
    deprecated
diff --git a/docs/pr-manager.rst b/docs/system/pr-manager.rst
similarity index 100%
rename from docs/pr-manager.rst
rename to docs/system/pr-manager.rst
-- 
2.20.1


