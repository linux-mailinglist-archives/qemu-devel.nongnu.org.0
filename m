Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6305D61379D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:15:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUJP-0006Cf-3g; Mon, 31 Oct 2022 08:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUJ7-0004tJ-Kf
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:54:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUJ6-0003SY-6G
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:54:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vyFquoWhRBqop6d2QQCGoBYPqIvepuw7IXNadOdimWY=;
 b=Lr9L3SQbSZ/qr25z3hRTHHhmqfItooV7BxgQZ+cKJGkHyFVaEETt/38jgdwiczPNKcedAb
 meC0zLekusjGsTShDcbnCKROXa1BEvmj1pqYjhaL6wsZMOcD6kK0Rrs1bYJYFMRGI0fBQj
 /T+nSpNXHzQ9VUKNt/0ObLo3TcNf6z0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-661-4iHFphreOUOow7lvci8p1Q-1; Mon, 31 Oct 2022 08:54:21 -0400
X-MC-Unique: 4iHFphreOUOow7lvci8p1Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 l1-20020a7bc341000000b003bfe1273d6cso2574322wmj.4
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vyFquoWhRBqop6d2QQCGoBYPqIvepuw7IXNadOdimWY=;
 b=a7rt7JZD4LtHFtMs/44ZYXw+zqZX+KdepoymDcArbAVK06hHHzm/ej3snDeP7HT45o
 3AuE2XV90S9y6QYldd85y+f+GO+x/r5ur2igB/3MW6v25yUBSdMzLg1uQPWa/f1OgdXo
 FNT6R/3eP4cXFhrSo674Ci+a4DkwtwDkbvNGsU0pX6QdZBKCyiyrdlDojCanwlYFqcID
 3ftq6biECQjPMPf6ko4cPSRqvPhi4qNa4k0swNnFwHRaoZ/0noMuz1fzWpKtgYP7E6tq
 HNFo4GDjTc86P3IvpTK5wACVO4X2oDhMmJETo9HCWWxh1Pevrhtgs0+6FKMop+mjdFox
 FEUA==
X-Gm-Message-State: ACrzQf23s4CLZFWDBXKZnDDKaM7V8UxeVh71Dl50tKWSf8PFUaI2LO9o
 qZZOzJm1XEAD0jlym2K1K+Jl57T1gEG95KW4U5JCauq+gCduxjEwvC7NNmphUNKHqhxjWqI9fQr
 +2zbRL00/CJW9lLt/bdXH2BGSHxroXlDU598LtumF0zDrCzdctS/LG5F1seVU
X-Received: by 2002:adf:f511:0:b0:236:60be:e885 with SMTP id
 q17-20020adff511000000b0023660bee885mr7832415wro.663.1667220860359; 
 Mon, 31 Oct 2022 05:54:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5vZjMub9FkyvLFgK/P2U+I1dNdBpApVvmgSJP+H8Lo+FC3W3VmGWeqHSk7A1F9VM6D7ur+Bw==
X-Received: by 2002:adf:f511:0:b0:236:60be:e885 with SMTP id
 q17-20020adff511000000b0023660bee885mr7832393wro.663.1667220860014; 
 Mon, 31 Oct 2022 05:54:20 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 q9-20020a5d61c9000000b00236733f0f98sm6976267wrv.107.2022.10.31.05.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:54:19 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:54:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Brice Goglin <Brice.Goglin@inria.fr>,
 Hesham Almatary <hesham.almatary@huawei.com>,
 Yicong Yang <yangyicong@hisilicon.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 75/86] tests: acpi: add and whitelist *.hmat-noinitiator
 expected blobs
Message-ID: <20221031124928.128475-76-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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


