Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E85D8370939
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 00:41:24 +0200 (CEST)
Received: from localhost ([::1]:57978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcyIe-0000vm-0N
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 18:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcyEY-0004Zx-IE
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:37:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcyEX-0008Nb-0N
 for qemu-devel@nongnu.org; Sat, 01 May 2021 18:37:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619908628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YUwsAY7j/ecV1UbnP3UC7xEIyUmH3VJq/XNOQQ4OyUg=;
 b=eHIAeIWbqj0astnoA60gFDaDFnuwXOxrXGW0Emt5WWW8q4y3qxbl+5FBptTy/RdRDnNL4b
 fR96/w0OLIdQ8hA4JRiDN8P4//6i+HAxBAfW0Sqq/dGHyMTjSsHTRP+uUR6sTiMo0Sfv5y
 oUSxxcEJ5sK/QRsuSv0RpORFgmmvW1Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-k6sN0xOWPPuq-nL-14RbGg-1; Sat, 01 May 2021 18:37:07 -0400
X-MC-Unique: k6sN0xOWPPuq-nL-14RbGg-1
Received: by mail-wr1-f69.google.com with SMTP id
 67-20020adf81490000b029010756d109e6so1277103wrm.13
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 15:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YUwsAY7j/ecV1UbnP3UC7xEIyUmH3VJq/XNOQQ4OyUg=;
 b=MUOL4FbXBFSdm2GUPmL8Z40baAuGnU6HAs+5D+kKm1m2GeQxaGVJfFZTdIb8bIttmT
 VoIpaK4g9BbFqbH8pAvAHiU9OKoi5QDSAzmj650lJuZir2DZzAAvudJRO7XQ/Z3IsRh0
 SEjeJnX16sW11BoD6oPOvowzxg2AaHKH/DL1EkJMFJlsmK46UHWpzEaS+zBpe5nu0mU6
 fz7zfYt1X8iFT0RwtIKmUUg4UPq/I8syuj/MhYWIBmkCqQ7b19XhUr2g2yjsANT6Q8Me
 ZjOi+pgcOJrwmfTQlB34mlzu9q/Wl6A+HbYAeOPvU4a9kqEPZZFk4IxzXGohx7QDhTIb
 kgmw==
X-Gm-Message-State: AOAM5322tYL4o6TV0hofdGgrUi63vBCWPBI0ICPjTQVOknx1HEPa4hKl
 eILUNEePcOtrvmhRFwQi3WjXagJKAAZTbIZZ8d+5mGX9r1NQtIfTIPtmPBMzkcnhygPzKJj+svV
 oiVcSZZryANk+jBx0mHR1jJFWZvmcacu2ceiyFZgJFzdXL+DtbapEClqHn3CQpqOK
X-Received: by 2002:a05:600c:1907:: with SMTP id
 j7mr13076088wmq.158.1619908625589; 
 Sat, 01 May 2021 15:37:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtvJ574OASz8WHsavoBlG4k6JyZrbSbGZFkzQvshH+3tEyGuCJ6yV+mAQOLN9RQAC6Rw8dyQ==
X-Received: by 2002:a05:600c:1907:: with SMTP id
 j7mr13076065wmq.158.1619908625457; 
 Sat, 01 May 2021 15:37:05 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id d5sm7408486wrv.43.2021.05.01.15.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 15:37:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/10] qtest/arm-cpu-features: Restrict
 sve_tests_sve_off_kvm test to KVM
Date: Sun,  2 May 2021 00:36:33 +0200
Message-Id: <20210501223638.510712-6-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
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


