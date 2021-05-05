Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A706373BF4
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 15:05:14 +0200 (CEST)
Received: from localhost ([::1]:42714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leHDF-0007cc-Bj
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 09:05:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leH6s-0001On-7q
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:58:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leH6q-0003zy-Ok
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:58:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620219516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YUwsAY7j/ecV1UbnP3UC7xEIyUmH3VJq/XNOQQ4OyUg=;
 b=iE54wZxbieTB0JIZ2t3fkq+j6copgGHMEhsiUex4d2Q3Oc3wZs6g0V5Jgg6y2a2S8BUvyg
 3US49Y3BfeKZ7D/siFl7Uy1QVwT0zC9uLRGkhuH6sTzY8xtenl//a1/e4Wyj4h7g2qDm0u
 OfUz9aV2bZofH5ae90jsHnHsPBihlj8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-M8798OVUOxObUU025TCh3A-1; Wed, 05 May 2021 08:58:33 -0400
X-MC-Unique: M8798OVUOxObUU025TCh3A-1
Received: by mail-wm1-f70.google.com with SMTP id
 z9-20020a1c65090000b029014b497b2d98so522699wmb.8
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 05:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YUwsAY7j/ecV1UbnP3UC7xEIyUmH3VJq/XNOQQ4OyUg=;
 b=H34ckP2Re0KIyAmlXdKKa9iVh9bpG5U4KRMTmisCX+QABjX/dQLll1m+GYoqlRM3Cl
 4C58PRE2aAnp8xgSHGsv3xlxQ461hMdKQ7L27hZjIG68pZNIClch/z6P2/Lbr0xNTJqQ
 E+U+1s4ITM6i5TdsnE4P+oRjomkJuHJCNaAi1pyuxzZ+X3YodfpkDvLRkKAv7+qFsBCD
 QmrqG9oQTIiXVTiZZ+pjbq3Ic45r4hNMVCNDY7GhzalhRXn8gTroMfpUcvP+brj9WGnT
 LA7e/YQ2+kuOg+voqvl0CzeWWhVVW3KI9Y64e+RJJYX0gMbiolbQjHnRI6xcO9mYTDF4
 Y31g==
X-Gm-Message-State: AOAM531KOCi6IL5YdDls6oyzACMPSTMvE1Gc+pHWcIYhd5HRuiPfB+PM
 FGVa3KdHRjfyXea7ADtM06qh/KbdjNG76Ju09kJTr4bNoeo4mFU+WEb1qmwyHHdyRigc9jgtCCe
 4PL92MpNUJzdCuBE3U2uhzkKJXDCLoHief+W1IhhAy2wZkMXn10Kbe3ofbQoXU+qS
X-Received: by 2002:a5d:4412:: with SMTP id z18mr37885723wrq.103.1620219512575; 
 Wed, 05 May 2021 05:58:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyL52Ime6rCjsxt0GX0VJCfOUBOXUFj+c/2ykJ5szKoiXAE5gAz5Y8gFs3dc5bD54SGn1PioQ==
X-Received: by 2002:a5d:4412:: with SMTP id z18mr37885692wrq.103.1620219512393; 
 Wed, 05 May 2021 05:58:32 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id b6sm5296646wmj.2.2021.05.05.05.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 05:58:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 05/12] qtest/arm-cpu-features: Restrict
 sve_tests_sve_off_kvm test to KVM
Date: Wed,  5 May 2021 14:57:59 +0200
Message-Id: <20210505125806.1263441-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505125806.1263441-1-philmd@redhat.com>
References: <20210505125806.1263441-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sve_tests_sve_off_kvm() test is KVM specific.
Only run it if KVM is available.

Suggested-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 7f4b2521277..66300c3bc20 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -604,6 +604,8 @@ int main(int argc, char **argv)
     if (g_str_equal(qtest_get_arch(), "aarch64") && qtest_has_accel("kvm")) {
         qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
                             NULL, test_query_cpu_model_expansion_kvm);
+        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
+                            NULL, sve_tests_sve_off_kvm);
     }
 
     if (g_str_equal(qtest_get_arch(), "aarch64")) {
@@ -611,8 +613,6 @@ int main(int argc, char **argv)
                             NULL, sve_tests_sve_max_vq_8);
         qtest_add_data_func("/arm/max/query-cpu-model-expansion/sve-off",
                             NULL, sve_tests_sve_off);
-        qtest_add_data_func("/arm/kvm/query-cpu-model-expansion/sve-off",
-                            NULL, sve_tests_sve_off_kvm);
     }
 
     return g_test_run();
-- 
2.26.3


