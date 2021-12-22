Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A363E47D11F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 12:38:41 +0100 (CET)
Received: from localhost ([::1]:34694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzzxA-0006KX-Pi
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 06:38:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzzsb-00011C-6L
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 06:33:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54146)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzzsX-00071E-7x
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 06:33:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640172832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q7HEwSW5CmcozoOgGeD5JmUQ5/pq/T+6BVd8h5XX9RM=;
 b=A5jEtQBRqwT5nMHF+Kt+bfLZNh+sP/qYP18QwK50zEiKs2wlgqP9rpMB+jIXYMTFCvzwD7
 HH9pI8Lww9C+qwFXaiwDSZv8BwIyb9eUcS/qUIr5/7HMHYZkK/7uC0JMBYXz7KDk0NzJfz
 +esJImWnHX80+yAvxsUCZ2Ulm4Q7Pc4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-YwEp-zZIPYaCiqmAmDB0Wg-1; Wed, 22 Dec 2021 06:33:49 -0500
X-MC-Unique: YwEp-zZIPYaCiqmAmDB0Wg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FA7081CCB4;
 Wed, 22 Dec 2021 11:33:48 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FA357B015;
 Wed, 22 Dec 2021 11:33:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/9] tests/qtest/boot-serial-test: Silence the warning about
 deprecated sga device
Date: Wed, 22 Dec 2021 12:32:52 +0100
Message-Id: <20211222113259.823203-3-thuth@redhat.com>
In-Reply-To: <20211222113259.823203-1-thuth@redhat.com>
References: <20211222113259.823203-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running the qtests, there are currently a bunch of warnings about
the deprecated sga device during the boot-serial-test. Switch to
"-M graphics=off" to silence these warnings.

Message-Id: <20211220164042.397028-1-thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/boot-serial-test.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
index 4d8e1343bd..d72a82d629 100644
--- a/tests/qtest/boot-serial-test.c
+++ b/tests/qtest/boot-serial-test.c
@@ -157,11 +157,11 @@ static testdef_t tests[] = {
     { "ppc64", "powernv8", "", "OPAL" },
     { "ppc64", "powernv9", "", "OPAL" },
     { "ppc64", "sam460ex", "-device e1000", "8086  100e" },
-    { "i386", "isapc", "-cpu qemu32 -device sga", "SGABIOS" },
-    { "i386", "pc", "-device sga", "SGABIOS" },
-    { "i386", "q35", "-device sga", "SGABIOS" },
-    { "x86_64", "isapc", "-cpu qemu32 -device sga", "SGABIOS" },
-    { "x86_64", "q35", "-device sga", "SGABIOS" },
+    { "i386", "isapc", "-cpu qemu32 -M graphics=off", "SeaBIOS" },
+    { "i386", "pc", "-M graphics=off", "SeaBIOS" },
+    { "i386", "q35", "-M graphics=off", "SeaBIOS" },
+    { "x86_64", "isapc", "-cpu qemu32 -M graphics=off", "SeaBIOS" },
+    { "x86_64", "q35", "-M graphics=off", "SeaBIOS" },
     { "sparc", "LX", "", "TMS390S10" },
     { "sparc", "SS-4", "", "MB86904" },
     { "sparc", "SS-600MP", "", "TMS390Z55" },
-- 
2.27.0


