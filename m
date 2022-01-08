Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6A74880D9
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 03:12:18 +0100 (CET)
Received: from localhost ([::1]:55916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n61DN-0002DK-5f
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 21:12:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Bs-0006z1-Gp
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:06:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60Bq-0002vh-RV
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:06:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HOsqJqrBMIM1qexMOBxqQCQ/OVZSIyFbpDvHp5LI3u0=;
 b=FmgDMssBEqtyobuXvJziETPDt3I1yPSAF0X8CUj3HK7yxSxPOjfWYGQIeZ31223EgNvunI
 V295/Mgp4d3yM+6tOisSZtDX70Q0TqhvXgiEwGP0B/E/ETHhnewEtP5hE7EEWCp4hNS6Gv
 nh3AcEWel8d1MNKEy0l+0DwH74XDiZA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-435-YGk9LFVYOUW0BrvdQ9sDsw-1; Fri, 07 Jan 2022 20:06:37 -0500
X-MC-Unique: YGk9LFVYOUW0BrvdQ9sDsw-1
Received: by mail-wm1-f70.google.com with SMTP id
 m9-20020a05600c4f4900b0034644da3525so2501803wmq.3
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:06:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HOsqJqrBMIM1qexMOBxqQCQ/OVZSIyFbpDvHp5LI3u0=;
 b=19ENNNHKArEoZO8Dvp9EuwBc5SM7YwWRPdfvyZHgZOlLU9EUrXnupioO3ssDOwllNX
 zSJUwpkU1IFl5dlxo6+b53ARN0ORZjUkcvtAuVnVs10So87ygWHS0SUb1itYd6oxFrjS
 SDkbcmetOwYEoNIMGSzrGVHsz6L4k5e4uz9/jUz8tbs/p7SkhM655IVMfBmsYBmU2z0/
 8JtV/WgG76aLOFMaXMbG8MtpWRicmQ8KicnASTk83XPfNPxBjwIRrnKgEhh+BTZYAgj0
 wPTfBNPOfEXH7aTGtO6hIruOCPKC1nr/wnnEY6L5ohGgoddI39u/DuD+KGDqSoLaGtDS
 Hjnw==
X-Gm-Message-State: AOAM532coX15yPSyqTpymNX9qPSnu/nwT4gRZrDAPfjvU2Wrft9nu+fy
 6vl7JcTzpqN3576XFgPhuM49FtTP2ANVfnAz9/cjKDV5iVAMmjRmOt6CvPbMQWawYBfOGq1/n+3
 FGvSMtkcJ21VSwPubqbYATezkA0EXq1t6LoYV4sbrL2b5mfh3suIxQvhmcoz/
X-Received: by 2002:a05:6000:1aca:: with SMTP id
 i10mr55671501wry.453.1641603995948; 
 Fri, 07 Jan 2022 17:06:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwO7ZFqPFzEnNkZjPNfNL2UDazThdvGYegZDujTvIlWc/kILOtyFP622Iy1XV+hlk0JxgugRg==
X-Received: by 2002:a05:6000:1aca:: with SMTP id
 i10mr55671480wry.453.1641603995785; 
 Fri, 07 Jan 2022 17:06:35 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id n12sm246231wrf.29.2022.01.07.17.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:06:35 -0800 (PST)
Date: Fri, 7 Jan 2022 20:06:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 54/55] acpi: tpm: Add missing device identification objects
Message-ID: <20220108003423.15830-55-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
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


