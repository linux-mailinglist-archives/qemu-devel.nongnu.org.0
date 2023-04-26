Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F0F6EF863
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 18:25:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prhxU-00073Q-Ob; Wed, 26 Apr 2023 12:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1prhxQ-00072r-2p
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:25:30 -0400
Received: from esa7.hc2706-39.iphmx.com ([216.71.137.80])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1prhxO-0006iv-2d
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:25:27 -0400
X-IronPort-RemoteIP: 209.85.222.200
X-IronPort-MID: 276150411
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:3OVDwqI5T4iG2NnFFE+RapclxSXFcZb7ZxGr2PjKsXjdYENShGdWz
 TEaXjjQbKnZM2r2eNAlaNiyoUgPvZ7UyN8yS1dorCE8RH908vbIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOOn9T8kjvvgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziJ2yDhjlV
 ena+qUzA3f4nW8lWo4ow/jb8kg34K6s4GlwUmEWPpingnePzxH5M7pCfcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aue60Tqm0xK6aID76vR2nRHe545gXBYqhea7vB3S9zx54
 I0lWZVd0m7FNIWV8AgWe0Aw/y2TocSqUVIISJSymZX78qHIT5fj669rAEIJIIIywPQ0EDFs1
 NMZdBk1bx/W0opawJrjIgVtrsEqLc2uJYBG/386lWmfAvEhTpTOBa7N4Le03h9q3pEITauYP
 ZBDL2A3NHwsYDUWUrsTIJs6jOGknFH1bntVpE/9Sa8fuTeNlVEpjOG0WDbTUo3WbMxOxXipn
 z/p3kXSEihKb/qayhPQpxpAgceKx0sXQrk6DbC967tmjUOewkQVDxsZU0b9puO24nNSQPpaI
 k0QvzMt9O08rhTzCNb6WBK8rTiPuRt0t8dsLtDWITqlksL8izt1zEBdEmEZADD6nKfanQAX6
 2I=
IronPort-HdrOrdr: A9a23:qmTFV6ik1tiNBjnciSCKlXFfUHBQXgwji2hC6mlwRA09TyVXrb
 HLoB19726JtN91YhsdcL+7Sc+9qB/nhPxICMwqTMyftWrdyRaVxf9ZnPLfKlTbckWUh41gPO
 VbAtJD4bXLbWSS5vyKhzVQfexQpeWvweSDqd2b4U1QbTxHXYld0iYRMHflLqS0fmV77FgCea
 Z0KvAom9PZQwVuUi1zPBZlY9T+
X-Talos-CUID: =?us-ascii?q?9a23=3AWGO+e2lXUwx09LGKheM9eOFxbxvXOSfYwHTvPkC?=
 =?us-ascii?q?SM3QqWe23aHCRpIpcksU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AFlPTAw9RksNWxecreJB2R8aQf5Y0yq21U348qMg?=
 =?us-ascii?q?pmuivJRUgYBGYjx3iFw=3D=3D?=
Received: from mail-qk1-f200.google.com ([209.85.222.200])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Apr 2023 12:20:24 -0400
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-74d62b70922so1142145485a.3
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 09:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1682526023; x=1685118023;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y8lqfGW40ktWobrkJtbGNnWDtsD/7tWAErgFuibUF9w=;
 b=FEYlrYCHHuX4QmzFaQ5KfpQhp00jrDbB9ZRDOMynR4KFyHWbhgl6Nork4IyBDFGuKn
 v5DrH3r3yVUuFuABYUNFh9xy1Q41lrGPJXz0QIIP5HCuH+0xE1BNSkCJK1wqtOAUW6nW
 rB6s1QsKlZcMiDJBbf0xawxp4anmNIfdit+8kSWpnNJ+rB6c7rM6a8Megz06kJ6/8XY/
 VAJB/+M38DwmBWuIU3fr7HEzasGtpl5/YnINdmoHUwybZqnbbGmeEnTA0Y6adtSIMO9n
 xQ3sXtF+Vl77JNp81kpM9uJgO3FBgIal6ak+SecSlICrFQf0FhskjBa484ouYB9MZiTn
 cSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682526023; x=1685118023;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y8lqfGW40ktWobrkJtbGNnWDtsD/7tWAErgFuibUF9w=;
 b=N3U1Eyhe1Kh/9TyHSJLZgzo/G4Z/fh+vGpsBTzD/PjmqdAzk4OmMRD1pTcFP3eaEDS
 Oh1BmKtRxJSJ3/TkD7nW0qM6/3RCPsy/TnpGSKQHqs4Ris9hZTAIVWn4CgL0cZ6xZsoc
 ESUB9qt8+wtwMl0WqIfpRkjYpl4jT2XerUIF0vp8whaC+H1+O831naecK/G4bHnyOfMj
 PLe5g9TSH+45gT2ZQRSubt74aL2ervUunpI1bBeCghi+X4Mz5uilQKNMn71pOpHPZJZY
 K3FWsteeSrUo+67tVOYnXbO6kMoY+bGrGtl0ct3M+dbQAyn2zc2aJtSc99E6cgFKyP0W
 ckVA==
