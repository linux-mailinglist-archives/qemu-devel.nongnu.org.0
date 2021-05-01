Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FC637093A
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 00:43:00 +0200 (CEST)
Received: from localhost ([::1]:33716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcyKB-0002aI-Q6
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 18:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcyEO-0004R9-HK
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:37:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcyEM-0008Hj-W8
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:37:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619908618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KvNHYhxkAqUqa9h+Qg11UCChxb8z3nuwgPPE3IGPHzY=;
 b=VlsltCOxyJRbch0PLwvgEEZfoKSOkyzKik8jtv6xws9St1R0+enZozBv5CY2YrlkYRtifU
 zvCSLKfQZ+is95hbVQMKo/KtiGvGXVUEWUviXQ0gZwo0jd5XhOEFRJZ8QY4yqyAIyrhb6q
 Do9lQgf/ZTIDZezG4RDY2lbAYHnBq4w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-KxmcaGUdNROAui3tJjQ41Q-1; Sat, 01 May 2021 18:36:57 -0400
X-MC-Unique: KxmcaGUdNROAui3tJjQ41Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso1282562wrf.11
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 15:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KvNHYhxkAqUqa9h+Qg11UCChxb8z3nuwgPPE3IGPHzY=;
 b=M3FF4iZ+u9/1rstmGp+PCUo2nQVDCrHdkg0gvcank1DOSieKI9mHAqRybDE9DqjY0+
 HMILeGlVSIb541+UB9cvNYafAFxRIw0MQutV1Ir3BNZeo7PJ9wDxwN9cuhXWo1F8g9WI
 aJdUfGBegoR7Woxzi8v9gcSx7rw12zSkqUYI5AHeZh9NoplyO6CceTxO7mPmQGLxVwCc
 fJrew/XXUUOZGYYaxxEvuqt7TMthhvW9xYss5XbPOz/9CKQ85TaB0IVeQKBICSgWKfIS
 DSOX3Ge7ablrbIlXP6fOLOQu1PFetzwka8Qquk1pJp/fnRo2UjLgRF9cWe6Cz4esZFF2
 nizA==
X-Gm-Message-State: AOAM531xv4dQ0FwHdqJqq+buiaNK/Yyyuvsz/UaPf7FoKkNVUK7wkIFs
 Fse9NLaRepXe0SwUJJpRXVMesG9uk4ZZ9ztEJKyXLGuLF9pGv/0z0o3QN1SryMwmpo+MKDY0gYn
 N0Wbc8HudKfI3+XGEq0YGAw4eWLCzht8P+105SQHOwupReePx/mzwl81V2EWj1Ni5
X-Received: by 2002:adf:fd0c:: with SMTP id e12mr3860681wrr.111.1619908615742; 
 Sat, 01 May 2021 15:36:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwn0mNPqpviMBqvwGpey6yvYbioi6rCsf3OxMpCVr2STxoQww3bFfq9mE8/L++4wHSsFlqTfA==
X-Received: by 2002:adf:fd0c:: with SMTP id e12mr3860658wrr.111.1619908615597; 
 Sat, 01 May 2021 15:36:55 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id s16sm16600778wmh.11.2021.05.01.15.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 15:36:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 03/10] tests/qtest: Add qtest_has_accel() method
Date: Sun,  2 May 2021 00:36:31 +0200
Message-Id: <20210501223638.510712-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210501223638.510712-1-philmd@redhat.com>
References: <20210501223638.510712-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the qtest_has_accel() method which allows a runtime
query on whether a QEMU instance has an accelerator built-in.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/libqos/libqtest.h |  8 ++++++++
 tests/qtest/libqtest.c        | 29 +++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
index a68dcd79d44..d80c618c18d 100644
--- a/tests/qtest/libqos/libqtest.h
+++ b/tests/qtest/libqos/libqtest.h
@@ -763,6 +763,14 @@ void qmp_expect_error_and_unref(QDict *rsp, const char *class);
  */
 bool qtest_probe_child(QTestState *s);
 
+/**
+ * qtest_has_accel:
+ * @accel_name: Accelerator name to check for.
+ *
+ * Returns: true if the accelerator is built in.
+ */
+bool qtest_has_accel(const char *accel_name);
+
 /**
  * qtest_set_expected_status:
  * @s: QTestState instance to operate on.
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 71e359efcd3..2156b7e3972 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -393,6 +393,35 @@ QTestState *qtest_init_with_serial(const char *extra_args, int *sock_fd)
     return qts;
 }
 
+bool qtest_has_accel(const char *accel_name)
+{
+    bool has_accel = false;
+    QDict *response;
+    QList *accels;
+    QListEntry *accel;
+    QTestState *qts;
+
+    qts = qtest_initf("-accel qtest -machine none");
+    response = qtest_qmp(qts, "{'execute': 'query-accels'}");
+    accels = qdict_get_qlist(response, "return");
+
+    QLIST_FOREACH_ENTRY(accels, accel) {
+        QDict *accel_dict = qobject_to(QDict, qlist_entry_obj(accel));
+        const char *name = qdict_get_str(accel_dict, "name");
+
+        if (g_str_equal(name, accel_name)) {
+            has_accel = true;
+            break;
+        }
+    }
+    qobject_unref(response);
+
+    qtest_quit(qts);
+
+    return has_accel;
+}
+
+
 void qtest_quit(QTestState *s)
 {
     qtest_remove_abrt_handler(s);
-- 
2.26.3


