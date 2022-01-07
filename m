Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CF54876A4
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:39:52 +0100 (CET)
Received: from localhost ([::1]:52546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nb5-00086V-Lu
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:39:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n41-0001Vl-N5
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n3y-0002MP-Ls
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:05:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xrm8CIGRgPpnhTX6j94BNeJt2bCzqkKY9MsNy4P9oQo=;
 b=hL0y1oIPhvigiCZXjBODvbqaVpnEg6ACPR2HbMlqKpNfCUv6ogO0n5dn6S45a6UmPLM7ns
 vXOfv2J+k+BxYR1A04EfleA62LFnQzJAd+k4ULidfwkTNp+EhUqSzaAnkzDnRYz84lB4LA
 oZbuN5ooJ2zn7IfgrVh+XMDp2T1c4rI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-547-uBXthJy6OvmCymVJNlmc1Q-1; Fri, 07 Jan 2022 06:05:30 -0500
X-MC-Unique: uBXthJy6OvmCymVJNlmc1Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 az9-20020a05600c600900b0034692565ca8so3458632wmb.9
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:05:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xrm8CIGRgPpnhTX6j94BNeJt2bCzqkKY9MsNy4P9oQo=;
 b=n6To4bp8M29m/tHIxPryxJrujL7tMqxkypAxKZ8r2uRkF5tA2j1tpMjfCkvxlyE9ue
 0Kg4W5NqwiCRFvEoKno5orGcgKIHAzM4G2Ecs+M8FI2Dtxo4ICXKX/WnNyGtFC3Om+al
 NqBDJWRo9/E6nbGdWZ6hokHPet0wYNb7M4i7iz04b6hMOlOQ+Oeyt7aXqmm9Y+MuDIsr
 8RHB/cv/JuxllYQqyLf5LumSSsYqYmk9U5UkqHy3wcEwx07VKJomboLOa7tQcgkA3oVZ
 0rstAXfPURkdk3iiQ7yaUp23t9g1VD5qZhoEd+9nEG1KrlyS+8XWlszbsypqtASyr0lY
 QsmQ==
X-Gm-Message-State: AOAM532Eg6W4ZOV2Xy1WRsHeHywAKs4MixSaq2uxi5GnlAjjGnrCxXwn
 HKGMC/ndL+IoyWFi9N5i1nCtARFw8IWKjc72i08Hkhl68MzmxNKqd7qCpfNIK/ExI1sJsd4FbKB
 zaVG2IgLqnrRqJwpxYNWFeTrxvJI38d5vgghU5YMJpGsp/hGX1a4YWBvhq6X6
X-Received: by 2002:a5d:59af:: with SMTP id p15mr53775807wrr.237.1641553528957; 
 Fri, 07 Jan 2022 03:05:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8wkk13gQFw6fCfBRv9N+vVS7zXQYf+RfYUTtNMpTaXHg1kRpJg6RyD3Yyse9XvM5euW5XRA==
X-Received: by 2002:a5d:59af:: with SMTP id p15mr53775791wrr.237.1641553528707; 
 Fri, 07 Jan 2022 03:05:28 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id 14sm4734920wry.23.2022.01.07.03.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:05:28 -0800 (PST)
Date: Fri, 7 Jan 2022 06:05:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 47/55] acpihp: simplify acpi_pcihp_disable_root_bus
Message-ID: <20220107102526.39238-48-mst@redhat.com>
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
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <ani@anisinha.ca>

Get rid of the static variable that keeps track of whether hotplug has been
disabled on the root pci bus. Simply use qbus_is_hotpluggable() api to
perform the same check. This eliminates additional if conditional and
simplifies the function.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <1640764674-7784-1-git-send-email-ani@anirban.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/pcihp.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index a5e182dd3a..6befd23e16 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -128,20 +128,15 @@ static void acpi_set_pci_info(void)
 
 static void acpi_pcihp_disable_root_bus(void)
 {
-    static bool root_hp_disabled;
     Object *host = acpi_get_i386_pci_host();
     PCIBus *bus;
 
-    if (root_hp_disabled) {
-        return;
-    }
-
     bus = PCI_HOST_BRIDGE(host)->bus;
-    if (bus) {
+    if (bus && qbus_is_hotpluggable(BUS(bus))) {
         /* setting the hotplug handler to NULL makes the bus non-hotpluggable */
         qbus_set_hotplug_handler(BUS(bus), NULL);
     }
-    root_hp_disabled = true;
+
     return;
 }
 
-- 
MST


