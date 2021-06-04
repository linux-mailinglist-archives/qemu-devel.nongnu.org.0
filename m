Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC3139BC52
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 17:55:23 +0200 (CEST)
Received: from localhost ([::1]:49154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCAM-0006Ja-AI
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 11:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8R-0002Kw-14
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:23 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8N-0008O5-5g
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:22 -0400
Received: by mail-wr1-x42d.google.com with SMTP id m18so9807582wrv.2
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TvyIlJW3PO7q09G/gvxhFxBVndq7M4s8XzLxW3dgEK0=;
 b=WYwIOaaIjE19ZhMLtM5SnbB16XfCcI1pHVrnlhT2fH6VApU3pTTbmhEv5Hnt+Vl/wL
 fifSxS9u1dpXVPAVzXQUsjsZ3DODWwGmkJU0/fT0FoaeHOKuU8bmnCrNW9JHAkGzcRRI
 qkZgVB9Zlatrkfp1mmUsZC6w9IlWpcaz3+O/LaIXgWysj3Ub75+wpYnDGp2uys3y8B/X
 gZwoKtc/1J8VyVn0/qKPiUTJmIHGxkyfbDC/iAkYz6oBlYWvJ7X/C2dTf/fAJfumqTdf
 /AuzUO9YYnSBiCZJFB0SlEepfQLRZ93IOULZngHbt9ignJTL+83PPV3GKYZz00opX1/6
 ZxFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TvyIlJW3PO7q09G/gvxhFxBVndq7M4s8XzLxW3dgEK0=;
 b=CPFxquhAGFr4F/gqkimBxX8KYjx9cAYiitd5aXwOpEd+s43B8EULGTaFe3qR8omF8M
 Z8GOdatQBQPYmboWku/sh07q5ucGiyMGyXOzz/dyFyhG1qfDxRkRTD+pA+ApAwzsJ3Pi
 RyEPviVK0HeNeiZlxw51vEb0RUXm8RRpImA0w5eBqY27JmzV9xz09NeLG7Ei2P/tm3qz
 kCBzMi4D6gMz72n+FNlinTZsEZp5G+9bsUiqwVBgEDnDc9MQ7bzPctgz0OV406NPKt1A
 +RR3yggwGJ2BNWEOmFiy+KRAt1AFUGRQCXXTlh2GNZ7DtO9kRpDjHmbgRVemtdejOOH6
 aC2w==
X-Gm-Message-State: AOAM5334f+U7E4zJhxFLRMasQ3qOwVdl+vImEEKNWAlICcEbeWwZNOHf
 ZLIYfzRV6qFfwT7mESJR/O3QQA==
X-Google-Smtp-Source: ABdhPJwLkU+psoJMTHeG9YajGsIX8seZ7zn7gLKg5Ih4dUVq0yaBKpbD/BShRRbSD2gFVJp5bmwh2Q==
X-Received: by 2002:a5d:6b0b:: with SMTP id v11mr4489637wrw.339.1622821997592; 
 Fri, 04 Jun 2021 08:53:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m37sm482577wms.46.2021.06.04.08.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:53:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A239D1FF8F;
 Fri,  4 Jun 2021 16:53:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v16 03/99] qtest: Add qtest_has_accel() method
Date: Fri,  4 Jun 2021 16:51:36 +0100
Message-Id: <20210604155312.15902-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Introduce the qtest_has_accel() method which allows a runtime
query on whether a QEMU instance has an accelerator built-in.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210505125806.1263441-4-philmd@redhat.com>
---
 tests/qtest/libqos/libqtest.h |  8 ++++++++
 tests/qtest/libqtest.c        | 29 +++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/tests/qtest/libqos/libqtest.h b/tests/qtest/libqos/libqtest.h
index a68dcd79d4..d80c618c18 100644
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
index 825b13a44c..6bda6e1f33 100644
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
2.20.1


