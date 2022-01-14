Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2313548E386
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 06:18:19 +0100 (CET)
Received: from localhost ([::1]:39270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Eyg-0005rf-8c
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 00:18:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n8EqS-0005wE-QX
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 00:09:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n8EqQ-0001OS-Gk
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 00:09:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642136985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bY6cvK6nZc9hj0bIXLe/SWrY0nGYXsMM/ScTWeXubo0=;
 b=PJynOT0fv2wObkLAn0Nd2Ftak6R8ZZH3urebNPsdQKKQSRWVVNPsoDyZ2ksZs7f1S2zQKJ
 LG8rVFpFvi+tnLf9rPnrbOFwl+X3ZqLFHzaDlsvz1t2Gm7pmejIx/1EGg9ak0p7fPX7FP2
 17/3E2pVjrdJd4uGbCH5BTD6gR0OMz0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-F_0zF2S0M2yzw09uF0ZcqA-1; Fri, 14 Jan 2022 00:09:43 -0500
X-MC-Unique: F_0zF2S0M2yzw09uF0ZcqA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D96FE1F759;
 Fri, 14 Jan 2022 05:09:42 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-172.pek2.redhat.com
 [10.72.13.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3CD16108A9;
 Fri, 14 Jan 2022 05:09:40 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL V3 05/13] net/colo-compare.c: Update the default value comments
Date: Fri, 14 Jan 2022 13:09:01 +0800
Message-Id: <20220114050909.27133-6-jasowang@redhat.com>
In-Reply-To: <20220114050909.27133-1-jasowang@redhat.com>
References: <20220114050909.27133-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


