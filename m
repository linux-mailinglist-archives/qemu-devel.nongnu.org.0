Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 180713F8D14
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:31:58 +0200 (CEST)
Received: from localhost ([::1]:42116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJE7-0005Jw-Rd
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:31:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImu-0005s3-JZ
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:36 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:42639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJIms-0008Us-Ps
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:36 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 k20-20020a05600c0b5400b002e87ad6956eso2659841wmr.1
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=kA2IUnctNyzUdfw7J0NuYj+Tjg7lyZY/fnc0JxtxmlE=;
 b=slqpRDyR3RaGyQgaF2kiU3Gbn6fZcbmIh15L+FgGjOuQGLkIBAUybIs57mujsDbIHh
 EXPrf9OvNRSqr35mF45SIRKYXWxGVWCKZw5lLYkmGipA8m8Hm3D/tIGJFNC0tHscU/He
 jw0BrJcVSlWZ8dV9tTm2BOveeFNCKBFdhNbWqMI6Sn4LiLTro8vbpcKy1Cuos2TYHl20
 xKTtwr7/w6/rtzwBhhIbwdyg4hot6KVOuyR/1kRBTdNh2/TJUcT5EJzn4QuAfTzbj3OU
 Y08AcaAvtOX2izmLhvTJRZavFo5n0vopQV+9xaLehT7Y2DCaI7zAU5sifUICN73PsbZX
 +uOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kA2IUnctNyzUdfw7J0NuYj+Tjg7lyZY/fnc0JxtxmlE=;
 b=b0rMVCLaNr6Js2KHCV7pURjJJnDK7iMdrJ2iqgOQwkqKna1DfPUh/WThsOUS+Eko34
 QB8kNhNuf7PzA0aJrRTc67MUwcgkDHpIKkEzkNnrk8w0d5Prlc4mMIskdaaNs+wggOhG
 fXss+bS5UZR0oGNmSqRnCVMdJETye6bi4EnMvJbW2cGUosMyO8JrdhamLHbUHXXZIbE8
 Y8Vh6HhfuPRgTv6laXifYDcP0Vr3UwnnjerWvmlk4iZCSSGQ3BmGkMt5/dLo4lmM7iho
 qxnG0jVenJNSYkgwz7LrHEuWeCsec2XsTDnFw89g/OMb3VC5WkH9/MqUYEgI5iNnkTR6
 DoQg==
X-Gm-Message-State: AOAM530tWXZ6jduZ3b35USP0ycGyin0HGemwiJrtnE+yrtqCWNKEhFcZ
 V+JZLs1+tF3Xi7GWDWX3SLnFOC0Qo+btfQ==
X-Google-Smtp-Source: ABdhPJxir+hbzOmJn5itTj6fUBJpRTnqZtQYQWRrsbziCRooTi11Kd4HnhItup+IVX6blwFrgWyuAg==
X-Received: by 2002:a7b:c441:: with SMTP id l1mr4662197wmi.69.1629997412562;
 Thu, 26 Aug 2021 10:03:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/37] stubs: Remove unused arch_type.c stub
Date: Thu, 26 Aug 2021 18:02:52 +0100
Message-Id: <20210826170307.27733-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

We added a stub for the arch_type global in commit 5964ed56d9a1 so
that we could compile blockdev.c into the tools.  However, in commit
9db1d3a2be9bf we removed the only use of arch_type from blockdev.c.
The stub is therefore no longer needed, and we can delete it again,
together with the QEMU_ARCH_NONE value that only the stub was using.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210730105947.28215-9-peter.maydell@linaro.org
---
 include/sysemu/arch_init.h | 2 --
 stubs/arch_type.c          | 4 ----
 stubs/meson.build          | 1 -
 3 files changed, 7 deletions(-)
 delete mode 100644 stubs/arch_type.c

diff --git a/include/sysemu/arch_init.h b/include/sysemu/arch_init.h
index e7789399508..70c579560ad 100644
--- a/include/sysemu/arch_init.h
+++ b/include/sysemu/arch_init.h
@@ -24,8 +24,6 @@ enum {
     QEMU_ARCH_RX = (1 << 20),
     QEMU_ARCH_AVR = (1 << 21),
     QEMU_ARCH_HEXAGON = (1 << 22),
-
-    QEMU_ARCH_NONE = (1 << 31),
 };
 
 extern const uint32_t arch_type;
diff --git a/stubs/arch_type.c b/stubs/arch_type.c
deleted file mode 100644
index fc5423bc98a..00000000000
--- a/stubs/arch_type.c
+++ /dev/null
@@ -1,4 +0,0 @@
-#include "qemu/osdep.h"
-#include "sysemu/arch_init.h"
-
-const uint32_t arch_type = QEMU_ARCH_NONE;
diff --git a/stubs/meson.build b/stubs/meson.build
index d3fa8646b38..717bfa9a999 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -1,4 +1,3 @@
-stub_ss.add(files('arch_type.c'))
 stub_ss.add(files('bdrv-next-monitor-owned.c'))
 stub_ss.add(files('blk-commit-all.c'))
 stub_ss.add(files('blk-exp-close-all.c'))
-- 
2.20.1


