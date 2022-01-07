Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7806C487698
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:34:42 +0100 (CET)
Received: from localhost ([::1]:41176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nW5-0008J6-IG
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:34:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n3z-0001RG-21
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n3o-0002Iw-Sj
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553526;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UtXyrtn+0H59zIz1wAsdY62sOCwJtY4CRpesWdrs1nM=;
 b=EFxuBTwmEq6lSyVlWRVelbI4nTwsCANgfar/Y79RceSMWKIdwoIdPYBefgnM4A8aP0eoa/
 20FsBivO9Ww8BIBdK0pGTOit8URMXKE5/DVYxq1lhnMxcJ1whhG6TWUOOpUaRi3Re/2Buu
 vLlGcGfn8WjlNpCZ6i7elL9uNn0vaPI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-5k3g6RYSNLaiGHJ7MMtcVA-1; Fri, 07 Jan 2022 06:05:25 -0500
X-MC-Unique: 5k3g6RYSNLaiGHJ7MMtcVA-1
Received: by mail-wr1-f72.google.com with SMTP id
 i23-20020adfaad7000000b001a6320b66b9so264104wrc.15
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:05:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UtXyrtn+0H59zIz1wAsdY62sOCwJtY4CRpesWdrs1nM=;
 b=w++Q93cFTCXHM4d0ChmtV/lNdngVAq+jg8zPTVkPPO2a7g+Wgkd+oJqVTfSLRXF0e7
 7+P2txYoqMRRIiQrYGY4+IDcc7spGuqs0/Vkyf981+dFGNrjk1EOEP28S9ViK5vbr1S7
 sTMhluMIoIOGxbTKAyO8tTk+w03+pSGtW2nPY/kGNtpB7rUIjIj4DGOGBcvvN+Q7YQf3
 F8bXtB3I3EqYMC+45qxRv54xoi/gL5/o4WrXs6s2Z6tlAiyEJ360eOfUwqhDmHqf5jEw
 DMhJDpr8JzNF+Ij2tOcKWSOXoXUofQcfyxuilu6ZNvqOYmjSwB4dEKZ5zPjtjvPWxbOk
 Py/g==
X-Gm-Message-State: AOAM5330I5gX4qDz6mLGcvokE6k4y3lv0Q31zd/ONlOnQxCE7fI0O3Xr
 b/tyjYecoOwQS8pd0misxEPeDFThjAF9U2O6SiFMQgVR5Hsrh/kecXvI+dJZyvvkHl2rgDC7pLB
 zDGR6plmfQXrmq7/xVkTrveoAS5PVdBSliaVbnHxaHyn8Xuscjtcphq4/rmcA
X-Received: by 2002:a05:6000:1688:: with SMTP id
 y8mr52105919wrd.682.1641553523485; 
 Fri, 07 Jan 2022 03:05:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBfMJcfM2q2+DgDB5jTDuSg3MIZ1AbCe40L2yCL3W0+YnKn+viP8sOIYgS6gQ2ud4YYlu+kA==
X-Received: by 2002:a05:6000:1688:: with SMTP id
 y8mr52105893wrd.682.1641553523232; 
 Fri, 07 Jan 2022 03:05:23 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id w6sm3768536wro.114.2022.01.07.03.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:05:22 -0800 (PST)
Date: Fri, 7 Jan 2022 06:05:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 45/55] tests: acpi: add SLIC table test
Message-ID: <20220107102526.39238-46-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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


