Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71471400D3B
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:54:18 +0200 (CEST)
Received: from localhost ([::1]:40106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdc9-00061T-Hw
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:54:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdMC-0007nn-0Q
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdM7-0001qm-BQ
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xjuzAmf2KkHQdIs6JW/8X9WZ9cd/2U1SOrubuoXWXrY=;
 b=Fobjud2pfqBvnrBASMXxsqlvqs03oMwWlARFYB4XwmzqK5c5sWU51jNoTWhQtRrq+4Xj+H
 aatW7CYpqPsa/wkkWAg9cP3mvkOBJUkIr+JOWf+pGtsN85MmlhIQ2gq0onSUuOcqQEqfij
 G/EidR1jgxSdhZMK49FjAKQnlrdB1p8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-w-k7QAeqOByhN3LvvwDLUg-1; Sat, 04 Sep 2021 17:37:41 -0400
X-MC-Unique: w-k7QAeqOByhN3LvvwDLUg-1
Received: by mail-ed1-f72.google.com with SMTP id
 i17-20020aa7c711000000b003c57b06a2caso1348356edq.20
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xjuzAmf2KkHQdIs6JW/8X9WZ9cd/2U1SOrubuoXWXrY=;
 b=fdzUlIyaTdxbeeN8caHWyaDM8CnD183yEN78pK6ycL0tvpMoFsMQgRLhAgQm9nKGvF
 WFleKZwChcaYwuoZApomXK83edYjD+iZyjlmwFgcn344lJYGCM1GacVfEUcNjTdcA5H1
 SdP1Yme1x4ELoVyZ2SpfsaL/uJ9VNBt1OVehTRDLyebwzEVROln8l76/dVxnVSEPTB3W
 XeSJp/ieIkLciMBlJCMdW2NAbp4IUid9exxLrFKTBJ6HEeeco45lkGR3fWR6dLKCPunQ
 H2XVVn9p1iafqf/0jDPLWTHLWAmf4Jx+7NAsMJ8yBLARvJYMNhDbJGgl3ow4B7TqB7K9
 2dNg==
X-Gm-Message-State: AOAM533VjxwSCetBeNellePVQLjIxO3ECkn156jnx2oJcrBnh3JwDkyX
 y53sDAjS3snqZe3YMQrXiJqTwgDdgVJenEwovFDhfaK2rIsGQXu4/fL944eN+6I46Qyr3HrrQL/
 2iL3qjrB7Mj/xl7CsZRVR0SqLO16eSlEH9/yIQrrxWusLr9awyA+Y2nFvpcCj
X-Received: by 2002:aa7:cd92:: with SMTP id x18mr5820165edv.325.1630791460056; 
 Sat, 04 Sep 2021 14:37:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwh6nl4KHfY2P2aR+oiDpZH9oDa0Eleht0IMTdia38ZA2sRkt5ih0Yj7cIIHiVL9mh24eA/bQ==
X-Received: by 2002:aa7:cd92:: with SMTP id x18mr5820155edv.325.1630791459890; 
 Sat, 04 Sep 2021 14:37:39 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id h7sm1919792edr.4.2021.09.04.14.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:37:39 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:37:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 34/35] vhost-vdpa: fix the wrong assertion in vhost_vdpa_init()
Message-ID: <20210904213506.486886-35-mst@redhat.com>
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

Vhost_vdpa_add() can fail for various reasons, so the assertion of the
succeed is wrong. Instead, we should free the NetClientState and
propagate the error to the caller

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20210903091031.47303-11-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/vhost-vdpa.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 99327d17b4..d02cad9855 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -173,7 +173,10 @@ static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
     }
     s->vhost_vdpa.device_fd = vdpa_device_fd;
     ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa);
-    assert(s->vhost_net);
+    if (ret) {
+        qemu_close(vdpa_device_fd);
+        qemu_del_net_client(nc);
+    }
     return ret;
 }
 
-- 
MST


