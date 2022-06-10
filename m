Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B05C5462AB
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 11:43:25 +0200 (CEST)
Received: from localhost ([::1]:53644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzbAp-0004D6-TM
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 05:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXe-0001dQ-G3
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:58:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZXd-0006Lb-1b
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:58:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zi1f1xIZDpfajJzSX/eZblV3mOswJWDLXbmw9h13TIA=;
 b=VJTR/wigLsjGSRfMGzyx5hu7xUo8Cdyxvr928jEPrskge2erkmq5kANp1laH/+dXuszLyr
 YJ3T+58Gl5ihp+POb/8FvLV/nyet877pWVXYPJdH7yDdOdpBux0HQskswleYmMWX0v6rHM
 lhuYtB8So2syFuo+VSthjog3hl6zYmo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-lkjOZ3i2OPes8qthshJL-Q-1; Fri, 10 Jun 2022 03:58:40 -0400
X-MC-Unique: lkjOZ3i2OPes8qthshJL-Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so978350wmj.0
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zi1f1xIZDpfajJzSX/eZblV3mOswJWDLXbmw9h13TIA=;
 b=d1lUEutKtlxanXAJoFGixF0ehncxMApuYD84LhfgQ99YVYEp+GxrtOypU+brSAvRIN
 aQZmRrV26YFCq/jViB0k9OOo9nnm+E4JjJgOhaVE+9ivcbvytexUHgqu5YPV82po3hUJ
 QEifvUm8FCoXgJe17bj1L4FrrQ26Sy7tvdNK71Va8gBSFEZ27PdfIh4VNF2PYdlg87O6
 Ahsm+uFMIYu691y9KS6Y5nU+XxWt7sX2OFr8RdnJqc6cccsgHglxZoNnkp+SopegXK9X
 amlWr8FUld6RwZUGg2ooO30ony5ejjemi9PQbOqcyMMZJ80g0A/WFbQC1P9Mh9utPCpZ
 N+Cw==
X-Gm-Message-State: AOAM530gNXHK6sY4u7usW8MA+dByl9ix1ZGYaJIRUvso1GGfv+JPTfCS
 Ox0Gn7Fwa4bPpPVL1qDXR+JgHbXMYu7lqcSMBosqfy2MH1Od4sIrG8YVdifSd8hfT/eqgqg0dnQ
 mKtcos9tO77dJzOlbIiL4Y9avS+xP773ocGdHwHD76r8J4RYJdHFhrwThJ13J
X-Received: by 2002:adf:e3cf:0:b0:219:e523:905f with SMTP id
 k15-20020adfe3cf000000b00219e523905fmr2683099wrm.240.1654847918813; 
 Fri, 10 Jun 2022 00:58:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJN8A/BbUEYP0+J0aGTl17UrcLBFZ3NOQPKmXfY6hJzXlsnlN8Uqe1OwyQqTbmN/chNU+kPw==
X-Received: by 2002:adf:e3cf:0:b0:219:e523:905f with SMTP id
 k15-20020adfe3cf000000b00219e523905fmr2683079wrm.240.1654847918598; 
 Fri, 10 Jun 2022 00:58:38 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 h7-20020a7bc927000000b0039740903c39sm2067545wml.7.2022.06.10.00.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:58:38 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:58:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 32/54] acpi: pc/q35: remove not needed 'if' condition on pci bus
Message-ID: <20220610075631.367501-33-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20220608135340.3304695-33-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 6b496480d2..1204b6da05 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -1797,16 +1797,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
 
     sb_scope = aml_scope("\\_SB");
     {
-        Object *pci_host;
-        PCIBus *bus = NULL;
-
-        pci_host = acpi_get_i386_pci_host();
+        Object *pci_host = acpi_get_i386_pci_host();
 
         if (pci_host) {
-            bus = PCI_HOST_BRIDGE(pci_host)->bus;
-        }
-
-        if (bus) {
+            PCIBus *bus = PCI_HOST_BRIDGE(pci_host)->bus;
             Aml *scope = aml_scope("PCI0");
             /* Scan all PCI buses. Generate tables to support hotplug. */
             build_append_pci_bus_devices(scope, bus, pm->pcihp_bridge_en);
-- 
MST


