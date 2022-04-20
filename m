Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FBB508F51
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:23:19 +0200 (CEST)
Received: from localhost ([::1]:44556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhEz0-0008BO-1p
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEiu-0005d1-4g
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:40 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:46901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEis-0001Ea-KJ
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:39 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 e62-20020a17090a6fc400b001d2cd8e9b0aso2750301pjk.5
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QruqmmtFKc2ehxSS4AhSTbmV3nwhrgkbO6GJghhE20A=;
 b=I+neKLtsUJg9Dy3ptCe2XHdvkpuUL0HMvvqPnps3YP+rfG5i1WvQHq2jDyOSRgXXcz
 C9wHp/UVwmkQ/jAnPCtzScTMUr//3jtOQ/nYIiWNLA6JmrlQ4h+UBIY+Mzz//GBOgwCM
 /A5h3IYfmenpXKPQoDR4rIXGOn4CfFUCfGLI0FbtOjLiLyad62rw+YEmtY3BrWgcxwid
 Fqu+heL7cfc83irvbn1qISJixp/+67C7dsW7vWootLI9pZJ8laIjFbnNJrh31/F3IyH4
 8WB9V3KoAgvQX3Ycwa9SWQiG516GqMAekzw8YXE8sx2dTM37F7EF64v9wZ+rLjnn7+5K
 PdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QruqmmtFKc2ehxSS4AhSTbmV3nwhrgkbO6GJghhE20A=;
 b=woXzdOBHSt4kD0LXxfjy4aQ9qpWxccg6Q2pYKwIZvvqBd0aiW2J5N9Zq/b7G9SuZsf
 IkrCuUboYzrlhz0QuZbKawGtJX5ZTkL83u0ZS1tEyeIzHxXzFDIBAm3A2e8GxFwprxPy
 0z5vZ9EFoYdtGmI2tzrxJotVzTreFFwKpszh5+atD2wTUCdGdtyPp3M0axI8/VLnotgM
 rOlbfF/p6/R/Hg0nTCw1VRCoGfMBstmstwgkwXsdy/BlKCYh/LYzShsVLVcHTzSQonqX
 rJTJ2MdnB4gX6ddO/wKNC4PXAUD+suZ1HkjeMEvyL8cAhXnUAm4ROhTcAsNxjIQhjAPX
 NWdg==
X-Gm-Message-State: AOAM533oxL7lqWF+6MU4hc2slTFk2hUtYxoEAKY55oJAsCQAl7S8cYYj
 VFwFhW1wyYCo6VFgbS/y1Q9G/5Jhluy8KA==
X-Google-Smtp-Source: ABdhPJzwc4N8xJnqQtMman8tqRxOFJRHLmbNifvYex7vTCkKvE8dWnA6DiX3xIrYV97UBXyBrRcXuw==
X-Received: by 2002:a17:90b:1b01:b0:1d2:ef4a:98e1 with SMTP id
 nu1-20020a17090b1b0100b001d2ef4a98e1mr5811694pjb.163.1650477997351; 
 Wed, 20 Apr 2022 11:06:37 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/39] util/log: Use qemu_log_trylock/unlock in qemu_log
Date: Wed, 20 Apr 2022 11:05:55 -0700
Message-Id: <20220420180618.1183855-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid using QemuLogFile and RCU directly.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-17-richard.henderson@linaro.org>
---
 util/log.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/util/log.c b/util/log.c
index 6b7b358573..090bc3bc39 100644
--- a/util/log.c
+++ b/util/log.c
@@ -62,23 +62,22 @@ void qemu_log_unlock(FILE *fd)
 /* Return the number of characters emitted.  */
 int qemu_log(const char *fmt, ...)
 {
+    FILE *f = qemu_log_trylock();
     int ret = 0;
-    QemuLogFile *logfile;
 
-    rcu_read_lock();
-    logfile = qatomic_rcu_read(&qemu_logfile);
-    if (logfile) {
+    if (f) {
         va_list ap;
+
         va_start(ap, fmt);
-        ret = vfprintf(logfile->fd, fmt, ap);
+        ret = vfprintf(f, fmt, ap);
         va_end(ap);
+        qemu_log_unlock(f);
 
         /* Don't pass back error results.  */
         if (ret < 0) {
             ret = 0;
         }
     }
-    rcu_read_unlock();
     return ret;
 }
 
-- 
2.34.1


