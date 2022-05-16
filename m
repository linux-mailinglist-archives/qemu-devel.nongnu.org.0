Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DC85292D2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:25:03 +0200 (CEST)
Received: from localhost ([::1]:54426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqiD8-0003Mw-FE
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhif-00088g-8v
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:53:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhid-0006dh-Qt
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:53:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PQz4ehzFlsyqaJdQtd3oII5C6sWLvrd+BwENnYaq6Qc=;
 b=aqJCYNchNS5U86JXTkbOWQ2ZLKj7pkOGX/gvKve93QSCyMY4+qMIkxabYUdkkbwmTMDrKO
 siHhmSsvrCLyYUE0/Z2LIFossv2pmk8dMYUjyPkj9w+NFi3awfRVLLS3DG3kNWl/Jy2fDN
 4taY1rU8ye8FiVzgNTEGe+itu2PXcwg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-kn3uhWYkOtqMCU1s_rmKqQ-1; Mon, 16 May 2022 16:53:30 -0400
X-MC-Unique: kn3uhWYkOtqMCU1s_rmKqQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 q12-20020a056402040c00b0042a84f9939dso4549354edv.7
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:53:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PQz4ehzFlsyqaJdQtd3oII5C6sWLvrd+BwENnYaq6Qc=;
 b=Ho4/FzHnEMFd78RvWBnXNnhkxc3qSz0R2uIZsbVtfCLM3cBc/05gcArHXPVtdJ0J8D
 Upq6wpxBljk+Ww6HT/MkDmgDAey5r2q0S22UYcHYg0KI7B6BN/Vd/Np7R1WH+uEk5dxz
 VhOfHEJio8G3upsTh2M18xAF9mO/n5hhL6WOWWPFB5bHrTol0SFWLmIfFsXOJNp6W35t
 iLMx1f0s7RRO0a4DqWeiAptqqy8yZF60LebaqtHDef7wLduPAjXD0gkBb8OZiwWJj4sD
 oqT6OKcFUtjkskMQtesatlUSIgkuGpe+yzpQKoxFN72mn0hG7hmoaOz0Vbh1vMu5XYVA
 wdfA==
X-Gm-Message-State: AOAM530tFFU7w2ziTmbHpNEA/Gt0FaLbtZMV8xqOt3EA5Gc9HJ304ceU
 gN3sEOhOjUZgLrOS74kh5z/5sJctnBBixgv3mIQ0J7LEBEQBz1yhg+quDYLcpvS/z8sFosY4e8y
 4ztRIpRkpAUv77w1IQWZSnQsLxSdII1drudc5roR7gJY7vW2xwfJf4pOgM/71
X-Received: by 2002:a17:906:7952:b0:6fe:1e0b:6343 with SMTP id
 l18-20020a170906795200b006fe1e0b6343mr11032909ejo.337.1652734408813; 
 Mon, 16 May 2022 13:53:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYXs0fsrLB2scIAuaDKF86zAl15GeMp5a0Yp2u6j298zRJoQ3cdH2hbYdmCvDYcPAFI1jdLg==
X-Received: by 2002:a17:906:7952:b0:6fe:1e0b:6343 with SMTP id
 l18-20020a170906795200b006fe1e0b6343mr11032888ejo.337.1652734408475; 
 Mon, 16 May 2022 13:53:28 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 d16-20020a056402145000b0041d893ed437sm5817945edx.2.2022.05.16.13.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:53:27 -0700 (PDT)
Date: Mon, 16 May 2022 16:53:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>
Subject: [PULL v2 48/86] vhost: Fix element in vhost_svq_add failure
Message-ID: <20220516204913.542894-49-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Eugenio Pérez <eperezma@redhat.com>

Coverity rightly reports that is not free in that case.

Fixes: Coverity CID 1487559
Fixes: 100890f7ca ("vhost: Shadow virtqueue buffers forwarding")

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20220512175747.142058-7-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index a8376ef82b..56c96ebd13 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -199,11 +199,19 @@ static bool vhost_svq_add_split(VhostShadowVirtqueue *svq,
     return true;
 }
 
+/**
+ * Add an element to a SVQ.
+ *
+ * The caller must check that there is enough slots for the new element. It
+ * takes ownership of the element: In case of failure, it is free and the SVQ
+ * is considered broken.
+ */
 static bool vhost_svq_add(VhostShadowVirtqueue *svq, VirtQueueElement *elem)
 {
     unsigned qemu_head;
     bool ok = vhost_svq_add_split(svq, elem, &qemu_head);
     if (unlikely(!ok)) {
+        g_free(elem);
         return false;
     }
 
-- 
MST


