Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E80A397011
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 11:12:28 +0200 (CEST)
Received: from localhost ([::1]:42646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo0Rn-0006jB-Ic
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 05:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lo0N7-0004iY-81
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 05:07:38 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lo0N1-0005Nz-9Y
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 05:07:36 -0400
Received: by mail-wr1-x432.google.com with SMTP id q5so2797100wrm.1
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 02:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OQUrS1tZDptB7Sfh+dVZZrOUcLABv4RnyRL2OneaB3U=;
 b=v8XJTAWzTUCr20VqsCwzWPfwzOWmbi3791twxDTncpefAByE3XLdi/pB2Wr+eT2Kfi
 XUuQFD0SR13BNHsuZdTKfw3RhcNOzKd+pljAI1mO5u3whKLHSbZOTyIynPb8vcp93abO
 +u9SzgBlSjFyUKMVx1YaYmi+iMfgQ6yfpy2oQFXSl9H+HHH9yq3wA/AosutdgXZar3yS
 ZzuUZ+VUoOIUSBk/cMW7t9i7ue1JnmHLVIsgVCDXABfn8fwXVFPqxx48c/jV59tvy17Z
 I3uO6j4WGsfU8/oAeSJ06lM4HgU9LXNsFRMP1urt6k9M+nzV41dL/WjrslvgICeyxoo7
 wDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OQUrS1tZDptB7Sfh+dVZZrOUcLABv4RnyRL2OneaB3U=;
 b=bX78WTzFtCWZqv/B5mRtOqJxRyvc2K/x3gTBbIid67gJ7VJlbTHdZbILPzhGIqZsJu
 /LUdOXMfSD2Hr5RpniqiH7gjH/w7JiMFk9zIt9l/6/2t4qIFvRmHhSyiFkf4AOgezesv
 ZzhIqv+tsoIIZnRjUDERJRTvlZFL1BOrFy7K3BI8q4J2jlFJJ71Kgz4UiHhtXGzArXMZ
 FwVYCH0200EUCsNCFi2VjQzLXsJeeVSYe73j/XfuO7tbL9hhLIC+ykXOvrzP7t05eEkZ
 gj2qTWjJmvpWOwtGsBkjx841QdbGUXql73brXLlU9x6Is10kvFveBN4ZIOVvjweO/ix/
 qg1Q==
X-Gm-Message-State: AOAM532ShZCnwG4Qnk7uNbZawfqFDsOLdg2W9tLwgZc9G3M+QB8RYUG2
 7bzupiPyX+bFQGscHWAYikmHWA==
X-Google-Smtp-Source: ABdhPJxBRWX9ZDKccLiEXtSQ5NThelQM3kGlQouVma7uHHYd7lT7l4dSlHVpzfuVv/RppZfKR8Lwag==
X-Received: by 2002:a5d:4203:: with SMTP id n3mr15067903wrq.132.1622538446656; 
 Tue, 01 Jun 2021 02:07:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h14sm2467620wmb.1.2021.06.01.02.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 02:07:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F069B1FF7E;
 Tue,  1 Jun 2021 10:07:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] semihosting/arm-compat: remove heuristic softmmu
 SYS_HEAPINFO
Date: Tue,  1 Jun 2021 10:07:15 +0100
Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew <astrauss11@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The previous numbers were a guess at best. While we could extract the
information from a loaded ELF file via -kernel we could still get
tripped up by self decompressing or relocating code. Besides sane
library code has access to the same symbols in run time to make a
determination of the location of the heap.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Andrew <astrauss11@gmail.com>
---
 semihosting/arm-compat-semi.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 1c29146dcf..041b4f6c04 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -1165,12 +1165,10 @@ target_ulong do_common_semihosting(CPUState *cs)
     case TARGET_SYS_HEAPINFO:
         {
             target_ulong retvals[4];
-            target_ulong limit;
             int i;
 #ifdef CONFIG_USER_ONLY
+            target_ulong limit;
             TaskState *ts = cs->opaque;
-#else
-            target_ulong rambase = common_semi_rambase(cs);
 #endif
 
             GET_ARG(0);
@@ -1201,12 +1199,15 @@ target_ulong do_common_semihosting(CPUState *cs)
             retvals[2] = ts->stack_base;
             retvals[3] = 0; /* Stack limit.  */
 #else
-            limit = current_machine->ram_size;
-            /* TODO: Make this use the limit of the loaded application.  */
-            retvals[0] = rambase + limit / 2;
-            retvals[1] = rambase + limit;
-            retvals[2] = rambase + limit; /* Stack base */
-            retvals[3] = rambase; /* Stack limit.  */
+            /*
+             * Reporting 0 indicates we couldn't calculate the real
+             * values which should force most software to fall back to
+             * using information it has.
+             */
+            retvals[0] = 0; /* Heap Base */
+            retvals[1] = 0; /* Heap Limit */
+            retvals[2] = 0; /* Stack base */
+            retvals[3] = 0; /* Stack limit.  */
 #endif
 
             for (i = 0; i < ARRAY_SIZE(retvals); i++) {
-- 
2.20.1


