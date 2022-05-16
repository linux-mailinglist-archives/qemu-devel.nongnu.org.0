Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A9D52837C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:47:15 +0200 (CEST)
Received: from localhost ([::1]:59428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZBy-0008SU-B8
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY6z-0007Z9-9i
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:38:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY6x-0005QQ-O1
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:38:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hmAqjrNwcz/n9dDfLQEkci2IFR8H57pNgW0hXHwtPIo=;
 b=aNnNpIWI8ADZ2h80m4b8FEhnnI/APuDdBuuVF/2WmJ+THG1/I59lngR/lzISer8AjEstlw
 CzOsYFCOOQuVlvLlzKkGSDLCOAPl+0wfNpTyc6EP5lhLSX9EMBbdNm/KHF2rfmIPQpEnKn
 aNYAzK5ZBLzeherCAZSCvyj/9yhGe1E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-Y7F5SOsjMjivHXJFYviewA-1; Mon, 16 May 2022 06:37:58 -0400
X-MC-Unique: Y7F5SOsjMjivHXJFYviewA-1
Received: by mail-wm1-f71.google.com with SMTP id
 m26-20020a7bcb9a000000b0039455e871b6so5437349wmi.8
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hmAqjrNwcz/n9dDfLQEkci2IFR8H57pNgW0hXHwtPIo=;
 b=pqC7dnMZf/w3hSwK6bSMP6ZJiUOiRb/ncDDWIy1h2gEMLTAQvQGY4PLRje4lchqTGC
 UdoVTX4dbazSYoyk3bvSkF77+LnWzgysxr3iiIadhAMmP6lNCUjl/HX6yNV7dIH2+p8t
 KJoeB+W3hDIQLTcQyo0AuJ2b/kKOHmiX+yvurGwrK/EqAYOWzU/wtouOmW86FNGx39XL
 5itMQ695QyLb5e0RJ3NdGtdxga6jvYFhWoqkw5to8Fp4oBe/LEfBkBTOzVyZ20Q1RCyl
 Uy780pOQqcXyQZ4yew4YkQzolkihS8l0mihP5eRrIXEEa6pZHFQUOEbWPDuDy8g/8PG4
 yQVw==
X-Gm-Message-State: AOAM5318NhlzYHz1U6MI9dEE3+vPL+v9oY3ts8ooSPQBOXHednGU+y1L
 FQuBFyzyVBuWdhn7SAix6V32WlNQQ1xfGv/M81UWDL3RgkvhbtOEqQ7gYMDi35Ljj9IgVuarYkB
 UQ21nxmdxsxMd/wkJpWPQ0OH9ccecH0waM1VfiPA/hD+uyN3PRSqCqE9RvSO0
X-Received: by 2002:adf:dd8a:0:b0:20d:ff7:ce01 with SMTP id
 x10-20020adfdd8a000000b0020d0ff7ce01mr1065719wrl.242.1652697476707; 
 Mon, 16 May 2022 03:37:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTPMLgGnu4kL1uVx3zKVe1R9fQqlLQ+akagqjyYw8FYmiv9Gfd1k+IQoDcZguaEDsoSu41aA==
X-Received: by 2002:adf:dd8a:0:b0:20d:ff7:ce01 with SMTP id
 x10-20020adfdd8a000000b0020d0ff7ce01mr1065703wrl.242.1652697476458; 
 Mon, 16 May 2022 03:37:56 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 q22-20020adfb196000000b0020cfed0bb7fsm5781451wra.53.2022.05.16.03.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:37:56 -0700 (PDT)
Date: Mon, 16 May 2022 06:37:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 39/91] qtests/bios-tables-test: Add a test for CXL emulation.
Message-ID: <20220516095448.507876-40-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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


