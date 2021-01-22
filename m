Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCBA2FF98E
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 01:44:35 +0100 (CET)
Received: from localhost ([::1]:43118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2kYz-0002j5-Vj
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 19:44:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3jx8KYAMKCvwhniksskpi.gsquiqy-hiziprsrkry.svk@flex--dje.bounces.google.com>)
 id 1l2kXU-0002Fx-RA
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 19:43:00 -0500
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649]:54723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3jx8KYAMKCvwhniksskpi.gsquiqy-hiziprsrkry.svk@flex--dje.bounces.google.com>)
 id 1l2kXS-0002SS-Ls
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 19:43:00 -0500
Received: by mail-pl1-x649.google.com with SMTP id u7so2092067plg.21
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 16:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=SR6FBTX2omZf3YEVC7Vh4kmiv+O6hz92MhCWmhtza6U=;
 b=qInTQ07yoH7M2ik9bz4DRhSZZFpzVG4F50pFClkVL/eydX63eXB2d2VMR6SSR29YbK
 HZPn3jkzSsVtSG0AmX1FTyLzbjFIQF/KmYoyEgxTzjG5mHZsBrtf+6dwQpkfkA5PqVUT
 Fq2VrsgFYKQCtet6r9gGXS3f99gNxGvIhUuCi67N8yvvRVvawr+lO5pJ1tHQ/eQAZJc0
 e6CusZvo6yQhDobMOvyF0Kisq19R5Z0ye1XPPLJuWuDtLmE8TWIOOt0w+qSAddCIX/4z
 FZcb1w9PHLiI7Bu8mmtogXiBp4GtAwX0GJIkbM/7Irr1GjAREPVq0EoUbZhU2geoOOlx
 H50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=SR6FBTX2omZf3YEVC7Vh4kmiv+O6hz92MhCWmhtza6U=;
 b=s5J4OomSGAOCNYoIE1WRClx9EUy0W68ZlqVTmjq3E5hD6+usoN2ez+VohykDeJc/MH
 twnEuqW0ci4zN+aORewlMTW/lD3bHZoopAA2vdM5bmfwpCbeXR9Mw13iyknKXP/smTYy
 K43HaEnSWXTRKVDpupPV9rCjzokWixafNua55k/cEwPfAvdQpbKRc3FHOGHXDBlGeNfy
 XZIlcjd+UZEzXIn59GAxKe4rFp4Ci+Q8Ofe5fPOH/0JssSvFJ38Xwno5v/YmuUIs7taT
 rXSczs2JfjbAMJXBBQ9d37Vdxmlur+Q9xC8m60fnp34sgykHIYRE/M3dfuF1uWgKjLPi
 bBvQ==
X-Gm-Message-State: AOAM5333O1ugnHe0aalzfZkyDaNtJYLZT/SXRHu6dPcYxnSI0Tzs5w2Z
 qbZ1XfrOb1qk7AhhCvRuSwreSTagaReONnHQI6r1Ev0HpRjz4417prtzdIjcjmo9EpXwa/+Wr+Y
 He7AY0RlLV1GnOCbo3srMVW2T6HOPg8wp2/PxY6t0tubgUv1S5zOk
X-Google-Smtp-Source: ABdhPJyhka9SmNAH2Z1QZCta9QNHSLQbFcn3pSab5cEwNqyUGJh/QYKWzAIkCiLllCRi5X4hRnaR4n4=
X-Received: from ruffy.mtv.corp.google.com
 ([2620:0:1000:1412:4a0f:cfff:fe66:e570])
 (user=dje job=sendgmr) by 2002:a17:90b:107:: with SMTP id
 p7mr2289569pjz.110.1611276175150; 
 Thu, 21 Jan 2021 16:42:55 -0800 (PST)
Date: Thu, 21 Jan 2021 16:42:51 -0800
Message-Id: <20210122004251.843837-1-dje@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH] net/slirp.c: Fix spelling error in error message
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::649;
 envelope-from=3jx8KYAMKCvwhniksskpi.gsquiqy-hiziprsrkry.svk@flex--dje.bounces.google.com;
 helo=mail-pl1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, Doug Evans <dje@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Doug Evans <dje@google.com>
From: dje--- via <qemu-devel@nongnu.org>

DNS should be DHCP

Signed-off-by: Doug Evans <dje@google.com>
---
 net/slirp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/slirp.c b/net/slirp.c
index 8350c6d45f..be914c0be0 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -473,7 +473,7 @@ static int net_slirp_init(NetClientState *peer, const char *model,
         return -1;
     }
     if (dhcp.s_addr == host.s_addr || dhcp.s_addr == dns.s_addr) {
-        error_setg(errp, "DNS must be different from host and DNS");
+        error_setg(errp, "DHCP must be different from host and DNS");
         return -1;
     }
 
-- 
2.30.0.280.ga3ce27912f-goog


