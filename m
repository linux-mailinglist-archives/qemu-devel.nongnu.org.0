Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E8F538487
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 17:16:28 +0200 (CEST)
Received: from localhost ([::1]:55054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvh87-0003oz-UV
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 11:16:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nvgzU-0003Ui-Bk
 for qemu-devel@nongnu.org; Mon, 30 May 2022 11:07:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nvgzS-00062c-0r
 for qemu-devel@nongnu.org; Mon, 30 May 2022 11:07:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653923249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nGpuekABlEoAYzo64DJQwTob3NuYJjKbcyJimxkE0jQ=;
 b=CMHtFi7LPAMmexoRCUFnMt1juZKAaItbIsCjeRdNa38xdv9E9PeoebtB4LBUisHS6ZU4fX
 g3Mssy/QG0nYWa2w6rpX25DNHLMG6VL/sHjjT7SIVQtaF1N6Oh3mwEwNfOvtDaKKwXiX6N
 3Y5aH9wS8Mc2d/XFApR9z704LoOoFAA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-Tpzj-GmmORqWmRmvc8wd5Q-1; Mon, 30 May 2022 11:07:28 -0400
X-MC-Unique: Tpzj-GmmORqWmRmvc8wd5Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 t14-20020a056402020e00b0042bd6f4467cso8242906edv.9
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 08:07:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nGpuekABlEoAYzo64DJQwTob3NuYJjKbcyJimxkE0jQ=;
 b=u6UZt8/4TR09OiYlaxFSl2Z83xGu0uLJkF44F2Ya5mthuLFlD1MrVljvCRHZ5Dp7WY
 5VCtlfA/GluOxkAPZtmo2N8jW4GRJwtQS/Q/8MKfOUvmmSzdCYdjuhQrn9gnvgRFxpsD
 pwSCeAwiqF/MEl9E/Cz3dZwKiqgSbd+P+hesoYByJEP3Y1gtMqfTn8qN/zmv71a3N9aM
 K4iScNHPREXjDywG867F8dkaPlaHYqv7K2HR7q4HN/yZd+278ARhvnjSCY1X+ZXnsKlp
 aTcWJHLaG4Hfs9B8ZWQ90enKnWER6TJNPMIqSxT2GCyGSI+tgMRlQ6LFqKO1pbJOi7ms
 L/6Q==
X-Gm-Message-State: AOAM531SY46QyoSfMuS1/4IBBoBcxgU0PQNYuiwTmD+RuFBygp1+wj6J
 CQ34D3pYxGb7wuK//IAz1zh9mbJ/QcKQv5cpCxe8EvJsHTUDmj188BCzLu0RcF3WjrT40rZ5gFg
 1Y9RPxEXm8vV6I88DsxbIJCnmFftuc1+WH03Ei/0IW2CsOSiK7YSkb+aur7/KOnCChwU=
X-Received: by 2002:a05:6402:b3b:b0:42b:fbec:7807 with SMTP id
 bo27-20020a0564020b3b00b0042bfbec7807mr18717066edb.420.1653923246674; 
 Mon, 30 May 2022 08:07:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzONto5JWucFCPG/cKTD1gARKwxofSa7TkFs3l8zASKA5DV7H3xqlHzuoZdzen6TrhmwIbRqg==
X-Received: by 2002:a05:6402:b3b:b0:42b:fbec:7807 with SMTP id
 bo27-20020a0564020b3b00b0042bfbec7807mr18717042edb.420.1653923246381; 
 Mon, 30 May 2022 08:07:26 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 r22-20020a170906365600b006f3ef214dbesm4083659ejb.36.2022.05.30.08.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 08:07:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH v5 04/10] cutils: fix case for "kilo" and "kibi"
Date: Mon, 30 May 2022 17:07:08 +0200
Message-Id: <20220530150714.756954-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530150714.756954-1-pbonzini@redhat.com>
References: <20220530150714.756954-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The correct abbreviations use a lowercase k, so adjust freq_to_str
and size_to_str accordingly and add tests.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/test-cutils.c | 20 ++++++++++++++++++++
 util/cutils.c            |  6 +++---
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/tests/unit/test-cutils.c b/tests/unit/test-cutils.c
index 98671f1ac3..783127ff0e 100644
--- a/tests/unit/test-cutils.c
+++ b/tests/unit/test-cutils.c
@@ -2450,6 +2450,22 @@ static void test_qemu_strtosz_metric(void)
     g_assert(endptr == str + 7);
 }
 
+static void test_freq_to_str(void)
+{
+    g_assert_cmpstr(freq_to_str(999), ==, "999 Hz");
+    g_assert_cmpstr(freq_to_str(1000), ==, "1 kHz");
+    g_assert_cmpstr(freq_to_str(1010), ==, "1.01 kHz");
+}
+
+static void test_size_to_str(void)
+{
+    g_assert_cmpstr(size_to_str(0), ==, "0 B");
+    g_assert_cmpstr(size_to_str(1), ==, "1 B");
+    g_assert_cmpstr(size_to_str(1016), ==, "0.992 kiB");
+    g_assert_cmpstr(size_to_str(1024), ==, "1 kiB");
+    g_assert_cmpstr(size_to_str(512ull << 20), ==, "512 MiB");
+}
+
 int main(int argc, char **argv)
 {
     g_test_init(&argc, &argv, NULL);
@@ -2729,5 +2745,9 @@ int main(int argc, char **argv)
     g_test_add_func("/cutils/strtosz/metric",
                     test_qemu_strtosz_metric);
 
+    g_test_add_func("/cutils/size_to_str",
+                    test_size_to_str);
+    g_test_add_func("/cutils/freq_to_str",
+                    test_freq_to_str);
     return g_test_run();
 }
diff --git a/util/cutils.c b/util/cutils.c
index a58bcfd80e..19fb4d04f8 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -875,12 +875,12 @@ int parse_debug_env(const char *name, int max, int initial)
 /*
  * Return human readable string for size @val.
  * @val can be anything that uint64_t allows (no more than "16 EiB").
- * Use IEC binary units like KiB, MiB, and so forth.
+ * Use IEC binary units like kiB, MiB, and so forth.
  * Caller is responsible for passing it to g_free().
  */
 char *size_to_str(uint64_t val)
 {
-    static const char *suffixes[] = { "", "Ki", "Mi", "Gi", "Ti", "Pi", "Ei" };
+    static const char *suffixes[] = { "", "ki", "Mi", "Gi", "Ti", "Pi", "Ei" };
     uint64_t div;
     int i;
 
@@ -899,7 +899,7 @@ char *size_to_str(uint64_t val)
 
 char *freq_to_str(uint64_t freq_hz)
 {
-    static const char *const suffixes[] = { "", "K", "M", "G", "T", "P", "E" };
+    static const char *const suffixes[] = { "", "k", "M", "G", "T", "P", "E" };
     double freq = freq_hz;
     size_t idx = 0;
 
-- 
2.36.1



