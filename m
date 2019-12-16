Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B52212039A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 12:18:50 +0100 (CET)
Received: from localhost ([::1]:51464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igoOm-0000xM-KG
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 06:18:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50209)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1igoEE-0005XW-OB
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 06:07:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1igoED-0003xI-Gc
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 06:07:54 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:46134)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1igoED-0003uC-AA
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 06:07:53 -0500
Received: by mail-wr1-x443.google.com with SMTP id z7so6668274wrl.13
 for <qemu-devel@nongnu.org>; Mon, 16 Dec 2019 03:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EapHr3pf3XFLFZlU0U22jAMjtMgqM8Xrl+mCmZ4QWKU=;
 b=ywpN5YA6aCvHTyEWwS0u5/pYxOTVGI38mdV308SSTsfdYdCFqNkiRzJONqHeQvIcX+
 St6hHKunOSzkpdtHTEMgm2+hTv0NK2GIHP4E0YvH5O0+TquOtFi4C+TFC6bD3owOnHQ8
 sDNl3lL80pVWkCuTwXnPsebCEL2UIctKVLP/Pn/CbZ2++FU3mDTdq++xf9sJUBk6au0I
 sIX4mBHcZuP5RigpNU7sY8r/w3XscKmVGnDUi4KdUSURZSHlLHAWslLUVT6P7JUdqHsd
 UWAvUTjHHhV1SSdsG+AvykT4gh/2ifexeGYP08lcgYUsg0DPRMcQp+P0NQ1HyZOWg9nK
 P78g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EapHr3pf3XFLFZlU0U22jAMjtMgqM8Xrl+mCmZ4QWKU=;
 b=KoPS8hwrMbxQ1AA0MNnpsMGjvLnHu9AOPKuACEOXXJ0T+0Iact5g3P7tsxIB/F6seh
 dI6Q+k+yJeFQMUXsPWkSHo75HXgVXAChObrijj9VfYt3+Jt6k4uFdPfGhlVCltsT9VVY
 fQZCD/4gUPVcQ9sdAYD3uMdUXf1hwtqpUKVMFduS7rlAExHpYwd4ZpLuWXFm8TFdpeS1
 LXPwMSELBgYMc1CRNV72Le0BlDGh5nEyGxLG9BUqVnSDgbLiy88FjV/kBDuDOjjmtWju
 hAO382lPVvTcgisMVohelsEQCNwqZgLyi0onWBqLbCgNkrdhisnHImIA65fe89Ad/cEn
 gavw==
X-Gm-Message-State: APjAAAUktOFQ3/CCA0dCFJwvTUboNbgv1kQAkhaYrVXytbof1F+iwkSn
 8S9jHnrEk+kd37dQSWpGiN2hOQ==
X-Google-Smtp-Source: APXvYqwposUjIe7B/3bm7El0RYkM/AZ/pfHVJeqD6KJPTRNrZLCdDQ2fHFxukQOskGqiXYFPyB1i+g==
X-Received: by 2002:adf:f803:: with SMTP id s3mr29258255wrp.7.1576494472318;
 Mon, 16 Dec 2019 03:07:52 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u22sm22206820wru.30.2019.12.16.03.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2019 03:07:46 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 573EB1FF9D;
 Mon, 16 Dec 2019 11:07:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 13/16] Add a mutex to guarantee single writer to
 qemu_logfile handle.
Date: Mon, 16 Dec 2019 11:07:29 +0000
Message-Id: <20191216110732.24027-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191216110732.24027-1-alex.bennee@linaro.org>
References: <20191216110732.24027-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: fam@euphon.net, berrange@redhat.com, Robert Foley <robert.foley@linaro.org>,
 stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Robert Foley <robert.foley@linaro.org>

Also added qemu_logfile_init() for initializing the logfile mutex.

Note that inside qemu_set_log() we needed to add a pair of
qemu_mutex_unlock() calls in order to avoid a double lock in
qemu_log_close().  This unavoidable temporary ugliness will be
cleaned up in a later patch in this series.

Signed-off-by: Robert Foley <robert.foley@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20191118211528.3221-4-robert.foley@linaro.org>
---
 util/log.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/util/log.c b/util/log.c
index 417d16ec66e..953a66b5a8d 100644
--- a/util/log.c
+++ b/util/log.c
@@ -24,8 +24,10 @@
 #include "qapi/error.h"
 #include "qemu/cutils.h"
 #include "trace/control.h"
+#include "qemu/thread.h"
 
 static char *logfilename;
+static QemuMutex qemu_logfile_mutex;
 FILE *qemu_logfile;
 int qemu_loglevel;
 static int log_append = 0;
@@ -49,6 +51,11 @@ int qemu_log(const char *fmt, ...)
     return ret;
 }
 
+static void __attribute__((__constructor__)) qemu_logfile_init(void)
+{
+    qemu_mutex_init(&qemu_logfile_mutex);
+}
+
 static bool log_uses_own_buffers;
 
 /* enable or disable low levels log */
@@ -70,7 +77,9 @@ void qemu_set_log(int log_flags)
     if (qemu_loglevel && (!is_daemonized() || logfilename)) {
         need_to_open_file = true;
     }
+    qemu_mutex_lock(&qemu_logfile_mutex);
     if (qemu_logfile && !need_to_open_file) {
+        qemu_mutex_unlock(&qemu_logfile_mutex);
         qemu_log_close();
     } else if (!qemu_logfile && need_to_open_file) {
         if (logfilename) {
@@ -105,6 +114,7 @@ void qemu_set_log(int log_flags)
 #endif
             log_append = 1;
         }
+        qemu_mutex_unlock(&qemu_logfile_mutex);
     }
 }
 
@@ -240,12 +250,14 @@ void qemu_log_flush(void)
 /* Close the log file */
 void qemu_log_close(void)
 {
+    qemu_mutex_lock(&qemu_logfile_mutex);
     if (qemu_logfile) {
         if (qemu_logfile != stderr) {
             fclose(qemu_logfile);
         }
         qemu_logfile = NULL;
     }
+    qemu_mutex_unlock(&qemu_logfile_mutex);
 }
 
 const QEMULogItem qemu_log_items[] = {
-- 
2.20.1


