Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C152E653177
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:14:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7yne-0006F1-C7; Wed, 21 Dec 2022 08:06:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynH-0005x4-Ls
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7yn7-0004K9-Kn
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:05:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jrop8WBQ1pXXhoyeV49pfT1fm4W1BHZBWr999uexy2o=;
 b=b/4YYsnf9NXoLyYBfZ/BW/kUTxVEKYNOYHIgaHBe7dWBHKJcaOg+46PMAnS1kurolnOxrB
 SE8u9F2RFiNOupuNvqW/tjcRN9Sxn0jHL3ipv4W1tnIFuFNqclaVbbO1d18/Pi2EYzo4FV
 hIHUTacYj3heBcgXjjgRv7eTSEMeQwA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-304-K1G5bsL1Po2p1i-UX8UbXA-1; Wed, 21 Dec 2022 08:05:42 -0500
X-MC-Unique: K1G5bsL1Po2p1i-UX8UbXA-1
Received: by mail-wr1-f71.google.com with SMTP id
 n12-20020adfc60c000000b0026647ef69f4so1052479wrg.10
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:05:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jrop8WBQ1pXXhoyeV49pfT1fm4W1BHZBWr999uexy2o=;
 b=vSQFO6/EvLOWhzW2tYHY4OvKPnOJsAmahBZKTO5URiLKbFrWZngVEYxEVMF2nbkifv
 CQhqd5l4bg8owrgwLs8SvPwEAbH5qRnR4K5k+FEEBDTYs7lnIZ7/1RxCQ28TfSKa3d8l
 jQE8bTroS5d8ZCtt2dxBaooAGtcPvf8OYz8ek8xVte1KgNIAFmCOOlumw2nRRnLLHwOY
 tCT3Mxn25ehjgSXqgpO4Ciz5/Lu0laGa7Q32HvV/WeAOKj3EhYUpQ0amhqdVAL+2Cl5Q
 9Q9Sy6Thc7DRnQPKg0PBNJ/lVe/mRngJ/nFm0Q5vgmYms/3WH5omGtAvn6XNsRHzTTcX
 IxbQ==
X-Gm-Message-State: AFqh2kqT7nTN5I5ScJpHTxMrbuf/GNeZciwkh2z1D808l7K+MozS24k0
 P4+b8GfZgq8A0ZvbcLu154ihoFXot5C4cDR6KF+G1QIruvjSFWR+408S+ZZuPYujCgnEfvk26vc
 gdhoADAkDXFN4OaobPNM8hhFxQuIKR2h/a7umh4M4qriLnCXX7BkYceFDFVf9
X-Received: by 2002:a05:600c:1604:b0:3d5:b222:20a with SMTP id
 m4-20020a05600c160400b003d5b222020amr1291177wmn.32.1671627940989; 
 Wed, 21 Dec 2022 05:05:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsK4MpYoFIYzHSdyHBm5isfxCeuqhuSsedAwnHjdRIFvfdoHvaIjKgGfvPu0Uv/Jz3TeKiJ7A==
X-Received: by 2002:a05:600c:1604:b0:3d5:b222:20a with SMTP id
 m4-20020a05600c160400b003d5b222020amr1291157wmn.32.1671627940704; 
 Wed, 21 Dec 2022 05:05:40 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c3ba400b003b49bd61b19sm2540236wms.15.2022.12.21.05.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:05:40 -0800 (PST)
Date: Wed, 21 Dec 2022 08:05:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 21/41] vdpa: store x-svq parameter in VhostVDPAState
Message-ID: <20221221130339.1234592-22-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

CVQ can be shadowed two ways:
- Device has x-svq=on parameter (current way)
- The device can isolate CVQ in its own vq group

QEMU needs to check for the second condition dynamically, because CVQ
index is not known before the driver ack the features. Since this is
dynamic, the CVQ isolation could vary with different conditions, making
it possible to go from "not isolated group" to "isolated".

Saving the cmdline parameter in an extra field so we never disable CVQ
SVQ in case the device was started with x-svq cmdline.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221215113144.322011-11-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/vhost-vdpa.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index a592ee07ec..bff72717d0 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -38,6 +38,8 @@ typedef struct VhostVDPAState {
     void *cvq_cmd_out_buffer;
     virtio_net_ctrl_ack *status;
 
+    /* The device always have SVQ enabled */
+    bool always_svq;
     bool started;
 } VhostVDPAState;
 
@@ -568,6 +570,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
 
     s->vhost_vdpa.device_fd = vdpa_device_fd;
     s->vhost_vdpa.index = queue_pair_index;
+    s->always_svq = svq;
     s->vhost_vdpa.shadow_vqs_enabled = svq;
     s->vhost_vdpa.iova_range = iova_range;
     s->vhost_vdpa.iova_tree = iova_tree;
-- 
MST


