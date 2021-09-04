Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7858400D28
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:44:04 +0200 (CEST)
Received: from localhost ([::1]:59752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdSF-0006jD-Op
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdKz-0004pk-8Y
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdKw-00010c-PI
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6c4pKbq4HffI/CB8k5O6YlmR6P/++9oBvmvZgdDQscQ=;
 b=M6K0uxd7dzMyNXDWHbQnMtHcteXy2rT2fAXDPP1E1EBXzBLgHYKYgH4tAkSMG3Z/GdBFna
 s89eI5Ly9Ehz5tYxIcZ0MdA7Edi6WOVqTFET0j4wZJkGRbpWXGIvoBqIc4q0pd1f/g5urQ
 RLdU5W3OHbv+22T8tahY7FYu3ncvZ4A=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-VmE7g7qxOquHM9Q7M46r8A-1; Sat, 04 Sep 2021 17:36:29 -0400
X-MC-Unique: VmE7g7qxOquHM9Q7M46r8A-1
Received: by mail-ed1-f69.google.com with SMTP id
 h4-20020aa7c604000000b003c423efb7efso1491047edq.12
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6c4pKbq4HffI/CB8k5O6YlmR6P/++9oBvmvZgdDQscQ=;
 b=TyMyR5FKiCK0ROr2FAPTMKIjuJdX81g4yck4a3Xu/d/0ykYP7C3Bny+CIDGM0Zip8x
 wotqAqOiW1zfY2j6ksyi/4bBHU9rxANWWZYX1Y6kH56XkvYGRo8iM1FfJtzpLSvi4zlQ
 5wYgmRqEsXsvAuK8TWpvvxqmKIQjJ0XHIUhcrcgAv4gAxD9lxmuUVT8Dx+kcLc5IqDmx
 y9SNvkh76U2kbm6D87TohQBMg4owbVRgNPzRJwGcMaP5/owMhrrjVA2OQ2ADDD7B6JPV
 +7PZJprt4assK+aVzG8gg7qq9a9A3Tdv6fo4AEbAd1DqXd4kyA7QdnwE2qd9ED07zXkB
 bT5Q==
X-Gm-Message-State: AOAM533RIjMgFb9riYXk78wKCGHsvYmwtkBN3hyJ+4mWICj8tlSW9wNH
 evkH2BZePthCuvK/XEZIiDWMDDR++MjvJ9/79F2xYjbc4/G/2+PBIwGopeZ+XA5WQZ9E+EKFhJN
 KchFvy602VqrgH2T6/LhAvtlCVc6ncOtJFwb1BLSUIIkiWQKIzBPO2Jf/lYF6
X-Received: by 2002:a05:6402:35cd:: with SMTP id
 z13mr993858edc.13.1630791387476; 
 Sat, 04 Sep 2021 14:36:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgtxc5I37gKa9byopvmEIIOV32oXoGiDlGwQz65pfKsdKjaTSRkptIC+At6wB+kiMBGX/igw==
X-Received: by 2002:a05:6402:35cd:: with SMTP id
 z13mr993838edc.13.1630791387277; 
 Sat, 04 Sep 2021 14:36:27 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id h2sm1929515edd.43.2021.09.04.14.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:36:26 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:36:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/35] Use PCI_HOST_BRIDGE macro
Message-ID: <20210904213506.486886-11-mst@redhat.com>
References: <20210904213506.486886-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

OBJECT_CHECK(PciHostState, ..., TYPE_PCI_HOST_BRIDGE) is exactly
what the PCI_HOST_BRIDGE macro does.  We can just use the macro
instead of using OBJECT_CHECK manually.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20210805193431.307761-7-ehabkost@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 8 ++------
 hw/pci-host/i440fx.c | 4 +---
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 6c27e12e2a..9a9572cadb 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -303,13 +303,9 @@ Object *acpi_get_i386_pci_host(void)
 {
     PCIHostState *host;
 
-    host = OBJECT_CHECK(PCIHostState,
-                        object_resolve_path("/machine/i440fx", NULL),
-                        TYPE_PCI_HOST_BRIDGE);
+    host = PCI_HOST_BRIDGE(object_resolve_path("/machine/i440fx", NULL));
     if (!host) {
-        host = OBJECT_CHECK(PCIHostState,
-                            object_resolve_path("/machine/q35", NULL),
-                            TYPE_PCI_HOST_BRIDGE);
+        host = PCI_HOST_BRIDGE(object_resolve_path("/machine/q35", NULL));
     }
 
     return OBJECT(host);
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index 28c9bae899..cd87e21a9b 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -316,9 +316,7 @@ PCIBus *i440fx_init(const char *host_type, const char *pci_type,
 
 PCIBus *find_i440fx(void)
 {
-    PCIHostState *s = OBJECT_CHECK(PCIHostState,
-                                   object_resolve_path("/machine/i440fx", NULL),
-                                   TYPE_PCI_HOST_BRIDGE);
+    PCIHostState *s = PCI_HOST_BRIDGE(object_resolve_path("/machine/i440fx", NULL));
     return s ? s->bus : NULL;
 }
 
-- 
MST


