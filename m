Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F7533DBFE
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 19:03:44 +0100 (CET)
Received: from localhost ([::1]:54848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lME2h-0000v5-Sb
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 14:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMDRW-0000DX-DI
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:25:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMDRU-0002vq-P9
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:25:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615915516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ef99CGiVPIoBJ1DNt6ZdEeS2PoHSPZ74D2ug+Z1Mo6I=;
 b=bcCQgyaZwsAMakgdtk1j+BKVo+Mfhp7yk/moq6K3Q3qJr1iLnJHLgKAQQw2+XgWFO0eUhe
 xcPPn9kcIjlJONc6EXCUKQa0acm3VaZCSoYErLKK3iE9xn2NwaqEQfm3hgrj0kLFBdeFwz
 ZRKQu193z/TF+8GyW6O9amJj92Ba194=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-YOz_jc2-PiK9Nebamm1yiA-1; Tue, 16 Mar 2021 13:25:14 -0400
X-MC-Unique: YOz_jc2-PiK9Nebamm1yiA-1
Received: by mail-wr1-f72.google.com with SMTP id o11so1000793wrc.4
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 10:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ef99CGiVPIoBJ1DNt6ZdEeS2PoHSPZ74D2ug+Z1Mo6I=;
 b=TOIOWLddt+imbJdp7bEQgbZpfpr3gy/SBaLgovpZI9hWC/pbPlR4+LPxoiYljaXRWh
 2aB6enUQEUJHi9ZRMDEJHIpEGY7i1W/85/yK0e8dAyb7Zz6F8hQRREqkl8UlcTfhwQvZ
 D0hszGU62pdKV4qiIa9x2MRojWmIhn1nX8IjUc6OhRJ3URG2ZZwBpni2sysdWFcKIEHE
 0+mahiQCNcO70ftSLtFv61MQt4v6aqOeAK/mq1b8qmRSFz7AVBlkekZsNsBAXxq6WzsB
 M2vNMMP/i1H+LZAyBN7LL2wpH7C80KeifoDB4Hm9g2hJrxrwp14Wk6Zq+tr4y3SyH9NC
 i3Wg==
X-Gm-Message-State: AOAM532ehrhw6QCp2satMA+z/Zjc9AHW9lT+pt2e06wAA6wPcqgWLL7Z
 ZbUiWsQHcoCo4S4VIRwOx+2Jr9aYELmmZ5pmXMz+3iNr5ErDmHhX+ci/GYfu4OlZH4ktqqTVAZA
 F+s3LtnYP6hMfy2+OpBQB4sgQZMzj3OcChRnbgHp67MTpe6s5l+itiRrPiC3l9ldl
X-Received: by 2002:adf:d851:: with SMTP id k17mr112724wrl.254.1615915512940; 
 Tue, 16 Mar 2021 10:25:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGQsUIYmLkFMpqv4PkmVovmHwArB3e9hY5ULAePM0VQ4Rwb+rVUNzEwC7WmI9bWhsIE1TJ9Q==
X-Received: by 2002:adf:d851:: with SMTP id k17mr112693wrl.254.1615915512741; 
 Tue, 16 Mar 2021 10:25:12 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 12sm40097wmw.43.2021.03.16.10.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 10:25:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] tests/qtest: Do not restrict bios-tables-test to
 Aarch64 hosts anymore
Date: Tue, 16 Mar 2021 18:24:49 +0100
Message-Id: <20210316172449.3148634-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210316172449.3148634-1-philmd@redhat.com>
References: <20210316172449.3148634-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
 Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 82bf7ae84ce ("target/arm: Remove KVM support for
32-bit Arm hosts") we can remove the comment / check added in
commit ab6b6a77774 and directly run the bios-tables-test.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/meson.build | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 66ee9fbf450..82e92d33f82 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -173,14 +173,13 @@
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
2.26.2


