Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 548F0500FD3
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 16:02:29 +0200 (CEST)
Received: from localhost ([::1]:57982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf03H-0008Bp-SI
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 10:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <moteenshah.02@gmail.com>)
 id 1nexf6-00084L-KD
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 07:29:20 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:43865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <moteenshah.02@gmail.com>)
 id 1nexf1-0004Wm-Ef
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 07:29:16 -0400
Received: by mail-pg1-x534.google.com with SMTP id u2so4522602pgq.10
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 04:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LEzTAlbhmJy6HQ4f5aoCU83uOi6CNeuJC0p1S7WoYq4=;
 b=MJyTPcLMfw3T7XHFywOmh+L44bSl8tezD4nkHJkSyKvWCcQ1igQjD2F9yBVkfUy0Qj
 dS3DnRNkLK045I2FWXPYlj6pvxqapG16MpcqwhAUz2SGVY7i/jsiN5DbWFPM3TTK1LvH
 lKP7X4DvzjOoPowlOtynNNghhlKC41Jl7xVrB7vn99+2d4fiJeUWLOGVQsCvTh1aHTLY
 7UpwXzn/lH6KaSlCCqvFPmpUDBBjW+fJgbXWvja2FZ+GyKfAyRFtLG6Ccws8mDGSUcs8
 +rI6dNCeQgLIDc+hiwf76+ms7WT3nDN42zOsFfswGDlynw0GOA8RcVYLpkhpxLG7YFC/
 Sobg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LEzTAlbhmJy6HQ4f5aoCU83uOi6CNeuJC0p1S7WoYq4=;
 b=aK6kYtAk/ag4INSUcDzZRCzt+Cd0Re3EJuTlleYbWK2rigXX3JPKDLcR6GTx70DpPY
 i01l2SLHypWd/b3U9bxQXJsRMmgbSXRzxcotBseBFbRidM36925iDxD7AaeCfFpwYoa9
 DWZJjuymWWfja+tXFGgTGcd2jG0dG1gqiRgf81IzxuSzqtWXEuVBtwtPQ/mTQ4uba/+5
 I8nN5PukChxGGAsyaSNuyXHliGL1stfV668WjO8Z+AohViuaBVRnzVyBzo143BGG+qOP
 pp9CAS3zt6nzxurxh0VVdpduE7pIFhkYHsMBoQ23unWRJEc3NIBI0ZX5R38YxlIQAzdZ
 rqcA==
X-Gm-Message-State: AOAM533xztksNK2FjGRtoL1YqOZV+hl9+k6d9457PrLsXOydQbBwJoK2
 fFJaDwRoDoZyzjjGQ3ZM/G7FmdrVbsk9Dg==
X-Google-Smtp-Source: ABdhPJzQYdxnMwBMcpEEiDkj4XZdlVHESBLl8b0rSBJMORUTRSbYxn8Kamq6kf16RONV9PNYL20Kcw==
X-Received: by 2002:a05:6a00:234f:b0:4fa:f52b:46a1 with SMTP id
 j15-20020a056a00234f00b004faf52b46a1mr3475966pfj.32.1649935753653; 
 Thu, 14 Apr 2022 04:29:13 -0700 (PDT)
Received: from localhost.localdomain ([103.199.136.32])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a63b606000000b003808b0ea96fsm1671764pgf.66.2022.04.14.04.29.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Apr 2022 04:29:12 -0700 (PDT)
From: Moteen Shah <moteenshah.02@gmail.com>
X-Google-Original-From: Moteen Shah <codeguy.moteen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1] virtio/virtio.c: include virtio prefix in error message
Date: Thu, 14 Apr 2022 16:59:02 +0530
Message-Id: <20220414112902.41390-1-codeguy.moteen@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=moteenshah.02@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 14 Apr 2022 09:59:15 -0400
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
Cc: Moteen Shah <moteenshah.02@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Moteen Shah <moteenshah.02@gmail.com>

The error message in virtio_init_region_cache()
is given a prefix virtio.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/230
Buglink: https://bugs.launchpad.net/qemu/+bug/1919021``

Signed-off-by: Moteen Shah <moteenshah.02@gmail.com>
---
 hw/virtio/virtio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 9d637e043e..f31427bd41 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -174,7 +174,7 @@ static void virtio_init_region_cache(VirtIODevice *vdev, int n)
     len = address_space_cache_init(&new->desc, vdev->dma_as,
                                    addr, size, packed);
     if (len < size) {
-        virtio_error(vdev, "Cannot map desc");
+        virtio_error(vdev, "Virtio cannot map desc");
         goto err_desc;
     }
 
@@ -182,7 +182,7 @@ static void virtio_init_region_cache(VirtIODevice *vdev, int n)
     len = address_space_cache_init(&new->used, vdev->dma_as,
                                    vq->vring.used, size, true);
     if (len < size) {
-        virtio_error(vdev, "Cannot map used");
+        virtio_error(vdev, "Virtio cannot map used");
         goto err_used;
     }
 
@@ -190,7 +190,7 @@ static void virtio_init_region_cache(VirtIODevice *vdev, int n)
     len = address_space_cache_init(&new->avail, vdev->dma_as,
                                    vq->vring.avail, size, false);
     if (len < size) {
-        virtio_error(vdev, "Cannot map avail");
+        virtio_error(vdev, "Virtio cannot map avail");
         goto err_avail;
     }
 
-- 
2.35.1


