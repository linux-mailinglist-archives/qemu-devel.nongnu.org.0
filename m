Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3264363200
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Apr 2021 21:43:50 +0200 (CEST)
Received: from localhost ([::1]:37364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXqr7-0001CJ-7O
	for lists+qemu-devel@lfdr.de; Sat, 17 Apr 2021 15:43:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXqpY-0007sk-5m
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 15:42:12 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:39646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lXqpW-0008Am-72
 for qemu-devel@nongnu.org; Sat, 17 Apr 2021 15:42:11 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 i21-20020a05600c3555b029012eae2af5d4so6363754wmq.4
 for <qemu-devel@nongnu.org>; Sat, 17 Apr 2021 12:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CuYAxYEssZGCHU2JHke0qyk/TAhFSaPXu7Y4rIDN+sw=;
 b=A+wQSu24ydbrfJnh5jM0fF2ovnGlvviStL3W0HPKJWQ3stKb6cX7t6wWTuNUjKdxjw
 vEAmbnSyqI5qdlhuwZAF0Vd8WGGi1uxEn6JPGkVlipHLeNT4eDxWE5nhIYtYj5Rcnh2t
 62OrSFu5RJu+6Y0yLuGdeq5vt/QCzu1JmwNJHBWx48xL9WG6ntvKHCPfFMasObRtpubl
 yxVHw1csKAg3f+Nt/D+uPO7haLe/CnOQoDnmmjpkfMkOyUYjVeBcOzlQZ2V3yhatApzG
 gUL87d4TPTtV1ijoY6uF3o5/jm+MHS+1mEGKUzqAhxIPXoEtCtS3lh5j+eWg8Dzx/f6D
 wMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CuYAxYEssZGCHU2JHke0qyk/TAhFSaPXu7Y4rIDN+sw=;
 b=bYyJRvHtyAtPIHIh9zkcOReFBGOGeubfKASPwMXULRuT5I7otTbV4cIsZHJ+sZ+R6o
 ZbpmlRlF983kah4/VdElm5COtuoke4+UqrKo9FvtT4AeAv7O4D3rdhg6A1RjlFw4gWI9
 UvAYTS2NALqOHBK7NM/C73w+UnKmkYxqn8nIB5BIOR0aNJvj3dBN5SRKo6keXnjKC1Wr
 Aka/EMXM/aHv2/bmjTPDLWNSyoj2vm3osingypNcoL65jNMkrrCsD6WWgUi1oXYvBsCE
 hnWxuC5IusDYSzJVEPHs0a2LuhhzGjc0G2l0/UI+pXE0ZpI2qDP6bgZM4/Wl56QfYOP1
 R7oQ==
X-Gm-Message-State: AOAM530DCocApSLNC+af5GHjgQAEzcNu10+hKhMW3sbkfYiob5N97Kyi
 2Qvvzh0Q7s8qBphmR8Rn+rPMoIz8IimmkbHd
X-Google-Smtp-Source: ABdhPJz5EsYW7SEeTARx/HUM3iRWJmbqHSEIIEantLzguGvhvZODTqw0PcwWj5BOMfHjWULxszBlvQ==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr13941414wmi.36.1618688528631; 
 Sat, 17 Apr 2021 12:42:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c12sm17304374wro.6.2021.04.17.12.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Apr 2021 12:42:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/7] osdep: include glib-compat.h before other QEMU headers
Date: Sat, 17 Apr 2021 20:41:59 +0100
Message-Id: <20210417194205.17057-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210417194205.17057-1-peter.maydell@linaro.org>
References: <20210417194205.17057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

glib-compat.h is sort of like a system header, and it needs to include
system headers (glib.h) that may dislike being included under
'extern "C"'.  Move it right after all system headers and before
all other QEMU headers.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210416135543.20382-2-peter.maydell@linaro.org
[PMM: Added comment about why glib-compat.h is special]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu/osdep.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index ba15be9c569..ab84ecc7c1c 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -111,6 +111,13 @@ extern int daemon(int, int);
 #define WEXITSTATUS(x) (x)
 #endif
 
+/*
+ * This is somewhat like a system header; it must be outside any extern "C"
+ * block because it includes system headers itself, including glib.h,
+ * which will not compile if inside an extern "C" block.
+ */
+#include "glib-compat.h"
+
 #ifdef _WIN32
 #include "sysemu/os-win32.h"
 #endif
@@ -123,7 +130,6 @@ extern int daemon(int, int);
 #include <AvailabilityMacros.h>
 #endif
 
-#include "glib-compat.h"
 #include "qemu/typedefs.h"
 
 /*
-- 
2.20.1


