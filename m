Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2674865D2
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:09:23 +0100 (CET)
Received: from localhost ([::1]:42402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TSE-0006N2-ES
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:09:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sf4-0005c5-S9
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sf3-00014M-DH
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UtXyrtn+0H59zIz1wAsdY62sOCwJtY4CRpesWdrs1nM=;
 b=caYjc1C7Wo5D37sxO0ZLYn+QG3oGyOSzGzmhyYwUE2ryP4h27TBqW9byXR91Of2ptRGgsG
 g1lcC5wAE34P9F6bXdApvY1ceCIf7+RWA9nWt/CyXKkSsBPAIqP5Z+JWpPX/dUUoqx1b71
 xozRlEk51zsFJTFq4nH0fWKM7ybIyCY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-2AcLWlh5OMKe8ddUP_E0bA-1; Thu, 06 Jan 2022 08:18:32 -0500
X-MC-Unique: 2AcLWlh5OMKe8ddUP_E0bA-1
Received: by mail-ed1-f69.google.com with SMTP id
 i5-20020a05640242c500b003f84839a8c3so1940581edc.6
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:18:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UtXyrtn+0H59zIz1wAsdY62sOCwJtY4CRpesWdrs1nM=;
 b=MIEKu9NvHDWZRPDBlfOqwqOsOoLTMM+Mma7CIkxCRpwT7IO0oOXb81LS/g40cbB4mn
 tSuTdvn4FCP/gsaukw1U8flrGr5gkxdc1VWABIHxoROe+w3S5YzOWnHSaRoWGwZZieuh
 F8bKquNSQ3d9MzKw5nOv9MZYmCK8i3dXuCLGsfB0Qae50KG+yvmLVm8UEWWBiB8nz9/B
 Kh4Pa4Em4/CFMZSATiwEd49JN/lbSQSXY+A0O/jPSo6AcOY5mYCVtpxx1FC4vk+RBn9f
 LXQLehrVI2CYRkUNN/7Jx4Ly52U+7dArwZNbZJy6LZuY1J6UW7FeBgqQpEmQ+X/m9mNM
 gBPQ==
X-Gm-Message-State: AOAM531gkiVI6ChTzd3dXYosaImf9QYr361TNB1mzIrhN6tPOvpPUpoV
 W/0Xm9F1rcFGbBGf86MqitTVPmyuAZBRzYUf1fOm5h/1f0FfBWWGlfwd/S64b4nqqHvbSer282I
 25re4kFDlQlwckmCjudb2vhgDFfNBFJPK9almMVky21l5Njh8e+No5OnhQ9yS
X-Received: by 2002:a17:907:90ce:: with SMTP id
 gk14mr3768535ejb.230.1641475110379; 
 Thu, 06 Jan 2022 05:18:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmBYp5pSE4uJUgF3mwJep4VPRgqpCyWcOcB4wFT96EHw9K5cGZadwXLQM7y5lxnDYvt2AhlQ==
X-Received: by 2002:a17:907:90ce:: with SMTP id
 gk14mr3768523ejb.230.1641475110187; 
 Thu, 06 Jan 2022 05:18:30 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id b6sm716959edd.47.2022.01.06.05.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:18:29 -0800 (PST)
Date: Thu, 6 Jan 2022 08:18:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 45/52] tests: acpi: add SLIC table test
Message-ID: <20220106131534.423671-46-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

When user uses '-acpitable' to add SLIC table, some ACPI
tables (FADT) will change its 'Oem ID'/'Oem Table ID' fields to
match that of SLIC. Test makes sure thati QEMU handles
those fields correctly when SLIC table is added with
'-acpitable' option.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20211227193120.1084176-4-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 9a468e29eb..e6b72d9026 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1502,6 +1502,20 @@ static void test_acpi_virt_viot(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_slic(void)
+{
+    test_data data = {
+        .machine = MACHINE_Q35,
+        .variant = ".slic",
+    };
+
+    test_acpi_one("-acpitable sig=SLIC,oem_id='CRASH ',oem_table_id='ME',"
+                  "oem_rev=00002210,asl_compiler_id='qemu',"
+                  "asl_compiler_rev=00000000,data=/dev/null",
+                  &data);
+    free_test_data(&data);
+}
+
 static void test_oem_fields(test_data *data)
 {
     int i;
@@ -1677,6 +1691,7 @@ int main(int argc, char *argv[])
             qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
         }
         qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
+        qtest_add_func("acpi/q35/slic", test_acpi_q35_slic);
     } else if (strcmp(arch, "aarch64") == 0) {
         if (has_tcg) {
             qtest_add_func("acpi/virt", test_acpi_virt_tcg);
-- 
MST


