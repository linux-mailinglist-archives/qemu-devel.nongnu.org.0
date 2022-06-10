Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70241546088
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 10:53:10 +0200 (CEST)
Received: from localhost ([::1]:38978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzaOD-00055m-BB
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 04:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXB-0000Iv-Rm
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:58:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZX8-0006IX-Sf
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:58:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4nmjN6bwgcMzCDQZFw4PNGDXA6/jQ8q9DHYb9d4XDTk=;
 b=fTw53f+tFLBtUtPoc9FCP6BIoIiJ//7gxqDK/DBXsUUJaWzppXhhOh1CiLronFWWVQxL0Z
 J0PPvwXChwSGiR3UPBk7f7iFFYNO0DZ/Mz0X7u3imAc+l67ftAJsbzpoM0KzI8gr1IUU7/
 BSOCMjsZ5OTk9hu3Fbx0xa3xkLgosOI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-tY8HXp18P76mh1OHlhwUlg-1; Fri, 10 Jun 2022 03:58:14 -0400
X-MC-Unique: tY8HXp18P76mh1OHlhwUlg-1
Received: by mail-wm1-f69.google.com with SMTP id
 v125-20020a1cac83000000b0039c6608296dso943485wme.4
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:58:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4nmjN6bwgcMzCDQZFw4PNGDXA6/jQ8q9DHYb9d4XDTk=;
 b=AR1cq2OIGt3F9IHQtnT8AMz2gDU7RbdY0yGHPbKfQLq2B6FRspLldPsjRzV7ea0OJ2
 dP/U5UfwOTSA04HF0ZKR3RZRyRjAgFmJf78H2esZSS+uHcxUfOPyHCaxlHxYECvj3pyX
 kq71CGWnH60P3nCFabBX9t+wHH/55J4UnsgRf05mFYtxpsC3M+uSw0K+k8upMjplRr3t
 /atty++hB/lGp/sFtnVfw5gUI5Gw6xc8aVaBMF2/3qUHGx5kq4ZnU7NpwqSg3jwUrly3
 GPv9dnlogQVGDKc92oqml/c0L08tzuH4Cq6gLhYNO3SVCialOQu+b7mCpaKRjonFjftI
 CRkQ==
X-Gm-Message-State: AOAM533olZLsV/h/weNhi7OxCd+CSCO0N4/UQr6shfOONJrU7x2+NnNT
 vTrl2MYLgeC4WpW8Sh1IlbmsjnQNtjvY1aOH1UcVMNdTq2q+B6t3sN6Bz0pTi6fCnpGDpIP3I3L
 MH67g73UuACUuoSfQo8VFE+Y0ugDwn4e769aUlPaYniDFu+ldz9rn8I8v4Scq
X-Received: by 2002:a5d:64cc:0:b0:20f:e6d6:72e1 with SMTP id
 f12-20020a5d64cc000000b0020fe6d672e1mr41828588wri.384.1654847892893; 
 Fri, 10 Jun 2022 00:58:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHWshblt7XxWTvVT7sa6NvbHogo/t+ATTnPQkzBo+iy/30nMJXo45HAki3XDscr7BSQ0mCnA==
X-Received: by 2002:a5d:64cc:0:b0:20f:e6d6:72e1 with SMTP id
 f12-20020a5d64cc000000b0020fe6d672e1mr41828566wri.384.1654847892643; 
 Fri, 10 Jun 2022 00:58:12 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 p21-20020a05600c359500b00394708a3d7dsm2191730wmq.15.2022.06.10.00.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:58:12 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:58:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 23/54] tests: acpi: add applesmc testcase
Message-ID: <20220610075631.367501-24-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20220608135340.3304695-24-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index d896840270..7d238218ca 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1625,6 +1625,17 @@ static void test_acpi_q35_slic(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_applesmc(void)
+{
+    test_data data = {
+        .machine = MACHINE_Q35,
+        .variant = ".applesmc",
+    };
+
+    test_acpi_one("-device isa-applesmc", &data);
+    free_test_data(&data);
+}
+
 static void test_oem_fields(test_data *data)
 {
     int i;
@@ -1783,6 +1794,7 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
         qtest_add_func("acpi/piix4/acpierst", test_acpi_piix4_acpi_erst);
         qtest_add_func("acpi/q35/acpierst", test_acpi_q35_acpi_erst);
+        qtest_add_func("acpi/q35/applesmc", test_acpi_q35_applesmc);
         qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
         qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
         qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
-- 
MST


