Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F604A8F39
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:43:38 +0100 (CET)
Received: from localhost ([::1]:50600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFix7-0007Zb-S5
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:43:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhwx-0004a4-O0
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:39:24 -0500
Received: from [2607:f8b0:4864:20::62b] (port=36623
 helo=mail-pl1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhwv-00066W-TV
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:39:23 -0500
Received: by mail-pl1-x62b.google.com with SMTP id x3so3096208pll.3
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iquACF5fINiHInRLGyn7zr/xi4B507aTmwDEUpBFgA0=;
 b=WqqR127ENiuUzg2CtFyBkaLyywkvIVD3wLXz4DzQnYbRdZ8HDnATF1Z2uV5Cnb9FI+
 hAvdgNkvYvCEjCXmrdFDOVZTRT3B8KC3ytfnZakKePT6KeMltEOYdtz6mGhvIxL+zP2Y
 FyyjfVkM8pVffXjOL9DiOUjswTUdwB4LfPy8lLM3VrpTDH/Vs2t8Ey92Coyo3zymqXLV
 gkCUoBBPQqWmgrnO54gGkV+bzReEnT+/USq3andJN+Z2YfZawZiaerUANUJmJ6dDf5uV
 he3sOReVcdotJ4lr6WlrVhHH12pFpUBQlAqON047Cig+j6JGgrI098IlNd/BJBDPxDCx
 Q3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iquACF5fINiHInRLGyn7zr/xi4B507aTmwDEUpBFgA0=;
 b=t1xGNgNz3KMAyDKPxsPBDAuW0S6EmO5grU631ASoXAETGekmRHxHCxiF2sRtHIV45w
 ++MXRbF8rXGGvOx6RlXlv69p5telpQQFAk8YL1qhhsaOQtvd5HVJrLxOoercl0JciSK3
 XcOGixZSSdjPupQMTYpxkvhILLA7CRXRr8EYHkqxTQRJQ4uZipUDTPyyzqVjAe4Or3+w
 kSCJXORWrY90GULsuyTvvy/k49eSHWzlwFAUBtxCwelZacQjLx3erEgPUtT3xuK21jIO
 Qk0CHkD9IQ2rQRdnOHjUUqKc6a2foLtmVjK4zY7/6EtLeF6BOD3JAECzsVMg+wEiwmOt
 sLLA==
X-Gm-Message-State: AOAM532f+MCG2QqI3p7a7lelauxjpWW2XBa0FjSiHpGoUUNgVysnbYpg
 oYrqUEkziFheYdvufJo/e7Qb01G6wrE=
X-Google-Smtp-Source: ABdhPJx8283Y4qRuabj0VQuZqaH+oxWC7CRSawKvy/q4mmZSKEdzmRT6rS/PPZ0niD1SiFitMFr9bg==
X-Received: by 2002:a17:902:ed89:: with SMTP id
 e9mr37782536plj.88.1643917160526; 
 Thu, 03 Feb 2022 11:39:20 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id d15sm3517248pfu.72.2022.02.03.11.39.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:39:20 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 09/10] linux-user: Add missing "qemu/timer.h" include
Date: Thu,  3 Feb 2022 20:38:02 +0100
Message-Id: <20220203193803.45671-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203193803.45671-1-f4bug@amsat.org>
References: <20220203193803.45671-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

"qemu/timer.h" declares cpu_get_host_ticks().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/i386/cpu_loop.c | 1 +
 linux-user/ppc/cpu_loop.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/linux-user/i386/cpu_loop.c b/linux-user/i386/cpu_loop.c
index 29dfd7cd0c..90bffc1956 100644
--- a/linux-user/i386/cpu_loop.c
+++ b/linux-user/i386/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "qemu/timer.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index 46e6ffd6d3..ffe39851ed 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu.h"
+#include "qemu/timer.h"
 #include "user-internals.h"
 #include "cpu_loop-common.h"
 #include "signal-common.h"
-- 
2.34.1


