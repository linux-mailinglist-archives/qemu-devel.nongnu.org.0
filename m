Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B494BD98C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 13:08:18 +0100 (CET)
Received: from localhost ([::1]:52614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM7UH-00072E-BF
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 07:08:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7NN-0003qY-Vp
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:01:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7NL-0000p7-GH
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:01:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645444866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YerZ32/3jtWzAtNH5XFDIJqtCOfQSUS9OebBdydGUfE=;
 b=Dg05+QWKPTX82I2gDnJZ44hfqvYQoUV5EcR70PCq64syN5lXaFkv8iDK5cPy9MVVaH8qeD
 lH0AH2Kadp7ZoHoZlIrUsOFlJGAS+81nWKEHSryRohL5Q9GVtMbNiK3rWey+6bJvRaORh0
 I4LU9lvThoDMqg3ng1g7Bf1pBkdqI0E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-vtdTlKofM4uiaTTmBG7Uww-1; Mon, 21 Feb 2022 07:01:03 -0500
X-MC-Unique: vtdTlKofM4uiaTTmBG7Uww-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9071F1853026;
 Mon, 21 Feb 2022 12:01:02 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5306373162;
 Mon, 21 Feb 2022 12:01:01 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/25] erst: drop cast to long long
Date: Mon, 21 Feb 2022 12:59:46 +0100
Message-Id: <20220221120008.600114-4-thuth@redhat.com>
In-Reply-To: <20220221120008.600114-1-thuth@redhat.com>
References: <20220221120008.600114-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Michael S. Tsirkin" <mst@redhat.com>

The way to print uint64_t is with PRIx64, not with
a cast to long long.

Message-Id: <20220206093547.1282513-1-mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/erst-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/erst-test.c b/tests/qtest/erst-test.c
index c6a0ae4013..f94cd8dd8e 100644
--- a/tests/qtest/erst-test.c
+++ b/tests/qtest/erst-test.c
@@ -75,7 +75,7 @@ static inline uint64_t in_reg64(ERSTState *s, unsigned reg)
     uint64_t res;
 
     res = qpci_io_readq(s->dev, s->reg_bar, reg);
-    g_test_message("*%s -> %016llx", name, (unsigned long long)res);
+    g_test_message("*%s -> %016" PRIx64, name, res);
 
     return res;
 }
-- 
2.27.0


