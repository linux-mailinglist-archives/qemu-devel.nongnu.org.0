Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A917331AE0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 00:15:53 +0100 (CET)
Received: from localhost ([::1]:35262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJP6O-0005hq-G1
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 18:15:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lJP2E-0001vm-8X
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 18:11:34 -0500
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:40260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lJP2B-0005ma-JV
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 18:11:33 -0500
Received: by mail-qk1-x735.google.com with SMTP id l132so11211638qke.7
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 15:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aoM0M/DyXZftEA9Ex3Gu16FrflMwJF8lgoZOVYhOnRQ=;
 b=Tq2LEKeA71/8Ua0E/3BNhFRZXma12M/qJYMqDjs+TOsByx7bNV5/rm4Xfqg2PNZ7p2
 qM89GT7dYdi64nNLbZmKvgx06f3mFCGqFTuXUvVs+STPyBtQ+aKfN8MFFALGsxBBt/7n
 /OSTIkrRi4bsHwVXgMSeM/t5WbfJbGLHm1FSs+9cD7nhK7fMeY7Ah+G7ElFghqH53LAc
 wiQR5FaYcGhYLEXZapVTLCVdpuioweqIQqcMcis6zePGGA6hWxheMKbHcSp469KInbMp
 ajGNsfqNQP1Kt7mXRCYL1o9J3BRcDBF++lGorrbEcY7vEA++J94rKz/OTYQepnMSfHWg
 EJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aoM0M/DyXZftEA9Ex3Gu16FrflMwJF8lgoZOVYhOnRQ=;
 b=ki1f84nIzkdmUfw+8sKHXawKK29tHbPDm1+L+2DBMg/tyohNgDJmtWbsecSdQQnVoY
 yJr8hv31qyOfiIhUj/zyDbW2t69h+6J501fMx/rfcFjXLRiDxOI4DzBYg4PXK8rKxa3H
 xbBXaCz1B+e6y+zwr4gFhyRiMCnBHUjWpe//TiPQgpVTXkH91c/LfohTpIPqvRFOUdPE
 3hRNGyc5ltYzsrAJjaGicR5/OCtlbpP+29VoYMuvRvI+PjVk6BBy6kABVP7lreA00xwk
 QPcV/pnwlwFB5oGrYZErmk2ezqD+V85FUD+62VmlN+jEMDM0j4ihTeKz05izoGCEXDH0
 IPMQ==
X-Gm-Message-State: AOAM530+ukcbxDVRUqD2MN0RpWfVa7n6YlCL7s5vzTN8a5NNtyoiITmP
 iCysi5+Lwbaxzazv8OP+MalrOepTZUrnbA==
X-Google-Smtp-Source: ABdhPJxiMUNLsUXnE5xJFBUzV4hC22/EKUYAZZkyyE31tZzsZRHI6l4W1k5Lg0e8MoxYpjMNI8L4ng==
X-Received: by 2002:a05:620a:31c:: with SMTP id
 s28mr22950255qkm.342.1615245090764; 
 Mon, 08 Mar 2021 15:11:30 -0800 (PST)
Received: from cube.nuviainc.com (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id z6sm3312342qto.70.2021.03.08.15.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 15:11:30 -0800 (PST)
From: Rebecca Cran <rebecca@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v2 3/3] target/arm: set ID_AA64ISAR0.TLB to 2 for max AARCH64
 CPU type
Date: Mon,  8 Mar 2021 16:11:17 -0700
Message-Id: <20210308231117.12650-4-rebecca@nuviainc.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210308231117.12650-1-rebecca@nuviainc.com>
References: <20210308231117.12650-1-rebecca@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=rebecca@nuviainc.com; helo=mail-qk1-x735.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Rebecca Cran <rebecca@nuviainc.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Indicate support for FEAT_TLBIOS and FEAT_TLBIRANGE by setting
ID_AA64ISAR0.TLB to 2 for the max AARCH64 CPU type.

Signed-off-by: Rebecca Cran <rebecca@nuviainc.com>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index c255f1bcc393..e1003fd96138 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -651,6 +651,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
         t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
+        t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2);
         t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);
         cpu->isar.id_aa64isar0 = t;
 
-- 
2.26.2


