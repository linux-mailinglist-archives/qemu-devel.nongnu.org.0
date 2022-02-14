Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB644B40A5
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 05:16:04 +0100 (CET)
Received: from localhost ([::1]:59504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJSmG-0003F4-H0
	for lists+qemu-devel@lfdr.de; Sun, 13 Feb 2022 23:15:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJSXg-0006Xo-Au
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 23:00:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJSXd-0000AB-WD
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 23:00:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644811245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bY6cvK6nZc9hj0bIXLe/SWrY0nGYXsMM/ScTWeXubo0=;
 b=AhIKkdP7THivd5tujpFlFwe1uyZabxX1TvXog6FZHUdr2fmUqVnWl2cT8BBexWsU2wBYTm
 DBINO09Y8YrVIocO1DiwfFlam6XigVBEnDLxmcfoLvgfqeuzRVMcZDx8lKc96Ux78fPf+8
 yMcV16XF5OJZsAO+3Ef6gHYg0l6FC3E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-mahFdZuJO5acSDi-0HqC0g-1; Sun, 13 Feb 2022 23:00:42 -0500
X-MC-Unique: mahFdZuJO5acSDi-0HqC0g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D4601091DA2;
 Mon, 14 Feb 2022 04:00:41 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-241.pek2.redhat.com
 [10.72.13.241])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B35A346993;
 Mon, 14 Feb 2022 04:00:39 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 5/8] net/colo-compare.c: Update the default value comments
Date: Mon, 14 Feb 2022 11:59:54 +0800
Message-Id: <20220214035957.71339-6-jasowang@redhat.com>
In-Reply-To: <20220214035957.71339-1-jasowang@redhat.com>
References: <20220214035957.71339-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Zhang Chen <chen.zhang@intel.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zhang Chen <chen.zhang@intel.com>

Make the comments consistent with the REGULAR_PACKET_CHECK_MS.

Signed-off-by: Zhang Chen <chen.zhang@intel.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/colo-compare.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/colo-compare.c b/net/colo-compare.c
index 216de5a..62554b5 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -1267,7 +1267,7 @@ static void colo_compare_complete(UserCreatable *uc, Error **errp)
     }
 
     if (!s->expired_scan_cycle) {
-        /* Set default value to 3000 MS */
+        /* Set default value to 1000 MS */
         s->expired_scan_cycle = REGULAR_PACKET_CHECK_MS;
     }
 
-- 
2.7.4


