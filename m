Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC5A54DDB7
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 10:58:45 +0200 (CEST)
Received: from localhost ([::1]:59176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1lKu-0002RQ-TJ
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 04:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvl-0001np-F2
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvj-0002tP-PZ
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655368363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NXuyXvKJHh1ScnEKLGw4n5wQHt4LGnf3pTNOBm5Xpkg=;
 b=COCqknG9V76I4I/+UzTtVs8f+/6x4AOLtupAiKHTCjdQBxjc6yUDmbpPeUQVbV22ousJkO
 nH39Da6mAzPBU+8XxS900QgBg4/cVFI6XnuQqBgF3fu9MYS/pys/ArDEayPx+/VQnjZ9FM
 tA49eBkxk1qGA6BX6ue0IK7tIMHZimU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-05bFYbD3MwuHaGRT5h7NDg-1; Thu, 16 Jun 2022 04:32:40 -0400
X-MC-Unique: 05bFYbD3MwuHaGRT5h7NDg-1
Received: by mail-ej1-f71.google.com with SMTP id
 k7-20020a1709062a4700b006fe92440164so308535eje.23
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 01:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NXuyXvKJHh1ScnEKLGw4n5wQHt4LGnf3pTNOBm5Xpkg=;
 b=jElkJ1sCmXnUhyeQUZu/mHVtxjE2psWfqgIfVvVSGwkuIjDZ5GZ5yMc36wCvs36yjD
 xbTYL+RZFxiBPjQhtI8axiGkP+4+BEqfF3J+IDHRwkkNsLVUj5pQAnt/lK3gNHYTnX0Q
 hAGBLGcl4ovtU7zzBBQGOBP9AzWa0nPN7CPq7TMj0h8I3EgVd7f9DGll+xorQ9y3R8f9
 7gqs1B1aiV5t84BghH+yHmGFuiGce7dyKONcNTgZlUUKDv3fQRY2OgWZewMHIjlmFA+1
 /uI1/i9JfiF7kn3D6YuFticwrvxP53ZZRwuiiYol+u81sUiGcfFM9A+mUd3xoXpFX1Nw
 LrQA==
X-Gm-Message-State: AJIora8Yi5NgqgXLMVqNPCh0m6xP1E+M9CXnKd2upmLa9pzha/QbOaRw
 JAgKTVqk+R0Kl82oSfgTVIYtvRzyLaqBMdX26/roBuwro9ORFyjTXa/s91qjkrWifo5lOajzuXM
 OLkMUr9WXpQ5uSE79UX9spfGJ2ijlxWaEqmDqwztBjqTmFaT/PpcEZj0Zn58V8U9AvIE=
X-Received: by 2002:aa7:c84d:0:b0:431:4226:70c9 with SMTP id
 g13-20020aa7c84d000000b00431422670c9mr4910205edt.51.1655368359299; 
 Thu, 16 Jun 2022 01:32:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v9aOupoWwIP73CFiElX5b/xPwPaqZyP6945KJXduomzM2cSdmfuXWVhXZ8ybMfASCrEFvExg==
X-Received: by 2002:aa7:c84d:0:b0:431:4226:70c9 with SMTP id
 g13-20020aa7c84d000000b00431422670c9mr4910182edt.51.1655368359009; 
 Thu, 16 Jun 2022 01:32:39 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00705fa7087bbsm487978ejo.142.2022.06.16.01.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:32:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>
Subject: [PULL 12/21] virtio-mmio: stop ioeventfd on legacy reset
Date: Thu, 16 Jun 2022 10:32:00 +0200
Message-Id: <20220616083209.117397-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220616083209.117397-1-pbonzini@redhat.com>
References: <20220616083209.117397-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

If the queue PFN is set to zero on a virtio-mmio device, the device is reset.
In that case however the virtio_bus_stop_ioeventfd function was not
called; add it so that the behavior is similar to when status is set to 0.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/virtio/virtio-mmio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index 688eccda94..41a35d31c8 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -376,6 +376,7 @@ static void virtio_mmio_write(void *opaque, hwaddr offset, uint64_t value,
             return;
         }
         if (value == 0) {
+            virtio_mmio_stop_ioeventfd(proxy);
             virtio_reset(vdev);
         } else {
             virtio_queue_set_addr(vdev, vdev->queue_sel,
-- 
2.36.1



