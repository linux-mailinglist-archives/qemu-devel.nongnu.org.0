Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDA2602377
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 06:50:30 +0200 (CEST)
Received: from localhost ([::1]:50562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okeYf-0003AV-5N
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 00:50:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <linmq006@gmail.com>)
 id 1okeVE-0008L4-JR
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 00:46:56 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:42770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <linmq006@gmail.com>)
 id 1okeVD-00038H-1i
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 00:46:56 -0400
Received: by mail-pf1-x431.google.com with SMTP id i3so13006835pfk.9
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 21:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W9IWHuJyr8ph9J1Q0xRajmENbspcIQ6rSawapbHVXww=;
 b=fE18LNLu4sL/9ZC9S4a58y0hLR+02zlfYB45+EzrIUYPExfUKg/UF6H3pXM9LLy9Om
 F67nDWQYsSb84yYkSIQcbw4OVDt30BSenK67MQWgM/amwwioi2lcaU92dL7tuJe4V2a9
 S0nTqLNF35GcJgNnkq7AMLJv5WGXF9d/iL67OHepq4QNI7cTRV8+0Aq/1u+muQ3P04c/
 5Lf1axnLHDd4yIkrZmsvSHynlviu31fLNWZRsJN1xXme8gPG5YGuO03uZ7RL5qNkDv+y
 TXxbA/0Oup1TkwOg55jwM/uNXipfcH7LfzSquJTe2n003mqK5fJfsbIVgWd3OiW+fEXg
 FO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W9IWHuJyr8ph9J1Q0xRajmENbspcIQ6rSawapbHVXww=;
 b=u6izDEcmsmDxm/ppORfBS1wM85/lGn0McQ+AL7d6YXCl8ABJLIbbVZi+6lJ9CXvlv8
 h3CalYWFrXrn70J91sxRv6mMit79ZsYjT/Clmwc/2df6Vih779+n6IJIgfV4GQHJOfpH
 X0fPg9h9Szz54FQgYU5Pnp/L0jJwAfm6tRPDAzIpPkOu8if/uJrWIvv+QCj4jD6kHJxZ
 k0XRVTQD7VhV5JrBVtEQqVurzECg+bj76SOwjCQDA0CB9A5VpvVZYxskaOvV+VVRAnez
 2iQSTMPbGz0FkznDVUqRYzb8+CMhpxlo8EKcp46zVMVGHdKCUdp6vWnPCQ/8oQjMubo0
 kjEQ==
X-Gm-Message-State: ACrzQf2qhbl2UkmC2E63A+ZvE9MB5kOl/P+rGo/YHVCOnJT5gwxpegEt
 tXIoyCguLyob6gmVuuG3NZc=
X-Google-Smtp-Source: AMsMyM4PskPIRa3WHBmbFi9LrlZ0fviXTD3KsY/SOY7ppNhHqI2i8t46kzg3vE8TNcyueyLUgSvaiQ==
X-Received: by 2002:a63:cf48:0:b0:439:7d1c:fedc with SMTP id
 b8-20020a63cf48000000b004397d1cfedcmr1124182pgj.281.1666068413106; 
 Mon, 17 Oct 2022 21:46:53 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 21-20020a631855000000b00462ae17a1c4sm7035806pgy.33.2022.10.17.21.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 21:46:52 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-devel@nongnu.org
Cc: linmq006@gmail.com
Subject: [PATCH] qga: Fix memory leak in split_list
Date: Tue, 18 Oct 2022 08:46:45 +0400
Message-Id: <20221018044645.863859-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=linmq006@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We should use g_strfreev to free the memory allocated by g_strsplit().
Use g_free() will cause a memory leak.

Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 qga/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/main.c b/qga/main.c
index 5a9d8252e075..04902076b25d 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -934,7 +934,7 @@ static GList *split_list(const gchar *str, const gchar *delim)
     for (i = 0; strv[i]; i++) {
         list = g_list_prepend(list, strv[i]);
     }
-    g_free(strv);
+    g_strfreev(strv);
 
     return list;
 }
-- 
2.25.1


