Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EC64DE08B
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 18:53:26 +0100 (CET)
Received: from localhost ([::1]:39146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVGmz-0008Th-8M
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 13:53:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nVGU3-0004ii-A9; Fri, 18 Mar 2022 13:33:51 -0400
Received: from [2607:f8b0:4864:20::333] (port=34779
 helo=mail-ot1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nVGU1-0002CE-3J; Fri, 18 Mar 2022 13:33:50 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 d15-20020a05683018ef00b005b2304fdeecso6017683otf.1; 
 Fri, 18 Mar 2022 10:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4D2wEpyeuKiVeib0JY059TwLtfK5N95kWu6UXkH8AGI=;
 b=Hi5BlDilLLlosC5fiNbxf3nOTNqVL3Fxb7FESCDRaqMz/JNqYkEMB9ar4OAbFtJKIv
 6AJNahpNm4+L6Sl8Mxs4vK/79FPKhltRJqEVdH1yeUoo8cx1bb7t0QXlJYd+RyUr+znX
 xCOkfNd0Z+vAZ4fE8rPgUWIc93qcftqJfsv2RX6O6Tz+LjFhqzP/RkpSPCQIIU34wJ9x
 lLR29YOIIHYOZJFB4ldedYgRRspBXcLgR3cpuSOh05QzSi9Tk53Ss5fBaNtbSgSWs514
 pkkqr6ydTnH2RbTXTGkXV3yelvgfyTEkDFL8jh8U1lixnqSZc8g9mYN3WFZHRFn60sU/
 l6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4D2wEpyeuKiVeib0JY059TwLtfK5N95kWu6UXkH8AGI=;
 b=H2SDxpCLaQ80wF57kqGWzH0TntxuBwDwzdR7AHozUd/dNuARsrljtSjAqNlVfGH6L1
 nguBuX2dHetj4yX5Np4W6qS9bqnkD/0OvATEuaBZ4Nkm/8t+6Tq8wNUfEYTNeJtqr2dz
 C9rB2YtQAEm+um/2/CWKnXwyHPqmjOHLSp+I4IyMpaVWsK+EflKFE8wwlDfzWxwO0s/D
 GwsiQUdBeW5eiWfC+rOrtyTiTl/7rmOCADiBxNKfC394+gH+LiBX1OTtledOPhakE2Ec
 OAyI7I/6TtkzNbBxqfai96hcDTzGWppUyl+zPk/mvYI2/b4/tnk494wyZA2aRqksAPDb
 SscA==
X-Gm-Message-State: AOAM532yXrLOUaPgNNLlZSw17d0de9RZKddCS2t9S4AGDf/n3KYUgqzm
 lKbIVGqrvZS8U2HQ4s/kJQ7WTigBZ/M=
X-Google-Smtp-Source: ABdhPJwJTvurk2LrDwdvWQcUF+Jnye1/3pzEktGaCtMahJT9jT8RBPk3G6EimkqODPYAmvsR3GOeHA==
X-Received: by 2002:a05:6830:1e32:b0:5b2:2dcd:653d with SMTP id
 t18-20020a0568301e3200b005b22dcd653dmr3558508otr.256.1647624827695; 
 Fri, 18 Mar 2022 10:33:47 -0700 (PDT)
Received: from rekt.ibmmodules.com ([2804:431:c7c6:daa8:d948:1d15:1451:398f])
 by smtp.gmail.com with ESMTPSA id
 d2-20020a05683025c200b005c93d78e1f6sm4324662otu.29.2022.03.18.10.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 10:33:47 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 9/9] hw/ppc/spapr_drc.c: remove spapr_drc_index()
Date: Fri, 18 Mar 2022 14:33:20 -0300
Message-Id: <20220318173320.320541-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220318173320.320541-1-danielhb413@gmail.com>
References: <20220318173320.320541-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::333
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x333.google.com
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

The only remaining caller of this function is the initialization of
drc->index in spapr_dr_connector_new().

Open code the body of the function inside spapr_dr_connector_new() and
remove spapr_drc_index().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_drc.c         | 23 ++++++++++-------------
 include/hw/ppc/spapr_drc.h |  1 -
 2 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
index 11a49620c8..8c8654121c 100644
--- a/hw/ppc/spapr_drc.c
+++ b/hw/ppc/spapr_drc.c
@@ -39,18 +39,6 @@ SpaprDrcType spapr_drc_type(SpaprDrc *drc)
     return 1 << drck->typeshift;
 }
 
-uint32_t spapr_drc_index(SpaprDrc *drc)
-{
-    SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
-
-    /* no set format for a drc index: it only needs to be globally
-     * unique. this is how we encode the DRC type on bare-metal
-     * however, so might as well do that here
-     */
-    return (drck->typeshift << DRC_INDEX_TYPE_SHIFT)
-        | (drc->id & DRC_INDEX_ID_MASK);
-}
-
 static void spapr_drc_release(SpaprDrc *drc)
 {
     SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
@@ -546,11 +534,20 @@ SpaprDrc *spapr_dr_connector_new(Object *owner, const char *type,
                                          uint32_t id)
 {
     SpaprDrc *drc = SPAPR_DR_CONNECTOR(object_new(type));
+    SpaprDrcClass *drck = SPAPR_DR_CONNECTOR_GET_CLASS(drc);
     g_autofree char *prop_name = NULL;
 
     drc->id = id;
     drc->owner = owner;
-    drc->index = spapr_drc_index(drc);
+
+    /*
+     * No set format for a drc index: it only needs to be globally
+     * unique. This is how we encode the DRC type on bare-metal
+     * however, so might as well do that here.
+     */
+    drc->index = (drck->typeshift << DRC_INDEX_TYPE_SHIFT) |
+                 (drc->id & DRC_INDEX_ID_MASK);
+
     prop_name = g_strdup_printf("dr-connector[%"PRIu32"]", drc->index);
     object_property_add_child(owner, prop_name, OBJECT(drc));
     object_unref(OBJECT(drc));
diff --git a/include/hw/ppc/spapr_drc.h b/include/hw/ppc/spapr_drc.h
index 93825e47a6..33cdb3cc20 100644
--- a/include/hw/ppc/spapr_drc.h
+++ b/include/hw/ppc/spapr_drc.h
@@ -228,7 +228,6 @@ static inline bool spapr_drc_hotplugged(DeviceState *dev)
 /* Returns true if an unplug request completed */
 bool spapr_drc_reset(SpaprDrc *drc);
 
-uint32_t spapr_drc_index(SpaprDrc *drc);
 SpaprDrcType spapr_drc_type(SpaprDrc *drc);
 
 SpaprDrc *spapr_dr_connector_new(Object *owner, const char *type,
-- 
2.35.1


