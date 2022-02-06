Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5A04AAEB7
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 10:57:45 +0100 (CET)
Received: from localhost ([::1]:51374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGeIi-00053O-DX
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 04:57:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGe0E-0000dJ-Kk
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48290)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGe0C-0003ih-O2
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644140316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dqIW4HOXDQJl70JpvdUs1dPT+8Qw8RjLjhx0buPuD7M=;
 b=BpRWvCPfzutWBmRzTLI4eufKGeMbkghveMxHUr+9QBAhPpPrckw4zsL1UallhnH6ry0HbP
 nA2V1XPolmYYDcfMNZwE2cMJ1n2QLF5bYRTINme5VlU/PgJPectYzAZJRWePwGHtyqZ4E3
 XQ5o+KgsnjkpFME1lMcXCjp7RKFQn4E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-0MHdMMGMNhCUXofGYt3zhw-1; Sun, 06 Feb 2022 04:38:35 -0500
X-MC-Unique: 0MHdMMGMNhCUXofGYt3zhw-1
Received: by mail-wm1-f71.google.com with SMTP id
 c7-20020a1c3507000000b0034a0dfc86aaso10239449wma.6
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 01:38:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dqIW4HOXDQJl70JpvdUs1dPT+8Qw8RjLjhx0buPuD7M=;
 b=yT60NTTjtP6/4jyMzq8LAK02gsXAlyRGfvDVQrLcQespelXYPsoLVY4y1YsYvsU8lU
 PSmiSuXBNJjCj+W+HCRrcyV6f4bvUUgSgxQmESbCiXvEs4rvfOvq2uhBNK6SSHASppXl
 Pi/j4dr+oeb27hN2dcK56pTAKceug4oFidyoWa4YW4a4SI3E6PdMSirZDaqZqh7rsheJ
 0R8GdGmIfc7JLVaDKVRaOoHmUTsIiRx8DtLwmj3TnqiKvFJF4603A2d8NjKGAjjeY3ns
 tD+YhFtA+UtSg9nENjG2Wo1UzPidVaH6f4LyjKCmNuSzlvq7S4HwdBmIguvDftDaXqe1
 pe7g==
X-Gm-Message-State: AOAM530CzTAM07CQcOi6vTjkcHffEPeiyAI8oi5JA3H9Q9b5eIUEz6jO
 Y3bZQed2RYMgexILjRVvgtNC5jQceqS/fM5x1d7Ty6fpAhdvlw9jq+VyfnKwiG1oKDG3BNhvpvi
 07ilDFJSxxONWt0HJ/hFECz6mQjvy4VmePRWaFVAl56PagJp5cW+y9GzqeC4Z
X-Received: by 2002:a05:600c:646:: with SMTP id p6mr6411976wmm.3.1644140313779; 
 Sun, 06 Feb 2022 01:38:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxY7za4wVg3S8pE3unnGO2o5szTepoT4yRPRt58sCaZuVdTYyuyu2EQgkCFLen+yTee2N4eMw==
X-Received: by 2002:a05:600c:646:: with SMTP id p6mr6411957wmm.3.1644140313519; 
 Sun, 06 Feb 2022 01:38:33 -0800 (PST)
Received: from redhat.com ([2.52.12.81])
 by smtp.gmail.com with ESMTPSA id f16sm6846640wmg.28.2022.02.06.01.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:38:33 -0800 (PST)
Date: Sun, 6 Feb 2022 04:38:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 17/24] ACPI ERST: header file for ERST
Message-ID: <20220206093702.1282676-18-mst@redhat.com>
References: <20220206093702.1282676-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220206093702.1282676-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


