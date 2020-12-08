Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9AF2D3321
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:23:59 +0100 (CET)
Received: from localhost ([::1]:35968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjWg-00052x-Tc
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:23:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kminb-0007t0-IO
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:37:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kminZ-0005uJ-VP
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:37:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ss36U8za5czG2yM1M9Hh0SqAuQfgDaUEj+51fMZlZGs=;
 b=d2xpslLo4iqIEFfVRGwo31XtPcJ5gJpAInWOgkkEJp7abgzxZ87slKZXhF0IcJlECJrdsx
 05MA2QxNUc7g0FPyUVZLXmdQTyg8rDVc+BqiBcYsa6JVAwd25mWVVsUVTeyDZ1nJJc+lCQ
 TZCM/SD17rGjDWZ5vqIM7EruPVV0hnY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-906L-6uMMsW3CWEwttcJ6w-1; Tue, 08 Dec 2020 14:37:19 -0500
X-MC-Unique: 906L-6uMMsW3CWEwttcJ6w-1
Received: by mail-wr1-f69.google.com with SMTP id d2so2248246wrr.5
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:37:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ss36U8za5czG2yM1M9Hh0SqAuQfgDaUEj+51fMZlZGs=;
 b=KE8Dgh/psWBQI9PnnZcpCYkXdj1mKs16pjgjMcf92pWFRZHMwxYRFyw1RVQvN0lmdO
 eaeA5MNh9JcOJgp8Ad+nC6XfogwxgA8Ic3EEWUKdpGo9GkxJaYLgc57zp9mATDubwXJI
 4TofkP1mDfP/ie1wavPJ48S9E12MEYoOdnPIDFMyXCPWIiAiGWKQ3JAydxeulHzAJq3R
 JYNT3e1yTJKFdc2L2JeuI33eDt9DAVF4BjeQaz6kj9gV7iW/UzlarH6yplrq3r7hRAiH
 xvxsz606STz8M/BjKx+XNCOjP+MuVVn/2Pk9eHt8dEp/Z4Elm9PV/hoPQzU3TwYR3cgP
 Csbg==
X-Gm-Message-State: AOAM532YINIV2qfsMXjINXsVh4nv5iYoOQpcvWx4cQYCpEkWScxHxeon
 wW8hNYAO9ODvtUIQD7pdDbCEUqtb7eApZyE8CUwHvQz2GFOmtXOpZKZxUh5eshESnbFxkFDlTaA
 xNoxA7W723tjHTobOnNo7TDaXlvok268hjTisgV1gSm7zrs2z0zdsNQojDH14
X-Received: by 2002:adf:a29d:: with SMTP id s29mr8728426wra.329.1607456237919; 
 Tue, 08 Dec 2020 11:37:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxB1Tc3D2F+8zesojGiMEOv2dftHyuXv0lR/uTxGuAeMAXgKQ29EsFWKs9DX3s9X0jSCY9yg==
X-Received: by 2002:adf:a29d:: with SMTP id s29mr8728398wra.329.1607456237664; 
 Tue, 08 Dec 2020 11:37:17 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id z3sm16744817wrn.59.2020.12.08.11.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:37:17 -0800 (PST)
Date: Tue, 8 Dec 2020 14:37:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 58/66] x86: acpi: introduce AcpiPmInfo::smi_on_cpu_unplug
Message-ID: <20201208193307.646726-59-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


