Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C77C7338123
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 00:14:26 +0100 (CET)
Received: from localhost ([::1]:44922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKUVd-0003Vz-Oq
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 18:14:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKUTr-0001kw-8l
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:12:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lKUTb-00051s-Ei
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:12:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615504338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IiEzCG+Hf3rSrZ1O/fDyPl0nPuZdX/n6VTk+3584BFs=;
 b=OZKCWGKXT0fpcGVeFBpSyildN78/jiFNspjfjAmveUYqfHCHQsyjdPiUWiunwjjkALkE8V
 A7W12GTkQV6AusDBYCVbMBXjyePEdkwnUFU15LYuDOV1k8pJmAzxa1/7711aXAxB1mShrj
 mratCyVpixjJZaiJs3M/vYbYwHR7HvA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-H8bw_UezOEK7lqSmkwTMEw-1; Thu, 11 Mar 2021 18:12:17 -0500
X-MC-Unique: H8bw_UezOEK7lqSmkwTMEw-1
Received: by mail-wm1-f69.google.com with SMTP id v5so4636290wml.9
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 15:12:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IiEzCG+Hf3rSrZ1O/fDyPl0nPuZdX/n6VTk+3584BFs=;
 b=DRFYI5n9iuRWLiEwtWgKZSVS6sZrFLySX1ellkuNhJ8LIH+/OPIlTuMWmheF+9f5lH
 dRVIZsDhbPOKtw72gWxFGyKnSgiMQKZQ7vhFFS//n3Zks6wJiLP5N26ia2IFVgKz/jX2
 lDV0NFL8Qfc53krliWNaHhmWhodGVvN3vD/kQafk1zurGqi1Sm+i0XW0c/jLpJ5EJfL7
 uq1LWQph1G59AuOsBu5kiHmJ83ojo1DuayaGjGucReB9URsRfQesRQC9B/JgjdzAtjlh
 kCXr+hhypVBPBeBKlWKIxBtvwTgrOmdJ/FPecqA/x1QxNpaLysfa+L9z/RuJVnHkCJx/
 LGUQ==
X-Gm-Message-State: AOAM532fKnjYukCnrUh/2stXuPv9MTiXk8eQnxqrECntzg6dNRHonahO
 VYHkRDO0lULhJ8hFjXGNpntzQJfMzVpv4afoCWZH1SJMRa3NpXC9JenocJvjEUX/lqJzfA0i69O
 H1K5GcGLIqRRuxmoikjup3hgEGuo+Z8u+rjMpSr+HA2nDYN2qLaaZOkCU6aez0esV
X-Received: by 2002:a7b:cbc1:: with SMTP id n1mr10495969wmi.30.1615504336102; 
 Thu, 11 Mar 2021 15:12:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzb8NpJrjL9P9hQv7nyN4GfbO8u7FsaCkrKFjhXVT6GBZzi1fU+sszoxZdNK8ke3w24qRafUQ==
X-Received: by 2002:a7b:cbc1:: with SMTP id n1mr10495946wmi.30.1615504335894; 
 Thu, 11 Mar 2021 15:12:15 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 75sm288962wma.23.2021.03.11.15.12.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 15:12:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Claudio Fontana <cfontana@suse.de>
Subject: [PATCH 2/6] tests/qtest: Add qtest_probe_accel() method
Date: Fri, 12 Mar 2021 00:11:58 +0100
Message-Id: <20210311231202.1536040-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210311231202.1536040-1-philmd@redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the qtest_probe_accel() method which allows
to query at runtime if a QEMU instance has an accelerator
built-in.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/libqos/libqtest.h |  9 +++++++++
 tests/qtest/libqtest.c        | 24 ++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
index a68dcd79d44..ebedb82ec98 100644
--- a/tests/qtest/libqos/libqtest.h
+++ b/tests/qtest/libqos/libqtest.h
@@ -763,6 +763,15 @@ void qmp_expect_error_and_unref(QDict *rsp, const char *class);
  */
 bool qtest_probe_child(QTestState *s);
 
+/**
+ * qtest_probe_accel:
+ * @s: QTestState instance to operate on.
+ * @name: Accelerator name to check for.
+ *
+ * Returns: true if the accelerator is built in.
+ */
+bool qtest_probe_accel(QTestState *s, const char *name);
+
 /**
  * qtest_set_expected_status:
  * @s: QTestState instance to operate on.
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 71e359efcd3..57e7e55b9cc 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -872,6 +872,30 @@ void qtest_qmp_eventwait(QTestState *s, const char *event)
     qobject_unref(response);
 }
 
+bool qtest_probe_accel(QTestState *s, const char *name)
+{
+    bool has_accel = false;
+    QDict *response;
+    QList *accels;
+    QListEntry *accel;
+
+    response = qtest_qmp(s, "{'execute': 'query-accels'}");
+    accels = qdict_get_qlist(response, "return");
+
+    QLIST_FOREACH_ENTRY(accels, accel) {
+        QDict *accel_dict = qobject_to(QDict, qlist_entry_obj(accel));
+        const char *accel_name = qdict_get_str(accel_dict, "name");
+
+        if (!strcmp(name, accel_name)) {
+            has_accel = true;
+            break;
+        }
+    }
+    qobject_unref(response);
+
+    return has_accel;
+}
+
 char *qtest_vhmp(QTestState *s, const char *fmt, va_list ap)
 {
     char *cmd;
-- 
2.26.2


