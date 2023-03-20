Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 532206C129C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 14:05:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peFBJ-0001JW-9L; Mon, 20 Mar 2023 09:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peFBF-0001J5-2N
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:04:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1peFBD-0006Kx-B5
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 09:04:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679317442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IEZoy54UNTSWw9dnjNawsZEl0xUoegcInF2dFQwV8eQ=;
 b=VYNCpM6HbsA4IbtUF86XyM2OxY2k8533xGbNaqpyPhPNnPL5ZIgXwoOuA++R3/xf+UNuVz
 Swag0pqaDrmo9IceqNz0rqdJRy2OEXIJFPtBRw3+mpP7swwIPO4vqWGAZxoycdTu88p8uY
 7E6/TTx9tHRIYJLz7t6ZODhvGamLlAE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-s7RQu7HbMt2VrMN3zEssBA-1; Mon, 20 Mar 2023 09:03:59 -0400
X-MC-Unique: s7RQu7HbMt2VrMN3zEssBA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E1CC8526FC;
 Mon, 20 Mar 2023 13:03:58 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 655FDC15BA0;
 Mon, 20 Mar 2023 13:03:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 19/24] target/s390x: Update do_unaligned_access() comment
Date: Mon, 20 Mar 2023 14:03:25 +0100
Message-Id: <20230320130330.406378-20-thuth@redhat.com>
In-Reply-To: <20230320130330.406378-1-thuth@redhat.com>
References: <20230320130330.406378-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ilya Leoshkevich <iii@linux.ibm.com>

Relative long instructions now depend on do_unaligned_access() too.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230316164428.275147-12-iii@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/tcg/excp_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
index a7829b1e49..228aa9f237 100644
--- a/target/s390x/tcg/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -85,8 +85,8 @@ void HELPER(data_exception)(CPUS390XState *env, uint32_t dxc)
 
 /*
  * Unaligned accesses are only diagnosed with MO_ALIGN.  At the moment,
- * this is only for the atomic operations, for which we want to raise a
- * specification exception.
+ * this is only for the atomic and relative long operations, for which we want
+ * to raise a specification exception.
  */
 static G_NORETURN
 void do_unaligned_access(CPUState *cs, uintptr_t retaddr)
-- 
2.31.1


