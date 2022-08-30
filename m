Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EF45A6CDD
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 21:12:16 +0200 (CEST)
Received: from localhost ([::1]:55662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT6ek-0004hr-PF
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 15:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6AJ-0007af-KE
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6AH-00059L-6q
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661884844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gWu2ue5FbA0VTaTgYN+1Vxs9PqXQn1tRbHSCr9kXQnE=;
 b=IdJzi+x7mXkqZTF0ojCoBLBmkGxz3FCpPrdQfozDUno7pWMPBBBztq8cRoctHdftEPckgR
 7VcS/SOv1jDtXGOSbkNTbVwymEOv8Op9NC4MAsxI/snj4kv3F40VR77y7iShWGmNioI7gh
 5kw3G1yEH0NkCZxfNruJ1CTaRRtzRps=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-c3KiG51mM8KjoFTLzgiSNg-1; Tue, 30 Aug 2022 14:40:43 -0400
X-MC-Unique: c3KiG51mM8KjoFTLzgiSNg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4B4685A589;
 Tue, 30 Aug 2022 18:40:42 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A16E51410DD5;
 Tue, 30 Aug 2022 18:40:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PULL 16/23] tests/qtest: prom-env-test: Use double quotes to pass
 the prom-env option
Date: Tue, 30 Aug 2022 20:40:05 +0200
Message-Id: <20220830184012.77978-17-thuth@redhat.com>
In-Reply-To: <20220830184012.77978-1-thuth@redhat.com>
References: <20220830184012.77978-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Single quotes like -prom-env 'nvramrc=cafec0de 4000 l!' in the arguments
are not removed in the Windows environment before it is passed to the
QEMU executable. Such argument causes a failure in the QEMU prom-env
option parser codes.

Change to use double quotes which works fine on all platforms.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220824094029.1634519-46-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/prom-env-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/prom-env-test.c b/tests/qtest/prom-env-test.c
index c2b0448e55..39ccb59797 100644
--- a/tests/qtest/prom-env-test.c
+++ b/tests/qtest/prom-env-test.c
@@ -58,8 +58,8 @@ static void test_machine(const void *machine)
             " -machine " PSERIES_DEFAULT_CAPABILITIES;
     }
 
-    qts = qtest_initf("-M %s -accel tcg %s -prom-env 'use-nvramrc?=true' "
-                      "-prom-env 'nvramrc=%x %x l!' ", (const char *)machine,
+    qts = qtest_initf("-M %s -accel tcg %s -prom-env \"use-nvramrc?=true\" "
+                      "-prom-env \"nvramrc=%x %x l!\" ", (const char *)machine,
                       extra_args, MAGIC, ADDRESS);
     check_guest_memory(qts);
     qtest_quit(qts);
-- 
2.31.1


