Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0F631C5E4
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 04:49:52 +0100 (CET)
Received: from localhost ([::1]:42466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBrN1-00038I-83
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 22:49:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lBrKp-0001Qf-BS; Mon, 15 Feb 2021 22:47:35 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lBrKn-0002eQ-Mq; Mon, 15 Feb 2021 22:47:35 -0500
Received: by mail-ed1-x535.google.com with SMTP id h10so5831617edl.6;
 Mon, 15 Feb 2021 19:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BDo04eiVdRpSfmb3nBH2DvGZY71bds0sndzN9THAQNs=;
 b=sQ+1aOYeBDt7smtQpThd/jtSahXt733c/CvTNIXKR8C+gAO8O88QNShMckJe/Ey5N8
 2pkhplfbRTGM7FbpZU3LfsMWH73CtRXwP48TIH675lzNBihmgnf/hIc+5rsn2PRV6cml
 d5STP7/iDwslbpVkgqMEuvOV1x+n1mHpFFGeXxsGCzh+M58g20wihtxKx/GMxQ8/+JXy
 W99MwW9Ujq/TALT+M8BvpT1T++CR039Ccfuw8sZepwZw1vHIdYUtU5lAs3X51rI0y/KJ
 +fc2ThQuUKIyrBnqfheq9VCwtCT26gEGS3wcG32gAOXHNZhrHMDxO+D5/6Flk7uhKdoa
 0vDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BDo04eiVdRpSfmb3nBH2DvGZY71bds0sndzN9THAQNs=;
 b=VBIO9lXEK9zKy+zcmrMPBs9aUidugWv4DhUc2Yyc8PUqDw1yp1DIg158lGI9bUI/Zq
 mgEEiLqtzCjDRN5G4jvYt0epR0RIXEA4OekdmUiPwvYR49KVxdwUQNIsZ4EGvYRPnXDw
 8gZMx6u/UoeSbKOdbUE7NAtySCEO/scNDzcKVMfAtfJpml0jJkJ1vyLa0wttC3mAlltc
 33WP5SStaF27ZHOKuWFxhlZrHggnz5Ml/QrwLnrehWn3zeQ2b36faMz6NV9VPLpAlOCf
 tPMndYbmHSraKvzXPDJ/5Hd19Tt6sq0xp1HbPljIF7k/gxSZZJFvNXIDEEqaMvR8PO01
 LOZA==
X-Gm-Message-State: AOAM531Hdx5QxzmEq12j1xVo4WUhQlVMakOvZrvx7KtFlefP7apSckf0
 J8+dfC0ZrR3ovc5Yt0uKWcg=
X-Google-Smtp-Source: ABdhPJwp0KtsKaiV9w1lTB9eOotq7hEaeHlowNxRE3GBJuLAilIVZZYIbJQTyJ5X9Xs74rZjjJYdOQ==
X-Received: by 2002:a50:be8b:: with SMTP id b11mr13147102edk.145.1613447251804; 
 Mon, 15 Feb 2021 19:47:31 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id z19sm12837866edr.69.2021.02.15.19.47.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Feb 2021 19:47:31 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Li Qiang <liq3ea@163.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Prasad J Pandit <ppandit@redhat.com>, Bandan Das <bsd@redhat.com>
Subject: [PATCH v2 4/6] hw/sd: sdhci: Simplify updating s->prnsts in
 sdhci_sdma_transfer_multi_blocks()
Date: Tue, 16 Feb 2021 11:46:52 +0800
Message-Id: <1613447214-81951-5-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
References: <1613447214-81951-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

s->prnsts is updated in both branches of the if () else () statement.
Move the common bits outside so that it is cleaner.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

(no changes since v1)

 hw/sd/sdhci.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 0b0ca6f..7a2003b 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -598,9 +598,9 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
         page_aligned = true;
     }
 
+    s->prnsts |= SDHC_DATA_INHIBIT | SDHC_DAT_LINE_ACTIVE;
     if (s->trnmod & SDHC_TRNS_READ) {
-        s->prnsts |= SDHC_DOING_READ | SDHC_DATA_INHIBIT |
-                SDHC_DAT_LINE_ACTIVE;
+        s->prnsts |= SDHC_DOING_READ;
         while (s->blkcnt) {
             if (s->data_count == 0) {
                 sdbus_read_data(&s->sdbus, s->fifo_buffer, block_size);
@@ -627,8 +627,7 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
             }
         }
     } else {
-        s->prnsts |= SDHC_DOING_WRITE | SDHC_DATA_INHIBIT |
-                SDHC_DAT_LINE_ACTIVE;
+        s->prnsts |= SDHC_DOING_WRITE;
         while (s->blkcnt) {
             begin = s->data_count;
             if (((boundary_count + begin) < block_size) && page_aligned) {
-- 
2.7.4


