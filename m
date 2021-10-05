Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EE8422ED3
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:13:27 +0200 (CEST)
Received: from localhost ([::1]:59964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXo0L-0007Bh-HH
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmvH-00024y-Od
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:04:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmvF-00071P-NU
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:04:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hoAsOcICaDiNobBhDkgg+vqDQALYK1r5xTzLqWDdXc8=;
 b=fpCsK1K9P6JcKiwYHrL3vyNyQctv3aH3CGehscoJEQZqhNA4UarKVP39ngwvT2OWMSE9KV
 W5B+cNH8PSKrmKJP6wqgINAX7/DXlsG4l9ADu1gz4FqDG8r8W8lkAGsSLI/XrlqNisrqce
 pBYXnEvT5ktns9Bm4zaHFvhjSVjg1ow=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-F-PQp7nTPx2NO8L-WlC8hg-1; Tue, 05 Oct 2021 12:00:50 -0400
X-MC-Unique: F-PQp7nTPx2NO8L-WlC8hg-1
Received: by mail-wm1-f72.google.com with SMTP id
 f11-20020a7bcd0b000000b0030d72d5d0bcso1456566wmj.7
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hoAsOcICaDiNobBhDkgg+vqDQALYK1r5xTzLqWDdXc8=;
 b=8ANKtxedP4ICn4sHkLcAVA7BvtxkFiigWiuJ3rkFJ7FU7ES+0khLjcApHY4toaBmos
 G1Oslif0ae8L8PkU+E33Uxa8kq7UkfXto8KslZRer8FbOu8/Cpu/z/aA61t3hDbIkh3q
 u7pH3roMDT4ETQVmYTf0LCyVqjc3wKLt789Jcb0EpvKz+zUqZHebj8R1/D36drf615Qn
 pPF2YgtSD764OYfpyT0FoNs9f9SE+g5Hz1O4izj6VKYbU1q8uUn+FD0I8Bw5S90E2UkH
 aGVZ70IL4md4z8hJV29c+fhVlWKhvq5R04OefWWfmgp/zM5sTMSpezMtLFTy7b1v/CJm
 E7rA==
X-Gm-Message-State: AOAM530I3sWbozD0lMzsdl53fu7B7NYuzoCR9cEjS57/dSTgEb0PM0l3
 WWoBckMCmnw7GzpLQXfxSiAGn0pHs72niUt/ekQgrijlqm/HUWt7knNYa/FHzXYpEg0sIdRv+Gl
 0hJ4T6NNQezz0j1sbA9leV1hoOAOVFgjCubXWu2urQghQeEu4SIRlLfkl7Nln
X-Received: by 2002:adf:bb88:: with SMTP id q8mr22588686wrg.390.1633449648660; 
 Tue, 05 Oct 2021 09:00:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFG7i0LBhWZa/z8FAcj0xfdN1o7vTaWNSUy+TbtzAR44YMmhJVZ+hKI2U83zOosTh6Xvw3sA==
X-Received: by 2002:adf:bb88:: with SMTP id q8mr22588639wrg.390.1633449648315; 
 Tue, 05 Oct 2021 09:00:48 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id b19sm299483wmb.1.2021.10.05.09.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:00:47 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:00:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/57] hw/virtio: Acquire RCU read lock in
 virtqueue_packed_drop_all()
Message-ID: <20211005155946.513818-2-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.066, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

vring_get_region_caches() must be called with the RCU read lock
acquired. virtqueue_packed_drop_all() does not, and uses the
'caches' pointer. Fix that by using the RCU_READ_LOCK_GUARD()
macro.

Reported-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210906104318.1569967-3-philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
---
 hw/virtio/virtio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 240759ff0b..dd0ab433b8 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -1703,6 +1703,8 @@ static unsigned int virtqueue_packed_drop_all(VirtQueue *vq)
     VirtIODevice *vdev = vq->vdev;
     VRingPackedDesc desc;
 
+    RCU_READ_LOCK_GUARD();
+
     caches = vring_get_region_caches(vq);
     if (!caches) {
         return 0;
-- 
MST


