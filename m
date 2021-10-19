Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48EF4334C7
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:34:15 +0200 (CEST)
Received: from localhost ([::1]:42890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcnNm-0004E2-N2
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnAW-0000CL-Co
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:20:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnAO-0002Cv-Us
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:20:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X5r2KJQH0mFVuWmoeGDJsGfJGfPX7snxmFOMGZkQyOY=;
 b=hXQgUmYKWtKoCxwc733IQKbAXnTDb7PP1TrATfTlfkLcbbMG6IWPTtMb+NRk3tM+kmMU01
 U1WHm9swRtqk5W0EMx8pbDqFCkVs49IJ2DL/GGeuPwVoR5a9qeaX7FPnIXylrh2Dg/dfW8
 9zAimxKL/wFkj/LWKfqM3hEoHDCRSbk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-Lc7N89e1NLGGzpx5Z6swZg-1; Tue, 19 Oct 2021 07:20:21 -0400
X-MC-Unique: Lc7N89e1NLGGzpx5Z6swZg-1
Received: by mail-ed1-f70.google.com with SMTP id
 t28-20020a508d5c000000b003dad7fc5caeso93607edt.11
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X5r2KJQH0mFVuWmoeGDJsGfJGfPX7snxmFOMGZkQyOY=;
 b=MLoVZG+zWyCx/mPEpnXBitJT/0N4VORRlvUQNMErSFWRXQDwXq958REN2PWm/cgGZz
 VQslk37RWpVwB3lBir35/MmX+orlGhZ5BPK/GX7lbs2KgMHvpgR7epbn8a8fvZ+h5zt5
 19q3W0kPHVQGhRGAd2j4DYQpiHU8OeUXNzJdSJ5D0K3zJuCe980EEwkXT2twDB5YE7AE
 EdwfceYzKNodz6CLCQPG7hBxsjPrsltEwnn7zOT4P6Dn0Tilq9xIq4czS19DbWLaykHM
 jGPIrsvDzADZJZWx+5vjJVhuV7JQPzvSPl8ibY7uSm+ES5spHKEqeQx6rlqgBKcEMsP9
 yzRA==
X-Gm-Message-State: AOAM532Jcp8CZoPHMrYuVgwIAvyCmhoYDqdYQWg2Ca1Ky6fNlxfZFxbD
 1CgdsaOJ+EpZ3iUSNaD3PcYmNUHStIaLF6a3WpiMyaE9XVPzjvyHJevUgwQaXWUMQDKxyI/uy/y
 i3JtMre6DRoI0TEz9Lr3C6k99MYTph5i56FqMBhYTj2BFzpu9MtokKTrFOpaZ
X-Received: by 2002:a05:6402:35d6:: with SMTP id
 z22mr52043854edc.227.1634642419922; 
 Tue, 19 Oct 2021 04:20:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPXHbj7GrB1zq2aZDL0pyQuknpzZYQbbrwQYn9EwXdIeYzlBNTo6uylbxlNS9FAP3B37bGBw==
X-Received: by 2002:a05:6402:35d6:: with SMTP id
 z22mr52043824edc.227.1634642419679; 
 Tue, 19 Oct 2021 04:20:19 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id p13sm7328179ejn.12.2021.10.19.04.20.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:20:19 -0700 (PDT)
Date: Tue, 19 Oct 2021 07:20:16 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/29] tests: arm-cpu-features: use qtest_has_kvm() API
Message-ID: <20211019111923.679826-14-mst@redhat.com>
References: <20211019111923.679826-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019111923.679826-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

and drop custom function that were doing the job

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210902113551.461632-14-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 29 +++++------------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 90a87f0ea9..f76652143a 100644
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
@@ -506,14 +491,6 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
 
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
@@ -637,7 +614,11 @@ int main(int argc, char **argv)
      * order avoid attempting to run an AArch32 QEMU with KVM on
      * AArch64 hosts. That won't work and isn't easy to detect.
      */
-    if (g_str_equal(qtest_get_arch(), "aarch64")) {
+    if (g_str_equal(qtest_get_arch(), "aarch64") && qtest_has_accel("kvm")) {
+        /*
+         * This tests target the 'host' CPU type, so register it only if
+         * KVM is available.
+         */
         qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
                             NULL, test_query_cpu_model_expansion_kvm);
     }
-- 
MST


