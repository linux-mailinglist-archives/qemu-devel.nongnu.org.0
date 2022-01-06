Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87111486595
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:53:05 +0100 (CET)
Received: from localhost ([::1]:56908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TCS-0002zQ-Kz
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:53:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sdu-0004jz-2v
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5Sds-0000tn-HN
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:17:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sHSJcWtTIMlbxRfYVXtkQUvuw3rw0rHE0YLD56kL/PM=;
 b=IU6RXzNtXZl/YgMRV/ZLPhkCIjDoFZsbWk7LrndbIbXUycCzOmyjUY9AFpOliJW3mFDtYs
 yKNFHlcOh2m0IO1pioPUKCDIbDkpY67CoH4JD8VcpBy4ivWVe1LC3px51IsP7PJEq06lEz
 As+UChcmerX/4XkjL08qPtE0pZvb1To=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-zeVWAdWxOVaNFojVtD442A-1; Thu, 06 Jan 2022 08:17:18 -0500
X-MC-Unique: zeVWAdWxOVaNFojVtD442A-1
Received: by mail-wm1-f72.google.com with SMTP id
 m15-20020a7bce0f000000b003473d477618so544793wmc.8
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:17:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sHSJcWtTIMlbxRfYVXtkQUvuw3rw0rHE0YLD56kL/PM=;
 b=3tY1cWj+y/6g8bqCOYXJ09jfngfyAMA2gaVMhS1mpvLZghZrbWVO9hUomf1omri/+Y
 0kyFPMnxm60ZBBe4aB7xM4XjN65BIMNKWj+UboJHRigap4Y0s/6yRxyRh/eoa9sQA+mS
 WaRt/9uK/S6pKA9fvdGQRdqDM6pOPIuDCFXZTCI3q78a3oGG94CVtVIhLdlZRju1Iy4E
 TB1AiPH3sKntsxUFMYSAjHnSku2OlnzmiLMl7RoaGtYuXs+lQAJ23Fx+zI57tPPMjbyL
 8P1+GVOB2dLOJXr6sqlzjqPXiLPG0rNDuM7CtbFXk8/D1/QccAYyT62cYCSEOMyVW5L/
 TBlQ==
X-Gm-Message-State: AOAM532bwYtKd4XJ1FL+wre2wgIgM2hEtjJNTL6NaglMWiUXgT9l0e6t
 pZmV27AmVflmKIx6VGodfk8vBJsRSyV19Soh8BvlLOehoOEJ1wJyOJCuzG/Lv8fGutJmj8zC6rd
 JZvif1DVpqfzcvAzEzejc+Da9py2p5L0g15YqK9tI/CSaEcrQ9TSAWEu4Q8x5
X-Received: by 2002:a05:600c:2f01:: with SMTP id
 r1mr7262760wmn.153.1641475037111; 
 Thu, 06 Jan 2022 05:17:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDhLnebCSwwQVPV9cct8OqkFFe0vL+G+2ovuf5k57C65sUH1S3jme+r7sTQwp8IusQHJ7Uyg==
X-Received: by 2002:a05:600c:2f01:: with SMTP id
 r1mr7262736wmn.153.1641475036876; 
 Thu, 06 Jan 2022 05:17:16 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id u3sm2594246wrs.0.2022.01.06.05.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:17:16 -0800 (PST)
Date: Thu, 6 Jan 2022 08:17:14 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/52] vhost-user-blk: propagate error return from generic vhost
Message-ID: <20220106131534.423671-23-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Roman Kagan <rvkagan@yandex-team.ru>, Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Roman Kagan <rvkagan@yandex-team.ru>

Fix the only callsite that doesn't propagate the error code from the
generic vhost code.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
Message-Id: <20211111153354.18807-11-rvkagan@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
---
 hw/block/vhost-user-blk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index f9b17f6813..ab11ce8252 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -100,7 +100,7 @@ static int vhost_user_blk_handle_config_change(struct vhost_dev *dev)
                                &local_err);
     if (ret < 0) {
         error_report_err(local_err);
-        return -1;
+        return ret;
     }
 
     /* valid for resize only */
-- 
MST


