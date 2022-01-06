Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D5644865BD
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:02:59 +0100 (CET)
Received: from localhost ([::1]:53908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TM2-0003F6-N2
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:02:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5SfA-0005hb-NQ
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sf9-00015o-5g
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:18:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xrm8CIGRgPpnhTX6j94BNeJt2bCzqkKY9MsNy4P9oQo=;
 b=IuOslyxdPz2+ggLOizNnYUjgah65GTs1sZmlIeEhHkPBS/BB5bBUCpyuCjdxIyuC4V+KqH
 eOuNwbnNupbbggt6mcqNESqfA17OpduDG6aHEZBriob1SrVsc7oBqtVH1vcZdgZH2jSGBy
 O1JuwrWLZ/uqC0sQuzEaXgFfp+7Uuzs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-504-2eoWaVxtOGC2ENdDGGQilw-1; Thu, 06 Jan 2022 08:18:37 -0500
X-MC-Unique: 2eoWaVxtOGC2ENdDGGQilw-1
Received: by mail-ed1-f69.google.com with SMTP id
 d7-20020aa7ce07000000b003f84e9b9c2fso1936701edv.3
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:18:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xrm8CIGRgPpnhTX6j94BNeJt2bCzqkKY9MsNy4P9oQo=;
 b=BzlKVI/7bVWjDHy+/Y1n4Jly/2KdHAUXvFnB8JckmVh+qCocI5faK1lJKyzh0GIYAE
 va+2M5Ewytur6kdMrrnFFky9LfZsB3RpbgKM6Sw/HX9q8Y+exhT3z5BpZxjh8cyW7Z9w
 V3hfTsqQS3xOvI6o1VZXNM+sG2JPzYoW0aojW24Ss1FyCeZixzqIHBmSJuGBJ2je14NS
 uQkMaq5AbJJqAi4ZtCVADBp58lqot08ASqJCHCRuVrqzxP/e/pjooThiHEsgHNo9fbK+
 TEQS8c5H6nBdBw60rsxmptLnlV3Jz5e3OIJDhup4H0t4STLUKVyeRdtYupI19m1HgYg/
 wnXw==
X-Gm-Message-State: AOAM533ZDbparVpJlq1lSzJ7BW4EMfBMOO+wwNucvrv26I1cXgFwzr/c
 ucqxEEg7zcppnUxhSGJHXhX3MffLDjy3MfPqaDmF/AI4KWNeBJ5z0InwZrroF6EVPEKzPj26xUa
 eorlPH9m8liK7IIcQe5jVJVkD/jaqx/hTTtmUvMbn/SHibK3pRN/Y9PpbIkMV
X-Received: by 2002:a17:907:7289:: with SMTP id
 dt9mr37530517ejc.545.1641475116091; 
 Thu, 06 Jan 2022 05:18:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyO+/xtQynjQQ88wDSi0wD7OJFaS1QKkNrcOCrIiaCdyUJWwmvVGb467lpN7xPyICUWYi/lVQ==
X-Received: by 2002:a17:907:7289:: with SMTP id
 dt9mr37530497ejc.545.1641475115861; 
 Thu, 06 Jan 2022 05:18:35 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id f18sm178941edf.95.2022.01.06.05.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:18:35 -0800 (PST)
Date: Thu, 6 Jan 2022 08:18:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 47/52] acpihp: simplify acpi_pcihp_disable_root_bus
Message-ID: <20220106131534.423671-48-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
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


