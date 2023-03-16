Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C506BCF70
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 13:28:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcmiC-0006lN-Ux; Thu, 16 Mar 2023 08:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pcmiA-0006kb-5p
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:28:02 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pcmi8-000386-EM
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:28:01 -0400
Received: by mail-pl1-x635.google.com with SMTP id v21so1536311ple.9
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 05:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1678969679;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n1R+aEVDBOJIlT2PKegpb/El2YxGuu/QJmhVuq/d/KI=;
 b=6gAzhUuqDYnGMeJu8JpHQ+gmAAL0D3uEMhY+m5n/RLcddY+c0em/k//rARm5pTEPwG
 2de/Xm17hVKTE9yGEyvIJL+6FoyPbg9Lzw9f3nrKLaj2R1GFiPo0q3cmIIWf8kUtdI3Y
 pjXBAMJsfcNzW9g0BTF/bgUqbvsY5vkZJWpln6l4oItFNuysIQAH/DIUh3QoK5ISAXs/
 xhIXFecStcWDoxl2OZX3Mc7hm6q7clP3VA1pRiWA2xSOK4WF8m0X4r9Z2em3jy81uLWy
 3OOZU4GOVKX5wNAG6AwkHZwgtb3LmfKLXKn1rwZmUfetOO4Q8QnmyhFcjprDrs1LIffI
 Tuxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678969679;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n1R+aEVDBOJIlT2PKegpb/El2YxGuu/QJmhVuq/d/KI=;
 b=RDKfGpTe91yw5ZCWFgdc51e8WDhirkQCYfxG7ioioSgchO4M4OfpDCjNgy2mvwikLi
 ZIkaidnzjeHPTrPwhH22mQ6Bq9HQ1D3zTm10rwYnjVoxER05iOdBVtKNlKmCuaGBuedn
 nUw4dom9UI11hWhj6WuGHjWPEUCwxCVHfjBo177318NAVKCIdNuCsDNxxIm31Z6BxESo
 0qUmRhFklbccW/SscCHR6xRne6ys2I6LkPni7EgkKLN4iI55aZBKwam7wJSSHtxnsrUg
 KGcmDa+NbuzUEHbuzQmAfnojgMb7uH4/RPdx+w/Em0kuHaMoDzPTd0Xd4j6EyIButb5R
 uDTg==
X-Gm-Message-State: AO0yUKVk8xwXkPj48cZtVTpl0zguJzxCvUxC9ZCPH/W3cd3F7r1auM0y
 OP5hZVUb2Q9nROcdv0rzVAtlOJTTE+mO2hm+/Zd9nA==
X-Google-Smtp-Source: AK7set8BvHddn1wsaXIEqFATcG3Z5v44fd0yqsvesxDWis5xF0QrsH9zL6Ep+itfZP07JPswmlLcew==
X-Received: by 2002:a05:6a20:7f9c:b0:d4:bc25:4a05 with SMTP id
 d28-20020a056a207f9c00b000d4bc254a05mr4180149pzj.49.1678969679033; 
 Thu, 16 Mar 2023 05:27:59 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a63cc49000000b00502fd70b0bdsm5108161pgi.52.2023.03.16.05.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 05:27:58 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Alexander Bulekov <alxndr@bu.edu>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH for 8.0] hw/net/net_tx_pkt: Ignore ECN bit
Date: Thu, 16 Mar 2023 21:27:51 +0900
Message-Id: <20230316122751.10907-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::635;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

No segmentation should be performed if gso type is
VIRTIO_NET_HDR_GSO_NONE even if ECN bit is set.

Fixes: e263cd49c7 ("Packet abstraction for VMWARE network devices")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1544
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/net_tx_pkt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
index cb606cc84b..efe80b1a80 100644
--- a/hw/net/net_tx_pkt.c
+++ b/hw/net/net_tx_pkt.c
@@ -796,11 +796,13 @@ bool net_tx_pkt_send_custom(struct NetTxPkt *pkt, bool offload,
 {
     assert(pkt);
 
+    uint8_t gso_type = pkt->virt_hdr.gso_type & ~VIRTIO_NET_HDR_GSO_ECN;
+
     /*
      * Since underlying infrastructure does not support IP datagrams longer
      * than 64K we should drop such packets and don't even try to send
      */
-    if (VIRTIO_NET_HDR_GSO_NONE != pkt->virt_hdr.gso_type) {
+    if (VIRTIO_NET_HDR_GSO_NONE != gso_type) {
         if (pkt->payload_len >
             ETH_MAX_IP_DGRAM_LEN -
             pkt->vec[NET_TX_PKT_L3HDR_FRAG].iov_len) {
@@ -808,7 +810,7 @@ bool net_tx_pkt_send_custom(struct NetTxPkt *pkt, bool offload,
         }
     }
 
-    if (offload || pkt->virt_hdr.gso_type == VIRTIO_NET_HDR_GSO_NONE) {
+    if (offload || gso_type == VIRTIO_NET_HDR_GSO_NONE) {
         if (!offload && pkt->virt_hdr.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) {
             net_tx_pkt_do_sw_csum(pkt, &pkt->vec[NET_TX_PKT_L2HDR_FRAG],
                                   pkt->payload_frags + NET_TX_PKT_PL_START_FRAG - 1,
-- 
2.39.2