X-Gm-Message-State: AAQBX9d3ABVnql4VY4tNee62ketMfzcbHn5o9nG+Ny/im9oTcXnL/Yo1
 VpATwePI/UIWdSOOImsfd9IZNHYAPThZ3uE5V1hwDPlRIH9q0d6RyBwrDgHLB4CJT46NF+H4uV7
 YnqU0lb7qgCqPyVRBlAuGYrz4HQ9Zp0ctoACt5wyEpwM=
X-Received: by 2002:a05:6214:d67:b0:5ef:46a9:15d2 with SMTP id
 7-20020a0562140d6700b005ef46a915d2mr40741316qvs.7.1682526022963; 
 Wed, 26 Apr 2023 09:20:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350aDDhrY6YFKE9X7SgJ6MzvzBVadcWbwKdF+LFCJ3AQz2pkJzC5OKajgqomyhuFMm3gRhZyNpg==
X-Received: by 2002:a05:6214:d67:b0:5ef:46a9:15d2 with SMTP id
 7-20020a0562140d6700b005ef46a915d2mr40741269qvs.7.1682526022721; 
 Wed, 26 Apr 2023 09:20:22 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 z18-20020a0ca952000000b005dd8b9345d3sm4939392qva.107.2023.04.26.09.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 09:20:22 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org (open list:Block I/O path)
Subject: [PATCH v9 7/8] memory: abort on re-entrancy in debug builds
Date: Wed, 26 Apr 2023 12:19:50 -0400
Message-Id: <20230426161951.2948996-8-alxndr@bu.edu>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230426161951.2948996-1-alxndr@bu.edu>
References: <20230426161951.2948996-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.80; envelope-from=alxndr@bu.edu;
 helo=esa7.hc2706-39.iphmx.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.266, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is useful for using unit-tests/fuzzing to detect bugs introduced by
the re-entrancy guard mechanism into devices that are intentionally
re-entrant.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 softmmu/memory.c | 3 +++
 util/async.c     | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index af9365bb81..d038633a6c 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -547,6 +547,9 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
         !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
         if (mr->dev->mem_reentrancy_guard.engaged_in_io) {
             trace_memory_region_reentrant_io(get_cpu_index(), mr, addr, size);
+#ifdef DEBUG
+            abort();
+#endif
             return MEMTX_ACCESS_ERROR;
         }
         mr->dev->mem_reentrancy_guard.engaged_in_io = true;
diff --git a/util/async.c b/util/async.c
index a9b528c370..2dc9389e0d 100644
--- a/util/async.c
+++ b/util/async.c
@@ -160,6 +160,9 @@ void aio_bh_call(QEMUBH *bh)
         last_engaged_in_io = bh->reentrancy_guard->engaged_in_io;
         if (bh->reentrancy_guard->engaged_in_io) {
             trace_reentrant_aio(bh->ctx, bh->name);
+#ifdef DEBUG
+            abort();
+#endif
         }
         bh->reentrancy_guard->engaged_in_io = true;
     }
-- 
2.39.0


