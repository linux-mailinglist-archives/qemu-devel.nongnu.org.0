Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD18455BE74
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 07:31:35 +0200 (CEST)
Received: from localhost ([::1]:38672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o63p0-0001fA-Oc
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 01:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o6348-0000GB-JJ
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:43:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o6347-0006tL-3C
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:43:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656391386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0F75Xkg7ztQgcowiItypu8oAqV/zHE5jhJdNwWc/ppM=;
 b=I+23pb1/J8Xp/Zl59+7LUKyFuIfxTt6faj+qiz9OkqDI+VYzeaXeOj0jQeix7Wd6BIktbL
 VB1WGLhv2O/o5GZpGNVgzmASvLk2Jdy32qcPfoM187bTQYKu7T866NZLHpVkhp2EP6vxzd
 OCLiZvGNOYdeH3U2/2wKkFAwzf1X3Ls=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-xyduXKGIP9KdeBm5qPU2tw-1; Tue, 28 Jun 2022 00:43:05 -0400
X-MC-Unique: xyduXKGIP9KdeBm5qPU2tw-1
Received: by mail-wm1-f72.google.com with SMTP id
 m17-20020a05600c3b1100b003a04a2f4936so2607222wms.6
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0F75Xkg7ztQgcowiItypu8oAqV/zHE5jhJdNwWc/ppM=;
 b=t74tFIi8vJTytdCHiPRVshqVeJYwKvZm3wDGNf87vv54jYsaepfphCiF/Y+Afnr4sb
 O7mJD+HGs+ZmF1btBz/ctq+BR3UzoVCB9Bb1hFmRsI5Jybij6u9zitwNFO5q75IdSOH8
 lbsfqMPATrf+c+bVidMcSlGNmDkxNAN88z+Yiav2ukXDMwiNx39Y6EBi5f9qDkTZhLzh
 VWIa2EqL4rrZ3E51Eyubjn3wpnL3fTIWyoeZghM7XY/2my9/c1wGtwq43rQGBR7Wr5Fc
 cd+RHieQVlCUoC2TWSa2oyd/vNwqniDmkwZMTvUOH/HsaBZ6zR0ENmChEjTHN8QC9ycC
 e4BQ==
X-Gm-Message-State: AJIora8Mp9nyqbzaXUTbenD2OHcpQe2nB5LuyX+L9V7qxbqMRi8hvdg5
 cM7OrWZnwhb32jHPJlQ05b/xD/tpFcYy8QSvQC60oAY0hPCS5ihITuJTBjGNk1OHrz3oErAyJ2C
 4p1ORk2cIfJbKcqqYOtxPeBz/uYRcLJtrV2FJufqDr7hHv4Z7omu7eQm2plUn
X-Received: by 2002:a1c:7414:0:b0:3a0:201c:5b7f with SMTP id
 p20-20020a1c7414000000b003a0201c5b7fmr24007167wmc.170.1656391383667; 
 Mon, 27 Jun 2022 21:43:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1srcrLEVaiyObgcmdm4XbmtUr4ngnjxYt7JtwuhrlXLXUw5GjwM6d4EG5rd+4h69owrDYru6Q==
X-Received: by 2002:a1c:7414:0:b0:3a0:201c:5b7f with SMTP id
 p20-20020a1c7414000000b003a0201c5b7fmr24007146wmc.170.1656391383453; 
 Mon, 27 Jun 2022 21:43:03 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 t11-20020adff60b000000b0021b962f4256sm12109445wrp.80.2022.06.27.21.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:43:02 -0700 (PDT)
Date: Tue, 28 Jun 2022 00:43:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 11/12] include/hw/virtio: document vhost_get_features
Message-ID: <20220628044201.217173-12-mst@redhat.com>
References: <20220628044201.217173-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220628044201.217173-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220524154056.2896913-4-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/virtio/vhost.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 1e7cbd9a10..bfc71b7c50 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -247,6 +247,17 @@ bool vhost_virtqueue_pending(struct vhost_dev *hdev, int n);
  */
 void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
                           bool mask);
+
+/**
+ * vhost_get_features() - return a sanitised set of feature bits
+ * @hdev: common vhost_dev structure
+ * @feature_bits: pointer to terminated table of feature bits
+ * @features: original feature set
+ *
+ * This returns a set of features bits that is an intersection of what
+ * is supported by the vhost backend (hdev->features), the supported
+ * feature_bits and the requested feature set.
+ */
 uint64_t vhost_get_features(struct vhost_dev *hdev, const int *feature_bits,
                             uint64_t features);
 void vhost_ack_features(struct vhost_dev *hdev, const int *feature_bits,
-- 
MST


