Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA32F641B51
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 08:32:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1jSo-0000vq-Gf; Sun, 04 Dec 2022 02:31:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p1jSl-0000vF-Jh
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 02:30:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p1jSk-0001fO-7Z
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 02:30:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670139057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iBXOTls0ls8EQxLSBoIe1IhGZWHU7ZY9DYJEMi6bQmU=;
 b=BsEC5dei9tJfF72PHgrCNhH3eebU4BWIRyzvO8qKhUzbS08a3jZg2yJxHNPh0FMtJAmSbw
 QS8OB1MQL2e/1LK9OLAX3lvrAJnUCLXH3OhbfT5NfcDz8/Mku5saGCXQM6EQR744x9bPOy
 hmHeyuUvFNkMJImCp/3FNtQ8Itbxokc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-JgIPkhnhMEi39c47VgvUFw-1; Sun, 04 Dec 2022 02:30:54 -0500
X-MC-Unique: JgIPkhnhMEi39c47VgvUFw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CF59185A78B
 for <qemu-devel@nongnu.org>; Sun,  4 Dec 2022 07:30:54 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0ABF82166B29;
 Sun,  4 Dec 2022 07:30:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PULL 3/3] hw/display/next-fb: Fix comment typo
Date: Sun,  4 Dec 2022 08:30:43 +0100
Message-Id: <20221204073043.54402-4-thuth@redhat.com>
In-Reply-To: <20221204073043.54402-1-thuth@redhat.com>
References: <20221204073043.54402-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>

Signed-off-by: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
Message-Id: <20221125160849.23711-1-evgeny.v.ermakov@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/display/next-fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/next-fb.c b/hw/display/next-fb.c
index dd6a1aa8ae..8446ff3c00 100644
--- a/hw/display/next-fb.c
+++ b/hw/display/next-fb.c
@@ -126,7 +126,7 @@ static void nextfb_class_init(ObjectClass *oc, void *data)
     set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
     dc->realize = nextfb_realize;
 
-    /* Note: This device does not any state that we have to reset or migrate */
+    /* Note: This device does not have any state that we have to reset or migrate */
 }
 
 static const TypeInfo nextfb_info = {
-- 
2.31.1


