Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C35974AA573
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 02:51:32 +0100 (CET)
Received: from localhost ([::1]:45376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGAEd-0007Fb-QX
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 20:51:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA6L-0003h2-Em
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:42:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGA6I-0003Ij-6Q
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:42:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644025373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7KcsN9wh78ObpWmFzT4JOGjUX5sRs+uFsgg22ySvULc=;
 b=QHQyRrGB/hK+8+H7N/TxUoYJ0Xg9qA3efmkMzu9iM7ADttu4hxqYYxb82+zfHpeq0atWHr
 nI1L/LfeKAH1AoPLk3QErDsRgqWYjpfltZF132n60LVs6xaTE7DyktCg0sDBeTV6M9K12d
 Xky06Px9gVQYB4qCqsSHe74MP6hlaIo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-_gSKQnuUOYuxPmK56sn_iQ-1; Fri, 04 Feb 2022 20:42:52 -0500
X-MC-Unique: _gSKQnuUOYuxPmK56sn_iQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 k12-20020adfe3cc000000b001d6806dfde1so2779112wrm.16
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 17:42:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7KcsN9wh78ObpWmFzT4JOGjUX5sRs+uFsgg22ySvULc=;
 b=z+Uj3ca45sJcmd6paqP+aOwmxlMrakod7vCRJ2ae5vtcGFhyuYCCaP5a/3Yl3dWbm6
 Lgnpoq36kLN6rBBImxk+d/lXwoyhLd7qwxNf/WVA020QvMv1GmPg4HcRbF/RlxMm3GJZ
 OcUY0xzI7Z94OchhZW7DGH3yD8ZZ6mcCDK6RGXcgJTU7+foDbaA+qrQyoQwiyN2/d1o+
 6JmqCK7ll6tAO4+LbxIWCefPKnhrt4Rtje+iFZoR04KpjrO7zjc8MVnCFuYq2htN3hm8
 g+rM8EUhXt76IL0k7epc/QTtRcTl6EOSEun4ylMxCzrKtLrRfGxt2armTGN+HqbQStZe
 sXiA==
X-Gm-Message-State: AOAM530mMwHr/ftlz6NWbQH44Il8Pb+4XP9g9NOT+egPJ7tpQO7hknwI
 vjUzWd737ltaNxEF/V5Nd93ltZys9XTbMmfvrRkhT9W1ZjsEx2rH9LbaD02//W1hNZI1kn4k2Kg
 TywWTI8SRkUuaBVlRdswZE0uW/JRS0l5sqO7RqPAOWVXP33K/hMB2mr12KP3c
X-Received: by 2002:a05:6000:16cc:: with SMTP id
 h12mr1225771wrf.408.1644025371365; 
 Fri, 04 Feb 2022 17:42:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/ocJPl+glT3ARTk70LzTFPhYqSyvwrfoOszvcEzUOxTS4vTPoZsN9hEZo1QOVqObA2R2trw==
X-Received: by 2002:a05:6000:16cc:: with SMTP id
 h12mr1225755wrf.408.1644025371180; 
 Fri, 04 Feb 2022 17:42:51 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id n10sm10780377wmr.25.2022.02.04.17.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 17:42:50 -0800 (PST)
Date: Fri, 4 Feb 2022 20:42:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/32] acpi: fix OEM ID/OEM Table ID padding
Message-ID: <20220205014149.1189026-6-mst@redhat.com>
References: <20220205014149.1189026-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220205014149.1189026-1-mst@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-stable@nongnu.org, "Dmitry V . Orekhov" <dima.orekhov@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Commit [2] broke original '\0' padding of OEM ID and OEM Table ID
fields in headers of ACPI tables. While it doesn't have impact on
default values since QEMU uses 6 and 8 characters long values
respectively, it broke usecase where IDs are provided on QEMU CLI.
It shouldn't affect guest (but may cause licensing verification
issues in guest OS).
One of the broken usecases is user supplied SLIC table with IDs
shorter than max possible length, where [2] mangles IDs with extra
spaces in RSDT and FADT tables whereas guest OS expects those to
mirror the respective values of the used SLIC table.

Fix it by replacing whitespace padding with '\0' padding in
accordance with [1] and expectations of guest OS

1) ACPI spec, v2.0b
       17.2 AML Grammar Definition
       ...
       //OEM ID of up to 6 characters. If the OEM ID is
       //shorter than 6 characters, it can be terminated
       //with a NULL character.

2)
Fixes: 602b458201 ("acpi: Permit OEM ID and OEM table ID fields to be changed")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/707
Reported-by: Dmitry V. Orekhov <dima.orekhov@gmail.com>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-stable@nongnu.org
Message-Id: <20220112130332.1648664-4-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Tested-by: Dmitry V. Orekhov dima.orekhov@gmail.com
---
 hw/acpi/aml-build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index bb2cad63b5..8966e16320 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1724,9 +1724,9 @@ void acpi_table_begin(AcpiTable *desc, GArray *array)
     build_append_int_noprefix(array, 0, 4); /* Length */
     build_append_int_noprefix(array, desc->rev, 1); /* Revision */
     build_append_int_noprefix(array, 0, 1); /* Checksum */
-    build_append_padded_str(array, desc->oem_id, 6, ' '); /* OEMID */
+    build_append_padded_str(array, desc->oem_id, 6, '\0'); /* OEMID */
     /* OEM Table ID */
-    build_append_padded_str(array, desc->oem_table_id, 8, ' ');
+    build_append_padded_str(array, desc->oem_table_id, 8, '\0');
     build_append_int_noprefix(array, 1, 4); /* OEM Revision */
     g_array_append_vals(array, ACPI_BUILD_APPNAME8, 4); /* Creator ID */
     build_append_int_noprefix(array, 1, 4); /* Creator Revision */
-- 
MST


