Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F6D422E36
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:43:55 +0200 (CEST)
Received: from localhost ([::1]:55272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXnXm-0005Ro-HA
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmut-0001oS-9n
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:03:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmul-0006eW-4h
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:03:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iAzL/wufk6tcA8Ix7aJbETc2s1jG6V3MD8hzC48k5Dg=;
 b=X3hl3V7SiX5jT8tWONHAxinVmwXXVV4PiyBilzocCcjgldNaNfLwzE4/3tQCc1HQRZ9FeH
 nBhqzCPDbtyplOZFVm0xuM/4EBBqTUKPRUYCPVOzOSPe8iJxHGamsD9Vxttr3aEUW4/OIo
 hkUBpMtZvEYdh844dFUBm+X58q6hiuc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-0xmcUa5wO9qA63Wao4wXxA-1; Tue, 05 Oct 2021 12:03:33 -0400
X-MC-Unique: 0xmcUa5wO9qA63Wao4wXxA-1
Received: by mail-wr1-f70.google.com with SMTP id
 k2-20020adff5c2000000b00160b12639a5so1699105wrp.3
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iAzL/wufk6tcA8Ix7aJbETc2s1jG6V3MD8hzC48k5Dg=;
 b=ACL2qbbpqZm6C5KnO2KuX8yW2EoNsyKkUCFCOJzpx7su4Rs6hE+AtpgzuPnrbmJKk0
 lbi/N/6kRGdlZjw9McuanTJpbBcMIa5DyFbCm56ctw0hRi6UVvuUODdkE2tzBRCxCRx1
 41+nYhw7CtvXAgt7JECg73hn5XjXcxhrwEfDezwDoXr+/XK+E6rY3Ho2ijte5BZQA4af
 zjEexFDj+a40lIH+5fFE1JAnYyxU5ttJhCU1OAnnErDBDfawZIkO5nfT3kUVMyx2yfqT
 tIgCdBJ2p+S2BKafkEtRgQXcKVa5W/uH/ma5I5zJLiBFe8VyZos41mVmRUdG0fWo/+OH
 b6qA==
X-Gm-Message-State: AOAM532pZdShDdJWLsDH8smLUeTcUwnfEydZgWkqeB8uFTb2NxuBI4J5
 DZ7AEbzLz/xleopG+8aqg2/61teHyIVxcWZW1GnvfyLTadpjRZa42Ka5/84zuHcVqd4gMt4Vlnc
 fhEaidi/4hbT0h9+WolWpzb47z2CkrwvQJ2CYe2rU41mhYqgZaaO0xC26H0Pn
X-Received: by 2002:adf:df91:: with SMTP id z17mr11461007wrl.434.1633449811917; 
 Tue, 05 Oct 2021 09:03:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4QxjQWuyC7Zu19s7u18PO86E+Fdzxvw+yvF+6tZ2plajyQlWdLGMoCEeP2SdzAyFzWK8MCg==
X-Received: by 2002:adf:df91:: with SMTP id z17mr11460968wrl.434.1633449811659; 
 Tue, 05 Oct 2021 09:03:31 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id s24sm2169566wmh.34.2021.10.05.09.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:03:31 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:03:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 36/57] acpi: x86: remove dead code
Message-ID: <20211005155946.513818-37-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eric Auger <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-23-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/acpi-defs.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index c7fa5caa06..af4fa412a5 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -163,19 +163,6 @@ struct AcpiFacsDescriptorRev1 {
 } QEMU_PACKED;
 typedef struct AcpiFacsDescriptorRev1 AcpiFacsDescriptorRev1;
 
-/*
- * Differentiated System Description Table (DSDT)
- */
-
-/*
- * MADT values and structures
- */
-
-/* Values for MADT PCATCompat */
-
-#define ACPI_DUAL_PIC                0
-#define ACPI_MULTIPLE_APIC           1
-
 /* Values for Type in APIC sub-headers */
 
 #define ACPI_APIC_PROCESSOR          0
-- 
MST


