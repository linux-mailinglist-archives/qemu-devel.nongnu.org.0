Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 359584509D5
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 17:40:13 +0100 (CET)
Received: from localhost ([::1]:37200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmf1g-0004IQ-3v
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 11:40:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmezf-0001ce-Vn
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:38:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mmezd-0005CQ-PH
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:38:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636994284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/FAcbaSW6GFOcfG2P5xertmYz+uafNHyYCjbb8h1fSg=;
 b=hRjsoufxhdHvxD3GbMT8S/VdVKlO0bkExq0qMMvzMEdoLYQe3pAXJN8qA8oBMPCFYtvc4i
 jiy6S7joyzag8SpR9H0mlhx9nDpAyYSNqHLzJhbG4oDne5UhGP8G6B+/Hd4X2LAsEnjvXD
 sub02ZPv7IhhjtHl0cids3nsNVqf3rI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-K1bUsC8KM6WSUcEwK0WR-w-1; Mon, 15 Nov 2021 11:38:02 -0500
X-MC-Unique: K1bUsC8KM6WSUcEwK0WR-w-1
Received: by mail-ed1-f72.google.com with SMTP id
 a3-20020a05640213c300b003e7d12bb925so2096985edx.9
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 08:38:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/FAcbaSW6GFOcfG2P5xertmYz+uafNHyYCjbb8h1fSg=;
 b=KDrNZLuHfdhn8FYKYY+NkWKa5WGzfdQuTK9DQ454SBg88pNeMBLg/718cBnI04qSoF
 qCkDNDgw/FxgyFa32XQA32Cms5y3Ac5mOPAd6xvWfVf3DZtgu3ClouAagYzkzoOvgAyM
 sX6/aF8IecIFRzlJD2lDBXTPghjklrUeYavtjTyJxGjV2Lbgn2udWJFKrFxy9aijQJ6i
 E3MgCInNLSzD24s8b6604UklD5q4qdyDDVE5p6VrcpPFEjOdclSpiL2vqVmPt4iJRxY2
 vuW5pOTCTfU4Wj7U9vIq2CrMMeOdzuvE2kUgJFxjcP4OnhJ/MYT59J5eGV2FVmrby3uR
 oKxA==
X-Gm-Message-State: AOAM530HBs7BgbdlUm4UKu4LkcLdLm+UzFvxi/ela8mIsigr2S1VgGGX
 h/1FWMHgT1zmmgmsUfJjgYSEbiBnZuWVFla1H7mohBuWD4ZKTel+5soEG4mUC74xtwDWK872/t8
 +yIbbJh6AFmgzLUMRKaj9nBZ2JPL/SGIhbc1RdKXRY0xGQDXbaPGnBH+nVWSC
X-Received: by 2002:a05:6402:3586:: with SMTP id
 y6mr25927edc.332.1636994281204; 
 Mon, 15 Nov 2021 08:38:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9YO6sfLqUBP3kvqvyAv7KGFcRyDUKpr0ZltASU09I+o0bxq9hZiLdEgG0my0PC55ClkCeaw==
X-Received: by 2002:a05:6402:3586:: with SMTP id
 y6mr25891edc.332.1636994281038; 
 Mon, 15 Nov 2021 08:38:01 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:9a71:d0b:1947:b534:3230])
 by smtp.gmail.com with ESMTPSA id k9sm7701229edo.87.2021.11.15.08.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 08:38:00 -0800 (PST)
Date: Mon, 15 Nov 2021 11:37:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/20] pcie: rename 'native-hotplug' to 'x-native-hotplug'
Message-ID: <20211115163607.177432-7-mst@redhat.com>
References: <20211115163607.177432-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211115163607.177432-1-mst@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Mark property as experimental/internal adding 'x-' prefix.

Property was introduced in 6.1 and it should have provided
ability to turn on native PCIE hotplug on port even when
ACPI PCI hotplug is in use is user explicitly sets property
on CLI. However that never worked since slot is wired to
ACPI hotplug controller.
Another non-intended usecase: disable native hotplug on slot
when APCI based hotplug is disabled, which works but slot has
'hotplug' property for this taks.

It should be relatively safe to rename it to experimental
as no users should exist for it and given that the property
is broken we don't really want to leave it around for much
longer lest users start using it.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20211112110857.3116853-2-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc_q35.c   | 2 +-
 hw/pci/pcie_port.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 797e09500b..fc34b905ee 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -243,7 +243,7 @@ static void pc_q35_init(MachineState *machine)
                                           NULL);
 
     if (acpi_pcihp) {
-        object_register_sugar_prop(TYPE_PCIE_SLOT, "native-hotplug",
+        object_register_sugar_prop(TYPE_PCIE_SLOT, "x-native-hotplug",
                                    "false", true);
     }
 
diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
index da850e8dde..e95c1e5519 100644
--- a/hw/pci/pcie_port.c
+++ b/hw/pci/pcie_port.c
@@ -148,7 +148,7 @@ static Property pcie_slot_props[] = {
     DEFINE_PROP_UINT8("chassis", PCIESlot, chassis, 0),
     DEFINE_PROP_UINT16("slot", PCIESlot, slot, 0),
     DEFINE_PROP_BOOL("hotplug", PCIESlot, hotplug, true),
-    DEFINE_PROP_BOOL("native-hotplug", PCIESlot, native_hotplug, true),
+    DEFINE_PROP_BOOL("x-native-hotplug", PCIESlot, native_hotplug, true),
     DEFINE_PROP_END_OF_LIST()
 };
 
-- 
MST


