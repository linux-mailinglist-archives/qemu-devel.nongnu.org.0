Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9D84A0410
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 00:06:47 +0100 (CET)
Received: from localhost ([::1]:42738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDaKM-0003Ep-HN
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 18:06:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nDaEE-00059r-PQ
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:00:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nDaE0-00069n-6R
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:00:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643410809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=391AyLgJBRzk74ny42xmsenxqZfkOGPWZo1xnxfSmQ4=;
 b=dSgHDm2zaWW+zHpziEAHGtUtc8waDPTKqEyeJcan6ulJQbt5u85e47ysBfQl5dWzn2JDWA
 LqLVdpAOlfQ/WHNqYS3VWGQNjBlupkJTsjXo835QamiU8oUiWRA4+bctVluqEdl7GyW5/J
 tAMRvbuq5m0w/eWsXnxLQ+Pq9Sv1DhQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-dZNCjB5dOyq9CMfpX5ZkOw-1; Fri, 28 Jan 2022 18:00:08 -0500
X-MC-Unique: dZNCjB5dOyq9CMfpX5ZkOw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47DCE100CCC0;
 Fri, 28 Jan 2022 23:00:07 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.22.32.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1ED69108B4;
 Fri, 28 Jan 2022 23:00:06 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] nbd/server.c: Remove unused field
Date: Fri, 28 Jan 2022 17:00:00 -0600
Message-Id: <20220128230003.1114719-2-eblake@redhat.com>
In-Reply-To: <20220128230003.1114719-1-eblake@redhat.com>
References: <20220128230003.1114719-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) DKIMWL_WL_HIGH=-0.167, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Nir Soffer <nsoffer@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nir Soffer <nsoffer@redhat.com>

NBDRequestData struct has unused QSIMPLEQ_ENTRY field. It seems that
this field exists since the first git commit and was never used.

Signed-off-by: Nir Soffer <nsoffer@redhat.com>
Message-Id: <20220111194313.581486-1-nsoffer@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Fixes: d9a73806 ("qemu-nbd: introduce NBDRequest", v1.1)
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/server.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/nbd/server.c b/nbd/server.c
index 4630dd732250..9fb2f264023e 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -77,7 +77,6 @@ static int system_errno_to_nbd_errno(int err)
 typedef struct NBDRequestData NBDRequestData;

 struct NBDRequestData {
-    QSIMPLEQ_ENTRY(NBDRequestData) entry;
     NBDClient *client;
     uint8_t *data;
     bool complete;
-- 
2.34.1


