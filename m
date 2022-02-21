Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CEE4BD9CC
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 14:11:59 +0100 (CET)
Received: from localhost ([::1]:55366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM8Tt-0008UM-Vj
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 08:11:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7OA-00045r-L7
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:01:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7O8-0000va-Lo
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:01:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645444916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2zAqBqtgrFSt48jCJWqeZ2YbzpF4L0FKHwROYYlVarY=;
 b=FsnNI2jswAjs5Y0KgQGmIXpHQ9ewGz+p6AkO+t49wqMhM83cwtioFTdLUUP5/zBsMG46gi
 JD0KK1Mu02qErjdXKA4TQv0OFk9Sk2N2+aTP+1lWyaVSMUWiiTLULGJOYkDidabwX5VcEW
 sFo5/nWqLMrH7vXdHfUWVt3tYCsrgr8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-rpCs6wzjMhmyD5ojtX9ywQ-1; Mon, 21 Feb 2022 07:01:52 -0500
X-MC-Unique: rpCs6wzjMhmyD5ojtX9ywQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C76931091DA0;
 Mon, 21 Feb 2022 12:01:51 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BDE673160;
 Mon, 21 Feb 2022 12:01:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/25] qtest: Add missing 'hw/qdev-core.h' include
Date: Mon, 21 Feb 2022 13:00:00 +0100
Message-Id: <20220221120008.600114-18-thuth@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Add "hw/qdev-core.h" to avoid when refactoring include/:

  softmmu/qtest.c:404:9: error: use of undeclared identifier 'NamedGPIOList'
        NamedGPIOList *ngl;
        ^

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220207082756.82600-5-f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 softmmu/qtest.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/softmmu/qtest.c b/softmmu/qtest.c
index 72751e1fd8..8b7cb6aa8e 100644
--- a/softmmu/qtest.c
+++ b/softmmu/qtest.c
@@ -19,6 +19,7 @@
 #include "chardev/char-fe.h"
 #include "exec/ioport.h"
 #include "exec/memory.h"
+#include "hw/qdev-core.h"
 #include "hw/irq.h"
 #include "qemu/accel.h"
 #include "sysemu/cpu-timers.h"
-- 
2.27.0


