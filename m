Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC242F6A05
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 19:54:38 +0100 (CET)
Received: from localhost ([::1]:52330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l07lV-0007rx-Dk
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 13:54:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l0718-0001py-HJ; Thu, 14 Jan 2021 13:06:42 -0500
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:32779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1l0716-0004zD-Hl; Thu, 14 Jan 2021 13:06:42 -0500
Received: by mail-qt1-x834.google.com with SMTP id c14so4187404qtn.0;
 Thu, 14 Jan 2021 10:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S0lgIP/ecxTOZFqlmmkF4x/uUpqQHFc9Bq5tMLixPXU=;
 b=sWbNYu6s5h2wTY7q2OVgyOiiY2c0G9t+WHb3NDr7Y3+IX4nseKmQSo6zD8kvW8aBjd
 njxgCzs2/xyf9P1nhs71tIjnLPQ5fYC0j7I20IQZNt3B+S5HPoNXnTLBTWAK1+jw3yl5
 w49olg/RPKDZAYjTknn1SBGoCmaR/nv85JN2dSrmyjUQ72q9nLyK/Dzu7SVWaxFddW0w
 VQPbGpRrc8/FiEgzNhQpCFsXI5WZ99mEmpqjJVuq03ttUIkxjz0iruTcU5veuOelcF6Y
 aynuGY9q+1nFwhuCHRPvY5dkRcMH+7w5XmAkBuQlz+jOXGDWWoU6qFupS3cMDRCze2eR
 Achw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S0lgIP/ecxTOZFqlmmkF4x/uUpqQHFc9Bq5tMLixPXU=;
 b=VvQVQvG1ogdKg/Pa4HdOcBtRaa2S8TAtULSoAuy9PS3aUkiUFL1nmMQm8EajEEyJa3
 wTlgefvXN87olzxUkVQt4+DTPIlmSwUw3sxMct39CwOMBMTHXslIKbfyOF0JZoQFYfmM
 EzpA5riYoQ372dXBykyZtmwDnEcdLyhPOf8rTAOx8zkAHF/m9I3OaLuwfLhpWzHEBKtr
 ONzStp0IbtdH0zAMnGw+mgEJhWlFR25DknoA8bOO0T9kwUYhUW1MOuLVjAR5YFImAKho
 kIC6OAAyFotGJ0PHaroMpuVqXQ5Ns6pQTGJBH5LdyBn9i94e50zNRFWSx6ExeITzYvHj
 8qUA==
X-Gm-Message-State: AOAM530DnJBOYiI2Opt1QD0wFxFa9W4B4J1WR+WlHcCUfDCka+3shu+N
 reCPRCrz/fOpZnOsDUX5LBJHZ1tPlvXfGA==
X-Google-Smtp-Source: ABdhPJyO4/TVyrXsNCYfsUUSmsgNHjE7Ft6V17f41YYdIc0JQPbjF3S1FdqbCdhfbRc1GMNaPohpWg==
X-Received: by 2002:ac8:6b46:: with SMTP id x6mr7998933qts.104.1610647599231; 
 Thu, 14 Jan 2021 10:06:39 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:b984:ff01:270:b51c:24a5])
 by smtp.gmail.com with ESMTPSA id a1sm3448129qkn.104.2021.01.14.10.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 10:06:38 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/7] spapr.h: fix trailing whitespace in phb_placement
Date: Thu, 14 Jan 2021 15:06:22 -0300
Message-Id: <20210114180628.1675603-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210114180628.1675603-1-danielhb413@gmail.com>
References: <20210114180628.1675603-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::834;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x834.google.com
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

This whitespace was messing with lots of diffs if you happen
to use an editor that eliminates trailing whitespaces on file
save.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 include/hw/ppc/spapr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 1cc19575f5..4d37c2a93b 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -145,7 +145,7 @@ struct SpaprMachineClass {
     bool pre_6_0_memory_unplug;
 
     bool (*phb_placement)(SpaprMachineState *spapr, uint32_t index,
-                          uint64_t *buid, hwaddr *pio, 
+                          uint64_t *buid, hwaddr *pio,
                           hwaddr *mmio32, hwaddr *mmio64,
                           unsigned n_dma, uint32_t *liobns, hwaddr *nv2gpa,
                           hwaddr *nv2atsd, Error **errp);
-- 
2.26.2


