Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A814C508F23
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:11:54 +0200 (CEST)
Received: from localhost ([::1]:38160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhEnu-0006ro-UM
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:11:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEif-0005Hm-TM
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:26 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:36398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhEie-0001Ah-Ah
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:06:25 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 ga4-20020a17090b038400b001d4b33c74ccso1746707pjb.1
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qOdUv5mfLIRRq/G3CLO50Ev+VYpnxZy+//PQdRqaMNk=;
 b=J+/HG7uuivAl4Wbn573ogI+SnNn59jNB5r5E8WdbO66d1ALxfcDf8ZQcS4wPsMbdJ/
 F2HgvBTCrzx4keYNw1ZoQpQFMksjBDr0k/CjJE7hKa50/k3fNQjlfDekmuTqknZvPX57
 sPhhm28rLmrCSpgpPR1iq++yoXEqVV+fr8J/wkc00WZnoyDJ/dDdHVErW8sDl2DE/16F
 XiVQY5LQXHCE7gjAqDOgVIrddJdmaf2SJzQs8lrKx8XmSCENzcSsKDlmqV2iXYNTDW5g
 GXjvWKiEccy21gMSECbuBJ8g0LIa9tNlkGjsCvxL/o5c59DUhKoi8/tppdjLsFwG/szz
 15xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qOdUv5mfLIRRq/G3CLO50Ev+VYpnxZy+//PQdRqaMNk=;
 b=ZYS482yK+g9dimyiiuukuWefHOpCZdLSl0F7S+K9to42Dg+YK4x3NKRGZY8gM0zd0Q
 ZFP8OogvOypEiVbgnlAm6WI9iEVjiDyIlPas88mB+8Y/pC4VAA+1N/xWz6+ydDSGPQAA
 yZP8qC5nLrGhWdSrz8qiZJ/pzZ+HpbgaXh5NI3XX3NuF1WLOlkLBOSx6vm1scE8CinDM
 n9jUOROweLGabpzrUfAnnH9f5FgzdkelYwlyGuwRghIIpaOxYwqM6fhIxoTs0wieo0nX
 GBz/fE4swMl3XuNW18/dtpRBLocuRaEZ6pN1u1QA+mYA/c1VnYqZbYzj0n2D/HBVDqxh
 zd1g==
X-Gm-Message-State: AOAM532bXQN5VFBMVhXZ9uwvPcJRlJZbEPIfN8qLdRJoVnVsIPULcFdx
 q8GHAaPc102D1GSwtQxz7bizGTbDBaikLg==
X-Google-Smtp-Source: ABdhPJwqkMsfioanJqOXz6NRdFkCbdrKHO2lts0diUHYwkG09TskpnDihvSZDL9YSyd4rPJ/iYJcmg==
X-Received: by 2002:a17:902:ecd0:b0:159:572:af3a with SMTP id
 a16-20020a170902ecd000b001590572af3amr14052970plh.77.1650477982954; 
 Wed, 20 Apr 2022 11:06:22 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a058200b001d2fc489b8asm56681pji.25.2022.04.20.11.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:06:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/39] util/log: Return bool from qemu_set_log_filename
Date: Wed, 20 Apr 2022 11:05:42 -0700
Message-Id: <20220420180618.1183855-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420180618.1183855-1-richard.henderson@linaro.org>
References: <20220420180618.1183855-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

Per the recommendations in qapi/error.h, return false on failure.

Use the return value in the monitor, the only place we aren't
already passing error_fatal or error_abort.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220417183019.755276-4-richard.henderson@linaro.org>
---
 include/qemu/log.h | 2 +-
 monitor/misc.c     | 3 +--
 util/log.c         | 5 +++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index ed59ebd4a2..fabfbe41da 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -148,7 +148,7 @@ typedef struct QEMULogItem {
 extern const QEMULogItem qemu_log_items[];
 
 void qemu_set_log(int log_flags);
-void qemu_set_log_filename(const char *filename, Error **errp);
+bool qemu_set_log_filename(const char *filename, Error **errp);
 void qemu_set_dfilter_ranges(const char *ranges, Error **errp);
 bool qemu_log_in_addr_range(uint64_t addr);
 int qemu_str_to_log_mask(const char *str);
diff --git a/monitor/misc.c b/monitor/misc.c
index b0fc0e5843..4b68fcd346 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -419,8 +419,7 @@ static void hmp_logfile(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
 
-    qemu_set_log_filename(qdict_get_str(qdict, "filename"), &err);
-    if (err) {
+    if (!qemu_set_log_filename(qdict_get_str(qdict, "filename"), &err)) {
         error_report_err(err);
     }
 }
diff --git a/util/log.c b/util/log.c
index ffa66a267e..a838686a18 100644
--- a/util/log.c
+++ b/util/log.c
@@ -138,7 +138,7 @@ void qemu_set_log(int log_flags)
  *
  * filename may be NULL. In that case, log output is sent to stderr
  */
-void qemu_set_log_filename(const char *filename, Error **errp)
+bool qemu_set_log_filename(const char *filename, Error **errp)
 {
     g_free(logfilename);
     logfilename = NULL;
@@ -149,7 +149,7 @@ void qemu_set_log_filename(const char *filename, Error **errp)
                 /* We only accept one %d, no other format strings */
                 if (pidstr[1] != 'd' || strchr(pidstr + 2, '%')) {
                     error_setg(errp, "Bad logfile format: %s", filename);
-                    return;
+                    return false;
                 } else {
                     logfilename = g_strdup_printf(filename, getpid());
                 }
@@ -160,6 +160,7 @@ void qemu_set_log_filename(const char *filename, Error **errp)
 
     qemu_log_close();
     qemu_set_log(qemu_loglevel);
+    return true;
 }
 
 /* Returns true if addr is in our debug filter or no filter defined
-- 
2.34.1


