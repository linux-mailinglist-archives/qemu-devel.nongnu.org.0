Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5902FF7CF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 23:17:44 +0100 (CET)
Received: from localhost ([::1]:41080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2iGt-0005Zp-FC
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 17:17:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2i8x-0006Sl-N3; Thu, 21 Jan 2021 17:09:38 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:46206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2i8r-0000MM-Ls; Thu, 21 Jan 2021 17:09:29 -0500
Received: by mail-pf1-x435.google.com with SMTP id f63so2359940pfa.13;
 Thu, 21 Jan 2021 14:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=gq79wtNdkMEoBleQb6W3xZAzvk0xvFQyqyLanl+JX3c=;
 b=NcWsWdhRa+KlpCqhKsMYzihSn6S/0NRtGWLxGEdSIg/dkH3SDP+8wbOwl+BnnRfIrd
 7VFskzq/VM9+1zkHf9jB1YSGZbGyJ/Viw0gNCOKibOydMTElqV2jmHCznGanAJRmCbUS
 Nddbn7MCX9OmON/WEPTIMUzlP6CIse9dCd9Cq5SDlsPjBPRMIb6TD2f/A4teBlIwhHCm
 JCGI4E2xziVwrkbSNwiINdZcN55csF5daJCV5VxX+V1zbDcwboFN/Bk6WeEcU53LYfqO
 Qe1Hgi4PlJVx9UxosmTHEdDseXR9k33mJnHvuBYCxc9cQ/Mm3/MlrXrMWKhdngQTk+mS
 tnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=gq79wtNdkMEoBleQb6W3xZAzvk0xvFQyqyLanl+JX3c=;
 b=pYPet907hD+eHhF5ytpsMLMcj+EJA58DYLrrl96sWZfnCC9HRwBSqRohFvFKjH3pbe
 5qjzuBvw44slrZPrEN41KPerwrKbDH11DOdEo55JZgcT3Dq6PNQcoObXz+XJ8tFjvJKt
 deo+EVp36WImbeIJdgUbLIYZAhca/Yhp5T+Z+cvIxFE6Mh9pMhvj4SRYHTrSqcpQa78h
 LatYNj8Dtv0OmORis5FXZ2zMbkWorgd93liHuMrTMSgYZ/5l7EqEl3YCP/XSzNN53zxM
 7PkR4UU1VTXy8SoZ/26a3795yeN+qUMJav3wzT5Hfsh3YzIdQfzJ9/AMGbcgnJW1et5Y
 Uwjw==
X-Gm-Message-State: AOAM533KbJ5IDDZPr9vPmOVisU/Q4NHSaOn1+tjfdnl4i5DpeOEhQxRD
 zwr92X65Q4qOUDBSpgc8qQN2CIQOab6Mmg==
X-Google-Smtp-Source: ABdhPJxtGAeDi46Meq3fXmbkoY2lkNUmXp1jCUsy3CFgyOjg6zwYWuw0CY1Awo1/Tnm7M3aV7JtHug==
X-Received: by 2002:a62:844b:0:b029:19e:62a0:ca18 with SMTP id
 k72-20020a62844b0000b029019e62a0ca18mr1596570pfd.46.1611266963850; 
 Thu, 21 Jan 2021 14:09:23 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id c8sm5584308pfo.148.2021.01.21.14.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 14:09:23 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V4 3/6] hw/block/nvme: add CMIC enum value for Identify
 Controller
Date: Fri, 22 Jan 2021 07:09:05 +0900
Message-Id: <20210121220908.14247-4-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210121220908.14247-1-minwoo.im.dev@gmail.com>
References: <20210121220908.14247-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x435.google.com
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Added Controller Multi-path I/O and Namespace Sharing Capabilities
(CMIC) field to support multi-controller in the following patches.

This field is in Identify Controller data structure in [76].

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 include/block/nvme.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index e4b918064df9..d6415a869c1c 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1034,6 +1034,10 @@ enum NvmeIdCtrlLpa {
     NVME_LPA_EXTENDED = 1 << 2,
 };
 
+enum NvmeIdCtrlCmic {
+    NVME_CMIC_MULTI_CTRL    = 1 << 1,
+};
+
 #define NVME_CTRL_SQES_MIN(sqes) ((sqes) & 0xf)
 #define NVME_CTRL_SQES_MAX(sqes) (((sqes) >> 4) & 0xf)
 #define NVME_CTRL_CQES_MIN(cqes) ((cqes) & 0xf)
-- 
2.17.1


