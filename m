Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB72469D5C4
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 22:25:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUDeR-00012j-4G; Mon, 20 Feb 2023 16:24:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pUDeP-00011v-6B
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 16:24:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pUDeN-0003bx-4Z
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 16:24:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676928282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5DO1mZwoAkYPQzfEzo8A1LTayfYDhjbuzjhIRR/8IX4=;
 b=P9swPUY+hEkZBQ4zUDWe+mw/pui+PDvtppDB9E1TB8R5n0HL09sLEMaeIgY/dwPmEUiIbY
 HGWI512mQOHsK5XcAyeozXjPaLNfm47aoxgC9PXg8wkyAY5tu3yODjqpkrMZbx4Qb2hN9D
 DGIEhlo8iY8B4HzOW5hF0QQ+9PEfGYY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-168-nTM0JD-GPsOLNeXQ4_LWzQ-1; Mon, 20 Feb 2023 16:24:38 -0500
X-MC-Unique: nTM0JD-GPsOLNeXQ4_LWzQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6952E85A5A3;
 Mon, 20 Feb 2023 21:24:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 430ED492B04;
 Mon, 20 Feb 2023 21:24:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 32C7121E6A1F; Mon, 20 Feb 2023 22:24:37 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, bwidawsk@kernel.org, Jonathan.Cameron@Huawei.com
Subject: [PATCH] MAINTAINERS: Remove CXL maintainer Ben Widawsky
Date: Mon, 20 Feb 2023 22:24:37 +0100
Message-Id: <20230220212437.1462314-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Ben is no longer with intel.  He told me he expected to get back to
CXL, but it's not happening as quickly as he'd like, and that it's
best to remove him as maintainer.  So let's do that.

Thank you for serving as maintainer, Ben!

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fd54c1f140..c3e83a1a47 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2630,7 +2630,6 @@ T: git https://gitlab.com/jsnow/qemu.git jobs
 T: git https://gitlab.com/vsementsov/qemu.git block
 
 Compute Express Link
-M: Ben Widawsky <ben.widawsky@intel.com>
 M: Jonathan Cameron <jonathan.cameron@huawei.com>
 S: Supported
 F: hw/cxl/
-- 
2.39.0


