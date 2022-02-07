Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE3E4AB7F0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:49:12 +0100 (CET)
Received: from localhost ([::1]:51652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH0dz-0008LU-HN
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:49:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGzON-0006Pe-68
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:29:11 -0500
Received: from [2a00:1450:4864:20::436] (port=39458
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGzOF-0007Cw-GF
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:53 -0500
Received: by mail-wr1-x436.google.com with SMTP id v19so8368180wrv.6
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 00:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+/GMCFoh/637sxfOZ8qqqNowze1Ji9NqOJcB77QAJgM=;
 b=RsrEDOiKYXKobuWFpvg/Z4O33ANrlCJsA2btsYcXFloAjy5xK9iuLp6wBWatYvLH9E
 uu7/gh4comicu58G7kW/eRmnHR8jKVnKxiHRBRUE1uX51NQ7EplLWQD9FrePQT1EiPaH
 NZzxGY1ZjQDso1aMfeHCRwRsoR7VLBgTzkwev6MXwmMntx+vmRh9KOTndGeHXXwOzIuE
 I23mWG4nOYnx4FMFoJ5vrBrKbc57FPuwRFWgbVuNNonqv8UvyEW9sZ7DWDexlX3nnlC9
 yqwAqg6kXEze4bX188b4lNGg6K1JXzzcCpt3tdbyBHYSvptO8RV4D0AU0Mh3t0MOhYN0
 LzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+/GMCFoh/637sxfOZ8qqqNowze1Ji9NqOJcB77QAJgM=;
 b=gsU/Tmixjzp7VZ6GI6XjVs+c4B8URnYQEy2/PipiBSEqswcEg69Vv0SJZa7q/Ly+3K
 tCEJpfhzDBjB8IJSzJvsRf93y6EIDrbo4j8CKgysZaf0JIDoUvd+K34k2L6QOpip+Xxx
 5RmhBWrDusG86v1i2Qso5g5mAR7P02EkcbmOLuVbDtNprIaP5h5UY2KkWB1d+INo0HLR
 Qxkc4OBfTzhfRSgrP7dV2x0kWmdiM9SIGRViuRg6EURedQZ3diGsLRG7ovJwlO9n6y7Y
 6iIdIDAtRklN5OH+2SVB7nxLlfrzl1yods+vi0F0AThza66+dnIgYu6Y5nHVL+yrGmZm
 vbSA==
X-Gm-Message-State: AOAM5327MO6kt2OEuG02tfOpWHUOVVanOSiHEW+t+bvhvFYhPtap1a+p
 Pkhvt/IcE94fV6jGzxHYoYl9uH7KTDY=
X-Google-Smtp-Source: ABdhPJyaTHaV9Mo4NjS3mMDi6GSmB42kTM2WjOQJdFILbTdAcVBTLoBCLZPhE7U2qVp9WXMeJ3upYw==
X-Received: by 2002:adf:a4da:: with SMTP id h26mr9231228wrb.179.1644222515131; 
 Mon, 07 Feb 2022 00:28:35 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id o3sm996595wrc.41.2022.02.07.00.28.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Feb 2022 00:28:34 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 8/9] linux-user: Add missing "qemu/timer.h" include
Date: Mon,  7 Feb 2022 09:27:55 +0100
Message-Id: <20220207082756.82600-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207082756.82600-1-f4bug@amsat.org>
References: <20220207082756.82600-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


