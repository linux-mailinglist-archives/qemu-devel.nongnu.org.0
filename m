Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E19C82FBD32
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 18:08:52 +0100 (CET)
Received: from localhost ([::1]:47720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1uUt-0004Jh-Oz
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 12:08:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1uOU-0008Lh-4I; Tue, 19 Jan 2021 12:02:14 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:43989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1uOQ-0003H3-1q; Tue, 19 Jan 2021 12:02:13 -0500
Received: by mail-pl1-x62e.google.com with SMTP id x12so10840327plr.10;
 Tue, 19 Jan 2021 09:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZS4AAceOWkt11M3JMlg76caf7C9tWZ1B4JbRoZNTgFE=;
 b=DHoMiCFVm7+qsnVehZ+0/PLr+r4KO4xnOLrzDfbL1iWaUde81vD4f++ecaA6g2cXKj
 oqGpmWPvbniMNwiRD0VTIg26w8UaAAYEHFXAZbVMNh96UaIY5gbGvKLxQnCTFr/d0WHL
 2R0qOs1IiEGM7WHkp1Pw1zs/XsVbyxQ2vzZ9mFzwyudARoZNAia4ebJVym0qzUsxYe6F
 SyfsLZ8yM2h2mBUu2gv/msRrip08U0gZXrCLEHSizurnOo+zYYmOWhWc/sf/D71bL+uL
 9BrzbLz0fPmduzFz3O2/vfmRi7E0osm8XhYcJDBveGOw4ACt3uZTwOf0pFYuZNGWvGDa
 k5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZS4AAceOWkt11M3JMlg76caf7C9tWZ1B4JbRoZNTgFE=;
 b=boPc7u0RQzGlia1Z4XTti3AmyhqdxH9vTZ1y3bqGAjRJC+Mxc50G0j9ZUF6Um0KT7D
 BnS1kzZlYLLTQ7qoREW5q09bX+IYbFOSMKvBY01K0/wRpCDGNpkEesGTkCDOPRIJLRlX
 6ywytKsYqihxqP+n6O8GRKM+OKyJboHYH1srtIxsFyiCycOx2qiq2/XG32/mXTN47YSX
 i1OFZlI5OcnAbMT/1OhJJpTfuD+PSRvIUPvafU3gHilRcptjmYzCLZR0WbwFyWKa43SJ
 lhlV5ikTCi8P2JVdfT35ED1HwM2g6k1qFyzubcJM6lq/d2jJ0RmFL2E713T/HPhFPoWF
 IUpg==
X-Gm-Message-State: AOAM531nItLQsCfeFMQQs3A2Ft8u8ZZEj8lJuhiZIJKrXAKdnbsu0U7o
 BgRIeA796JeBYLJxvwuUKYNCI8iwnRzhgg==
X-Google-Smtp-Source: ABdhPJzxkPl+E+KXGVq++vfLnmQilRzQ5sPwFZns5gaikJPGTFKEf/RIptRgbYlnGCpDQc2oYA1unQ==
X-Received: by 2002:a17:90b:8d7:: with SMTP id
 ds23mr680569pjb.116.1611075728168; 
 Tue, 19 Jan 2021 09:02:08 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id m4sm19396001pgv.16.2021.01.19.09.02.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 09:02:07 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC PATCH V3 5/8] hw/block/nvme: add NMIC enum value for Identify
 Namespace
Date: Wed, 20 Jan 2021 02:01:44 +0900
Message-Id: <20210119170147.19657-6-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210119170147.19657-1-minwoo.im.dev@gmail.com>
References: <20210119170147.19657-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x62e.google.com
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

Added Namespace Multi-path I/O and Namespace Sharing Capabilities (NMIC)
field to support shared namespace from controller(s).

This field is in Identify Namespace data structure in [30].

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 include/block/nvme.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 733fb35fedde..28404a62b9d2 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1110,6 +1110,10 @@ enum NvmeNsIdentifierType {
     NVME_NIDT_CSI               = 0x04,
 };
 
+enum NvmeIdNsNmic {
+    NVME_NMIC_NS_SHARED         = 1 << 0,
+};
+
 enum NvmeCsi {
     NVME_CSI_NVM                = 0x00,
     NVME_CSI_ZONED              = 0x02,
-- 
2.17.1


