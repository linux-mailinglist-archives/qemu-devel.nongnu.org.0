Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC5D3FFCCB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:12:51 +0200 (CEST)
Received: from localhost ([::1]:54862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5Fi-0003Fe-V0
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM57D-0006L7-9r
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:04:03 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:35524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM57B-0005i3-BJ
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:04:02 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 z9-20020a7bc149000000b002e8861aff59so3297877wmi.0
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 02:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mR+DLJiG7KKaByVpRDzQv8ceHSAlvak8Zfn7rSXlsPc=;
 b=rM8Q/HjymvS3X9RmUppWagtEPA8UKYOVUiJAgQFYeC3lZAnT1WZufMC6IEPVCpWnt7
 f+nOyZNBJuwLgvYaUA6d/gn9crHhj2gKO5WAcZshOWZBbhqqQMBL9Yc3TAh5MAJ2opVU
 Tu/z7DgCHkuaLS/RotN953RS4A7FcYjF/x+SNbifZEhmQSbdHx+mhH3eNvv2Ojum01kQ
 UesZDja2ZpTbipI5eKuiba3vL6DLGetOQ/ae74tEXST8nCi5OJiLNZUnby0iuGttqigP
 Y2KIIqQi3kvGTRcFsfKdj6lgrIVTzLy0cRQa8ndziS1r62i6uHXce6nPSziTLustGQfe
 qcaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mR+DLJiG7KKaByVpRDzQv8ceHSAlvak8Zfn7rSXlsPc=;
 b=lMq+OTvZXh3bBGT1c0V7tqjNAh3JoFPSLApZSyy30eze2vzK2OPg1SANRfk8JYKBfR
 KTv3juQgzPyQ0KVWKaeJk8MaCy9Sihjzcx/Ry4K88HZYCT5S32x37vIs+KgkIpGJpwBX
 Ym9/2r7XTckYLMrXvixrWip9vCFfQA9E1Jdba3RRP5usR/hObxde75xy8mP1suxgFV4/
 PrkNBWFPqvLv0FoGF3jVL+Xcaq3unHP/+v83CeuXucfMo+cxfh6DO0yCEK7M5/EFttdI
 wpD6trbrMviPOE14r/mUbmtHaoxU34ZTUsBwRtHT/R7qJMrlHj3dmHflJHfcv+/whVc1
 xuoQ==
X-Gm-Message-State: AOAM532PPQIiHqcywZPMpop0Jim7Mm0mmmH4HxJxxFE0aTM6fRpL+Qle
 V7FpW0TfaqnPWB2bwtRA0oAUhA==
X-Google-Smtp-Source: ABdhPJyYOweHh5oTFSzWhaILCc1h/4TF0ioaRMdSPK6wgn0Ydm5wuXAUCjF0SofzC967C25qaJlUwg==
X-Received: by 2002:a1c:2209:: with SMTP id i9mr2267594wmi.92.1630659839899;
 Fri, 03 Sep 2021 02:03:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n4sm3331640wra.37.2021.09.03.02.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 02:03:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1577A1FFAE;
 Fri,  3 Sep 2021 10:03:41 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 15/22] plugins/howvec: adapting to the new argument passing
 scheme
Date: Fri,  3 Sep 2021 10:03:32 +0100
Message-Id: <20210903090339.1074887-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903090339.1074887-1-alex.bennee@linaro.org>
References: <20210903090339.1074887-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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

Correctly parsing plugin argument since they now must be provided as
full-form boolean parameters, e.g.:
    -plugin ./contrib/plugins/libhowvec.so,verbose=on,inline=on

Also, introduced the argument "count" that accepts one opt to count
individually at a time.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210730135817.17816-8-ma.mandourr@gmail.com>

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index e1f9eff587..7b1dece024 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -80,7 +80,7 @@ Once built a program can be run with multiple plugins loaded each with
 their own arguments::
 
   $QEMU $OTHER_QEMU_ARGS \
-      -plugin tests/plugin/libhowvec.so,arg=inline,arg=hint \
+      -plugin tests/plugin/libhowvec.so,inline=on,count=hint \
       -plugin tests/plugin/libhotblocks.so
 
 Arguments are plugin specific and can be used to modify their
@@ -212,13 +212,13 @@ The hotpages plugin can be configured using the following arguments:
 
 This is an instruction classifier so can be used to count different
 types of instructions. It has a number of options to refine which get
-counted. You can give an argument for a class of instructions to break
-it down fully, so for example to see all the system registers
-accesses::
+counted. You can give a value to the `count` argument for a class of
+instructions to break it down fully, so for example to see all the system
+registers accesses::
 
   ./aarch64-softmmu/qemu-system-aarch64 $(QEMU_ARGS) \
     -append "root=/dev/sda2 systemd.unit=benchmark.service" \
-    -smp 4 -plugin ./contrib/plugins/libhowvec.so,arg=sreg -d plugin
+    -smp 4 -plugin ./contrib/plugins/libhowvec.so,count=sreg -d plugin
 
 which will lead to a sorted list after the class breakdown::
 
diff --git a/contrib/plugins/howvec.c b/contrib/plugins/howvec.c
index 600f7facc1..4a5ec3d936 100644
--- a/contrib/plugins/howvec.c
+++ b/contrib/plugins/howvec.c
@@ -333,23 +333,34 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
 
     for (i = 0; i < argc; i++) {
         char *p = argv[i];
-        if (strcmp(p, "inline") == 0) {
-            do_inline = true;
-        } else if (strcmp(p, "verbose") == 0) {
-            verbose = true;
-        } else {
+        g_autofree char **tokens = g_strsplit(p, "=", -1);
+        if (g_strcmp0(tokens[0], "inline") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &do_inline)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", p);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "verbose") == 0) {
+            if (!qemu_plugin_bool_parse(tokens[0], tokens[1], &verbose)) {
+                fprintf(stderr, "boolean argument parsing failed: %s\n", p);
+                return -1;
+            }
+        } else if (g_strcmp0(tokens[0], "count") == 0) {
+            char *value = tokens[1];
             int j;
             CountType type = COUNT_INDIVIDUAL;
-            if (*p == '!') {
+            if (*value == '!') {
                 type = COUNT_NONE;
-                p++;
+                value++;
             }
             for (j = 0; j < class_table_sz; j++) {
-                if (strcmp(p, class_table[j].opt) == 0) {
+                if (strcmp(value, class_table[j].opt) == 0) {
                     class_table[j].what = type;
                     break;
                 }
             }
+        } else {
+            fprintf(stderr, "option parsing failed: %s\n", p);
+            return -1;
         }
     }
 
-- 
2.30.2


