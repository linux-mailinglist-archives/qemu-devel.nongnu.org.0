Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6E54D0BE0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 00:17:31 +0100 (CET)
Received: from localhost ([::1]:58414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMba-0004E9-IC
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 18:17:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7o-0000dY-G6
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM7n-0005kK-0u
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:46:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s3tpCVjYIOk1B/dIJbNsw4y7BbXatFeQMGgCwwa4oeU=;
 b=grmWu9r/mo7F8vZv3ezUuDu2lN4hL22eRhJyVMCMpJwfQz3qIdOAwAxTxwQ6uGKmQ8dNPD
 aoRxuOpbMeyi55LVBInyKBH3F2NfCfOBlcerltK1bVap+R8FOO4xQBCkOqrzKYl5PzDU0+
 aB7E3C7ohherUJm9tWVlJPaKG2AaJ/U=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-k5HAeMeDPSSiSXixhKfKhg-1; Mon, 07 Mar 2022 17:46:41 -0500
X-MC-Unique: k5HAeMeDPSSiSXixhKfKhg-1
Received: by mail-ed1-f69.google.com with SMTP id
 r8-20020aa7d588000000b00416438ed9a2so3005117edq.11
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:46:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=s3tpCVjYIOk1B/dIJbNsw4y7BbXatFeQMGgCwwa4oeU=;
 b=IWEfmolU0yd1hQN3wAwlPGAo46WXw8qytpL5mAWjMGh9APoTPK8bUGDS0lO/lSjoHS
 zL2obPCXGm7yME1HOM0qeJo4B1Y6sxPOBa0N6AOoTWS/aOqFXaa5S3Y7dyBQjtOQnLBH
 Wq9hiJUcSebLMfhUfKKbov3g5xkxoc143EnjXnW9/33gFq3B7+e+1aVqaNRhAI87Ug6H
 i30enMpC+8bQmwoBj6dSeo7ea3iu3UaMHdhxaANP1IOucq4lNL6hZt7Gg/X0/MJ5FmxD
 cg6v6SfRWhQdzfA8rJv22wCpJW1xfl6ixaaG3Eu6v+HhySzpE/dTih2Tb9SfYK/edK7K
 mGFA==
X-Gm-Message-State: AOAM532325vqWQuG1fa3HjYgOYEKY7HHAldFJj6QmfdYIdELXGHXfEJ1
 o0x2ReJEJJmAUZ5tQGhaQ1nKtlEJNtRGlA7CK8sXtUSnOZ5g0yozHoINU1/kdeNXDxk0UuqTU6L
 3gFnKQ3mpbCFTQlHD1UiWtUuf2GMCvV7XSR3LlLJ0OyE8XCp7U02w+dr7cy2L
X-Received: by 2002:a17:906:4cd8:b0:6db:372:c4ba with SMTP id
 q24-20020a1709064cd800b006db0372c4bamr9908011ejt.57.1646693199688; 
 Mon, 07 Mar 2022 14:46:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxnpFEqCoNMQifNSQGAfBKRQJhDw6aPNryS+mh4bAZnQWO2c3J4MZNdShv118l/6WByBhJIXA==
X-Received: by 2002:a17:906:4cd8:b0:6db:372:c4ba with SMTP id
 q24-20020a1709064cd800b006db0372c4bamr9907996ejt.57.1646693199407; 
 Mon, 07 Mar 2022 14:46:39 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 t4-20020a056402524400b00415b90801edsm6907557edd.57.2022.03.07.14.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:46:38 -0800 (PST)
Date: Mon, 7 Mar 2022 17:46:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 39/47] pci: drop COMPAT_PROP_PCP for 2.0 machine types
Message-ID: <20220307224357.682101-40-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
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
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

COMPAT_PROP_PCP is 'on' by default and it's used for turning
off PCP capability on PCIe slots for 2.0 machine types using
compat machinery.
Drop not needed compat glue as Q35 supports migration starting
from 2.4 machine types.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220222102504.3080104-1-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 32bf12421e..fd55fc725c 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -318,8 +318,6 @@ GlobalProperty pc_compat_2_0[] = {
     { "pci-serial-4x", "prog_if", "0" },
     { "virtio-net-pci", "guest_announce", "off" },
     { "ICH9-LPC", "memory-hotplug-support", "off" },
-    { "xio3130-downstream", COMPAT_PROP_PCP, "off" },
-    { "ioh3420", COMPAT_PROP_PCP, "off" },
 };
 const size_t pc_compat_2_0_len = G_N_ELEMENTS(pc_compat_2_0);
 
-- 
MST


