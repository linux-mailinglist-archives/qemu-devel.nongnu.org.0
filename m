Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A144E4632
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 19:42:50 +0100 (CET)
Received: from localhost ([::1]:44230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWjSz-0004yJ-63
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 14:42:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nWjPU-0002Mb-WF; Tue, 22 Mar 2022 14:39:13 -0400
Received: from [2607:f8b0:4864:20::336] (port=38657
 helo=mail-ot1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nWjPS-0006ZU-1U; Tue, 22 Mar 2022 14:39:12 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 a7-20020a9d5c87000000b005ad1467cb59so13108211oti.5; 
 Tue, 22 Mar 2022 11:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5bETcJ1VAQBfcrmPp79dWNkpCfk535Hl4vdR5mSX/QE=;
 b=pwGuNw5uNnq6ab2r+1GF3rGnPV3Qxua4FAwjRf7zS/C8Rmf2E4oKyyCTAQkufnGo3N
 cKm2Qqxf2dsFbg6uq3m5hLEG/dHbGeYaSFWs+0ZX8Iq7nXRYvL/j5xRcKuihijIwuyQl
 muYa1c2lHD6fqSKkBoRvBRNUSle8irInmsgrqIq4IrRi5a9VzZIhtt4GVb1QMdxc5yJq
 Vq4/hM6RQLI8CO9QzPmgSMmZAwFT2Lwmj7Gz9pv2sqPzxgxOVooeVlagU28hCVWt3JCH
 EgirxvAVlX6Hjlnla0AB/IXznFyOUAUwM0LxYQ+Wb942WTBgzliijEv+rRl0fAaX+C0I
 zJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5bETcJ1VAQBfcrmPp79dWNkpCfk535Hl4vdR5mSX/QE=;
 b=osgJSPVnue9KqitB/pRYa2Tg8agsw0DhAFDnwfLXF1GSeC2Cp0LNc+CmZdRD4w5ZK9
 vwC0sVCZRgpaI8xVEKtX5JHMwaW8ti6R7jflg92cXoFmiHoHJc9m3BH4N2RH14Y7up50
 FlOZqjU8eFGJtWgaCJoDB6/PfOl1+qRp0jO3LX/oKYh0ACXGqFR6IWpBCJJsg6MdFR89
 xfVR/rJSKj+0o+P1i5w0G7BruyH0vaD+UlKyqa8t922zfLNjCdIsK9xhzV/uD63TxOpt
 AGenZymE3fhasx8dkM/rdGaJoL8c2hjOQMhyrjcREjpl46XE0rrakfY8hL7rPRZxB4uK
 YZZw==
X-Gm-Message-State: AOAM530WzLF/Z+5MctZ7ox12ugyImCbXhhbd440QyXSldGaT0TuUK55/
 k/CJ1MDmizRZYQmstD9JmjctJ3I9Qi4=
X-Google-Smtp-Source: ABdhPJzNnVWrf0Lkc6GIA6tmkOZBeZwESeai8ZcaCSU94i1cmS7nDIzEo1oEWn+oOFSkgwQX/nFSOA==
X-Received: by 2002:a9d:7994:0:b0:5b2:3110:e69c with SMTP id
 h20-20020a9d7994000000b005b23110e69cmr10539574otm.267.1647974346566; 
 Tue, 22 Mar 2022 11:39:06 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:daa8:ba9e:6f18:bac1:8a96])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d0469000000b005c959dd643csm9109627otc.3.2022.03.22.11.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 11:39:06 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 1/4] hw/ppc: use qdev to register logical DRC vmstates
Date: Tue, 22 Mar 2022 15:38:51 -0300
Message-Id: <20220322183854.196063-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220322183854.196063-1-danielhb413@gmail.com>
References: <20220322183854.196063-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::336
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x336.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Today we use vmstate_register() to register the vmstate of logical DRCs
during drc_realize(), following it up with a similar
vmstate_unregister() during drc_unrealize().

We can instead use qdev to init the vmstate of the device via the
dc->vmsd interface. This will spare us of both vmstate calls and make
the code a little more maintainable.

Since we're using spapr_drc_index() as instance_id in
vmstate_register(), we'll need to use qdev_set_legacy_instance_id() to set
the same instance_id the DRC vmstates are now used to have.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_drc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 76bc5d42a0..a5ef64d2a2 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -536,8 +536,7 @@ static void drc_realize(DeviceState *d, Error **errp)
     trace_spapr_drc_realize_child(spapr_drc_index(drc), child_name);
     object_property_add_alias(root_container, link_name,
                               drc->owner, child_name);
-    vmstate_register(VMSTATE_IF(drc), spapr_drc_index(drc), &vmstate_spapr_drc,
-                     drc);
+    qdev_set_legacy_instance_id(d, spapr_drc_index(drc), 1);
     trace_spapr_drc_realize_complete(spapr_drc_index(drc));
 }
 
@@ -548,7 +547,6 @@ static void drc_unrealize(DeviceState *d)
     Object *root_container;
 
     trace_spapr_drc_unrealize(spapr_drc_index(drc));
-    vmstate_unregister(VMSTATE_IF(drc), &vmstate_spapr_drc, drc);
     root_container = container_get(object_get_root(), DRC_CONTAINER_PATH);
     object_property_del(root_container, name);
 }
@@ -673,8 +671,11 @@ static void spapr_drc_physical_class_init(ObjectClass *k, void *data)
 
 static void spapr_drc_logical_class_init(ObjectClass *k, void *data)
 {
+    DeviceClass *dk = DEVICE_CLASS(k);
     SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_CLASS(k);
 
+    dk->vmsd = &vmstate_spapr_drc;
+
     drck->dr_entity_sense = logical_entity_sense;
     drck->isolate = drc_isolate_logical;
     drck->unisolate = drc_unisolate_logical;
-- 
2.35.1


