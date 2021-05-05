Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1495F373BFC
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 15:07:04 +0200 (CEST)
Received: from localhost ([::1]:48778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leHF1-0001iA-58
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 09:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leH7S-000279-M2
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:59:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leH7O-0004HU-Af
 for qemu-devel@nongnu.org; Wed, 05 May 2021 08:59:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620219549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=piFQVJLRgYVAQ8rwlcVYLrCWu2jTvSW2z8Zq+W/DVsE=;
 b=QRnWO9Y70/mIG8bXNGZYcULSgoyeLKHSjOIdVJSYCrmAkiwWf36TNRyF7rjbf+u187ycOT
 SmtIcPDpEJ5S1bo2bIWveuiB+0lhs3dC22vIuPgUV7EO1KYPHLAH9PQOReohTfVRSG+YQe
 WY72djdgA7TlhM2MkF89Et0cXGKdPig=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-wZ-m4iO3NNWuyt8-UjpRVg-1; Wed, 05 May 2021 08:59:07 -0400
X-MC-Unique: wZ-m4iO3NNWuyt8-UjpRVg-1
Received: by mail-wr1-f72.google.com with SMTP id
 p19-20020adfc3930000b029010e10128a04so673320wrf.3
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 05:59:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=piFQVJLRgYVAQ8rwlcVYLrCWu2jTvSW2z8Zq+W/DVsE=;
 b=P4YpCikXcgs8GcCEDeQ/c5alP8s/Ca48VsXBWt+tIWNvrvY0fn8DJqPbx2hX9pK++x
 GF62kHz0ZMHbK3IK6P5+kYRM27G8GNLoMH4KjdNP731nQzkr+YVNEYvh5GjkGHSenJsV
 sEqwsarlj5SV+jmaXh6O26OHxvBM5HIKerCcd6agW1Lv+K3kb9b8HIo+OgDo1pIutI/P
 FshZXHKEYhV5rNX0NCgwe0Mlicj54m4jsaxZ5pN8LJ4rM1aPlGmvguqlr1nBBEcSdU3i
 Sw7DOdMOsWxFb9uDVZeJ4rdFBNgQOGwuwzSo3Q8Jb3Mm7BL4L1GKkeneIbI2LTdEhtXy
 qqdQ==
X-Gm-Message-State: AOAM530RRTnyNEiptiU0dHr+JL1GPHlmBBIKpSX8YL+I5s7fRlou1/Ju
 5IaEGaaZpRKONrwFRvRo0LRpUPop7V2w/2TKUKCoeTPIRev/USxfOr/Hf+jLEkORcEqoOHu9Rhz
 gPiL4tuIiYVvy5UV+pE0AH6V+/+7al+6cKzWhpv8Uk+1wlPrSJbTsalNUBq/CD25P
X-Received: by 2002:a05:6000:1811:: with SMTP id
 m17mr16798939wrh.318.1620219545781; 
 Wed, 05 May 2021 05:59:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+WBIKg9rFUUUOy5o2J6lfMJzGmmi05JUj5mSpRaRYKXLFpJZ/d8eTjISyA0G4QGOGYIn+DA==
X-Received: by 2002:a05:6000:1811:: with SMTP id
 m17mr16798913wrh.318.1620219545631; 
 Wed, 05 May 2021 05:59:05 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id z19sm5504923wmf.47.2021.05.05.05.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 05:59:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 12/12] qtest: Do not restrict bios-tables-test to Aarch64
 hosts anymore
Date: Wed,  5 May 2021 14:58:06 +0200
Message-Id: <20210505125806.1263441-13-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 82bf7ae84ce ("target/arm: Remove KVM support for
32-bit Arm hosts") we can remove the comment / check added in
commit ab6b6a77774 and directly run the bios-tables-test.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/meson.build | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 0c767389217..46de073d155 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -175,14 +175,13 @@
    'boot-serial-test',
    'hexloader-test']
 
-# TODO: once aarch64 TCG is fixed on ARM 32 bit host, make bios-tables-test unconditional
 qtests_aarch64 = \
-  (cpu != 'arm' ? ['bios-tables-test'] : []) +                                                  \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-test'] : []) +        \
   (config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ? ['tpm-tis-device-swtpm-test'] : []) +  \
   ['arm-cpu-features',
    'numa-test',
    'boot-serial-test',
+   'bios-tables-test',
    'xlnx-can-test',
    'migration-test']
 
-- 
2.26.3


