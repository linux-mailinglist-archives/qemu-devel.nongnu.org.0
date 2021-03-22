Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E613452CB
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 00:09:42 +0100 (CET)
Received: from localhost ([::1]:48190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOTg5-0007Up-NN
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 19:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTX1-0006ys-Ac
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 19:00:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTWz-0001CU-KD
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 19:00:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616454017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vJdnuz4O5jTyvKH1AcU41+VrJbgX4Tt2CgNqnbi0l3s=;
 b=JprzvDlrLv/1pBkCbQfgiF/iexu+cM+yq6KsIruSaBTDeKnWzOAP3US3+Dgd0bL11xh6iu
 3GjivIRocldQSgQhsApaJn99yK6mW4hs2Z3HD5mI1F6r6lkMNOXf8DKTuknHHUgMFznbqv
 bSTWCrptEAUY0Ajj4KoECMOgmm/XSBU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-SYebeE59PASxdYp2Eb-b4Q-1; Mon, 22 Mar 2021 19:00:14 -0400
X-MC-Unique: SYebeE59PASxdYp2Eb-b4Q-1
Received: by mail-wr1-f72.google.com with SMTP id p15so146804wre.13
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 16:00:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vJdnuz4O5jTyvKH1AcU41+VrJbgX4Tt2CgNqnbi0l3s=;
 b=TxEormLfD5l4uyf1kSi4iXhx6yp2i0+gf6Nc+HGBg9S076oCGZMUN+IbJvE8gT8vmu
 y6sCDtfZp/YutETzBYh9zlpDZeSGnLHedam2TWZtuZwAdtXx8tQno8jXQfvefQ0Oppw0
 G7gSDbBoFqdt6kSd4xscaSJxF0Ll15jeAG6in0F/sGfu8+uaHB9dfdRVXpfkjzsKVI+j
 7RMi3lOCE4t2/OH9z4mFGl1qyudH+0JUVhKv2UOQA9O+5RGnz7HqGfQtu51fK1BwnkDB
 xyUxrtbWMpr6pKo0AjxHmN2L+V67ya+VPYStdMsHBWx/wsGZm58XBKCzdfbKvTq9nkMh
 dMtQ==
X-Gm-Message-State: AOAM532KuLcN7RdC3+fyNY0acujqoWF/cFHRdGAdQskeIts8HdtWnUY3
 ZYjAg2OjcNkSyffBGrSXygljQ6IDCK8JqA/2I99nlSZ943BXyNlsDm9hsFOSy1f2ILL9+MIg0zN
 /6eHq0ivdVEFZUoHvYdtKUj9F23dPAPO/bd4i/jg15Dc9afqoRn11OyZr8uq1
X-Received: by 2002:a05:600c:47d7:: with SMTP id
 l23mr582439wmo.155.1616454013307; 
 Mon, 22 Mar 2021 16:00:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykrWQpJADG2OTWqKItljcWh2pfv0ofZ/Qvqjg3VTJOl3oTiILRksi6ebGv5HsA6GSt/PzBRQ==
X-Received: by 2002:a05:600c:47d7:: with SMTP id
 l23mr582422wmo.155.1616454013111; 
 Mon, 22 Mar 2021 16:00:13 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id x14sm20450547wrw.13.2021.03.22.16.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 16:00:12 -0700 (PDT)
Date: Mon, 22 Mar 2021 19:00:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 08/19] virtio-pmem: fix virtio_pmem_resp assign problem
Message-ID: <20210322225907.541943-9-mst@redhat.com>
References: <20210322225907.541943-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210322225907.541943-1-mst@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Wang Liang <wangliangzz@inspur.com>, David Hildenbrand <david@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wang Liang <wangliangzz@inspur.com>

ret in virtio_pmem_resp is a uint32_t variable, which should be assigned
using virtio_stl_p.

The kernel side driver does not guarantee virtio_pmem_resp to be initialized
to zero in advance, So sometimes the flush operation will fail.

Signed-off-by: Wang Liang <wangliangzz@inspur.com>
Message-Id: <20210317024145.271212-1-wangliangzz@126.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
index a3e0688a89..d1aeb90a31 100644
--- a/hw/virtio/virtio-pmem.c
+++ b/hw/virtio/virtio-pmem.c
@@ -47,7 +47,7 @@ static int worker_cb(void *opaque)
         err = 1;
     }
 
-    virtio_stw_p(req_data->vdev, &req_data->resp.ret, err);
+    virtio_stl_p(req_data->vdev, &req_data->resp.ret, err);
 
     return 0;
 }
-- 
MST


