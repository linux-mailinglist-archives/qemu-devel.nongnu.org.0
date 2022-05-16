Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FEB52930C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:42:30 +0200 (CEST)
Received: from localhost ([::1]:37736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiU1-00069D-7O
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhi5-00079S-QX
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:52:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhi4-0006a2-6j
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:52:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hmAqjrNwcz/n9dDfLQEkci2IFR8H57pNgW0hXHwtPIo=;
 b=eARXNjAGOBmhLKHY7eFgZ3AcWVVLJlqfY/W4zgpxiskutLn1QgO0q38nArXdRrgFP1t0i6
 ynMKlPfSELFtT6HAE2Lx2dKdhOhx8Ua2c6Eg2UWnHuVaRu4pFAJbuxtdNT2uZC/FzkEYXY
 wFMJxA6DwlAvRowiZEsAkUnxE9wCUO8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-uJ0HbXspM0q4ImhJYZKBGw-1; Mon, 16 May 2022 16:52:54 -0400
X-MC-Unique: uJ0HbXspM0q4ImhJYZKBGw-1
Received: by mail-ed1-f69.google.com with SMTP id
 q12-20020a056402040c00b0042a84f9939dso4548544edv.7
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hmAqjrNwcz/n9dDfLQEkci2IFR8H57pNgW0hXHwtPIo=;
 b=sZsW5muneo58/P2N76jM+QOCNFonjaiV+eRIdV0YZ36v2wC3Q+TbQpxzYNBsiLYXXk
 FMoK+DyrfOl2K6hJxYSI1jXGGaXn98Ty0aZ8XFfhaQFbc10yQpfW+e/df/9dH9TsxLUf
 EiO1nN87U+e58UftUF0Pj27T4CRLD5lpVTIaC64G7hZoTqFiLR90tBK6VQJWd2zCWDn1
 XRjdXHVAoWAayUDb5qJnMkQzjGo8g6IB4dUVanoZ5OhMiGAMmmtuSX7X4Cz2TWkbYqUW
 Eki5dTqyjkTXkK/FmzfE+Mw4QmxeP4Oaew8HrrP4xM+88P+3RZ7TJcZv7HF54XADDPDx
 1SqA==
X-Gm-Message-State: AOAM531MiuKXVGKqP+Q/4eXU7GU6lk6ig4CZm8lnDVcjOgqI5guu+t6p
 tafWiV55yPolefIjnmG8h+yD7KNrRyhc4e0Hgnr4/XqZT77mb7PI+LOXU9hqsclRIBVV2zs9zY8
 KS2zJk2ayDUgA0wVu+ySbNczdd3mlLw75wuC8POY0wXVjP7D2JQ1CDy8AdP9x
X-Received: by 2002:a17:907:969f:b0:6f3:dede:f2d2 with SMTP id
 hd31-20020a170907969f00b006f3dedef2d2mr16412694ejc.511.1652734372864; 
 Mon, 16 May 2022 13:52:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmmM/MVF7s2rEMrrWv24lCwWvGFpYBTBUKn3SS1vKcU5cx841P51C+Ja7N6aKdkngRg5k1og==
X-Received: by 2002:a17:907:969f:b0:6f3:dede:f2d2 with SMTP id
 hd31-20020a170907969f00b006f3dedef2d2mr16412676ejc.511.1652734372525; 
 Mon, 16 May 2022 13:52:52 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 s3-20020a170906778300b006f3ef214dd5sm174481ejm.59.2022.05.16.13.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:52:51 -0700 (PDT)
Date: Mon, 16 May 2022 16:52:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL v2 39/86] qtests/bios-tables-test: Add a test for CXL emulation.
Message-ID: <20220516204913.542894-40-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

The DSDT includes several CXL specific elements and the CEDT
table is only present if we enable CXL.

The test exercises all current functionality with several
CFMWS, CHBS structures in CEDT and ACPI0016/ACPI00017 and _OSC
entries in DSDT.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220429144110.25167-38-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 44 ++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 5dddedabcd..a4a46e97f0 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1536,6 +1536,49 @@ static void test_acpi_q35_viot(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_cxl(void)
+{
+    gchar *tmp_path = g_dir_make_tmp("qemu-test-cxl.XXXXXX", NULL);
+    gchar *params;
+
+    test_data data = {
+        .machine = MACHINE_Q35,
+        .variant = ".cxl",
+    };
+    /*
+     * A complex CXL setup.
+     */
+    params = g_strdup_printf(" -machine cxl=on"
+                             " -object memory-backend-file,id=cxl-mem1,mem-path=%s,size=256M"
+                             " -object memory-backend-file,id=cxl-mem2,mem-path=%s,size=256M"
+                             " -object memory-backend-file,id=cxl-mem3,mem-path=%s,size=256M"
+                             " -object memory-backend-file,id=cxl-mem4,mem-path=%s,size=256M"
+                             " -object memory-backend-file,id=lsa1,mem-path=%s,size=256M"
+                             " -object memory-backend-file,id=lsa2,mem-path=%s,size=256M"
+                             " -object memory-backend-file,id=lsa3,mem-path=%s,size=256M"
+                             " -object memory-backend-file,id=lsa4,mem-path=%s,size=256M"
+                             " -device pxb-cxl,bus_nr=12,bus=pcie.0,id=cxl.1"
+                             " -device pxb-cxl,bus_nr=222,bus=pcie.0,id=cxl.2"
+                             " -device cxl-rp,port=0,bus=cxl.1,id=rp1,chassis=0,slot=2"
+                             " -device cxl-type3,bus=rp1,memdev=cxl-mem1,lsa=lsa1"
+                             " -device cxl-rp,port=1,bus=cxl.1,id=rp2,chassis=0,slot=3"
+                             " -device cxl-type3,bus=rp2,memdev=cxl-mem2,lsa=lsa2"
+                             " -device cxl-rp,port=0,bus=cxl.2,id=rp3,chassis=0,slot=5"
+                             " -device cxl-type3,bus=rp3,memdev=cxl-mem3,lsa=lsa3"
+                             " -device cxl-rp,port=1,bus=cxl.2,id=rp4,chassis=0,slot=6"
+                             " -device cxl-type3,bus=rp4,memdev=cxl-mem4,lsa=lsa4"
+                             " -cxl-fixed-memory-window targets.0=cxl.1,size=4G,interleave-granularity=8k"
+                             " -cxl-fixed-memory-window targets.0=cxl.1,targets.1=cxl.2,size=4G,interleave-granularity=8k",
+                             tmp_path, tmp_path, tmp_path, tmp_path,
+                             tmp_path, tmp_path, tmp_path, tmp_path);
+    test_acpi_one(params, &data);
+
+    g_free(params);
+    g_assert(g_rmdir(tmp_path) == 0);
+    g_free(tmp_path);
+    free_test_data(&data);
+}
+
 static void test_acpi_virt_viot(void)
 {
     test_data data = {
@@ -1741,6 +1784,7 @@ int main(int argc, char *argv[])
             qtest_add_func("acpi/q35/kvm/dmar", test_acpi_q35_kvm_dmar);
         }
         qtest_add_func("acpi/q35/viot", test_acpi_q35_viot);
+        qtest_add_func("acpi/q35/cxl", test_acpi_q35_cxl);
         qtest_add_func("acpi/q35/slic", test_acpi_q35_slic);
     } else if (strcmp(arch, "aarch64") == 0) {
         if (has_tcg) {
-- 
MST


