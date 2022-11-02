Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FF361684C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:19:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGLz-000472-Nq; Wed, 02 Nov 2022 12:12:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGLQ-0003LG-2J
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:12:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGLN-0003or-4F
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:11:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vyFquoWhRBqop6d2QQCGoBYPqIvepuw7IXNadOdimWY=;
 b=XsO/dxoEGdYx+qQXs5ajGNyT8D8qo0KQW5Bfw/UQUQaz6Glpc3ufKIIdq93wnmwL/M0X/3
 zaVfWbI5FfcXn7yuRBh7yOl3P+7J93Cu8y9iew5uVFFZbeKA5L4pd+ZqracmZraIT89mkt
 3P1EP2+DZfbQVzthzT17E89uSu4zGGE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-118-PxofkDNqN2iKAFZjHwk2nQ-1; Wed, 02 Nov 2022 12:11:51 -0400
X-MC-Unique: PxofkDNqN2iKAFZjHwk2nQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 s7-20020a1cf207000000b003cf56bad2e2so647332wmc.9
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vyFquoWhRBqop6d2QQCGoBYPqIvepuw7IXNadOdimWY=;
 b=kQ3Vg9x5Xy1d79PZOMvcAZsmuO01uFUvFZELlBV/OmxR7s+f2ORBFxVqLHByW+Z3mL
 2ZycCo8zbiHsMwpL/18rX1DNDZno1nUFX4Iu9j4pzwS89Bf97khOguz3lFyVJjvLeeCj
 nUo5SEhOuqk8LHbUkjm6/fZKYvMTA8alwZ61/ty1zC4vkU2z/ntIdal2FcQUnyiHTesd
 scyDH3fs9IfJ6mwHJ4maW/vLbLLklCtnTO3L2QhCoWnxCl1mB/ZyW5K1qIsYjbi7dhwZ
 36U6VtN85uHvRu1Sahy26dMFDrhNwISy4rJeoQIcjrIfFtV8WedzKJTk+SkLp5SDjkfZ
 rlXw==
X-Gm-Message-State: ACrzQf0Celb11lxQdElLKBvNH0elFUtBBx5u3NrJOSV4342/cnM7JbQz
 LsH4l9xcWV+6gvhoW7GBa/fY5+chWh61Oip3AnFsgA7WaQIsWsdgYfSdtkSnn1vPuVxkpuYtaOw
 SZANHbtewaUuE/lwbmRrtgWMXUXey0y8ntD0wSftGaYOZ7SUZvuZdCv3YuU4e
X-Received: by 2002:a5d:650c:0:b0:236:49d9:8e83 with SMTP id
 x12-20020a5d650c000000b0023649d98e83mr15708550wru.714.1667405509034; 
 Wed, 02 Nov 2022 09:11:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6no7c6oMP0cTnjLvjOxDV8ybJ7FmZ1i9Zt+wcwOs422jSJj7Mu+vrwrAZ57NKJ122S5sY4vA==
X-Received: by 2002:a5d:650c:0:b0:236:49d9:8e83 with SMTP id
 x12-20020a5d650c000000b0023649d98e83mr15708527wru.714.1667405508761; 
 Wed, 02 Nov 2022 09:11:48 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c444700b003c70191f267sm2804337wmn.39.2022.11.02.09.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:11:48 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:11:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Brice Goglin <Brice.Goglin@inria.fr>,
 Hesham Almatary <hesham.almatary@huawei.com>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v2 71/82] tests: acpi: add and whitelist *.hmat-noinitiator
 expected blobs
Message-ID: <20221102160336.616599-72-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Brice Goglin <Brice.Goglin@inria.fr>

.. which will be used by follow up hmat-noinitiator test-case.

Signed-off-by: Brice Goglin <Brice.Goglin@inria.fr>
Signed-off-by: Hesham Almatary <hesham.almatary@huawei.com>
Message-Id: <20221027100037.251-3-hesham.almatary@huawei.com>
Tested-by: Yicong Yang <yangyicong@hisilicon.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h   | 4 ++++
 tests/data/acpi/q35/APIC.acpihmat-noinitiator | 0
 tests/data/acpi/q35/DSDT.acpihmat-noinitiator | 0
 tests/data/acpi/q35/HMAT.acpihmat-noinitiator | 0
 tests/data/acpi/q35/SRAT.acpihmat-noinitiator | 0
 5 files changed, 4 insertions(+)
 create mode 100644 tests/data/acpi/q35/APIC.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/q35/DSDT.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/q35/HMAT.acpihmat-noinitiator
 create mode 100644 tests/data/acpi/q35/SRAT.acpihmat-noinitiator

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..245fa66bcc 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,5 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/APIC.acpihmat-noinitiator",
+"tests/data/acpi/q35/DSDT.acpihmat-noinitiator",
+"tests/data/acpi/q35/HMAT.acpihmat-noinitiator",
+"tests/data/acpi/q35/SRAT.acpihmat-noinitiator",
diff --git a/tests/data/acpi/q35/APIC.acpihmat-noinitiator b/tests/data/acpi/q35/APIC.acpihmat-noinitiator
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/DSDT.acpihmat-noinitiator b/tests/data/acpi/q35/DSDT.acpihmat-noinitiator
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/HMAT.acpihmat-noinitiator b/tests/data/acpi/q35/HMAT.acpihmat-noinitiator
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/data/acpi/q35/SRAT.acpihmat-noinitiator b/tests/data/acpi/q35/SRAT.acpihmat-noinitiator
new file mode 100644
index 0000000000..e69de29bb2
-- 
MST


