Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799AA613727
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:57:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUIS-0002Wx-90; Mon, 31 Oct 2022 08:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUI5-0000HN-6n
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUI3-00033k-CU
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:53:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mk4Sl4LbuMKont5xSBz6TsoGXbpWs8ZwHVKOV5dhnZU=;
 b=PvmWOKSjfJdb06yyuhyPKbgvCSiImQBAV+gWIkgroABBNEaHUBCi1jVoaMmiwCUhOtgZRG
 I8lhaUnqTtrw9SkDg6p+AQA2U/Ig78TgtWo1iq7kvdfp1SxyIWJhBnAWBA8uwfXOvFyFBx
 APcYNaY5XNXH2vwgH80Jumn0oEUvyc0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-371-UyHmoycWP_2go5LQwDpSpg-1; Mon, 31 Oct 2022 08:53:17 -0400
X-MC-Unique: UyHmoycWP_2go5LQwDpSpg-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg25-20020a05600c3c9900b003cf3ed7e27bso5264225wmb.4
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mk4Sl4LbuMKont5xSBz6TsoGXbpWs8ZwHVKOV5dhnZU=;
 b=oaDu7uRodtL53NJhkNcCxFk0Bh9E3xPsD1gOsCbcJZkNceEKNYy5p0q+p0DSpGci/w
 EnZ8MVyB2SqJBcq1u0kv/cE1y25Neza/cNNuSB9gGRw28dFe+lahriq65LxMRXJ2n6ec
 XgggeLD402twmsbh0k4P9d4chEmSYVFXqZlLoQ4HC4O1Vmo9Om2OVG08JeBvUIT5Vg1i
 y0p5nbYx3JZPDcZ4d43OoMkTcyJEIE6zCDfRt4kKCtC4yAJC12HRTt2RGOxaULhFKs6a
 2NlZ7Uu7/AOTF+YIGPJaAZgV++7ynUI4Sze+dS+ybnM56NObqIpw6Rgmsyj0H97KWWO5
 JQBA==
X-Gm-Message-State: ACrzQf1JpDbE4hAVtkgNSOflvXSGFkKnSsqi2W/JudymcMOGuyAJyx9C
 1h2gnOopT0XrpHT27mRZeJRzNxySbhA566HgPMb3AqvL8N4ccRz1aBiFNNZhOfqgfQYzF6bW4iP
 uvzxRnItNMCPrFn2oWKkAyvqu+2TJfYjJiKu0NnASGHz+NLYG2/14uIHnjuTv
X-Received: by 2002:a5d:53c9:0:b0:236:69fd:d4cc with SMTP id
 a9-20020a5d53c9000000b0023669fdd4ccmr8103631wrw.618.1667220795698; 
 Mon, 31 Oct 2022 05:53:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5cdk7xo2vglJMucthx44SMRzDpIMTiuWWfr0xBn/6Lh+Cv6ryLhM0r+gqhp042qc4B6Zp/SA==
X-Received: by 2002:a5d:53c9:0:b0:236:69fd:d4cc with SMTP id
 a9-20020a5d53c9000000b0023669fdd4ccmr8103612wrw.618.1667220795398; 
 Mon, 31 Oct 2022 05:53:15 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 t2-20020a05600c41c200b003c21ba7d7d6sm6980723wmh.44.2022.10.31.05.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:53:15 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:53:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Yajun Wu <yajunw@nvidia.com>,
 Parav Pandit <parav@nvidia.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 53/86] vhost-user: Fix out of order vring host notification
 handling
Message-ID: <20221031124928.128475-54-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Yajun Wu <yajunw@nvidia.com>

vhost backend sends host notification for every VQ. If backend creates
VQs in parallel, the VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG may
arrive to QEMU in different order than incremental queue index order.

For example VQ 1's message arrive earlier than VQ 0's:
After alloc VhostUserHostNotifier for VQ 1. GPtrArray becomes

    [ nil, VQ1 pointer ]

After alloc VhostUserHostNotifier for VQ 0. GPtrArray becomes

    [ VQ0 pointer, nil, VQ1 pointer ]

This is wrong. fetch_notifier will return NULL for VQ 1 in
vhost_user_get_vring_base, causes host notifier miss removal(leak).

The fix is to remove current element from GPtrArray, make the right
position for element to insert.

Fixes: 503e355465 ("virtio/vhost-user: dynamically assign VhostUserHostNotifiers")
Signed-off-by: Yajun Wu <yajunw@nvidia.com>
Acked-by: Parav Pandit <parav@nvidia.com>

Message-Id: <20221018023651.1359420-1-yajunw@nvidia.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-user.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index bb5164b753..abe23d4ebe 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1593,6 +1593,11 @@ static VhostUserHostNotifier *fetch_or_create_notifier(VhostUserState *u,
 
     n = g_ptr_array_index(u->notifiers, idx);
     if (!n) {
+        /*
+         * In case notification arrive out-of-order,
+         * make room for current index.
+         */
+        g_ptr_array_remove_index(u->notifiers, idx);
         n = g_new0(VhostUserHostNotifier, 1);
         n->idx = idx;
         g_ptr_array_insert(u->notifiers, idx, n);
-- 
MST


