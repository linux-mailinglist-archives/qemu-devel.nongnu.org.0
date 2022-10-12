Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 226555FC308
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 11:25:34 +0200 (CEST)
Received: from localhost ([::1]:51336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiXzY-0005Kx-VN
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 05:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiXpB-0003k4-Dx
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 05:14:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiXp4-00020I-35
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 05:14:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665566081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=pxd26dZJ5VDEEW8MqqI9RY1lhGTmRYgdDAtwUIZ7yNs=;
 b=LbY5IwrDzdRsDFfm+p+3pUHa9BFVOoIxPJusSL+Bq85NY+Anq+PExI4PcasFhwku2OR1EA
 8v/c4R1ff594pxtAxWslUl4uONA2YcdWXj5wKzykR+AsvBlpqcq37yr7KeKQKzF+D3ESR/
 oTmkwct1na/e96JDxL8rKUVJrzdenPY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-zux7na_AOJOlhJUpuJEVgg-1; Wed, 12 Oct 2022 05:14:40 -0400
X-MC-Unique: zux7na_AOJOlhJUpuJEVgg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1389811E67;
 Wed, 12 Oct 2022 09:14:39 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 667AFC15BA4;
 Wed, 12 Oct 2022 09:14:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Laurent Vivier <lvivier@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PATCH] tests/qtest/cxl-test: Remove temporary directories after
 testing
Date: Wed, 12 Oct 2022 11:14:35 +0200
Message-Id: <20221012091435.893570-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The cxl-test leaves some temporary directories behind. Let's
clean them up now!

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/cxl-test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
index cbe0fb549b..61f25a72b6 100644
--- a/tests/qtest/cxl-test.c
+++ b/tests/qtest/cxl-test.c
@@ -101,6 +101,7 @@ static void cxl_t3d(void)
 
     qtest_start(cmdline->str);
     qtest_end();
+    rmdir(tmpfs);
 }
 
 static void cxl_1pxb_2rp_2t3d(void)
@@ -115,6 +116,7 @@ static void cxl_1pxb_2rp_2t3d(void)
 
     qtest_start(cmdline->str);
     qtest_end();
+    rmdir(tmpfs);
 }
 
 static void cxl_2pxb_4rp_4t3d(void)
@@ -130,6 +132,7 @@ static void cxl_2pxb_4rp_4t3d(void)
 
     qtest_start(cmdline->str);
     qtest_end();
+    rmdir(tmpfs);
 }
 #endif /* CONFIG_POSIX */
 
-- 
2.31.1


