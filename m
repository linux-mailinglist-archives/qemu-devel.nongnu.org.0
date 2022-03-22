Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EF54E4634
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 19:42:57 +0100 (CET)
Received: from localhost ([::1]:44898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWjT7-0005Ry-2O
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 14:42:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nWjPX-0002Ok-6W; Tue, 22 Mar 2022 14:39:15 -0400
Received: from [2607:f8b0:4864:20::c29] (port=44687
 helo=mail-oo1-xc29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nWjPV-0006a3-OL; Tue, 22 Mar 2022 14:39:14 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 j7-20020a4ad6c7000000b0031c690e4123so21291762oot.11; 
 Tue, 22 Mar 2022 11:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h3tTFfrRS7qhxgSna2mS+NqVXyrjXDbAiB5G5+CJqBY=;
 b=oDLcyYM95N7LxLM7/6//0Nt4ZJd+sEogNRuO2LV7kTb/pZ+LA+OyDg+bYkIW66Rsdg
 QIBGGoUOm8wIrFzTnYDoC58uJDYS/wPILF3KD+2B9AaMy2URQ0kJ2d4Uka5iTapyDezM
 ptcjrj5DqBJ1xQ+O2cwY/mqbT0VIW3oBIRynryFLhF7L0vAwzMtgN/vkn+Wd6JTK+q03
 5QwxLZixCFeEZYmT7ROGk8AWQj4CD84yJ/V4nvs1S4c15HFgCPTXlwlmuObTGfKtT159
 hgfQbOOuRRqAnmD+Lra1u6Q7IKpuTutuKxzdxDCOa2mrXG5rMKIK0kdF5eZsC9fDBaL4
 5Gjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h3tTFfrRS7qhxgSna2mS+NqVXyrjXDbAiB5G5+CJqBY=;
 b=Pkk7H4WJlH5/Fm9spycQXoOYUJp4HDxpNSiKnWKiQxLwBpyL+uDSo3rd5gaH3t9afb
 t2aTtOv5BxsNQ5x2wqbp+R43wnn1acAuPmiTzWs2wIra3OqiPjz0JDFUnwgqhWdyVP8w
 9k4X8XSuLW3y5jCsr6QIjGTcHS9NjRJ76Sa/a/volZD+AdXd/D4EEXsrzmg751Xm3YK7
 eXtRDBeh5KI9e+Uv6hoqozu6m5vI7VZXDIUkJTabgvnUEsDZjawOax0GsI02bmS+eDUp
 C25qUhRktJgy9XUeeI+pz/IXMrh/mNMN4MSjNj2wwGQQPo17Ivl1C9so5EUmFpdgrwnn
 ebnA==
X-Gm-Message-State: AOAM530zUsM4KoMzON9tGVlFMKFe5CN5DqIA95dh607IjygxUJ2E8Y9d
 rdB2xFvVtKyWFM+x9Pkg1xvYmNmdCHk=
X-Google-Smtp-Source: ABdhPJyabLayGdOXK9CR005HLZrlHhzjDNDoLNt/1kPq6iJ8bqVhW9DOWZXMHOYNyqTKW/ikLQxRKA==
X-Received: by 2002:a4a:c68d:0:b0:321:6a20:e9c9 with SMTP id
 m13-20020a4ac68d000000b003216a20e9c9mr8879610ooq.63.1647974350559; 
 Tue, 22 Mar 2022 11:39:10 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:daa8:ba9e:6f18:bac1:8a96])
 by smtp.gmail.com with ESMTPSA id
 96-20020a9d0469000000b005c959dd643csm9109627otc.3.2022.03.22.11.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 11:39:10 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 3/4] hw/ppc: use qdev to register spapr_iommu tcet
 vmstate
Date: Tue, 22 Mar 2022 15:38:53 -0300
Message-Id: <20220322183854.196063-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220322183854.196063-1-danielhb413@gmail.com>
References: <20220322183854.196063-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc29.google.com
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

Use the dc->vmsd interface to register the vmstate of the tcet. The
instance_id is being set to tcet->liobn by calling
qdev_set_legacy_instance_id() during spapr_tce_table_realize().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_iommu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
index 81e5a1aea3..ac3389f0b7 100644
--- a/hw/ppc/spapr_iommu.c
+++ b/hw/ppc/spapr_iommu.c
@@ -321,8 +321,8 @@ static void spapr_tce_table_realize(DeviceState *dev, Error **errp)
 
     QLIST_INSERT_HEAD(&spapr_tce_tables, tcet, list);
 
-    vmstate_register(VMSTATE_IF(tcet), tcet->liobn, &vmstate_spapr_tce_table,
-                     tcet);
+    qdev_set_legacy_instance_id(dev, tcet->liobn,
+                                vmstate_spapr_tce_table.minimum_version_id);
 }
 
 void spapr_tce_set_need_vfio(SpaprTceTable *tcet, bool need_vfio)
@@ -424,8 +424,6 @@ static void spapr_tce_table_unrealize(DeviceState *dev)
 {
     SpaprTceTable *tcet = SPAPR_TCE_TABLE(dev);
 
-    vmstate_unregister(VMSTATE_IF(tcet), &vmstate_spapr_tce_table, tcet);
-
     QLIST_REMOVE(tcet, list);
 
     spapr_tce_table_disable(tcet);
@@ -673,6 +671,7 @@ static void spapr_tce_table_class_init(ObjectClass *klass, void *data)
     dc->realize = spapr_tce_table_realize;
     dc->reset = spapr_tce_reset;
     dc->unrealize = spapr_tce_table_unrealize;
+    dc->vmsd = &vmstate_spapr_tce_table;
     /* Reason: This is just an internal device for handling the hypercalls */
     dc->user_creatable = false;
 
-- 
2.35.1


