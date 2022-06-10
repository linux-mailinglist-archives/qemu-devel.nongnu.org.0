Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6A8545F95
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 10:45:55 +0200 (CEST)
Received: from localhost ([::1]:57008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzaHC-0005f3-6r
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 04:45:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXK-0000mN-Sc
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:58:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXJ-0006Jq-DW
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:58:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=weiTji5w6RfPO8HsfZs/BxaRyuDX9+G1lexlo1ANaI8=;
 b=entCqLXD2WQYJl8nFW8tYkp2/aZr5mfOHpkWRunZ3Gm7k9uuAZTDV1N3UEUyRnXfwpB2hb
 tHP/WKKYeNrPB6PDKBpb9RgaDZX2mmRxLpq3uP/sR3H2Lp7TAgNDR5zcknGALc1g0rIsoj
 vzHd6Cg5CgOZXAC9OanwO/43lYdZbEk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443--L-QoAxoPnGnwbIedhCi3g-1; Fri, 10 Jun 2022 03:58:26 -0400
X-MC-Unique: -L-QoAxoPnGnwbIedhCi3g-1
Received: by mail-wm1-f70.google.com with SMTP id
 c125-20020a1c3583000000b003978decffedso941994wma.5
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=weiTji5w6RfPO8HsfZs/BxaRyuDX9+G1lexlo1ANaI8=;
 b=qlWVyYVFHKD2PztQNua6YhLehJSw5vMv3lt8cN0wfN+INMNaYJFlNhRBndpVXSJld4
 Y5d3LGQ5wGpei9PnUYpJeqYHkUP8Idb0/Ry+vo2C3A1Zgax0LtNZaDLRZXs8+Rsu3OKA
 iETV8rsuQEPZGVet9TZz62hjdb7ujt28CnAT37mQnrc+hgOGUr9ixFXVQFYhPG3egGJB
 euaTmfsMA1UVpZ/gqDRuJ6wsHBhWd6QFF5DUZj5qYGR/MNJWE3q1kGGiJ1SW8Y89M3f7
 Z+N9NiES8rGULU3vdWghCqHmCM1y+DeA2vO/w0P7rqHsfilbnXKTrOabsBobdxv9hNJk
 /D/A==
X-Gm-Message-State: AOAM531AT0/3Rms/4pADDhWj/whNNSN3K8kLLWuVO57TgW1Y3UVht4WP
 mH5c0lWxdu+o69FOZGQkskcEt1QZqG3PB6P3Vgb0LIOZSygjRyksUbvFEjKi/wqY6NDu1yWvMzz
 zh7QrQtE8LmBe71q23cpOaw7ybQZ5j94XLWAoo12cJJT2eWoryI9VsGA9v12C
X-Received: by 2002:a05:6000:1006:b0:210:353e:32b2 with SMTP id
 a6-20020a056000100600b00210353e32b2mr42370534wrx.303.1654847905227; 
 Fri, 10 Jun 2022 00:58:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlWN/ZI69aplmqUMVIxefgcEOTH60BdkKTer1+fqg0v2D9KsqZwHuAecZWKdjA2wOG4fwQ8A==
X-Received: by 2002:a05:6000:1006:b0:210:353e:32b2 with SMTP id
 a6-20020a056000100600b00210353e32b2mr42370467wrx.303.1654847904159; 
 Fri, 10 Jun 2022 00:58:24 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 l4-20020a5d5604000000b0020fffbc122asm31552259wrv.99.2022.06.10.00.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:58:23 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:58:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 27/54] tests: acpi: add pvpanic-isa: testcase
Message-ID: <20220610075631.367501-28-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Message-Id: <20220608135340.3304695-28-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 7d238218ca..56498bbcc8 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1636,6 +1636,17 @@ static void test_acpi_q35_applesmc(void)
     free_test_data(&data);
 }
 
+static void test_acpi_q35_pvpanic_isa(void)
+{
+    test_data data = {
+        .machine = MACHINE_Q35,
+        .variant = ".pvpanic-isa",
+    };
+
+    test_acpi_one("-device pvpanic", &data);
+    free_test_data(&data);
+}
+
 static void test_oem_fields(test_data *data)
 {
     int i;
@@ -1795,6 +1806,7 @@ int main(int argc, char *argv[])
         qtest_add_func("acpi/piix4/acpierst", test_acpi_piix4_acpi_erst);
         qtest_add_func("acpi/q35/acpierst", test_acpi_q35_acpi_erst);
         qtest_add_func("acpi/q35/applesmc", test_acpi_q35_applesmc);
+        qtest_add_func("acpi/q35/pvpanic-isa", test_acpi_q35_pvpanic_isa);
         qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
         qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
         qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
-- 
MST


