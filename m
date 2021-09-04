Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C8B400D25
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:42:53 +0200 (CEST)
Received: from localhost ([::1]:54672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdR6-0003Je-LC
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:42:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLU-0005qP-QG
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLT-0001La-E7
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sSh2M0iEYArsKdnCzWuCUKGerGJG9NoNb7thnyEYSpU=;
 b=Ad3Q1TUNX/Rfj1olEL86AoYmhdmEQ29EC0TcRAty2qCYGdcIXplcbckcn6KM/qoJlD1lyl
 jJrB4wZzIxs/rI1n5vPwyJnP1hO6OVRsOFQtb+lLpzFBcCxLasFmQyOtGHpmZfn72pkmBn
 OwFIxy4PnPH1JIddhNbj/1+4oTHfJzQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-JgBb9cyfO0a7wRdTSX9UiA-1; Sat, 04 Sep 2021 17:37:01 -0400
X-MC-Unique: JgBb9cyfO0a7wRdTSX9UiA-1
Received: by mail-ej1-f70.google.com with SMTP id
 c25-20020a170906529900b005c56c92caa2so844793ejm.19
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=sSh2M0iEYArsKdnCzWuCUKGerGJG9NoNb7thnyEYSpU=;
 b=gYiCYskbh2CFauqjAIzNOYgunXFynbbhn2SDHIpPNUNcxGrXjZju4YV0jEJ31By1OV
 bKnNa1Ib0PqWZBsTWMyemzETromjzqA/N41P0sBqzgFyPMATcEJ9aMRxugkARa3hta2h
 DrLu2VjAD3HDIRlbxMMsNuSyDRbm9zHBED6bQizHzL+EJY0tNHUmmX/mcFC3+Fkrfl1N
 /sd3D5Wc97Bxc0KOCTznSXegCLmJ4nqL5dWedIVgY4BxZA67AUO3ThRH7gOiBImdYzKa
 vvTljpoCNzAp7JKV6psX6u8iTgAThXadiQtoZMdxJtKLFrJrXzuJ/6fPkQ9slVpy9Er3
 M3sA==
X-Gm-Message-State: AOAM531A6EstVMYBogYgd4qn8vLiLDACzlV6FPgW/Zn6OuNiP0SMpMCW
 +p7uPmv4h3TiXjcoHAXLkGNswQQEqv8/hXpQBi0Tsgvw4FO4OAwUQ5XQJ2kK2N4wJCHg+i1Eyhf
 DxFQUBMKksH1yIbdZ5l4Fhj89rdgb/UrC77WwyEOLCHfzm/JBxdu9lAhgY14H
X-Received: by 2002:a17:907:7704:: with SMTP id
 kw4mr5995646ejc.23.1630791420092; 
 Sat, 04 Sep 2021 14:37:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWlhNZCS6UKfacvE0RZUaDf4AAYsR6T0Pv3JKjCo9+FGJNCq6u8QkJzjHdjqLvIpioRvMFkg==
X-Received: by 2002:a17:907:7704:: with SMTP id
 kw4mr5995626ejc.23.1630791419874; 
 Sat, 04 Sep 2021 14:36:59 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id e22sm1924047edu.35.2021.09.04.14.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:36:59 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:36:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/35] hw/virtio: Document virtio_queue_packed_empty_rcu is
 called within RCU
Message-ID: <20210904213506.486886-21-mst@redhat.com>
References: <20210904213506.486886-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

While virtio_queue_packed_empty_rcu() uses the '_rcu' suffix,
it is not obvious it is called within rcu_read_lock(). All other
functions from this file called with the RCU locked have a comment
describing it. Document this one similarly for consistency.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210826172658.2116840-2-philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/virtio/virtio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 874377f37a..a5214bca61 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -634,6 +634,7 @@ static int virtio_queue_split_empty(VirtQueue *vq)
     return empty;
 }
 
+/* Called within rcu_read_lock().  */
 static int virtio_queue_packed_empty_rcu(VirtQueue *vq)
 {
     struct VRingPackedDesc desc;
-- 
MST


