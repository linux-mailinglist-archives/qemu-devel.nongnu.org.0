Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C468248EFB6
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 19:16:24 +0100 (CET)
Received: from localhost ([::1]:49122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8R7f-0008Ma-T0
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 13:16:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n8QzG-0005jC-Bw; Fri, 14 Jan 2022 13:07:42 -0500
Received: from [2607:f8b0:4864:20::c35] (port=37562
 helo=mail-oo1-xc35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n8QzE-0000Ot-GT; Fri, 14 Jan 2022 13:07:42 -0500
Received: by mail-oo1-xc35.google.com with SMTP id
 p11-20020a4adfcb000000b002dd4a3e84beso2790302ood.4; 
 Fri, 14 Jan 2022 10:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qpwkERfVTCeSqn5sNm4lZEtFIEicamQqN26TtaIo6MU=;
 b=HkHsnNOXB0IETWoqn45EJBreFn2PQd1q3cW2OhEkxeRa7gEJzrv4ctLN1FmEEVJorY
 RYNUkV1hn36aOWebzPbw0OmItGc57mci67Hgl2xjKvA4XsCYr8Wf9NV6zITgspM8JUMp
 ELrCvrcZGDxHtzZE8rOvHVJEHrnhzCShoWOUdc5dbARoQ51KV3l+sW18TXXNhuHqsZvp
 SPHrS/e5KdSLXade3lTLTnrQyqO0c9Zvol54Zae9xByz3WdwPy/anykorcIPBDjx0GBN
 FGCjhSUkXWhsOYYoeFjPXz4mh0HDkoSDH9FKWjd9m24ai454wv+ttrW3mLoxTsGad2Bd
 oMBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qpwkERfVTCeSqn5sNm4lZEtFIEicamQqN26TtaIo6MU=;
 b=l8NXYDKprasCGoshxYWAm38mopkbAZlRCSHFwDS3/9iIp7lYmTNSg5hQX1JWe29D07
 D97mMl4k8UvGI9eSjG3KvPfX/B5ZCoewMpOu0bXS3Us3qieYDj9N+BNWqsSGdkvcqfyW
 4Hqy+/HZF5And+VbBdrFTlFN0I/WsH604TAeQzRm8gxsmmkVTbjyzxo1W7YQLRTsBrd9
 fFQ4BPOnF5SBmHEhqMUHik9fKJOcAhMVoAIMq6HHj8BYELgDqd6Gapv2/C1+5NVNq8FJ
 wfQ9gDduouLghnZ2R29iCy7dZ46BsAE1pYAUTpKLI9H9dl+WbxfmetE0QsMNmdmjFnLm
 S4CA==
X-Gm-Message-State: AOAM530D0FhUP4DWxo4HdYPL5uKdoYa9pcXCMlmh2zFDDvib3VMwMjKY
 8UPVHxRrHbdv58H6yNJzkjOiog4MPgOYKI5W
X-Google-Smtp-Source: ABdhPJx64EDQXXPmvu6VSzhlLaQWJazmC6YtR4fN8Wn1gZFLn0RyoAEdKMrKaIiYwGo6dpdJk8/YSA==
X-Received: by 2002:a4a:3412:: with SMTP id b18mr7242865ooa.23.1642183659110; 
 Fri, 14 Jan 2022 10:07:39 -0800 (PST)
Received: from rekt.COMFAST ([152.249.109.193])
 by smtp.gmail.com with ESMTPSA id e17sm1353584otr.13.2022.01.14.10.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 10:07:38 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/8] ppc/pnv: remove PnvPhb4PecStack::stack_no
Date: Fri, 14 Jan 2022 15:07:16 -0300
Message-Id: <20220114180719.52117-6-danielhb413@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220114180719.52117-1-danielhb413@gmail.com>
References: <20220114180719.52117-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc35.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

pnv_pec_default_phb_realize() stopped using it after the previous patch and
no one else is using it.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/pci-host/pnv_phb4_pec.c     | 2 --
 include/hw/pci-host/pnv_phb4.h | 3 ---
 2 files changed, 5 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index a80a21db77..d6405d6ca3 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -166,7 +166,6 @@ static void pnv_pec_realize(DeviceState *dev, Error **errp)
         PnvPhb4PecStack *stack = &pec->stacks[i];
         Object *stk_obj = OBJECT(stack);
 
-        object_property_set_int(stk_obj, "stack-no", i, &error_abort);
         object_property_set_link(stk_obj, "pec", OBJECT(pec), &error_abort);
 
         if (defaults_enabled()) {
@@ -314,7 +313,6 @@ static void pnv_pec_stk_realize(DeviceState *dev, Error **errp)
 }
 
 static Property pnv_pec_stk_properties[] = {
-        DEFINE_PROP_UINT32("stack-no", PnvPhb4PecStack, stack_no, 0),
         DEFINE_PROP_LINK("pec", PnvPhb4PecStack, pec, TYPE_PNV_PHB4_PEC,
                          PnvPhb4PecState *),
         DEFINE_PROP_END_OF_LIST(),
diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index a9059b7279..2be56b7afd 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -171,9 +171,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(PnvPhb4PecStack, PNV_PHB4_PEC_STACK)
 struct PnvPhb4PecStack {
     DeviceState parent;
 
-    /* My own stack number */
-    uint32_t stack_no;
-
     /* The owner PEC */
     PnvPhb4PecState *pec;
 
-- 
2.33.1


