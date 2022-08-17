Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCEB5977C1
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 22:20:49 +0200 (CEST)
Received: from localhost ([::1]:51608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOPWy-0006eL-NH
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 16:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOPJD-0003Va-B8
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 16:06:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOPJB-0000Ji-Sq
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 16:06:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660766793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O2jVKSC/T/69XGJQ1pcYIKsl06VPDaFnR237r22fRUw=;
 b=MC/NnVZ3xSp1m8w/Ngc1O+ittjBBLdjjo356Ldn7bNnmCkNgEGEbJPbmy0Xcf/nf85de6Y
 n9sAjpbEnUhCKcbk8bDIdSTNYXE+sBXzCGMHYfhMQq5zFh39kwayQ7KGC/sB0VqugH5Eqp
 W62nqtjqIAOrtOP5RnMn2HBwTF+Yplw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-674-RRnRC6kLOO6nX9rkUxriuw-1; Wed, 17 Aug 2022 16:06:32 -0400
X-MC-Unique: RRnRC6kLOO6nX9rkUxriuw-1
Received: by mail-wr1-f70.google.com with SMTP id
 r8-20020adfbb08000000b00225239ce4deso682656wrg.1
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 13:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=O2jVKSC/T/69XGJQ1pcYIKsl06VPDaFnR237r22fRUw=;
 b=1JlNCFlZ3P/6W2rUdgldq/BU7L3DYGBrnTdzf0djA3cGhhQ0uIJGB5ackyOjHtVgmL
 y14CR3GTGdmmdTfb2HzlYXjYscKHFg/1AjPVI0q4Ahmv8FprqhgwxQNU9ZS53bx1kII1
 hyRhxTSGGqGwGsopdcnGhCkSKLYEvDSLbI8N0F7QZTw/97WBwQFw7fAjt2gx6iSHaXpE
 Eui8vDlaNdaFoF9CR+stheZOYF8vLUYMWRnAbe2BXEangcpda6v6XJ9n9NouiIlQkUb8
 vN4UKLR8KYt3uAvcPFG/RN3jTlKhLcgIzcAVSbWd915iTgNHuLOWW56AQ8sQH4UVxObj
 fURg==
X-Gm-Message-State: ACgBeo1NaRrKsElbvjOaQcXy4OQu1IEAIbGxt9EVP2ALpbiOpo84FUXq
 vQQRLHUFr1prvcTV9HkF+FD0Ho+FZ4+TR3k6wvKqZLWTjTKY6tGZb/LuaKs1dF1OKbrtoaPf3ov
 ZlOD28WPoVZdKSqJfArftAa49+9x2CfxJlEzOM0zAYvsmXD62T/ertPnCwAQT
X-Received: by 2002:a1c:7c18:0:b0:3a5:aaae:d203 with SMTP id
 x24-20020a1c7c18000000b003a5aaaed203mr3176719wmc.2.1660766790986; 
 Wed, 17 Aug 2022 13:06:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5uhAjCdsIYNKI43GuN2bYtumElHNmhvnJNAX6/vbd4LpXUCCDSxh2MF7ksUXygiRcQGguSRA==
X-Received: by 2002:a1c:7c18:0:b0:3a5:aaae:d203 with SMTP id
 x24-20020a1c7c18000000b003a5aaaed203mr3176705wmc.2.1660766790752; 
 Wed, 17 Aug 2022 13:06:30 -0700 (PDT)
Received: from redhat.com ([2.55.4.37]) by smtp.gmail.com with ESMTPSA id
 m18-20020adfe0d2000000b0021ea1bcc300sm13648077wri.56.2022.08.17.13.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 13:06:30 -0700 (PDT)
Date: Wed, 17 Aug 2022 16:06:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
Subject: [PULL 11/12] tests: acpi: silence applesmc warning about invalid key
Message-ID: <20220817200536.350795-12-mst@redhat.com>
References: <20220817200536.350795-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220817200536.350795-1-mst@redhat.com>
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

OSK value is irrelevant for ACPI test case.
Supply fake OSK explicitly to prevent QEMU complaining about
invalid key when it fallbacks to default_osk.

Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220728133713.1369596-1-imammedo@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 359916c228..7c5f736b51 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1632,7 +1632,9 @@ static void test_acpi_q35_applesmc(void)
         .variant = ".applesmc",
     };
 
-    test_acpi_one("-device isa-applesmc", &data);
+    /* supply fake 64-byte OSK to silence missing key warning */
+    test_acpi_one("-device isa-applesmc,osk=any64characterfakeoskisenough"
+                  "topreventinvalidkeywarningsonstderr", &data);
     free_test_data(&data);
 }
 
-- 
MST


