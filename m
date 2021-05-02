Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F35370EAB
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 20:58:15 +0200 (CEST)
Received: from localhost ([::1]:55900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldHIE-0001vx-Lp
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 14:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldHFH-0008OR-J6
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:55:11 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:44845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldHFG-0008Nc-0A
 for qemu-devel@nongnu.org; Sun, 02 May 2021 14:55:11 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 82-20020a1c01550000b0290142562ff7c9so2260304wmb.3
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 11:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fQSQe8AmFNdH7/S8ocBiYkSMiEn25ODIF1so8U4TOrA=;
 b=Iu4YAIExLWBTgwL8hn+reIewFCffelASF13cm+xGGdHb36GMp0loDrxqif9IPunFa8
 84PUOxyp8MaSqyGuLqBkWypWvUGhN2jKwjPejIocDpHpC+cMlvpUtYsuOB0DiGqZeg5o
 3EETlRiDdA0OgqRHnE/2ir445vHUM4UVRGbHitNLw9QMZvS4vxi9mWf8e3fa9SkvwFp0
 xdKsbQc3UrzL4+LZbWc60aQd0zGU6x3ddNV+Ku5JBYNZQzzqArgGERgHWe1mAaRa3h9S
 ixzig4qeE+7NJ/oPR+lDQ1mKNQHrIf2BvzK3OSmurFFwNryaQobrPtobmZuhcGjpBfK9
 phHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fQSQe8AmFNdH7/S8ocBiYkSMiEn25ODIF1so8U4TOrA=;
 b=RLi7XcUFu+fa0soA/aWAKA94hZriCUdeGfAyXK6T0QydhoRMpamt8Y9mVc+PLhbiX5
 DrS9dQ3sHezLGOfR4vfDQ3dKWB/2hsKLSJcP3RAitTBvfSEwuT3ji+AsNNek5UkJBnrR
 rkZFu6VLHrqNiNCFLqdT7Q78eFIHKdje1fr5p0HQoVixNqN6Dig34EW7uxII6UFMMaYr
 7XeSzHfQLUoMMaM4IQ60S8FPDfK85naou37hde7Zwt3tE4glezW7iuzBf7NVpHc9330Y
 19kpHs0JHRUOIu2+uzuEVUo3ZIsUrJIjloq2TJJz/6yy3PfRc3EbNknb0vFJRS2pkvRW
 nFzw==
X-Gm-Message-State: AOAM533WNLCETuNTKGkUhqWwgNchtXZary/xikGC/ZSzckChjtV/+kYd
 vN5cv0TtiaCdSf+VhC/YqEpOaaIqlmc/Hk1p
X-Google-Smtp-Source: ABdhPJwTZyTRI3IzELMAYh1asWJaduUM8sOtbqiTceAtCZnaGCD7Sy8cBC29Ho18XDVOENKgOjD33A==
X-Received: by 2002:a05:600c:4304:: with SMTP id
 p4mr4166695wme.111.1619981708562; 
 Sun, 02 May 2021 11:55:08 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id a9sm9395600wrw.26.2021.05.02.11.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 11:55:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/6] hw/sparc/sun4m: Fix code style for checkpatch.pl
Date: Sun,  2 May 2021 20:54:40 +0200
Message-Id: <20210502185441.599980-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502185441.599980-1-f4bug@amsat.org>
References: <20210502185441.599980-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to move this code, fix its style first.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sparc/sun4m.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index a625c41cd37..956216591b0 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -1181,11 +1181,11 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .dma_base     = 0xef0400000ULL,
         .esp_base     = 0xef0800000ULL,
         .le_base      = 0xef0c00000ULL,
-        .apc_base     = 0xefa000000ULL, // XXX should not exist
+        .apc_base     = 0xefa000000ULL, /* XXX should not exist */
         .aux1_base    = 0xff1800000ULL,
         .aux2_base    = 0xff1a01000ULL,
         .ecc_base     = 0xf00000000ULL,
-        .ecc_version  = 0x10000000, // version 0, implementation 1
+        .ecc_version  = 0x10000000, /* version 0, implementation 1 */
         .nvram_machine_id = 0x72,
         .machine_id = ss10_id,
         .iommu_version = 0x03000000,
@@ -1204,11 +1204,11 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .dma_base     = 0xef0081000ULL,
         .esp_base     = 0xef0080000ULL,
         .le_base      = 0xef0060000ULL,
-        .apc_base     = 0xefa000000ULL, // XXX should not exist
+        .apc_base     = 0xefa000000ULL, /* XXX should not exist */
         .aux1_base    = 0xff1800000ULL,
-        .aux2_base    = 0xff1a01000ULL, // XXX should not exist
+        .aux2_base    = 0xff1a01000ULL, /* XXX should not exist */
         .ecc_base     = 0xf00000000ULL,
-        .ecc_version  = 0x00000000, // version 0, implementation 0
+        .ecc_version  = 0x00000000, /* version 0, implementation 0 */
         .nvram_machine_id = 0x71,
         .machine_id = ss600mp_id,
         .iommu_version = 0x01000000,
@@ -1230,7 +1230,7 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .esp_base     = 0xef0800000ULL,
         .le_base      = 0xef0c00000ULL,
         .bpp_base     = 0xef4800000ULL,
-        .apc_base     = 0xefa000000ULL, // XXX should not exist
+        .apc_base     = 0xefa000000ULL, /* XXX should not exist */
         .aux1_base    = 0xff1800000ULL,
         .aux2_base    = 0xff1a01000ULL,
         .dbri_base    = 0xee0000000ULL,
@@ -1249,7 +1249,7 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
             }
         },
         .ecc_base     = 0xf00000000ULL,
-        .ecc_version  = 0x20000000, // version 0, implementation 2
+        .ecc_version  = 0x20000000, /* version 0, implementation 2 */
         .nvram_machine_id = 0x72,
         .machine_id = ss20_id,
         .iommu_version = 0x13000000,
@@ -1270,7 +1270,7 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
         .dma_base     = 0x78400000,
         .esp_base     = 0x78800000,
         .le_base      = 0x78c00000,
-        .apc_base     = 0x71300000, // pmc
+        .apc_base     = 0x71300000, /* pmc */
         .aux1_base    = 0x71900000,
         .aux2_base    = 0x71910000,
         .nvram_machine_id = 0x80,
@@ -1352,7 +1352,7 @@ static const struct sun4m_hwdef sun4m_hwdefs[] = {
     /* SPARCbook */
     {
         .iommu_base   = 0x10000000,
-        .tcx_base     = 0x50000000, // XXX
+        .tcx_base     = 0x50000000, /* XXX */
         .slavio_base  = 0x70000000,
         .ms_kb_base   = 0x71000000,
         .serial_base  = 0x71100000,
-- 
2.26.3


