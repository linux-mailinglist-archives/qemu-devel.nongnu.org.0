Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B7F400D1C
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:38:15 +0200 (CEST)
Received: from localhost ([::1]:35338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdMc-0006y5-Ko
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdKj-0003sf-1g
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdKh-0000qV-EY
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nhVlr8z9JFFPqYkwW9X45ltc35AYn16o3eufQ5sbAy0=;
 b=iD4xyiUJZHZBAZ3rYcFu29+EPOi1jZzT0XBtUHs41qaBU4Mz6lljOE6MPY6bcZG/iPIoYF
 GBN52CMcASxQOlceD2mAyfIeKM7aRtgs+j0XeEB+ZDGhjxO8CxicA8spuX43qH5T3eTYvs
 /Jc+N+4qEGpqmid5pd+XfrlayvoT+NA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-0QDGEXOjPNGGQNu-PYboNw-1; Sat, 04 Sep 2021 17:36:13 -0400
X-MC-Unique: 0QDGEXOjPNGGQNu-PYboNw-1
Received: by mail-ed1-f70.google.com with SMTP id
 y19-20020a056402441300b003cd8ce2b987so1499933eda.6
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nhVlr8z9JFFPqYkwW9X45ltc35AYn16o3eufQ5sbAy0=;
 b=LQZ0vSuJurbWe/UVIR0Cbsa6jZ9DWb3Nri/1xgRUT2pwmQNvZk9G9ppRVjkEI/mGSF
 i04h+0xm0Ru8O8+fyOgr2s0YxKYVZF4zoBeO8RWH9J31NqciE28n7/VvnPtwkVn+kS6q
 8EqMuTQxgq3ODkgjR5GVKdmiEs9Tf4oR7Vn7qsErx1B8mfVKjuJcAbA6YnSsGM5tmomw
 h52DHMpgYL7/jIfAgQdpf0zjfYyNXE66OP7nu1VTtmxM92v0RcRJogN438wHxxL4fEMn
 bBEwwFAYDZuUSVmbwMtkqfcoj7Hx++V2iFsDlh5VdtzOzsKuREXXvewnV4+jGbzWm7mZ
 k8EQ==
X-Gm-Message-State: AOAM5320qEW3MeurEi/xw5tcKX0eWxC16Y6xy7fa8FndhYfC9epRdgnH
 IbyaVk2yZB5a0BIl2dem4ASa6WAgL/s+byhVuudM1gr0PuN7WuwRuMg6Ac3tTUgH0auZhpFgeu9
 e0Y3BkURkNKR0+oGF09OzFVKFnbnP5pzEjk562aTfzssJqOVDUZPsPWJRG0ju
X-Received: by 2002:a17:906:8297:: with SMTP id
 h23mr6069282ejx.168.1630791372077; 
 Sat, 04 Sep 2021 14:36:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOGVVHQVa5FMlRH/cwG/wkzyPPXHLT9XOZxMLClat8vx8vu31FcGP6FEf1zKCloM7UFfimzw==
X-Received: by 2002:a17:906:8297:: with SMTP id
 h23mr6069266ejx.168.1630791371865; 
 Sat, 04 Sep 2021 14:36:11 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id gz22sm1551201ejb.15.2021.09.04.14.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:36:11 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:36:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/35] q35: catch invalid cpu hotplug configuration
Message-ID: <20210904213506.486886-6-mst@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Related: https://bugzilla.redhat.com//show_bug.cgi?id=1985924
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-Id: <20210812102341.3316254-1-kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/isa/lpc_ich9.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 5f9de0239c..5f143dca17 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -31,6 +31,7 @@
 #include "qemu/osdep.h"
 #include "qemu/log.h"
 #include "cpu.h"
+#include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "qemu/range.h"
 #include "hw/isa/isa.h"
@@ -676,6 +677,18 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp)
     DeviceState *dev = DEVICE(d);
     ISABus *isa_bus;
 
+    if ((lpc->smi_host_features & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT)) &&
+        !(lpc->smi_host_features & BIT_ULL(ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT))) {
+        /*
+         * smi_features_ok_callback() throws an error on this.
+         *
+         * So bail out here instead of advertizing the invalid
+         * configuration and get obscure firmware failures from that.
+         */
+        error_setg(errp, "cpu hot-unplug requires cpu hot-plug");
+        return;
+    }
+
     isa_bus = isa_bus_new(DEVICE(d), get_system_memory(), get_system_io(),
                           errp);
     if (!isa_bus) {
-- 
MST


