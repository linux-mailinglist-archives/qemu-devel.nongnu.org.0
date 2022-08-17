Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E3D59743C
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 18:34:38 +0200 (CEST)
Received: from localhost ([::1]:47476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOM03-0007ZW-SY
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 12:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOLnc-000861-MS
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:21:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOLnb-0005jq-3x
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:21:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660753302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O2jVKSC/T/69XGJQ1pcYIKsl06VPDaFnR237r22fRUw=;
 b=S2IdUMsavmGkpR5h2N/uoj7/A/K0aHIqCzc+RMLQFbPE6AzoDuSmtU5EoFcqNev8tIJarq
 pyZzRk1VJI5y/emnwFpZTrDmYq7S3tmIA5WW/1LJwpNMDCtPCEbCqQ+vYtfCsWaRjRVJIf
 E3r9jmI6NVo5YM/gD38Q5p3ZajuzCTM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-KnmV_bqpMYyWEXjWxqcr3A-1; Wed, 17 Aug 2022 12:15:04 -0400
X-MC-Unique: KnmV_bqpMYyWEXjWxqcr3A-1
Received: by mail-wm1-f70.google.com with SMTP id
 v64-20020a1cac43000000b003a4bea31b4dso1275708wme.3
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 09:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=O2jVKSC/T/69XGJQ1pcYIKsl06VPDaFnR237r22fRUw=;
 b=XV/5r/y207Bzod9FvLga172TizdruixGnoo4eCgJJl7oUcmWXM7AS9NMi6xoiaR/HI
 zcQHukpP9CYFYGm34Hx+r1zH0NDEEVY8MCbXttRCOaqi6zNogV2Vh58xc1QveJYs1Lpf
 6HlyscPvl4oMtYlc7Pka0uFz5KSMonhU0NS+KkYMrfiHS/xteu0xaqtlqJohr/fu2tD8
 MI3zRG2HeUra8MqW+mDgX5Cm367AL+iLpHujdb8X0PdmDiCwwWHkwEPcg85a2Ee4IPZl
 gpUYM8xamAPdGSYkNN/KEyf356/KlXF+nJQOtTDwI/ZDZr2ZbNm3WOItQKQBsvRckD8z
 wljA==
X-Gm-Message-State: ACgBeo2id1of8lamBxGJcAqEJPOUZwZdjreAqTGXY9P4v9Qh8LJJn+2/
 aEI4nhLg1EJHE/nI9cR9cgl/ctw6x7+98O06PQr3U647XBtvaaC3ScvBkOD9SFSCmPINYlKoHq9
 eO/uqc823SVjOFjpTsHhOkrNb+vpWr8I4F/Tdw7W1ivUDB1ZZwxwWMMj7YNW/
X-Received: by 2002:a05:600c:4e4b:b0:3a5:d36e:8349 with SMTP id
 e11-20020a05600c4e4b00b003a5d36e8349mr2703540wmq.44.1660752903562; 
 Wed, 17 Aug 2022 09:15:03 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4dww4JL+w+0a7mVI3yoN3Vo5tT/zjLrdxDDpRwNdtJsw8/OSfIUbZ8oU4KwcY4JupelJkTyw==
X-Received: by 2002:a05:600c:4e4b:b0:3a5:d36e:8349 with SMTP id
 e11-20020a05600c4e4b00b003a5d36e8349mr2703520wmq.44.1660752903205; 
 Wed, 17 Aug 2022 09:15:03 -0700 (PDT)
Received: from redhat.com ([2.55.43.215]) by smtp.gmail.com with ESMTPSA id
 m18-20020adfe0d2000000b0021ea1bcc300sm13218852wri.56.2022.08.17.09.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 09:15:02 -0700 (PDT)
Date: Wed, 17 Aug 2022 12:15:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Ani Sinha <ani@anisinha.ca>
Subject: [PULL 09/10] tests: acpi: silence applesmc warning about invalid key
Message-ID: <20220817161342.240674-10-mst@redhat.com>
References: <20220817161342.240674-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220817161342.240674-1-mst@redhat.com>
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


