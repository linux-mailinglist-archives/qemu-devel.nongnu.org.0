Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D974AA594
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 03:14:53 +0100 (CET)
Received: from localhost ([::1]:38280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGAbE-0007BM-S9
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 21:14:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGABI-0006Ex-Od
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:48:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGABG-0003yO-6U
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 20:48:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644025681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dqIW4HOXDQJl70JpvdUs1dPT+8Qw8RjLjhx0buPuD7M=;
 b=ZWHYuoVl+/d0K8QKvhNZ4G+5b+ANI6rnT2SfCZtZe2RMzMY2opuUB2MAr8VKTCrriy1qEQ
 br5nXbxeK785YDyocyZqFUQWiAHgnl9QEKURcGXS5n/3FaJcR9rq+lv93Na0fTQk6Q0MH4
 Xc9qmipBKEFnS9tr0kwwBE9JdPv3dho=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-fBqt1BIVNiylS8a-q-LbQg-1; Fri, 04 Feb 2022 20:43:50 -0500
X-MC-Unique: fBqt1BIVNiylS8a-q-LbQg-1
Received: by mail-wr1-f71.google.com with SMTP id
 w7-20020adfbac7000000b001d6f75e4faeso2805058wrg.7
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 17:43:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dqIW4HOXDQJl70JpvdUs1dPT+8Qw8RjLjhx0buPuD7M=;
 b=h9dDl4AOv9+y0fpfa+1lbWWRpEs/iFeaCg6XjWiZ8VEM42z6WTznYxRnxhGFVL6+tx
 Dj8g3ax0ltHqvFcoY1RE9qJH+34AdD2XpKkozNnWsEFPvZg7Or9nEF6bazT/KcD96W/8
 Jpd20saJB4WXDdtQooQquotEhXj2UXt9WbuEMvNpXAoY14SGAzv3IlbDE41CvWbUdtiW
 6g5TCaS3TpFKZ9GcPiAaCtxyr843zRrH6rcnqC8ayQ/W/ZaYUl2zaghpSRf028BsBKBV
 w4Rcj0c9l1LH0x+uSLGbDMme4YHQ83oDuzqw8quishryEWlZCR01JbQM9CwBAPYYC8O/
 ev3Q==
X-Gm-Message-State: AOAM531Z5jNkGg1CTmqmIkgisfkAVFoFvdFPMqMWp0zszbIYxkrlRZG9
 bG+VV7kAqZVF5Ky5q6PuFc5168tHm6VaBoWgGwnDgb30FLAUbH1vjEGEl/xjqdg+qDR7geJ/Mv8
 ZrfobuCRimqEq5KAfVPjlCxKK6mFe4ZAZ8bG79G+hrAsTQBFwZzTCegykKp6V
X-Received: by 2002:a1c:4604:: with SMTP id t4mr1125487wma.191.1644025429316; 
 Fri, 04 Feb 2022 17:43:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5zFYeLKN8PWfkgB+J/ljBs+2gU2p07KvweAv6WRN280IcrPAQYs/OyofQ9oJJlaRYEh3LbA==
X-Received: by 2002:a1c:4604:: with SMTP id t4mr1125472wma.191.1644025429007; 
 Fri, 04 Feb 2022 17:43:49 -0800 (PST)
Received: from redhat.com ([2a10:8005:331d:0:5c51:c095:613e:277c])
 by smtp.gmail.com with ESMTPSA id 21sm9507617wmv.11.2022.02.04.17.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 17:43:48 -0800 (PST)
Date: Fri, 4 Feb 2022 20:43:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/32] ACPI ERST: header file for ERST
Message-ID: <20220205014149.1189026-26-mst@redhat.com>
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
 Eric DeVolder <eric.devolder@oracle.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric DeVolder <eric.devolder@oracle.com>

This change introduces the public defintions for ACPI ERST.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <1643402289-22216-5-git-send-email-eric.devolder@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/erst.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 include/hw/acpi/erst.h

diff --git a/include/hw/acpi/erst.h b/include/hw/acpi/erst.h
new file mode 100644
index 0000000000..9d637179fe
--- /dev/null
+++ b/include/hw/acpi/erst.h
@@ -0,0 +1,19 @@
+/*
+ * ACPI Error Record Serialization Table, ERST, Implementation
+ *
+ * ACPI ERST introduced in ACPI 4.0, June 16, 2009.
+ * ACPI Platform Error Interfaces : Error Serialization
+ *
+ * Copyright (c) 2021 Oracle and/or its affiliates.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef HW_ACPI_ERST_H
+#define HW_ACPI_ERST_H
+
+void build_erst(GArray *table_data, BIOSLinker *linker, Object *erst_dev,
+                const char *oem_id, const char *oem_table_id);
+
+#define TYPE_ACPI_ERST "acpi-erst"
+
+#endif
-- 
MST


