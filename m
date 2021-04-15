Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC494360967
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 14:29:20 +0200 (CEST)
Received: from localhost ([::1]:59374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX17X-0004RE-GH
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 08:29:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX15C-0002x0-0O
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 08:26:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX159-00060P-NW
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 08:26:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618489611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WU1rsuPZSbiXCb5ZUrh9An1Xj0dCMP/3YS/3/3XzJFk=;
 b=NMH9F2XzumnaE3zEHUYPvf3o5kkJ8g0XsbXA/4csCYVfnvFy2m1cKaJDEVYvsVtMRFVOQp
 1WjcqIM1BYC1VO0Bz2KgTaoL6d0ByXUi2rpUlER0acV5F9VykJ8GbIlrGa+BRAwhyfJ3yA
 BgtJHStPqplCxmSxDH396pg/iqISKmQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-jwDfUz4JOSaxPsQJoMm5GA-1; Thu, 15 Apr 2021 08:26:47 -0400
X-MC-Unique: jwDfUz4JOSaxPsQJoMm5GA-1
Received: by mail-wm1-f69.google.com with SMTP id
 o3-20020a1c75030000b029010f4e02a2f2so2830895wmc.6
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 05:26:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WU1rsuPZSbiXCb5ZUrh9An1Xj0dCMP/3YS/3/3XzJFk=;
 b=W1PhiOuS7d8XyfXvV2CYWUD0BT4zlnkFPBjdpNjIrOnz4RttwhEjr9sChRN5MKbEGs
 JCGvcdvkK3L82cf8S9k/twoImv5lHX0REefoku6t65xVvSch7O7nmR/oad1bWoiQo5uq
 qvltKhlenCXIxVsdtcy2R7L88kcTTu8qaMEkIGsFEtoI8Fw3tAlJoxjoAneNHsmrikLR
 cgyr3aoVB/bkCE8/jbrbpKtX6wLWB7wa+d8Hga8DxQBfvuoajXs9g779Yl7OCByuq4AR
 2OOw6VuyxIloqM9a/DgbmAUSRAkqlYat0VibBTDY3JeHUAQse+vYVs7g+GjClaBK0JM8
 alog==
X-Gm-Message-State: AOAM530czV/vD0o7PNVgy+ANw2wdfbRNoqmRyYLDUpUz+WM9FYN+GhuO
 hsIuN8/urJbiqdu8D3wDuDbsInlCUnPoGKEdbCy+KUF1t3GWukg9DvHAFM9HaeF0ythcdQXgt9g
 B4re7E6ThP5MlC5icISQ/3hHIIL/hF5q4OrzQfMFmaIw8RrVc2YB+nreXSOTbWeu2
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr2619761wrd.159.1618489606443; 
 Thu, 15 Apr 2021 05:26:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzB90NWbYaE7b8Gf0ZunPtbrJC+NSXfcFzScvhaN2FMv+oN+b1BXp3u+mFGGp9PD013jpJoIg==
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr2619727wrd.159.1618489606241; 
 Thu, 15 Apr 2021 05:26:46 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id x17sm1399684wmi.46.2021.04.15.05.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 05:26:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/6] tests/qtest: Add qtest_has_accel() method
Date: Thu, 15 Apr 2021 14:26:29 +0200
Message-Id: <20210415122633.4054644-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210415122633.4054644-1-philmd@redhat.com>
References: <20210415122633.4054644-1-philmd@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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


