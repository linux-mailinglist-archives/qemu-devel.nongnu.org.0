Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6F2400D3E
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:56:05 +0200 (CEST)
Received: from localhost ([::1]:44628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdds-0000lv-Jq
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdPM-0007vy-6i
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:41:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdPK-0003w9-Lf
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:41:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LSmn8hNZpZJAtKWf/4Rp7i0Ir0780EOu5ZSFZW4+a58=;
 b=PL1oxMY8EDYkRux6c5WJkn9qy4cSiKG5FvgCLa+m5Rm0IhbAAOuqqN9rfjziAQFEO9Kk7O
 3kmcEGBzaVWks64LfePBZWzijgNqZQsSnK8d7wDXOz8YlrpehgseNj7tLS2HoYEiago1iV
 eZ+uojvugewLnkCF5BHJbyD+W/IqAs0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-LO2V2c0WOXGmSOeYseLRUg-1; Sat, 04 Sep 2021 17:37:35 -0400
X-MC-Unique: LO2V2c0WOXGmSOeYseLRUg-1
Received: by mail-ed1-f70.google.com with SMTP id
 b8-20020a056402350800b003c5e3d4e2a7so1509667edd.2
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LSmn8hNZpZJAtKWf/4Rp7i0Ir0780EOu5ZSFZW4+a58=;
 b=X+On4zFXhNJ6758H4jhNH2Om5vgSW0gxh++BvSAI0MQB8Op6BjllGXPIRE00hOrrAe
 OY99rywcN1/8bckT5iKM3LCiLBgzpzmKmKvOJcDFjLSVb5zpngPobt4mrbMiFSAbMIpS
 D4Pj0DkJ+eAXMVbqQjf7HD+EiBlKCLA8Yb/9dZqRHt5hlMErWJcky6C9USvKFbM9UBdQ
 OIrfE+WinwsRZgswN0mGin3vg2Xt6McgN+n52IsZyvXM2FotHRtMXbUr6TuOVi9pAifZ
 kBvTlPfXJmrDqDrogs+/BToBFdVpi5pVdGfkCYf84o095DajOb+UvSGP60nzVOlFxBy1
 1MSw==
X-Gm-Message-State: AOAM5329wKxLnOyGfjWsKIqGCI3g3Xut3D8EHKnEcfpdUI5uUL6RmDMP
 zAQ5DM0fcdq23kU01kn7TimVihXcyuIzLPlTUffAFD5G4faX40F8BustahYxTpKAB1NNEcegvy8
 4zlkh7YEQ7fE/PWGrYZ6kCZsEECehQQ0Me0VumPLiL67CCW8IaMXOG/HxG3yk
X-Received: by 2002:a17:906:249a:: with SMTP id
 e26mr5824143ejb.221.1630791453956; 
 Sat, 04 Sep 2021 14:37:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwynrE6bKvk9B/TAo8J6DOXCKEB9sm3UuyT/1J3bwmjIhNBx9MU6luzjiqXjlSj2ajju8YsHA==
X-Received: by 2002:a17:906:249a:: with SMTP id
 e26mr5824130ejb.221.1630791453799; 
 Sat, 04 Sep 2021 14:37:33 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id e7sm1965300edk.3.2021.09.04.14.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:37:33 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:37:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 32/35] vhost-vdpa: fix leaking of vhost_net in vhost_vdpa_add()
Message-ID: <20210904213506.486886-33-mst@redhat.com>
References: <20210904213506.486886-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

Fixes: 1e0a84ea49b68 ("vhost-vdpa: introduce vhost-vdpa net client")
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20210903091031.47303-9-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/vhost-vdpa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 3213e69d63..b43df00a85 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -110,6 +110,7 @@ static int vhost_vdpa_add(NetClientState *ncs, void *be)
 err:
     if (net) {
         vhost_net_cleanup(net);
+        g_free(net);
     }
     return -1;
 }
-- 
MST


