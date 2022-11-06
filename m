Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BAC61E304
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 16:33:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orhdC-0005sX-WB; Sun, 06 Nov 2022 10:32:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1orhd6-0005qe-Lv
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 10:32:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1orhd5-0000vV-9v
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 10:32:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667748730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ekTTpU+CJBjm1Kk01EmKvdGua+kpsXPd2YRwCKrr4/s=;
 b=Wjxua91rKeZUeFf9R/NY2TRviiThraBPqaVMJ33EpQaGmKa95eEQe4CuTufR3AcOqVeC4y
 EH9u1bXuyPCv5LY9y8oS7eaHutYk6fJ+mfJqWUvYbML8vP09EBz382FZtMsalUT6yNVaqO
 w5byr0LkhKzBTJyFlQwJWzwGI8PnyN4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-gSPe7dYbP--0RgVYl7V2Ow-1; Sun, 06 Nov 2022 10:32:07 -0500
X-MC-Unique: gSPe7dYbP--0RgVYl7V2Ow-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E300F8339B4;
 Sun,  6 Nov 2022 15:32:06 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCDA840C6EC4;
 Sun,  6 Nov 2022 15:32:05 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 04/12] tests/qtest/libqos/e1000e: Use E1000_STATUS_ASDV_1000
Date: Sun,  6 Nov 2022 16:31:48 +0100
Message-Id: <20221106153156.620150-5-thuth@redhat.com>
In-Reply-To: <20221106153156.620150-1-thuth@redhat.com>
References: <20221106153156.620150-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Akihiko Odaki <akihiko.odaki@daynix.com>

Nemonics E1000_STATUS_LAN_INIT_DONE and E1000_STATUS_ASDV_1000 have
the same value, and E1000_STATUS_ASDV_1000 should be used here because
E1000_STATUS_ASDV_1000 represents the auto-detected speed tested here
while E1000_STATUS_LAN_INIT_DONE is a value used for a different purpose
with a variant of e1000e family different from the one implemented in
QEMU.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20221103083425.100590-1-akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/libqos/e1000e.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/libqos/e1000e.c b/tests/qtest/libqos/e1000e.c
index 4fd0bd5311..05af6f2118 100644
--- a/tests/qtest/libqos/e1000e.c
+++ b/tests/qtest/libqos/e1000e.c
@@ -130,8 +130,8 @@ static void e1000e_pci_start_hw(QOSGraphObject *obj)
 
     /* Check the device status - link and speed */
     val = e1000e_macreg_read(&d->e1000e, E1000_STATUS);
-    g_assert_cmphex(val & (E1000_STATUS_LU | E1000_STATUS_LAN_INIT_DONE),
-        ==, E1000_STATUS_LU | E1000_STATUS_LAN_INIT_DONE);
+    g_assert_cmphex(val & (E1000_STATUS_LU | E1000_STATUS_ASDV_1000),
+        ==, E1000_STATUS_LU | E1000_STATUS_ASDV_1000);
 
     /* Initialize TX/RX logic */
     e1000e_macreg_write(&d->e1000e, E1000_RCTL, 0);
-- 
2.31.1


