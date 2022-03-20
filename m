Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38A34E1D1B
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:23:21 +0100 (CET)
Received: from localhost ([::1]:46800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzGy-00064w-T7
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:23:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5v-0008UD-E7
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:55 -0400
Received: from [2607:f8b0:4864:20::1034] (port=33973
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5s-0003SR-2v
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:53 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 o68-20020a17090a0a4a00b001c686a48263so6075212pjo.1
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nPJER5VpJQWDzK3DbfrzuAnOWSXda5Fj/5jRAuARZxU=;
 b=mI+cOOnt9YT5V5agfVxk9gCjYvnKZCLR2ij/AGdqfuc8751CE0moLz3d7ErkQKbolu
 sybH+W/s67DAyhWYHSm5YechTSHkh6MhP7MueJJv/GiFjqZ650NVf7Pny3PPa6b0h+an
 82wouplwImGIhZ7er4VNem3YbnU00TKuEh/qUSXGgrJJisEpK8jmJhO0tEjjzjYoIkX1
 Om/GcFgNVkzvAsk6QsXg0Y/BFNoAO/7RkVkqYNLiFHHj/U0KQwv17YHI/PQe2KgJw1kq
 0HdzEP+SIeGFn8oRmTRymE5BkMvemKGW8jLYRxoKaGjSKm+mL468l8YDf9RkA6nSugvk
 2gLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nPJER5VpJQWDzK3DbfrzuAnOWSXda5Fj/5jRAuARZxU=;
 b=QeXSZmCiWRQbyM6xJEVH+8DoTbRSq6Eey1RX5BIyvlK6XYFVMrk1HuznBBYyMiG71y
 Y5nZJSpHRpR9XL+0aMrdBsIciIy3eZtVno7iSdAt/3iLvgG5/KE3xArlmGUaFOl/moqP
 qE8RbROctsrmdsTVO4SL4+oZuDT8gxyGeTRtaCadGWLX0GsLUV1GjVHhCi7jZL0p604j
 z8swQvYGg1nmrToz7VSdbjNd4OXgYV/asEcXaIHYqygnwWemdElopFQM3CrqZN649s4/
 6hbkMakzAv4LSHx7EutiEOFA8gvrhCUawDs+3gDnpd6FbOPvyNYtJHqPlA5KC4qIH/J5
 2dJA==
X-Gm-Message-State: AOAM533G3hmofMlvepG+8eFMia6plZDxyyOcVjVyKAKRID43xsVqa8u6
 BDTxWBjErqnsOGb1SHDF6SPPAMWZNHpDeg==
X-Google-Smtp-Source: ABdhPJwiko/gInfmrtImZ4gSFm70OCFPd8aNMndnUcyzvlf/uYKZMOqWmo2jY1tj9n1k4NiSs48Jyg==
X-Received: by 2002:a17:902:9a46:b0:14e:ea0f:28cf with SMTP id
 x6-20020a1709029a4600b0014eea0f28cfmr9138390plv.43.1647796310392; 
 Sun, 20 Mar 2022 10:11:50 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:11:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 15/36] util/log: Use qemu_log_lock/unlock in qemu_log
Date: Sun, 20 Mar 2022 10:11:14 -0700
Message-Id: <20220320171135.2704502-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid using QemuLogFile and RCU directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 util/log.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/util/log.c b/util/log.c
index b1651d8122..3ec6e90575 100644
--- a/util/log.c
+++ b/util/log.c
@@ -62,23 +62,22 @@ void qemu_log_unlock(FILE *fd)
 /* Return the number of characters emitted.  */
 int qemu_log(const char *fmt, ...)
 {
+    FILE *f = qemu_log_lock();
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
2.25.1


