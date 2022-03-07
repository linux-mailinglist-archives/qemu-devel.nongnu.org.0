Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 663C94D049E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 17:54:50 +0100 (CET)
Received: from localhost ([::1]:58042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGdF-0001Yc-Gd
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 11:54:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGVz-0001Um-Qx
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:19 -0500
Received: from [2a00:1450:4864:20::335] (port=42741
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGVy-0007je-74
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:19 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 r187-20020a1c2bc4000000b003810e6b192aso9669636wmr.1
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 08:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=NaCmncalisG2HmxfoLWWRFVxRQONisu66EFRvxsSlWo=;
 b=F/wj2lrRFSQ/W1yKkYWTYcQlJt81DPS3nXJ09Sa+3XiMHXwxa9ojTCkYKrc8Wxj9nP
 CCU6rmxOZzZ5q1oJS4mSyXkcVvSW5VlvOQawsmLOwZmhNWPiUARBXmvg6jtyKgNw3GW8
 h9D0Ddz1mXT9NmIdVZ4m9VzqJ6+yXxe1dKckucpXfkVVDzCnRFscl/XjCzf6K1mqyCfT
 rIKktLmwgk2joL0KYU2fPjJL2uaFKf8b3Fu/6QTSqoDwxZEn5ze2nsV1uTEN/AQzRoxN
 7vb2F7jcvoKrRo8Gpj4O3Y/Z2kBRo/zhujmtGe1emp5yuB5ibPVDU80yS31soL6hBIw0
 CGVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NaCmncalisG2HmxfoLWWRFVxRQONisu66EFRvxsSlWo=;
 b=T8Cy60/LZ9fIFWAxxTCSO0/tUcovpCnpPzIY2A8FXYXOXCgqKlaPQ3kEAkGUNN9dXA
 ByxCN3mhQj2zeIuezFlZSsl9RWqve4nvWPnlxI7nUWVjBY3q2VM2i1Bqoss2f4i7Gzex
 g7GJYeM6mVkF5YpE2DBYhBSAxGyHNKyPDfjFZIU+slWUYyP6XcgqCq4okrtRFvgJa7/4
 Tb8db8AmDUCLDcKGP6UHggHmg9sqlDup+Mxy67/dhbie96EVnSfElAzDeBRcPcTn3byZ
 AfWpKbkOwdAOaiFfFGBFzHXRh2r6bbyaWOig78i61enFmw0Se85EKLyy8kJncJEljwz0
 c8Dg==
X-Gm-Message-State: AOAM5317/2Lf/DTDpE5sO1edn+XDjca+4LmkX4wCX7RW41NyCin4fdVe
 N4uNcIZdQKGQuAvMRkMcqcYkINktNUP7dw==
X-Google-Smtp-Source: ABdhPJyxbr7Aynx3ejmWPr3lvECPf0iHAxZpPRbvchRwceYs4hiOzNBURh2Cry+MZCo2KmW4Cr8Xfg==
X-Received: by 2002:a05:600c:4f0c:b0:389:990e:d9f4 with SMTP id
 l12-20020a05600c4f0c00b00389990ed9f4mr8490955wmq.90.1646671636900; 
 Mon, 07 Mar 2022 08:47:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v188-20020a1cacc5000000b00384b71a50d5sm13806652wme.24.2022.03.07.08.47.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 08:47:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/18] util: Use meson checks for valloc() and memalign()
 presence
Date: Mon,  7 Mar 2022 16:46:57 +0000
Message-Id: <20220307164709.2503250-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307164709.2503250-1-peter.maydell@linaro.org>
References: <20220307164709.2503250-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

Instead of assuming that all CONFIG_BSD have valloc() and anything
else is memalign(), explicitly check for those functions in
meson.build and use the "is the function present" define.  Tests for
specific functionality are better than which-OS checks; this also
lets us give a helpful error message if somehow there's no usable
function present.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220226180723.1706285-8-peter.maydell@linaro.org
---
 meson.build     | 2 ++
 util/memalign.c | 6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index bc0ac931e1a..774d0248a62 100644
--- a/meson.build
+++ b/meson.build
@@ -1623,6 +1623,8 @@ config_host_data.set('CONFIG_POSIX_FALLOCATE', cc.has_function('posix_fallocate'
 # thinking that Windows has posix_memalign()
 config_host_data.set('CONFIG_POSIX_MEMALIGN', cc.has_function('posix_memalign', prefix: '#include <stdlib.h>'))
 config_host_data.set('CONFIG_ALIGNED_MALLOC', cc.has_function('_aligned_malloc'))
+config_host_data.set('CONFIG_VALLOC', cc.has_function('valloc'))
+config_host_data.set('CONFIG_MEMALIGN', cc.has_function('memalign'))
 config_host_data.set('CONFIG_PPOLL', cc.has_function('ppoll'))
 config_host_data.set('CONFIG_PREADV', cc.has_function('preadv', prefix: '#include <sys/uio.h>'))
 config_host_data.set('CONFIG_SEM_TIMEDWAIT', cc.has_function('sem_timedwait', dependencies: threads))
diff --git a/util/memalign.c b/util/memalign.c
index 22b405700e3..083aaae619c 100644
--- a/util/memalign.c
+++ b/util/memalign.c
@@ -56,10 +56,12 @@ void *qemu_try_memalign(size_t alignment, size_t size)
     }
 #elif defined(CONFIG_ALIGNED_MALLOC)
     ptr = _aligned_malloc(size, alignment);
-#elif defined(CONFIG_BSD)
+#elif defined(CONFIG_VALLOC)
     ptr = valloc(size);
-#else
+#elif defined(CONFIG_MEMALIGN)
     ptr = memalign(alignment, size);
+#else
+    #error No function to allocate aligned memory available
 #endif
     trace_qemu_memalign(alignment, size, ptr);
     return ptr;
-- 
2.25.1


