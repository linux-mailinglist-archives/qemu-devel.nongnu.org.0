Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D26B52D4A67
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:36:36 +0100 (CET)
Received: from localhost ([::1]:53532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn5GN-0001uf-Ri
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:36:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3yb-00076d-7i
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:14:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3yV-0001RY-Tc
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:14:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ao4RDAEOM2YLTiIdrHeiCtTgsP0kjiPBhD8XurXHvys=;
 b=Ft5t9fZzGusl9Svxm9mLZ4RfxCmruukgwLymS2bOZVgEyGzMg+gNvQm6iquu7qbsp6yvBG
 vLA23MoYgE6jpcncgdSrjSTqRZr/eLdNC77B6rYjdsJvjluXVODhhIvD3YElyVEILJSkn5
 my3ZQGIh1RcF8DTzWHIkZnDUXKvDOZ0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-7QPTOcdWPwu1RWWDkQguMg-1; Wed, 09 Dec 2020 13:11:37 -0500
X-MC-Unique: 7QPTOcdWPwu1RWWDkQguMg-1
Received: by mail-wr1-f72.google.com with SMTP id p16so962486wrx.4
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:11:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ao4RDAEOM2YLTiIdrHeiCtTgsP0kjiPBhD8XurXHvys=;
 b=aLLKETGF/LJLl/pC2gEa+dTcFs2QXhTyIFnBdGlijT8MgaBPizvHwVvfsDJAigqBFF
 3EmRIwdaPty6+OnrlIYppwRrWSGHOiAHODxMBr6Hx72YRps+/R3DFwq2DgkO7CLjqxpj
 eDkOpXxJ1PwmCHeSVQ6EGenMcVl7hZh2aqEAyIENFPWd/UwrlZuIHyuXU2CJQkc4S0UY
 Ju1wAqvW5B0LsMnS3zcPKh1Y5CWcwNlxEQkYtPrs8d6crbXLG2gaH1cWjq7PN5qh/NBJ
 HyB7cM1cJGeHK1uMHAzXA0YoyIFT0FDT6VE6UfOyqwyzPL6fgxrnIGnTpRJKgUkwOc1U
 TjNQ==
X-Gm-Message-State: AOAM532kLbve69fEtmThQkw15sa2ljTS22Oej8rXjhSOfen1kotB/fja
 D8fsSb8GRG3wX7KgzYvWeNnsNPn/rGBamhJqAsiX2E7tMkCIEVKMbop1HQjnJHvfIOacS8837T2
 b8/6DDOpWJ3bKNC25LcoAF/5iRqi85o+rBHb67DGkCVW1sbFmleo3JnpD9KvS
X-Received: by 2002:a5d:5146:: with SMTP id u6mr4257124wrt.66.1607537495561;
 Wed, 09 Dec 2020 10:11:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdhxT42pF6yaMy9b7tDilgZvSggS4TBGBZJYI1BT4wEg4IWDioKAjdLoV0HW6cUJoaVnB6Dg==
X-Received: by 2002:a5d:5146:: with SMTP id u6mr4257100wrt.66.1607537495392;
 Wed, 09 Dec 2020 10:11:35 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id t1sm5280711wro.27.2020.12.09.10.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:11:34 -0800 (PST)
Date: Wed, 9 Dec 2020 13:11:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 62/65] x86: ich9: let firmware negotiate 'CPU hot-unplug
 with SMI' feature
Message-ID: <20201209180546.721296-63-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
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
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Keep CPU hotunplug with SMI disabled on 5.2 and older and enable
it by default on newer machine types.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20201207140739.3829993-9-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/pc.c      | 4 +++-
 hw/isa/lpc_ich9.c | 8 +++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 675e15c0aa..9e29f3792b 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -97,7 +97,9 @@
 #include "trace.h"
 #include CONFIG_DEVICES
 
-GlobalProperty pc_compat_5_2[] = {};
+GlobalProperty pc_compat_5_2[] = {
+    { "ICH9-LPC", "x-smi-cpu-hotunplug", "off" },
+};
 const size_t pc_compat_5_2_len = G_N_ELEMENTS(pc_compat_5_2);
 
 GlobalProperty pc_compat_5_1[] = {
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index da80430144..d3145bf014 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -392,6 +392,12 @@ static void smi_features_ok_callback(void *opaque)
         return;
     }
 
+    if (guest_cpu_hotplug_features ==
+        BIT_ULL(ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT)) {
+        /* cpu hot-unplug is unsupported without cpu-hotplug */
+        return;
+    }
+
     /* valid feature subset requested, lock it down, report success */
     lpc->smi_negotiated_features = guest_features;
     lpc->smi_features_ok = 1;
@@ -774,7 +780,7 @@ static Property ich9_lpc_properties[] = {
     DEFINE_PROP_BIT64("x-smi-cpu-hotplug", ICH9LPCState, smi_host_features,
                       ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT, true),
     DEFINE_PROP_BIT64("x-smi-cpu-hotunplug", ICH9LPCState, smi_host_features,
-                      ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT, false),
+                      ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT, true),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
MST


