Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B95D4880BC
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:56:07 +0100 (CET)
Received: from localhost ([::1]:49328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60xi-0002c9-LC
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:56:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60BU-00065C-D1
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:06:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n60BS-0002o7-1w
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:06:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xrm8CIGRgPpnhTX6j94BNeJt2bCzqkKY9MsNy4P9oQo=;
 b=cFh83wkJXx9RZ7o0Bvn6xQxTgN/9DksEUIfQqjWrukPvyoNgTbKpTQLWQUHr72coR4Xn8W
 4ZmkJzm187JLT7DBKSWrwG0SrSdQO1BnNy0YTCViEWKRRscpkfgwsySzo0sY/QcFpt1F/q
 kLFEBnOv4jk+TDWxJO07Z7FfZBmK7oI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35--Qf0-e7HOBeViLW1xCXS4g-1; Fri, 07 Jan 2022 20:06:12 -0500
X-MC-Unique: -Qf0-e7HOBeViLW1xCXS4g-1
Received: by mail-wm1-f71.google.com with SMTP id
 r2-20020a05600c35c200b00345c3b82b22so5652310wmq.0
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:06:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xrm8CIGRgPpnhTX6j94BNeJt2bCzqkKY9MsNy4P9oQo=;
 b=WZY2luXLo/w4guL6NOXob67liU88J4JDCU869YPk4vKGZKAPwcg18Q7wWKEbjhfKtV
 M6gU8i/2p0iGvSpxWe+n3zXfxMxV7NmkOBlfuEuIBGYNj7AUX8LaPycnotH8kf7q9VG9
 DaCjOvL+33rfkm1gJVQ74c0jZe9GodlQ3oM+yAfPUsRloi8jVbHqTCOdCZVS8LuGOFPB
 bPw+30JGJhzO5AK2GVEjowvE2ol3Hrx5XskeaAi9aqHM9YXYKXimBBfxqR7Tb0Kh19p3
 LxY1G42fAtp22OiE4K7zOT7bOdTrd3LbTdxi8HwmLwKPrC3Z3KgpdF4OtZNBICQsJzx7
 v9eg==
X-Gm-Message-State: AOAM5307K9KYDKvb2MAtigL8K65NsbDqTuo9wRU/QscwNurXmgRpmMlE
 htyylyNCjbRyZDCI07FKMb4/a5p+/S2zHPtntkuMFBM4p0a0EeTY+ijyuMWgsZechMRoHBck7Do
 91D178ou+G7Yy627CyA1NygEm+k/mkOTY9L4zKzjgcO8QsrV1dbDwLN1OIqaF
X-Received: by 2002:a05:600c:acf:: with SMTP id
 c15mr12572608wmr.7.1641603970927; 
 Fri, 07 Jan 2022 17:06:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwOAs0biBzIz1NhlWr2Z0JFys8BL+fSaAIt9tDZb5mU4HmYHdWmuf8aGuBPOAaMoVGEWxmosw==
X-Received: by 2002:a05:600c:acf:: with SMTP id
 c15mr12572597wmr.7.1641603970684; 
 Fri, 07 Jan 2022 17:06:10 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id k19sm231823wmo.29.2022.01.07.17.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:06:10 -0800 (PST)
Date: Fri, 7 Jan 2022 20:06:08 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 47/55] acpihp: simplify acpi_pcihp_disable_root_bus
Message-ID: <20220108003423.15830-48-mst@redhat.com>
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


