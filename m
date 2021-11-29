Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D0E4618C0
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 15:30:52 +0100 (CET)
Received: from localhost ([::1]:57956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrhgA-0008Hy-54
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 09:30:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrhLn-0001Ob-4b
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:09:47 -0500
Received: from [2a00:1450:4864:20::433] (port=40941
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mrhLk-0006WE-Gn
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 09:09:46 -0500
Received: by mail-wr1-x433.google.com with SMTP id t9so20123351wrx.7
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 06:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bE1boPVSofZsVRYk/2tnKXg+GDOQQWyCjSc44kFDB+A=;
 b=HZWYqXh8i9QQU+OkMcfBc7J52UYZqVbXSj4nI2M5iaw1x3oz9UfzAx0nEUT5Iskt79
 NJ779y0QLEjB4PtzWSYqn8hvarUFisVDRR7aD84UnwzzPhlFE5r+MDcQQ8uXr+jJ8VTD
 uP6ngFRTq7YmuIMJOFCHvfKhoYSpo+OFgXcgl+SAvJf+NwKgWYC38P9Y67C5PeFMbYcj
 shs4UQ73p4MNSDLxwE3gfZkLoTaVl8fiMjD7ACmjfNGM72Lk7iLzmTAHok+gVqQd6p1J
 iEHWifRXgCB1TAuviMmWwBBN7DtXl9ZVndBfUKWG41A4HYt/FEmjg9BCI+eCDdzG7bCa
 76CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bE1boPVSofZsVRYk/2tnKXg+GDOQQWyCjSc44kFDB+A=;
 b=FLKn15qgbxwuf3vrZoJV16rsnSUtnP6yPzFLfpP98hcnDXE3cOo9Kw8l7MJM1Rgmxn
 jff9M67IlWWdWcKRprt2qRNimmHaTp8bQSe1i+D8KwVoLuM/QGg1sW/qccXmvPKpGVQ3
 JmzBda6h4yxZNkianb7xunoVfDydEuLJcJ38rSORGrN09j8swDQTsIr/wHhK/37VSFeQ
 K0yfrQmlTmGgIVp5f16ZXItZ/9eklC6ayRLlZcpcPmgVlmjMPVDusqcmjChyTrb+shgW
 qSGO9QA+ebu4kdzjtBomkj53QNNiXXxC5VEvY8JxnttB53efEWqbC+KjRlHYqenLpWZG
 d/XQ==
X-Gm-Message-State: AOAM533EZsBS+Qe/ZUYrMl3CiZVn//DMEMVnCl2V5y6oXLBAi2DcX9a5
 ApaVhaduG8Dc+EUHgRSPoQEFNQ==
X-Google-Smtp-Source: ABdhPJwW5trdXzFhLjB7OVnwYe6ApnBTfMMRSoqcTwqUI5mauZ+2OkJuXeuDcCif5T7W9XUNF5ONYg==
X-Received: by 2002:a05:6000:18a3:: with SMTP id
 b3mr34450461wri.343.1638194983187; 
 Mon, 29 Nov 2021 06:09:43 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 138sm19954070wma.17.2021.11.29.06.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 06:09:39 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 913041FF9F;
 Mon, 29 Nov 2021 14:09:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 8/8] tests/plugin/syscall.c: fix compiler warnings
Date: Mon, 29 Nov 2021 14:09:32 +0000
Message-Id: <20211129140932.4115115-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211129140932.4115115-1-alex.bennee@linaro.org>
References: <20211129140932.4115115-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com,
 Juro Bystricky <juro.bystricky@intel.com>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Juro Bystricky <juro.bystricky@intel.com>

Fix compiler warnings. The warnings can result in a broken build.
This patch fixes warnings such as:

In file included from /usr/include/glib-2.0/glib.h:111,
                 from ../tests/plugin/syscall.c:13:
../tests/plugin/syscall.c: In function ‘print_entry’:
/usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: ‘out’ may be
       used uninitialized in this function [-Werror=maybe-uninitialized]
   g_free (*pp);
   ^~~~~~~~~~~~
../tests/plugin/syscall.c:82:23: note: ‘out’ was declared here
     g_autofree gchar *out;
                       ^~~
In file included from /usr/include/glib-2.0/glib.h:111,
                 from ../tests/plugin/syscall.c:13:
../tests/plugin/syscall.c: In function ‘vcpu_syscall_ret’:
/usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: ‘out’ may be
        used uninitialized in this function [-Werror=maybe-uninitialized]
   g_free (*pp);
   ^~~~~~~~~~~~
../tests/plugin/syscall.c:73:27: note: ‘out’ was declared here
         g_autofree gchar *out;
                           ^~~
cc1: all warnings being treated as errors

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211128011551.2115468-1-juro.bystricky@intel.com>
---
 tests/plugin/syscall.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tests/plugin/syscall.c b/tests/plugin/syscall.c
index 484b48de49..96040c578f 100644
--- a/tests/plugin/syscall.c
+++ b/tests/plugin/syscall.c
@@ -70,19 +70,17 @@ static void vcpu_syscall_ret(qemu_plugin_id_t id, unsigned int vcpu_idx,
         }
         g_mutex_unlock(&lock);
     } else {
-        g_autofree gchar *out;
-        out = g_strdup_printf("syscall #%" PRIi64 " returned -> %" PRIi64 "\n",
-                num, ret);
+        g_autofree gchar *out = g_strdup_printf(
+             "syscall #%" PRIi64 " returned -> %" PRIi64 "\n", num, ret);
         qemu_plugin_outs(out);
     }
 }
 
 static void print_entry(gpointer val, gpointer user_data)
 {
-    g_autofree gchar *out;
     SyscallStats *entry = (SyscallStats *) val;
     int64_t syscall_num = entry->num;
-    out = g_strdup_printf(
+    g_autofree gchar *out = g_strdup_printf(
         "%-13" PRIi64 "%-6" PRIi64 " %" PRIi64 "\n",
         syscall_num, entry->calls, entry->errors);
     qemu_plugin_outs(out);
-- 
2.30.2


