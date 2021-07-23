Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 620563D3460
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 07:59:06 +0200 (CEST)
Received: from localhost ([::1]:60478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6oDB-00029U-6J
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 01:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6o9n-0002ux-S5
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 01:55:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6o9l-0006gT-Nd
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 01:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627019733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+AqYz1D+lIS4/mwLssymakEEeYTD5+DoiZNycMQwlH0=;
 b=dINECE6nidEiz7vaou4Hrk/ucHISP9+UTQ8hSUAu47+iahQrFYCkslaPUnXPUZP8SjPREF
 5VuNwq8UXxqdMdodsFJg76oLGGG1kKxar1h3kt4nylUH7VDu9hCiOtrEpKrOs8g/zBcXec
 RRxO5NwP8nO6GLFL0qMuLNKNE71x+OI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-1yp2yB4ANLyrr7vAQVQBPA-1; Fri, 23 Jul 2021 01:55:31 -0400
X-MC-Unique: 1yp2yB4ANLyrr7vAQVQBPA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2707718C89C4
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 05:55:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F302F60C5F;
 Fri, 23 Jul 2021 05:55:20 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 164FC18009E6; Fri, 23 Jul 2021 07:54:49 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 5/6] vl: add virtio-vga-gl to the default_list
Date: Fri, 23 Jul 2021 07:54:47 +0200
Message-Id: <20210723055448.1032115-6-kraxel@redhat.com>
In-Reply-To: <20210723055448.1032115-1-kraxel@redhat.com>
References: <20210723055448.1032115-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Do not instantiate an extra default VGA device if -device virtio-vga-gl
is provided.

Related to commit b36eb8860f8f4a9c6f131c3fd380116a3017e022 ("virtio-gpu:
add virtio-vga-gl")

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20210701062421.721414-1-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 softmmu/vl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 4df149610185..a6c17fa39c38 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -202,6 +202,7 @@ static struct {
     { .driver = "virtio-vga",           .flag = &default_vga       },
     { .driver = "ati-vga",              .flag = &default_vga       },
     { .driver = "vhost-user-vga",       .flag = &default_vga       },
+    { .driver = "virtio-vga-gl",        .flag = &default_vga       },
 };
 
 static QemuOptsList qemu_rtc_opts = {
-- 
2.31.1


