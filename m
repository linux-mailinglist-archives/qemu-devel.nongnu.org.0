Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 534572D49DC
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:13:57 +0100 (CET)
Received: from localhost ([::1]:36162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn4uS-00071E-4u
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:13:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3vq-0004oi-L1
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:11:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3vn-0000c0-Ce
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:11:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ss36U8za5czG2yM1M9Hh0SqAuQfgDaUEj+51fMZlZGs=;
 b=Dq9JrvnKzl1kUtr/Y0Mwx/GiXkVNeRwrSTGeIM7Sjt6k4sVRNUlbD8SxQp4H1BLPphCZ3O
 Z/JAVwAdfs5t6jTn/Fp1R0o/xNve4yveUbziVY6+Zq6eiJ6tKI+qepUdAzasumo67x8MDg
 FUceFj44XdR+fF5lQyW8VascK+CF+gw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-YOLExtHlNBWBf3d97M5pVw-1; Wed, 09 Dec 2020 13:11:11 -0500
X-MC-Unique: YOLExtHlNBWBf3d97M5pVw-1
Received: by mail-wr1-f72.google.com with SMTP id z6so953158wrl.7
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:11:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ss36U8za5czG2yM1M9Hh0SqAuQfgDaUEj+51fMZlZGs=;
 b=mQiM7kDu18r31naleON0L6sWa+NLs4sKTPD7ICdMeltQGnuuWvdSwpdMUDvHlINDn6
 XA2Q37x/zVjlN6XyyzsJUAki2VZNI+hIidJa8gHXIJJdBmKWLOP9EHRW5U6x+OHgHEXw
 +yZkcunUQHGjblWuTGEeBPhjwMnbAzRbHq92ss9XZ2CZHnfgpXAL1SvJbyRKZo4nkC5U
 Apb1v+IARZQnmmzCvyg7yEpkMVwavg5QE0D0Ry3tHkoorFz9XNCS1sTey6kHlvqnvtD8
 Rw/Tj8+S6kESDMPqcYRYpB8RpYdg8xK0GbKbO/DzAvSt5j5qdDoa5vknCfztY7Jqfbdo
 r14Q==
X-Gm-Message-State: AOAM533J417VafN0MPHOQStxHAoGDBiXPKcdijU4Sxi6y/H+f7WA0HWt
 4HVbfa9SvO7Cp0//mqLtWVW2rolccphY54ouDm/G9PuR4dFj7F9DZhHloOHWglH/0AvYq9ePxV0
 mSmD4mdhEwT9uG4WWpKIZBZhyFGl1gDT3nsCEbctA2rxQyGHs+0ZqtA/U/v7R
X-Received: by 2002:a1c:e2c2:: with SMTP id z185mr4222134wmg.49.1607537469791; 
 Wed, 09 Dec 2020 10:11:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYrYX3xJt/EhlC2XUxe33nyuJLfJnhVQGdEU3Ig70kvcydW+VEo1HnyXN3zk2n3NpZO0Ss4Q==
X-Received: by 2002:a1c:e2c2:: with SMTP id z185mr4222110wmg.49.1607537469645; 
 Wed, 09 Dec 2020 10:11:09 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id m4sm4644428wmi.41.2020.12.09.10.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:11:09 -0800 (PST)
Date: Wed, 9 Dec 2020 13:11:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 57/65] x86: acpi: introduce AcpiPmInfo::smi_on_cpu_unplug
Message-ID: <20201209180546.721296-58-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20201207140739.3829993-4-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 76e27f8fad..44c9da5112 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -96,6 +96,7 @@ typedef struct AcpiPmInfo {
     bool s4_disabled;
     bool pcihp_bridge_en;
     bool smi_on_cpuhp;
+    bool smi_on_cpu_unplug;
     bool pcihp_root_en;
     uint8_t s4_val;
     AcpiFadtData fadt;
@@ -197,6 +198,7 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
     pm->pcihp_io_base = 0;
     pm->pcihp_io_len = 0;
     pm->smi_on_cpuhp = false;
+    pm->smi_on_cpu_unplug = false;
 
     assert(obj);
     init_common_fadt_data(machine, obj, &pm->fadt);
@@ -220,6 +222,8 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
         pm->cpu_hp_io_base = ICH9_CPU_HOTPLUG_IO_BASE;
         pm->smi_on_cpuhp =
             !!(smi_features & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT));
+        pm->smi_on_cpu_unplug =
+            !!(smi_features & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT));
     }
 
     /* The above need not be conditional on machine type because the reset port
-- 
MST


