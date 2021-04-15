Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA26E361046
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 18:37:44 +0200 (CEST)
Received: from localhost ([::1]:37198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX4zv-0005G6-ID
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 12:37:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4vt-00038Z-D8
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:33:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX4vq-00069D-PK
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:33:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618504410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WU1rsuPZSbiXCb5ZUrh9An1Xj0dCMP/3YS/3/3XzJFk=;
 b=RyOk0idRvO5vyqSBlz+YCu/RiHhNnFJ+HpA7UPlRYCetxOydPP8KWmkDyod1ggxSxx5k8T
 yplqOW/9/Z0dGQWbYXCgHQflUBIfh0O380qknMbJK/kHyEiYaSAe9CHENdJy6sOb9eE6oO
 QWji0hiB4jxX+yy2N50fPFSqc5t+wKo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-rZADwHoKMrW77MJfW2dXKw-1; Thu, 15 Apr 2021 12:33:28 -0400
X-MC-Unique: rZADwHoKMrW77MJfW2dXKw-1
Received: by mail-wr1-f70.google.com with SMTP id
 d15-20020a5d538f0000b02901027c18c581so2970538wrv.3
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 09:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WU1rsuPZSbiXCb5ZUrh9An1Xj0dCMP/3YS/3/3XzJFk=;
 b=lIq3MCZljBkEzHyn+6lM1uEUZueAtnDBx4zqAYxuDH1f639loNfM4J9CzgZcmopoeq
 O3tVFm4MNkMhGOQaJ7URGueUjDYDhC3hK3tPS3MlsjtWSzmtzrDZQi6DMUWBAH2zF3mL
 fj+5UO4i6YrACY615Bir7xj3aCC+FwitunVW6B2HlDAljZbmnFcIJtVERSGJfVfR9Eev
 EAr98TfjM6TsBKryNoYbI4fpOJiAnlLM/zYpBrvvq2C/nPfib5SqwcbK5ybpv60NwWyQ
 E9n3yqpRIUr8Fns6yGUtpxt1ae0eAmQ9D0LzebAAdYfKGwvS4R9hVTC2yHp0oKPuiCS/
 RM5Q==
X-Gm-Message-State: AOAM533iDeRtg+PNkHwDgsKPbDN2/KXY3jBMJlVTjvI7lglPqgAVUZf4
 71iVUb+eJTsH/zphA3iY5OvJ51Q3l6N/TuGNvISSrhLpHro19hX26hLYZAeuVlGImNaQOwdqkPM
 22MEyMicpOir6NKuy4T6DtWJxoS0CbZSRM0kuuy7AyRpAf0QfDFQgrdSu47/O2uxP
X-Received: by 2002:adf:dd48:: with SMTP id u8mr4409110wrm.139.1618504407383; 
 Thu, 15 Apr 2021 09:33:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGrT61qSo5wj8x2/RALyibrUug64G7g5M5VObIfAAHNuKgLeVhLpqhs/2rFWfX0dQiJbNh5A==
X-Received: by 2002:adf:dd48:: with SMTP id u8mr4409067wrm.139.1618504407155; 
 Thu, 15 Apr 2021 09:33:27 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id h14sm5223708wrq.45.2021.04.15.09.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 09:33:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/12] tests/qtest: Add qtest_has_accel() method
Date: Thu, 15 Apr 2021 18:32:55 +0200
Message-Id: <20210415163304.4120052-4-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210415163304.4120052-1-philmd@redhat.com>
References: <20210415163304.4120052-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the qtest_has_accel() method which allows a runtime
query on whether a QEMU instance has an accelerator built-in.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Since v2:
- reworded (Eric)
Since v1:
- rename qtest_probe_accel() -> qtest_has_accel()
- run with -machine none before creating QTestState
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


