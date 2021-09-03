Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2ED3FFCF1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:20:20 +0200 (CEST)
Received: from localhost ([::1]:52758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5Mx-0004O2-PM
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM57K-0006YL-P1
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:04:12 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM57F-0005lS-Co
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:04:06 -0400
Received: by mail-wr1-x42d.google.com with SMTP id g18so7174978wrc.11
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 02:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P0i71SO0mUfOxacGplPpPt2MK0kYjZTuvRy4ItPlDSU=;
 b=YLuv6o8Q6q86KhnHPd4gpYOdVjBAoVIwsG89SLENecGj4DYUgAJ8neNjKnayOQvtKL
 q0qAvzfj8bRrr6+bR2pkhvYBGJxnxtS1yIinImUwxgZxqe3qjLbZKf1YgFySQjmZQLtL
 xKA7SlJh78XHtB0udg2goZb39EFpUbX7EqZHOnVi3ikfbkHA7VQsog7yzwcKtUn2Jp9K
 H3xqchSiZYrhvX8S0zF0ddJOt24+i1Da1So9wlmwu+cV5QU5E6s1PfM9F0aMxrWYCQPW
 MjawGKTqoBJPUaWKZA04SlwzPCanDFQwG5LGZnrGOoYremBo5ZuUOO59RJ9IjTTxNxYj
 BDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P0i71SO0mUfOxacGplPpPt2MK0kYjZTuvRy4ItPlDSU=;
 b=BWtZWkxIgQxcCbLNyOj1HaCeFdH7nMWsXArL+DukGmYK9coO+RwTIuPZ81UcQV/dP/
 cOkJI4s6NJyRzPpg32AKnbSzAjSfIX81dEPbOsHoDilF+VKT2IRB75Edf1miSEdf6Go3
 hKUlT8AV/yzbOhxQeRdWfaeSmzcyJ3R5e8UMRpjiSVaSbizQqUA5XXeRpANOGZaIbbzD
 usN/AkS3GmCxJg2EYWRwngoBURrtIlPBPeJgFSpUPIyLcBDwi0El9bp95o27996VfWFh
 J9C0Vp34SM8IYTSNNo8q2FHzZwfLENXafXaUw2Aq+kCfEbA2CYD0skkb7tNTsSYM6NJA
 GaSQ==
X-Gm-Message-State: AOAM533g/1ABiWQ/dycBnIDuFG/YFP3BP36ButbDZOZxw+sqTxkQ3IL7
 fr5/L/7KIPhf6iDT3lRYDwRJFA==
X-Google-Smtp-Source: ABdhPJxCe10EgH5FGr7MuKkOf41eKw005FZlmnyh7LsdHKi8Fgo115NmfKUbkPqE7I/3g2+wCsu7XA==
X-Received: by 2002:a05:6000:1091:: with SMTP id
 y17mr2729359wrw.202.1630659843986; 
 Fri, 03 Sep 2021 02:04:03 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l2sm3876051wmi.1.2021.09.03.02.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 02:03:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 360151FFB1;
 Fri,  3 Sep 2021 10:03:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 17/22] tests/plugins/bb: adapt to the new arg passing scheme
Date: Fri,  3 Sep 2021 10:03:34 +0100
Message-Id: <20210903090339.1074887-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903090339.1074887-1-alex.bennee@linaro.org>
References: <20210903090339.1074887-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210730135817.17816-10-ma.mandourr@gmail.com>

diff --git a/tests/plugin/bb.c b/tests/plugin/bb.c
index de09bdde4e..7d470a1011 100644
--- a/tests/plugin/bb.c
+++ b/tests/plugin/bb.c
@@ -104,10 +104,17 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
 
     for (i = 0; i < argc; i++) {
         char *opt = argv[i];
-        if (g_strcmp0(opt, "inline") == 0) {
-            do_inline = true;
-        } else if (g_strcmp0(opt, "idle") == 0) {
-            idle_report = true;
+        g_autofree char **tokens = g_strsplit(opt, "=", 2);
+        if (g_strcmp0(tokens[0], "inline") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_inline)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "idle") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &idle_report)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", opt);
+                return -1;
+            }
         } else {
             fprintf(stderr, "option parsing failed: %s\n", opt);
             return -1;
-- 
2.30.2


