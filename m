Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9147225C63
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jul 2020 12:05:24 +0200 (CEST)
Received: from localhost ([::1]:57848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxSfj-0006Om-Q7
	for lists+qemu-devel@lfdr.de; Mon, 20 Jul 2020 06:05:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jxSeQ-0005WG-MC
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 06:04:02 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36249
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jxSeO-0007uY-Hc
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 06:04:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595239439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=qyjk0nD5qv7SgRtbfTF32Ffkbp5JEPojYMyQI9NUQYQ=;
 b=eLqsHwtJRK57lXO75cb7QQEX29bhvXd5dQ0DYtqyBtvX4CyzK+Hm9OMbFq+KFnO6cEIMZV
 9dFRTqcEEH/E0WziOYlFN4VAxalHp2L8ZCVjCSZ3Nfn0DqWsdOxQoDyjZL4SVAo6R4jGN6
 1by0YX6q4flU4Rp4PK61UVmcnKgqtOw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-XihBW7ALP6Si_E3hQdmCyA-1; Mon, 20 Jul 2020 06:03:57 -0400
X-MC-Unique: XihBW7ALP6Si_E3hQdmCyA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E15BC100526C
 for <qemu-devel@nongnu.org>; Mon, 20 Jul 2020 10:03:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-89.ams2.redhat.com
 [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C44E559;
 Mon, 20 Jul 2020 10:03:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 00C189D57; Mon, 20 Jul 2020 12:03:53 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] module: ignore NULL type
Date: Mon, 20 Jul 2020 12:03:51 +0200
Message-Id: <20200720100352.2477-3-kraxel@redhat.com>
In-Reply-To: <20200720100352.2477-1-kraxel@redhat.com>
References: <20200720100352.2477-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/20 02:11:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just return in case module_load_qom_one(NULL) is called.
vga_interface_available() can do that.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 util/module.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/util/module.c b/util/module.c
index 90e9bd42c6c7..0ab00851f0a4 100644
--- a/util/module.c
+++ b/util/module.c
@@ -275,6 +275,9 @@ void module_load_qom_one(const char *type)
 {
     int i;
 
+    if (!type) {
+        return;
+    }
     if (module_loaded_qom_all) {
         return;
     }
-- 
2.18.4


