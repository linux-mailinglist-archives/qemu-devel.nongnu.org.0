Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E1C400D3F
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:56:20 +0200 (CEST)
Received: from localhost ([::1]:45640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMde7-0001TX-ET
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdM5-0007gz-My
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdM4-0001op-8M
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mcfixr9sWA02pp6Gb17P43f1otbtram3wFNIQC/3H/s=;
 b=EOzZnCEf0dS+IGUE9HAbk52RhejuNKNmbkKDZH7ad7J7Ju1yebg9SalK+X7qpQrVTHy1q+
 o0xOeHykRMIid5sZUYxdVvH2Vl0T1XjWYVFRBZ5XUvKMOVEoJh3exwl3lG1NI3+KWnkRip
 8MasJ+mIC5iZR0MUk+Ubfnpk7MbhzU0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-JXYkdInJOkm8bV2Vs0YFkQ-1; Sat, 04 Sep 2021 17:37:38 -0400
X-MC-Unique: JXYkdInJOkm8bV2Vs0YFkQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 bi9-20020a170906a24900b005c74b30ff24so865397ejb.5
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Mcfixr9sWA02pp6Gb17P43f1otbtram3wFNIQC/3H/s=;
 b=txf8ovqmlrebVjXL1lxDRrLnajNPCQTY1CV3zVFjFZ6J3R7ZybqoxztRP9v7r9Pm5n
 yJEpNxB5VFlp9n68ZaK+1qi4DzggJZbcPsmu0lBKTfF9+VPU+5hS77s1tkEA2dQMGfic
 AESa0H6e63XyWKsllI0ZM9PnEsoJa7pKYNvkQO6D30O0SHvpNVTORR784TmB8SkwWZDF
 NThWPZtRkxmLdSBzDKsiijHEUW9mZrVhJhJirBeOk6GKauGNXQkvikvqXEC1CDWOfN9K
 QprQkip1SRNdH57mljaysk5QMShY4H3Cv5U8zeLgvBcaXj0Ldxsx0EdlSRTcJUxiRCVg
 NoYQ==
X-Gm-Message-State: AOAM530h3XXfvnc9fPBs78O6awjyc+XD6QMdxf0jreg4iHY7ik4GaK/2
 pftbSif7OpNo8WINuyf85IIqpS7cy5uYMF2p8HESYOVuvfYpcb4O20oSTtHkKuhc0Ic5NtR5IsE
 0jcQjiOj0eE+tzdIJD58TLcpUnjSsZHO/Wbz4ElzRzU0tDRjs592z8saWG6ri
X-Received: by 2002:a17:906:1d41:: with SMTP id
 o1mr5960055ejh.232.1630791457063; 
 Sat, 04 Sep 2021 14:37:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJye5EiFzfe9Cz8a/2arxhEifrwmqjZynxCnD6tcLyaBbAW7XmwfT68hw1TjoW7KupZA4wHbxg==
X-Received: by 2002:a17:906:1d41:: with SMTP id
 o1mr5960044ejh.232.1630791456919; 
 Sat, 04 Sep 2021 14:37:36 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id c19sm1517557ejs.116.2021.09.04.14.37.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:37:36 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:37:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/35] vhost-vdpa: tweak the error label in vhost_vdpa_add()
Message-ID: <20210904213506.486886-34-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

Introduce new error label to avoid the unnecessary checking of net
pointer.

Fixes: 1e0a84ea49b68 ("vhost-vdpa: introduce vhost-vdpa net client")
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20210903091031.47303-10-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/vhost-vdpa.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index b43df00a85..99327d17b4 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -99,19 +99,18 @@ static int vhost_vdpa_add(NetClientState *ncs, void *be)
     net = vhost_net_init(&options);
     if (!net) {
         error_report("failed to init vhost_net for queue");
-        goto err;
+        goto err_init;
     }
     s->vhost_net = net;
     ret = vhost_vdpa_net_check_device_id(net);
     if (ret) {
-        goto err;
+        goto err_check;
     }
     return 0;
-err:
-    if (net) {
-        vhost_net_cleanup(net);
-        g_free(net);
-    }
+err_check:
+    vhost_net_cleanup(net);
+    g_free(net);
+err_init:
     return -1;
 }
 
-- 
MST


