Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A49C5A6C87
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 20:45:19 +0200 (CEST)
Received: from localhost ([::1]:53378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT6Eb-0004tP-AW
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 14:45:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6AG-0007Zo-Qk
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6AF-00058m-B8
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661884842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VP/a8mFAERUzoOCsHlXCAnowfh9L65bIgncWFePKjfE=;
 b=YS8Q04fPwBs0O7jqCshgfDnM+yPcHcfTCX2UOSqpHNj4UfMzOiRsCBlukl8izgN/2C8YwZ
 4yN83Ui9qaysZtBTtTbUlSqbkgNeVcL24DUQEalwc7v0xATCa2yn3x0YDLa3URgriyK/fd
 pjYsVGLzT9v4fkIqcT5sNrTTsmbKTHY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-eSjNjYZWNVOXNS2U_YOupQ-1; Tue, 30 Aug 2022 14:40:37 -0400
X-MC-Unique: eSjNjYZWNVOXNS2U_YOupQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3303629AA2FA;
 Tue, 30 Aug 2022 18:40:37 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0EF9A1415117;
 Tue, 30 Aug 2022 18:40:35 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PULL 13/23] tests/qtest: device-plug-test: Reverse the usage of
 double/single quotes
Date: Tue, 30 Aug 2022 20:40:02 +0200
Message-Id: <20220830184012.77978-14-thuth@redhat.com>
In-Reply-To: <20220830184012.77978-1-thuth@redhat.com>
References: <20220830184012.77978-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

The usage of double/single quotes in test_pci_unplug_json_request()
should be reversed to work on both win32 and non-win32 platforms:

- The value of -device parameter needs to be surrounded by "" as
  Windows does not drop '' when passing it to QEMU which causes
  QEMU command line option parser failure.
- The JSON key/value pairs need to be surrounded by '' to make the
  JSON parser happy on Windows.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220824094029.1634519-36-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/device-plug-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
index 2e3137843e..a1fb99c8ff 100644
--- a/tests/qtest/device-plug-test.c
+++ b/tests/qtest/device-plug-test.c
@@ -95,7 +95,7 @@ static void test_pci_unplug_json_request(void)
     }
 
     QTestState *qtest = qtest_initf(
-        "%s -device '{\"driver\": \"virtio-mouse-pci\", \"id\": \"dev0\"}'",
+        "%s -device \"{'driver': 'virtio-mouse-pci', 'id': 'dev0'}\"",
         machine_addition);
 
     /*
-- 
2.31.1


