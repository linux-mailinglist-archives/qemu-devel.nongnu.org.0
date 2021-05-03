Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D8337224B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 23:14:47 +0200 (CEST)
Received: from localhost ([::1]:38316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldftu-0000ss-KH
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 17:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldfq6-0004Zs-41
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:10:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldfq3-00078P-Am
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:10:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620076246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MeNb2Atwfh/sX8kxLzvRexJijoqF1JUDJOimaLT3mRk=;
 b=VFTdd9Jfbiilco3BtLdysJVjZx1cBKi5PE+OeGUV3GDXfwHz59edbkhnxX6id56bJcPo+k
 jLNk4seteNbnjVUkQRrC0Reh6cYDBBEvIbWk9iPSpGDB7z4BBXfHs+ENgf7WCcpBTjqtmM
 7hA9d+N+e2EID3EjG0jQlsAgPmGQJe0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-fCxj2sQSOy6jCICP2CyN-Q-1; Mon, 03 May 2021 17:10:45 -0400
X-MC-Unique: fCxj2sQSOy6jCICP2CyN-Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 67-20020adf81490000b029010756d109e6so4614583wrm.13
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 14:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MeNb2Atwfh/sX8kxLzvRexJijoqF1JUDJOimaLT3mRk=;
 b=l7sGwrT7/n1ApW6klCYmruYJZGiNH/h1nInSphekxCGQIqhTFz9o29y1Ov+EJAQPCk
 c80tz1k1TrLJEZ4HHDoTAHXz/QzqvKti3/TgskVamFk3Z9uQBKExadaedSTD6I48AIoK
 lAakarr760Vu2fXAlzVR5LEwOKBjKjeYTWcxqnOQKjiOgF8xxGDUibldlzGjPvArlZXb
 GoAOpuSmsLDNH+qVj9FVSgayWSJq0+smUMKu6yKaPc8dN8HFgbcuy50g6BqVtBT6C9qe
 4nGMhpHSFkKQ4yFNgZnvpcbUu0R0Zw+vz1F/VucogxD72YkOxuFNW+TvI8etTk0K4KeK
 F6Jg==
X-Gm-Message-State: AOAM532OR8dXYNnwN3qAd5NGRRcXeRC+yOykYxyBlzxLpSnUsLIpWjkh
 0SR/KqhP+xJ9pdLboUH9s1AudxgrRy85BHU8Txj+VpT9KtXFEOQ9O9vPeHT4zouYLAotRrhUy+2
 mMylMxpDrn6BBLLwWnjsnrEW9zymD0b+ng1qcgh2QSjpbbJFozAFGcCoVKORQqU0k
X-Received: by 2002:a1c:f313:: with SMTP id q19mr23187076wmq.142.1620076243739; 
 Mon, 03 May 2021 14:10:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOHD1J8jmajrMm02z2PmNvoKrNsvyzY8tUAE1Mo70lt9r9leeAZmmXa6X9jqGXZ2uwZqj/pw==
X-Received: by 2002:a1c:f313:: with SMTP id q19mr23187054wmq.142.1620076243591; 
 Mon, 03 May 2021 14:10:43 -0700 (PDT)
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id q10sm729846wmc.31.2021.05.03.14.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 14:10:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 04/12] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for KVM
Date: Mon,  3 May 2021 23:10:12 +0200
Message-Id: <20210503211020.894589-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210503211020.894589-1-philmd@redhat.com>
References: <20210503211020.894589-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Andrew Jones <drjones@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use the recently added generic qtest_has_accel() method to
check if KVM is available.

Suggested-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 8252b85bb85..7f4b2521277 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -26,21 +26,6 @@
                     "  'arguments': { 'type': 'full', "
 #define QUERY_TAIL  "}}"
 
-static bool kvm_enabled(QTestState *qts)
-{
-    QDict *resp, *qdict;
-    bool enabled;
-
-    resp = qtest_qmp(qts, "{ 'execute': 'query-kvm' }");
-    g_assert(qdict_haskey(resp, "return"));
-    qdict = qdict_get_qdict(resp, "return");
-    g_assert(qdict_haskey(qdict, "enabled"));
-    enabled = qdict_get_bool(qdict, "enabled");
-    qobject_unref(resp);
-
-    return enabled;
-}
-
 static QDict *do_query_no_props(QTestState *qts, const char *cpu_type)
 {
     return qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s }"
@@ -493,14 +478,6 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
 
     qts = qtest_init(MACHINE_KVM "-cpu max");
 
-    /*
-     * These tests target the 'host' CPU type, so KVM must be enabled.
-     */
-    if (!kvm_enabled(qts)) {
-        qtest_quit(qts);
-        return;
-    }
-
     /* Enabling and disabling kvm-no-adjvtime should always work. */
     assert_has_feature_disabled(qts, "host", "kvm-no-adjvtime");
     assert_set_feature(qts, "host", "kvm-no-adjvtime", true);
@@ -624,7 +601,7 @@ int main(int argc, char **argv)
      * order avoid attempting to run an AArch32 QEMU with KVM on
      * AArch64 hosts. That won't work and isn't easy to detect.
      */
-    if (g_str_equal(qtest_get_arch(), "aarch64")) {
+    if (g_str_equal(qtest_get_arch(), "aarch64") && qtest_has_accel("kvm")) {
         qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
                             NULL, test_query_cpu_model_expansion_kvm);
     }
-- 
2.26.3


