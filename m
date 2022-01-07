Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A264876CC
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:50:43 +0100 (CET)
Received: from localhost ([::1]:51082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nla-00038H-EK
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:50:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n4G-00021A-0M
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n4D-0002bj-9B
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HOsqJqrBMIM1qexMOBxqQCQ/OVZSIyFbpDvHp5LI3u0=;
 b=Mlxc9ibKq4aXvsp1UPx1im2T9Z8HqfCgL88Q3O22ZiQU5c+2hl+LY3EA3R2BEDZ1h677aO
 83m9rLx4T895AHxurHHEimMzwivro6KzOFCVYKfdd3MK/+x/Sr2Z2xjO0OQ8z3xXcNKg9N
 iuaxx1Zt5z1G0H7izr+ir60iKfAkG0U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-0-2fg12YMUqoGkcDLMzfOQ-1; Fri, 07 Jan 2022 06:05:50 -0500
X-MC-Unique: 0-2fg12YMUqoGkcDLMzfOQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 q2-20020adfab02000000b001a3ed59eb96so2100619wrc.20
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:05:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HOsqJqrBMIM1qexMOBxqQCQ/OVZSIyFbpDvHp5LI3u0=;
 b=z9hVpAh19cq9oOat3FUr+t2LjqeJKEQL7qtHAhmEd0T0Y+eCssbjsjkl8l/Ywb4OvU
 wvG2GuGquy7NKe7C1yKl4c2NFbp3X+/QN9OiUhdttz3R3EcwzVFiV5vdkx9YdzvyScke
 5SazM3f0vyphnke/DZWyrLHq3mnYSaLr7XnES0ybHO1Py6lu4EwBoo0VjZjmKjmFEiE9
 i/o4SDZJHA2uOHnnCQcwHzsadAt16GWCExLvR6W44EeVesMIDtwVQ+3KMYVq8ugg9lDK
 C6Yi3qqVDgE6BwBGdVpbtQ42ACOWVMJZNvxKMclDiCSBlCfyo3O3yE83OKYW4UlTYk/O
 tIiQ==
X-Gm-Message-State: AOAM533rBu4ubQt9CaHKI492gjQfMNfR7zBMwHsemujoEy/ucVQ/k6l5
 8de4FJy/GNPX1QxL4FYJmPoIiWuzoQKVNXPXTUCjD6gGojf0j00J50dnTEWxZ5Z2WpcT+XT76gw
 AdgN3q8r6lman/pWuNLF+whzSIKNfBwgtHKCquvY8XScnnyGd/LpmHfp0GIWy
X-Received: by 2002:a05:6000:1886:: with SMTP id
 a6mr55414163wri.614.1641553549019; 
 Fri, 07 Jan 2022 03:05:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxaZH0bfhn22vbSn2E0wl+tTt22LFG4/guLqpF5EnUDKte/OtoFDrOt7+FGzE2mvLRZLl7wtQ==
X-Received: by 2002:a05:6000:1886:: with SMTP id
 a6mr55414140wri.614.1641553548836; 
 Fri, 07 Jan 2022 03:05:48 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id j13sm8315918wmq.11.2022.01.07.03.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:05:48 -0800 (PST)
Date: Fri, 7 Jan 2022 06:05:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 54/55] acpi: tpm: Add missing device identification objects
Message-ID: <20220107102526.39238-55-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Berger <stefanb@linux.ibm.com>

Add missing TPM device identification objects _STR and _UID. They will
appear as files 'description' and 'uid' under Linux sysfs.

Following inspection of sysfs entries for hardware TPMs we chose
uid '1'.

Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/708
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Shannon Zhao <shannon.zhaosl@gmail.com>
Message-id: 20211223022310.575496-3-stefanb@linux.ibm.com
Message-Id: <20220104175806.872996-3-stefanb@linux.ibm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/arm/virt-acpi-build.c | 1 +
 hw/i386/acpi-build.c     | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index d0f4867fdf..f2514ce77c 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -229,6 +229,7 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachineState *vms)
 
     Aml *dev = aml_device("TPM0");
     aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
+    aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device")));
     aml_append(dev, aml_name_decl("_UID", aml_int(0)));
 
     Aml *crs = aml_resource_template();
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 0234fe7588..ce823e8fcb 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1812,11 +1812,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
                     dev = aml_device("TPM");
                     aml_append(dev, aml_name_decl("_HID",
                                                   aml_string("MSFT0101")));
+                    aml_append(dev,
+                               aml_name_decl("_STR",
+                                             aml_string("TPM 2.0 Device")));
                 } else {
                     dev = aml_device("ISA.TPM");
                     aml_append(dev, aml_name_decl("_HID",
                                                   aml_eisaid("PNP0C31")));
                 }
+                aml_append(dev, aml_name_decl("_UID", aml_int(1)));
 
                 aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
                 crs = aml_resource_template();
@@ -1844,12 +1848,15 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     if (TPM_IS_CRB(tpm)) {
         dev = aml_device("TPM");
         aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
+        aml_append(dev, aml_name_decl("_STR",
+                                      aml_string("TPM 2.0 Device")));
         crs = aml_resource_template();
         aml_append(crs, aml_memory32_fixed(TPM_CRB_ADDR_BASE,
                                            TPM_CRB_ADDR_SIZE, AML_READ_WRITE));
         aml_append(dev, aml_name_decl("_CRS", crs));
 
         aml_append(dev, aml_name_decl("_STA", aml_int(0xf)));
+        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
 
         tpm_build_ppi_acpi(tpm, dev);
 
-- 
MST


