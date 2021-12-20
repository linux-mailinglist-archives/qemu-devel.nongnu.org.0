Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB8A47B38B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 20:14:18 +0100 (CET)
Received: from localhost ([::1]:49282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzO6z-0005pz-Vq
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 14:14:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzLie-00016B-6c
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 11:41:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzLib-0007Fa-1X
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 11:40:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640018456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DYfIhBF3Tbqlm/G1grPOH67XYFiuU3OUy7iar3hd2R0=;
 b=VABVSnJg1sz5p46qN6iOHe87SnU/QFCKrB8yKT0TsRId7udcFdBvPqLhIxaPr2CWT9MmcB
 R2apyDtsb7IVhvT4DxtkCoDoLk75b36YCDEtls6Mh8QvzJLY4rsn8o6A8yp1fmF4MosW0P
 IlqNcI72cuqhgUGRfKPnoI9UVZSwS1M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-XGwc8EvAPymKrDQZkVyX8A-1; Mon, 20 Dec 2021 11:40:54 -0500
X-MC-Unique: XGwc8EvAPymKrDQZkVyX8A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 272B2801AAB
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 16:40:54 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 481945DF4B;
 Mon, 20 Dec 2021 16:40:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH] tests/qtest/boot-serial-test: Silence the warning about
 deprecated sga device
Date: Mon, 20 Dec 2021 17:40:42 +0100
Message-Id: <20211220164042.397028-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
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
Cc: kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running the qtests, there are currently a bunch of warnings about
the deprecated sga device during the boot-serial-test. Switch to
"-M graphics=off" to silence these warnings.

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


