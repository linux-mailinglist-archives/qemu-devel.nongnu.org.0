Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD04372259
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 23:17:47 +0200 (CEST)
Received: from localhost ([::1]:45522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldfwo-0003u5-7S
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 17:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldfqF-0004v0-Ay
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:10:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldfqC-0007EH-St
 for qemu-devel@nongnu.org; Mon, 03 May 2021 17:10:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620076256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cVrcRnyBOkjPEo/icx3S79OKNawcTbdRmhevRRnT37M=;
 b=GgJLcYM/yRqLHQIeUZF9eDaxe0o61Vq8mi/trw7s46EHhoNCxvLmwh5bBZb6Wcx8aQotuX
 65Jzqd7BIQgOnYF4FQu982I2usDyajRf8J/YcfVybebNLeUMt32RqvwnnoI2/rKkAZIS28
 hho2cYeA1K4rET4hhgzP40F9DlUbUMU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-OtbllRNJPa65MMCoIMH_qA-1; Mon, 03 May 2021 17:10:55 -0400
X-MC-Unique: OtbllRNJPa65MMCoIMH_qA-1
Received: by mail-wr1-f70.google.com with SMTP id
 4-20020adf80040000b029010cab735fdeso4645623wrk.14
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 14:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cVrcRnyBOkjPEo/icx3S79OKNawcTbdRmhevRRnT37M=;
 b=Er1SiDZtcwuI9NxR/fIEhU/osY/Z2LmiK69Qfz0gQVT55qSAQ1AxwdV3bl/NIQnJ2b
 9OAHlOf53PWQp4z0g+ak+hNVYtKuc9X+6o3Y0PcUN24EVDGUfFiX0+o/sgoE2xlTCouv
 uJtsTXSa2jVOT/x5/aIhplpaFwlBUodE+/YJmuqBeiCVGODZ3B1oqaa67nOaGQe80FIV
 3v7tgAwnKFy+8qHzQJmreSjQYOxkBTFt2t4jgS1Qxu1okV90l/fawZjFMvWZRCjIV8Fv
 OpSJImuJkd78G7saiNe3ePtFB3Ap9uWhf/baSa/ibeKC2mrEqlfdh8BBwLx9tonERVVf
 SaSw==
X-Gm-Message-State: AOAM5333hpzvRVsgeQzjAix7dSFJlAonoYwbWn1jJG/MwA1oCQlsfF3g
 pmBA7E+VAfmOQ8OXg6s2CzfPN5T8dqCACMd9LrV0+RobCk4A61MAyZfnBr5cyYejL7meSNDHKX0
 PmZYZE9TqbwoOkHg5yrK5gUa94rOS19Fx0sc8pc9m5I1edaNyuAqO9dFd3cOs2rdJ
X-Received: by 2002:a5d:408f:: with SMTP id o15mr26434709wrp.89.1620076253783; 
 Mon, 03 May 2021 14:10:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyopwmZ7cduJ9B12KZ3WX74MWbnK8TNXlLxn09RVIm12tApSJhIF4QeWpEV4md/yG0+B4PPWg==
X-Received: by 2002:a5d:408f:: with SMTP id o15mr26434684wrp.89.1620076253590; 
 Mon, 03 May 2021 14:10:53 -0700 (PDT)
Received: from x1w.redhat.com (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id h8sm667607wmq.19.2021.05.03.14.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 14:10:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 06/12] qtest/arm-cpu-features: Remove TCG fallback to KVM
 specific tests
Date: Mon,  3 May 2021 23:10:14 +0200
Message-Id: <20210503211020.894589-7-philmd@redhat.com>
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
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

sve_tests_sve_off_kvm() and test_query_cpu_model_expansion_kvm()
tests are now only being run if KVM is available. Drop the TCG
fallback.

Suggested-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/arm-cpu-features.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 66300c3bc20..b1d406542f7 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -21,7 +21,7 @@
 #define SVE_MAX_VQ 16
 
 #define MACHINE     "-machine virt,gic-version=max -accel tcg "
-#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel tcg "
+#define MACHINE_KVM "-machine virt,gic-version=max -accel kvm "
 #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
                     "  'arguments': { 'type': 'full', "
 #define QUERY_TAIL  "}}"
-- 
2.26.3


