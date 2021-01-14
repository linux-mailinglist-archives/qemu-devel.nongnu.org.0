Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 896BA2F6938
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:16:38 +0100 (CET)
Received: from localhost ([::1]:48530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l07Aj-0001aM-Id
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:16:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l071I-0001zK-DB; Thu, 14 Jan 2021 13:06:52 -0500
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:41257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l071C-00051Q-Ad; Thu, 14 Jan 2021 13:06:52 -0500
Received: by mail-qt1-x832.google.com with SMTP id j26so4155245qtq.8;
 Thu, 14 Jan 2021 10:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zLIaL25dnVyYmxGQEimqdfQHBpzSSRoEUn6YuIhvtro=;
 b=NdRqgN0XlF8OLwfRmsLOqXQgmD1BcM12exGIiI4EROap8O2gs7/58i6IvnkiHCQswo
 Hf4DrslRKyrXxOKogmlPWyOZiS+99wAj9eF5wCUsKxWVQ/a/a10rIqD6VZu/DmaOJlu8
 urQratPt/zQQnfhddKOtxcfu5Ex+UeXWPc6CWAHTDAhg7ZBxFE/na11vzn1rWraEYEIk
 RavGi1fWt9qMzSDlqUSZ1ChdFenrKFmk7CCUPatwzXNdN8uLOiYdo3XGrAQZ5gSUQNE9
 0q+iiCvUba4VHVWYKFm6vcV8PePdXZiGAwrEFwQnLvwEJqSZyMTf6A4DOozQw2kjw2bj
 qwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zLIaL25dnVyYmxGQEimqdfQHBpzSSRoEUn6YuIhvtro=;
 b=bBvXUhPPX3S3jI/sC8ylKrKPE9O49Rw0dXMQbinNvS3ccJH2PdDwz+Ur5+JTnGz+vr
 ykcq7FORa2gkIMOEM4a6VDuCr4SfdW8Ng9WuTNG/JMKT6MJ+khzSe7spFiE+wICmxXhv
 HrzWkI3WiyZB3qkN2Sext96kAJV5qPBiMMWaoqPjZNG4ikRH/cnTLJGB5mLcHZ/1mD9w
 gqv2YxR0buq7iuO47OOWUAo/BfOOUsnBr/EvaXs2BkBU1UW9xWYKLAf6tu5SVDzdmkTI
 0og1PVS9xrlC5fMQDow/jY47OTIWEDYmU0dYxYqrUP1/RIrhqK3D8YFND9W3HfWVHmQG
 15ow==
X-Gm-Message-State: AOAM530bAR14c0456L2ULtYhwC/0mT/x3pHg+jXx/pnq4dGnUjEMOnY4
 kkja3qoiIhiG96E8Moasi5WAgZz3ahEOyQ==
X-Google-Smtp-Source: ABdhPJxP607UprFwwTwPsXR9pdksWGRk5xI18zWyo8VuIfXZAVSgrAL6ZRdT7DBuYts6M7vDN7Rd/g==
X-Received: by 2002:aed:3b96:: with SMTP id r22mr8144046qte.0.1610647605020;
 Thu, 14 Jan 2021 10:06:45 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:b984:ff01:270:b51c:24a5])
 by smtp.gmail.com with ESMTPSA id a1sm3448129qkn.104.2021.01.14.10.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 10:06:44 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 4/7] spapr_rtas.c: fix identation of rtas_ibm_suspend_me()
 args
Date: Thu, 14 Jan 2021 15:06:25 -0300
Message-Id: <20210114180628.1675603-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114180628.1675603-1-danielhb413@gmail.com>
References: <20210114180628.1675603-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x832.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 groug@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_rtas.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index d014684d60..fbefd5d3cb 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -219,9 +219,9 @@ static void rtas_stop_self(PowerPCCPU *cpu, SpaprMachineState *spapr,
 }
 
 static void rtas_ibm_suspend_me(PowerPCCPU *cpu, SpaprMachineState *spapr,
-                           uint32_t token, uint32_t nargs,
-                           target_ulong args,
-                           uint32_t nret, target_ulong rets)
+                                uint32_t token, uint32_t nargs,
+                                target_ulong args,
+                                uint32_t nret, target_ulong rets)
 {
     CPUState *cs;
 
-- 
2.26.2


