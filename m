Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF36C30CF9D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 00:06:46 +0100 (CET)
Received: from localhost ([::1]:41200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74kv-0006F6-Rk
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 18:06:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l74bJ-0005a5-K4
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:56:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1l74bF-0002K6-JR
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:56:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612306604;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=T83RMy2Gwje7YdzkCqa1OFUNA3HJsUqBur/2mRKIQ9Y=;
 b=dq6qi/mkVYMlOqkF/FnVX4kxP67m9vjZczkNVAhbofCqYkqIzVxNjUbE9VLqZ+SI+HhBFR
 +N7xU0Pv5wg2u6vnYeqAPiGwbe5s1PxYhtJHJE6zWLhg64sxrSsCcONCXRZskP5kL6EqbR
 dZW1WdraiuC9U9p//3wsbUOkIA2rqyA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-UxPtIBIUMMud2k_e5U79og-1; Tue, 02 Feb 2021 17:56:42 -0500
X-MC-Unique: UxPtIBIUMMud2k_e5U79og-1
Received: by mail-wm1-f69.google.com with SMTP id z188so2028185wme.1
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 14:56:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=T83RMy2Gwje7YdzkCqa1OFUNA3HJsUqBur/2mRKIQ9Y=;
 b=r7ElEhsh6ZgWA0w4yQwwPnXCbuqhqAeu0FmanrU6QFpf/1MZ5rNiO/TiMmsQhLThj4
 choWnvr5zl6OXzuCEpO4mk0L348PfzUQulLGa+DTWVxlkENAFmsHI63n3XRSAm/shHiv
 9n70/BXj0sYYkQtIHJiZfKkpuyU1jcWsKaUWyWuyxQ4ymCyc/IyJtOrKgCcv45zbkCEj
 Sn5Sh9cQ/rVqnB6Mm85WXlhJJeVnX0JJ+1opdsHQ2qweURWxbTXG/LsWw2mc4wIIpnvE
 W7257EQhBsLVGP1a6GTp2clTz2fOaKKn/vZ/NHg+Q/M45NYS78v13ScMzEy1TkpxARQG
 n1vw==
X-Gm-Message-State: AOAM5307Oh45zmqmfxEACkTShmCkh+oLld29D7Hf4vxGfkCLfmEqAffF
 zrGDEdpqjbNd8MTNRIJQbSm20RkDBd+muV/F9W6+I47jIRv61ACV3o43Ke1v1nP5kjxJJbSW0n7
 Qy8SuJjejWshqm5G15y+tamkao5TSFJB0jGKB+pws0FyuCwlvSe+gYDTPA235
X-Received: by 2002:a05:600c:4f50:: with SMTP id
 m16mr183907wmq.175.1612306601352; 
 Tue, 02 Feb 2021 14:56:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgrV+Np+Em18IkpBcUF1mwz8EoIOEPtv/owu1J680rbAW0uGcwA+fBzjfdOUh4eVKhFcd19w==
X-Received: by 2002:a05:600c:4f50:: with SMTP id
 m16mr183887wmq.175.1612306600967; 
 Tue, 02 Feb 2021 14:56:40 -0800 (PST)
Received: from redhat.com (bzq-79-177-39-148.red.bezeqint.net. [79.177.39.148])
 by smtp.gmail.com with ESMTPSA id h18sm98819wru.65.2021.02.02.14.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 14:56:40 -0800 (PST)
Date: Tue, 2 Feb 2021 17:56:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] acpi: use constants as strncpy limit
Message-ID: <20210202225636.1607306-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

gcc is not smart enough to figure out length was validated before use as
strncpy limit, resulting in this warning:

inlined from ‘virt_set_oem_table_id’ at ../../hw/arm/virt.c:2197:5:
/usr/include/aarch64-linux-gnu/bits/string_fortified.h:106:10: error:
‘__builtin_strncpy’ specified bound depends on the length of the
source argument [-Werror=stringop-overflow=]

Simplify things by using a constant limit instead.

Fixes: 97fc5d507fca ("acpi: Permit OEM ID and OEM table ID fields to be changed")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/arm/virt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ecb0e14816..f538194e32 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2107,7 +2107,7 @@ static void virt_set_oem_id(Object *obj, const char *value, Error **errp)
         return;
     }
 
-    strncpy(vms->oem_id, value, len + 1);
+    strncpy(vms->oem_id, value, 6);
 }
 
 static char *virt_get_oem_table_id(Object *obj, Error **errp)
@@ -2128,7 +2128,7 @@ static void virt_set_oem_table_id(Object *obj, const char *value,
                    "User specified oem-table-id value is bigger than 8 bytes in size");
         return;
     }
-    strncpy(vms->oem_table_id, value, len + 1);
+    strncpy(vms->oem_table_id, value, 8);
 }
 
 
-- 
MST


