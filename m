Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0DC6196BA
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 13:58:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqwGI-0001sr-Ql; Fri, 04 Nov 2022 08:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oqwGG-0001r7-QL
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 08:57:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oqwGE-0004Na-7n
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 08:57:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667566645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9bckxzEt+3VgSaPYJ9G43DS/NL0CDIE8SBblgiNSMQQ=;
 b=Chey5VdlpwrBojkHLSs+n8v3gpEr57VdFtbhdPEDQKiSkTnB+3uaGeygSHzO+DdC2MQlw2
 RuPlRGO20u4BVW24SiqlF9rS3Q7zeuoaALpshyly6FDfYeEgZydPp6GXUDGNZuw79tSpPu
 0HWVVaKffXccvR7XK9EKnjKgy8LaLio=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-OYpf3DFJO829ay44hNA5nw-1; Fri, 04 Nov 2022 08:57:11 -0400
X-MC-Unique: OYpf3DFJO829ay44hNA5nw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 886D93C01DED
 for <qemu-devel@nongnu.org>; Fri,  4 Nov 2022 12:57:11 +0000 (UTC)
Received: from thuth.com (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA3B04A9254;
 Fri,  4 Nov 2022 12:57:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Jason Wang <jasowang@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	pbonzini@redhat.com
Subject: [PATCH 3/3] net: Replace "Supported NIC models" with "Available NIC
 models"
Date: Fri,  4 Nov 2022 13:57:05 +0100
Message-Id: <20221104125705.415923-4-thuth@redhat.com>
In-Reply-To: <20221104125705.415923-1-thuth@redhat.com>
References: <20221104125705.415923-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Just because a NIC model is compiled into the QEMU binary does not
necessary mean that it can be used with each and every machine.
So let's rather talk about "available" models instead of "supported"
models, just to avoid confusion.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 net/net.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/net.c b/net/net.c
index b4b8f2a9cc..173195dbf9 100644
--- a/net/net.c
+++ b/net/net.c
@@ -943,7 +943,7 @@ int qemu_show_nic_models(const char *arg, const char *const *models)
         return 0;
     }
 
-    printf("Supported NIC models:\n");
+    printf("Available NIC models:\n");
     for (i = 0 ; models[i]; i++) {
         printf("%s\n", models[i]);
     }
-- 
2.31.1


