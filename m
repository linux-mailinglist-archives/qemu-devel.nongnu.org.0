Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A2B486547
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:28:05 +0100 (CET)
Received: from localhost ([::1]:60878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5SoH-0007LB-02
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:28:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sd2-0003xv-C5
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:16:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sd0-0000l5-R1
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:16:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641474986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vpoC0+6a4IT38j+kX8wAPq8AuzqmXiw7PFqYGYauyfQ=;
 b=S7YkuYMRBEUzH7kXKzwTqeE/MegYkp8krvBpjAugAHlxdN1mS6CMx2koVQ9wA/16ugWfit
 CvO0NczN90oGEtMph2MmrR7QIDSRpOfJQ5+BltyjcmtWpFSf9/lBbuuegyl28JwBoxoqmo
 THtf4pLZWS9HcQuPs54i61w8olXZFcw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587--DIFZMgHOV2TBPSj29TJAA-1; Thu, 06 Jan 2022 08:16:25 -0500
X-MC-Unique: -DIFZMgHOV2TBPSj29TJAA-1
Received: by mail-wm1-f72.google.com with SMTP id
 k40-20020a05600c1ca800b00345bf554707so1927781wms.4
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:16:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vpoC0+6a4IT38j+kX8wAPq8AuzqmXiw7PFqYGYauyfQ=;
 b=MgkSSuabC3O24zs+Yw3unL9WdA6Bf7L6y3OJbDhs7O9mWbJr/lNeyuUzMAdxZhVidM
 uN/WJVUTBTAWQwBEvd/MrLboqLXCRQ4p3dR+xI6ZKIgIZk2o++NZoiP/aM18n1N+RTqA
 gRdG/xzmyl5lnjkVvYazPecgT0zpDq5E9kY/V4IuK/UUMJnz4xRF43ImBQlGb1DGoMkZ
 cVMbwVCaMFr/LisLqd0LQY42o9I1pVVs3z1meAoJPYiDIKn+FZ/+ONrBdUOHf70c2KVu
 4t5PNDLiRg22FHztJ2yXGoedstbs15mCl6gcTmxE+fVMHa5o3719dg/gEePMGAGLugcH
 ZDdg==
X-Gm-Message-State: AOAM533rHQl0rSXbBz2bEe68T+T6CzFF1i35sZoRngGWA6qt+/kWb60n
 wfvTFb+cryW13z/Bil1wn2kSliWCDjssWTkzNddVuUbFjQBUexaR5FP/JKmrn06LIRpNktD6rIY
 cj+65xGmXzPNs6cc1KajLEOFmvyg7pe+DmzKO8iB7KcLCUeLQuscisthK+x8t
X-Received: by 2002:a1c:2544:: with SMTP id l65mr7224494wml.101.1641474983611; 
 Thu, 06 Jan 2022 05:16:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTrLPJnOVzKwIGOTfW1jfGlrRpV0KZpsU3ibO6xuyDOVeFvZLWKvb/7tp2CMeo6l2YOLnK8w==
X-Received: by 2002:a1c:2544:: with SMTP id l65mr7224476wml.101.1641474983426; 
 Thu, 06 Jan 2022 05:16:23 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id m15sm2310762wrw.27.2022.01.06.05.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:16:23 -0800 (PST)
Date: Thu, 6 Jan 2022 08:16:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/52] acpi: validate hotplug selector on access
Message-ID: <20220106131534.423671-3-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When bus is looked up on a pci write, we didn't
validate that the lookup succeeded.
Fuzzers thus can trigger QEMU crash by dereferencing the NULL
bus pointer.

Fixes: b32bd763a1 ("pci: introduce acpi-index property for PCI device")
Fixes: CVE-2021-4158
Cc: "Igor Mammedov" <imammedo@redhat.com>
Fixes: https://gitlab.com/qemu-project/qemu/-/issues/770
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
---
 hw/acpi/pcihp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 30405b5113..a5e182dd3a 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -491,6 +491,9 @@ static void pci_write(void *opaque, hwaddr addr, uint64_t data,
         }
 
         bus = acpi_pcihp_find_hotplug_bus(s, s->hotplug_select);
+        if (!bus) {
+            break;
+        }
         QTAILQ_FOREACH_SAFE(kid, &bus->qbus.children, sibling, next) {
             Object *o = OBJECT(kid->child);
             PCIDevice *dev = PCI_DEVICE(o);
-- 
MST


