Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C114343BA4
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 09:26:01 +0100 (CET)
Received: from localhost ([::1]:37258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOFsu-0005Mg-LX
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 04:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lOFrm-0004pg-3B; Mon, 22 Mar 2021 04:24:50 -0400
Received: from mail-pj1-f48.google.com ([209.85.216.48]:36657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1lOFrk-0001gw-M4; Mon, 22 Mar 2021 04:24:49 -0400
Received: by mail-pj1-f48.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so10073156pjh.1; 
 Mon, 22 Mar 2021 01:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fl3OQjdbtb4zTynG/YTW6tsfd9xdCAiC3RsTypoYN+0=;
 b=qTqcRIKl4jDBdkm0ZDxETvV/s20jFK4zOLhc7vx6sxYIkUzr96fMUTX77DvphCfMsf
 ZG4wJqZT/aIdkEnjqM8O1TaL20X/gvi7p7t5WkgU5gk8b4n59XPmOqNbQ58ZRLJdWskg
 8DE/JWQrK0B2BxUsidLlZoPQjIvQ+so7EAmNqvtnKFWD+aT8roWt8g1oV91btjh+QhtS
 z630Bju/XrtD2v0d1o+mM5nG0o69Cv5Xbj8AeBqGIb9kSWTLWC3kCtxFF/2cykrrlCMG
 L7jtoXHkYtdGfUHXH1rqBgNc0+k5Vvw0732yqtLQVDeB2YYkV/O25aOrq+5XsLWowZQl
 l3Vw==
X-Gm-Message-State: AOAM530S6/XdutQwyiOjVoE2p6d+DiFN1w/K+DiqyKa228Qft1kcFO9I
 h+jB3z0mAAFhsDjNVwsakJZPCd+qFQIkwg==
X-Google-Smtp-Source: ABdhPJyCWCoPbYIeZCZeheaSdbYbd3sEm3D+Kc8axb2cFSBl4ekvx7J5eSPI5XqLOYG877sa+DYYOg==
X-Received: by 2002:a17:902:c083:b029:e4:84c5:6ac8 with SMTP id
 j3-20020a170902c083b02900e484c56ac8mr26399494pld.71.1616401486186; 
 Mon, 22 Mar 2021 01:24:46 -0700 (PDT)
Received: from localhost.localdomain ([73.93.153.15])
 by smtp.gmail.com with ESMTPSA id y7sm13095917pfq.70.2021.03.22.01.24.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Mar 2021 01:24:45 -0700 (PDT)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Subject: [PATCH] nvme: expose 'bootindex' property
Date: Mon, 22 Mar 2021 01:24:44 -0700
Message-Id: <20210322082444.12916-1-j@getutm.app>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.216.48; envelope-from=osy86dev@gmail.com;
 helo=mail-pj1-f48.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:nvme" <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Joelle van Dyne <j@getutm.app>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The check for `n->namespace.blkconf.blk` always fails because
this is in the initialization function.

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 hw/block/nvme.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 6842b01ab5..42605fc55d 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -6330,11 +6330,9 @@ static void nvme_instance_init(Object *obj)
 {
     NvmeCtrl *n = NVME(obj);
 
-    if (n->namespace.blkconf.blk) {
-        device_add_bootindex_property(obj, &n->namespace.blkconf.bootindex,
-                                      "bootindex", "/namespace@1,0",
-                                      DEVICE(obj));
-    }
+    device_add_bootindex_property(obj, &n->namespace.blkconf.bootindex,
+                                  "bootindex", "/namespace@1,0",
+                                  DEVICE(obj));
 
     object_property_add(obj, "smart_critical_warning", "uint8",
                         nvme_get_smart_warning,
-- 
2.28.0


