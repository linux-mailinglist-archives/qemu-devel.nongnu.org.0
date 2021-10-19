Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3D14334A4
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 13:27:18 +0200 (CEST)
Received: from localhost ([::1]:52892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcnH3-0000N8-Ov
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 07:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnAW-0000CO-Ec
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:20:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mcnAO-0002A9-VC
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 07:20:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634642418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qOZtE7xnygrqomoULUMXxJIooXP/byLxi3JGgtUneLc=;
 b=feXkDIk5uHA5Ng3A6usKxoBZUByUGXHdMc9f6ixngM/8Y54yth7el1e2y4qI2fPnkwXlNb
 QsxqOT2kvUagREv9B3/4drxOtRjVLKQTpYPuymj2+B2UmxziKKWBmyrkFmTYW9uoU4bdJQ
 ETJOes/wO41eZy1CSfu8Ze7poNzbDdM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-SUe1npceMLaDko3n7Udp3w-1; Tue, 19 Oct 2021 07:20:17 -0400
X-MC-Unique: SUe1npceMLaDko3n7Udp3w-1
Received: by mail-ed1-f70.google.com with SMTP id
 i7-20020a50d747000000b003db0225d219so12643794edj.0
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 04:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qOZtE7xnygrqomoULUMXxJIooXP/byLxi3JGgtUneLc=;
 b=pEb1sR3hgJL2tMyuJq8Jv+OyHmrUIsl6/Z6Yfp6RSVotpcn4JnBdyH4nbYliSHvBMv
 K3Luhb/RqtXdkinEgq/nKrYv//GKIee7KTsEIA8a+6E4bg/m3b1eKMycx4VNVZ2NE8SD
 SKyG56Jh4SH7b6N/D4FTxWj+zO5605Vmj8B6ySRR7KFyQ/vqStQdpeI7MYpGNz3SgRf1
 4UVpW/oAJMS0yKxl/3t8nRaXsG0nGPKxf37wUKxBnUfGtwx0FtczohaJQ3/9O8f0puSf
 kGCx/E6HlupjI2Uszwwmc4b8n7gkwOXl8dg4gSKSmgdBEYucp9KyCwKCXM/fqP5KLTNb
 9sLw==
X-Gm-Message-State: AOAM533hxr0gyWbjxknXWH0ciFrhc3qy2J+LaRoGEqV3nwNk4401/Los
 WuZr2tQCN+0/s4R8rpdoVN6myXWiJGZFosg5l6EwCpBHzVmUHHQjY615TjfhuLP89nswXop2JGI
 RtIZyHQoYvV89q81Mm8E58iLajJ82GefrI8Q7snyfF49giFfkEV0Fcxr64TZE
X-Received: by 2002:a17:907:629b:: with SMTP id
 nd27mr35973415ejc.24.1634642416008; 
 Tue, 19 Oct 2021 04:20:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw02ZXzIQ5JosUQfx4+pa5MiBozIWHFxcHvBTvPaIKTuuN0icQFb7KOw88DCbPSjaPhGXOTVw==
X-Received: by 2002:a17:907:629b:: with SMTP id
 nd27mr35973387ejc.24.1634642415712; 
 Tue, 19 Oct 2021 04:20:15 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id i4sm10890129edt.29.2021.10.19.04.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 04:20:15 -0700 (PDT)
Date: Tue, 19 Oct 2021 07:20:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/29] tests: acpi: arm/virt: drop redundant test_acpi_one()
 in test_acpi_virt_tcg()
Message-ID: <20211019111923.679826-13-mst@redhat.com>
References: <20211019111923.679826-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211019111923.679826-1-mst@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

follow up call with smbios options generates the same ACPI tables,
so there is no need to run smbios-less variant at all.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210902113551.461632-13-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index ef28bb41f3..873eb9c037 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1430,9 +1430,6 @@ static void test_acpi_virt_tcg(void)
         .scan_len = 128ULL * 1024 * 1024,
     };
 
-    test_acpi_one("-cpu cortex-a57", &data);
-    free_test_data(&data);
-
     data.smbios_cpu_max_speed = 2900;
     data.smbios_cpu_curr_speed = 2700;
     test_acpi_one("-cpu cortex-a57 "
-- 
MST


