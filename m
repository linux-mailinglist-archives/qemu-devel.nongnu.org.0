Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0784FAAA6
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 22:11:34 +0200 (CEST)
Received: from localhost ([::1]:35724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndHQj-0000My-5z
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 16:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ndHOV-0006JM-5l; Sat, 09 Apr 2022 16:09:15 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334]:38880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ndHOT-0007Rr-Nt; Sat, 09 Apr 2022 16:09:14 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 88-20020a9d0ee1000000b005d0ae4e126fso8547780otj.5; 
 Sat, 09 Apr 2022 13:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OPmD59Y0m/lR0bRxI1F2FYantqjBhY6fQ8LKbna5lac=;
 b=SiiYHj/pF1eLcjQkUyp3Xdl/kjQF9qXhoxSr07HzNuYkN44ft3pCSSgu/kT2Zp1miG
 x8o7rrVS6fBRjEeP4OaYrw/8n/dWHN2G01/BRagKpUJwZ05/YPHR4kg0NAT80kG7roUQ
 FkiHsPeCS4n4nmA/aPwZ7QhLBd8wQPI+dGlXe0xm9IVwE/xyrKNY0V4qe7dmJNKldHPo
 TleLF5URY5uRngJKieVMfH5VFVJmes8FYrwfR7HZzgC4vFhDsrWzI1aZTWgW90lN0Moh
 bXbDvzs8NFOkq5J55CaI/U4D/retWim6TvEOIQ6s7yJV5ZiNkJcGBQsx6nnSu7F4PTeS
 2JIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OPmD59Y0m/lR0bRxI1F2FYantqjBhY6fQ8LKbna5lac=;
 b=NpEvb/eWvC4jnXIraYB+5xM7PkZHUbjCWwyTFX2UkFKd9Y2AaoTCa7FhcasMtklAp2
 G+bGLUS/Evng0hG426hgMt4aJ/GtD1mYNIyQSxTSLO2CvXfBFRo6wN3SIoeR2XhGtzFl
 Zm/OwFd1QOhx0zakUrTWpCdA4TZEstx5s7aatjpq4iq5CzweKWr0MecKoadBctEn7+nI
 zyRU+vCPNSgr2X3/qSZ/e9aaNqTV0f7+amPrZoEVeZgMWsFuGDbeCWbHfsYiAQx80Zir
 syLkEuDJNbOIESD9l5jtK5raEWB3sgAEUtoUxnxYNqeLakI18KPQCA6qlTh8Jpdi9ITL
 U9YA==
X-Gm-Message-State: AOAM533LqorvIQxObtHSeo+LeqEOPPOiumoO0KT+qM/lTufbUybjTYrc
 kWxu5XyTVVKOnmfB7bbprD1VVBL+0zU=
X-Google-Smtp-Source: ABdhPJxGp+RjclJUfvI+x6jH1wRyOWOjIEb46cMP1EAgVd3W7UoR9Lpsc2PjvuNnbWbIw8fUM3x5bA==
X-Received: by 2002:a05:6830:154c:b0:5e6:85c5:ed8b with SMTP id
 l12-20020a056830154c00b005e685c5ed8bmr8800728otp.253.1649534952322; 
 Sat, 09 Apr 2022 13:09:12 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:7ee3:afd9:f010:3a9:fd23])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a05683001c800b005cdadc2a837sm10457474ota.70.2022.04.09.13.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Apr 2022 13:09:12 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] hw/ppc: check if spapr_drc_index() returns NULL in
 spapr_nvdimm.c
Date: Sat,  9 Apr 2022 17:08:56 -0300
Message-Id: <20220409200856.283076-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220409200856.283076-1-danielhb413@gmail.com>
References: <20220409200856.283076-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x334.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

spapr_nvdimm_flush_completion_cb() and flush_worker_cb() are using the
DRC object returned by spapr_drc_index() without checking it for NULL.
In this case we would be dereferencing a NULL pointer when doing
SPAPR_NVDIMM(drc->dev) and PC_DIMM(drc->dev).

This can happen if, during a scm_flush(), the DRC object is wrongly
freed/released (e.g. a bug in another part of the code).
spapr_drc_index() would then return NULL in the callbacks.

Fixes: Coverity CID 1487108, 1487178
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_nvdimm.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
index c4c97da5de..04a64cada3 100644
--- a/hw/ppc/spapr_nvdimm.c
+++ b/hw/ppc/spapr_nvdimm.c
@@ -447,9 +447,15 @@ static int flush_worker_cb(void *opaque)
 {
     SpaprNVDIMMDeviceFlushState *state = opaque;
     SpaprDrc *drc = spapr_drc_by_index(state->drcidx);
-    PCDIMMDevice *dimm = PC_DIMM(drc->dev);
-    HostMemoryBackend *backend = MEMORY_BACKEND(dimm->hostmem);
-    int backend_fd = memory_region_get_fd(&backend->mr);
+    PCDIMMDevice *dimm;
+    HostMemoryBackend *backend;
+    int backend_fd;
+
+    g_assert(drc != NULL);
+
+    dimm = PC_DIMM(drc->dev);
+    backend = MEMORY_BACKEND(dimm->hostmem);
+    backend_fd = memory_region_get_fd(&backend->mr);
 
     if (object_property_get_bool(OBJECT(backend), "pmem", NULL)) {
         MemoryRegion *mr = host_memory_backend_get_memory(dimm->hostmem);
@@ -475,7 +481,11 @@ static void spapr_nvdimm_flush_completion_cb(void *opaque, int hcall_ret)
 {
     SpaprNVDIMMDeviceFlushState *state = opaque;
     SpaprDrc *drc = spapr_drc_by_index(state->drcidx);
-    SpaprNVDIMMDevice *s_nvdimm = SPAPR_NVDIMM(drc->dev);
+    SpaprNVDIMMDevice *s_nvdimm;
+
+    g_assert(drc != NULL);
+
+    s_nvdimm = SPAPR_NVDIMM(drc->dev);
 
     state->hcall_ret = hcall_ret;
     QLIST_REMOVE(state, node);
-- 
2.35.1


