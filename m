Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7F865E773
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:15:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMKa-0001MQ-7J; Thu, 05 Jan 2023 04:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMKX-0001M2-V1
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:14:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMKW-0006lw-Fz
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:14:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5qEglmRXYJZKZpYP6BpBMT10QEx12Bn66mMNUx3KI+Y=;
 b=EvXSNt7PSsULQZmgFSXanhA7yHsSYEHKOBs35kKFWdSKaogibmazhKVXxQ/SlJdbHjk8VV
 WIoHiU/A2vGYRSvzjq1Jrkt6jEqkjwSLhVNDw6qJbIxX477YL8Z37NuNz5vvverRWSZFSk
 C84PV5//xBmRZqys4MA07UwGwYx73j8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-537-C76dSZMEOjOE9XM731BFTQ-1; Thu, 05 Jan 2023 04:14:30 -0500
X-MC-Unique: C76dSZMEOjOE9XM731BFTQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 f20-20020a7bc8d4000000b003d1cda5bd6fso260357wml.9
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:14:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5qEglmRXYJZKZpYP6BpBMT10QEx12Bn66mMNUx3KI+Y=;
 b=DIUc2wLXDRyzxAqlqTdjfjcJyJMVwKm/vsK8g3B/XB/PeYKV/hb5WtAWEQ90uthe/p
 Te7bIOKtUjK5EAwif+vc/jUnEj+Pa5HsH6EouzvBXNMtrtggVaTffJf858emn+Xvd/5a
 P/RLgct6ft9SZD9QzTj6Pd5eMpysjPQ1vYMKTyDjfCz2neqOcHSNBKb2gnvahZA3h7fG
 ziF9r3akwG1tmJ4UV/8YBPIbLixNd2xACksJ3L/NxAFrS0vkcCLpTkiFD/ebBNGKVCze
 +y837EJvc/gCEaVdAHG/UAXfMK+LpoHj1tVbK81nFTxpPYQJ4O7N1Q49V5oMvoNDEx04
 miqw==
X-Gm-Message-State: AFqh2kpcNDQgdRdhIDEjhGkgL+C6ushnLNpdgmu7nIVA7m46kUiy7vOH
 qgwDCmFkEEYIxxfb7MwYfgRVsLe/p6FNR/7TdqJpLD9wtvs8sU8MZV/C9k+9ltZqGNU4RJISnfs
 GSPPgCg1C2XFrSI24SX9zX8CPXuX3dglRkZoAQAWXJnq/s98ppgE3lDnj5Zv0
X-Received: by 2002:adf:fb05:0:b0:242:15d6:1a75 with SMTP id
 c5-20020adffb05000000b0024215d61a75mr27081918wrr.66.1672910068935; 
 Thu, 05 Jan 2023 01:14:28 -0800 (PST)
X-Google-Smtp-Source: AMrXdXupo89gEx4OcPu/WA/HPQww6EX1yZeRd+biJHtScuRmeP9nkIPncX2FNoiPA6pK/mKNv1+2PA==
X-Received: by 2002:adf:fb05:0:b0:242:15d6:1a75 with SMTP id
 c5-20020adffb05000000b0024215d61a75mr27081905wrr.66.1672910068692; 
 Thu, 05 Jan 2023 01:14:28 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 bj11-20020a0560001e0b00b002a6f329203esm3297506wrb.61.2023.01.05.01.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:14:28 -0800 (PST)
Date: Thu, 5 Jan 2023 04:14:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 03/51] vdpa: handle VIRTIO_NET_CTRL_ANNOUNCE in
 vhost_vdpa_net_handle_ctrl_avail
Message-ID: <20230105091310.263867-4-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Eugenio Pérez <eperezma@redhat.com>

Since this capability is emulated by qemu shadowed CVQ cannot forward it
to the device. Process all that command within qemu.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20221221115015.1400889-4-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index d36664f33a..41de76376f 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -616,9 +616,18 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
     out.iov_len = iov_to_buf(elem->out_sg, elem->out_num, 0,
                              s->cvq_cmd_out_buffer,
                              vhost_vdpa_net_cvq_cmd_len());
-    dev_written = vhost_vdpa_net_cvq_add(s, out.iov_len, sizeof(status));
-    if (unlikely(dev_written < 0)) {
-        goto out;
+    if (*(uint8_t *)s->cvq_cmd_out_buffer == VIRTIO_NET_CTRL_ANNOUNCE) {
+        /*
+         * Guest announce capability is emulated by qemu, so don't forward to
+         * the device.
+         */
+        dev_written = sizeof(status);
+        *s->status = VIRTIO_NET_OK;
+    } else {
+        dev_written = vhost_vdpa_net_cvq_add(s, out.iov_len, sizeof(status));
+        if (unlikely(dev_written < 0)) {
+            goto out;
+        }
     }
 
     if (unlikely(dev_written < sizeof(status))) {
-- 
MST


