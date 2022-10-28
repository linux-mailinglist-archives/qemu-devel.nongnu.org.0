Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F3A61129A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:25:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPLF-0001KQ-Hz; Fri, 28 Oct 2022 09:24:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKV-00015e-K7
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKU-0005Hd-14
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666963401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LXRs/3LdONFoVUIPpQWSXmghrUrY4sk+ETH1GMNcAg8=;
 b=RG76lewPbKQunRPHcVkP5X5oSIpkewD8y/Vz3w3Bq2RKqthkUozjUYt6gtY/XFvldEk+s0
 nraFKeQv2l281AGllOBniegQMyMR1rCBnERNNDom3bTYte63lmBDaZcVscFkYckrmCFXWk
 efFkbmMBxg7m+I7dafZ6oqyAN4Zq/u0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-49votRA3MlWWDgsk-4eW-A-1; Fri, 28 Oct 2022 09:23:19 -0400
X-MC-Unique: 49votRA3MlWWDgsk-4eW-A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29795101A5DE;
 Fri, 28 Oct 2022 13:23:19 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E1CE112131B;
 Fri, 28 Oct 2022 13:23:17 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 07/21] MAINTAINERS: target/s390x/: add Ilya as reviewer
Date: Fri, 28 Oct 2022 15:22:50 +0200
Message-Id: <20221028132304.829103-8-thuth@redhat.com>
In-Reply-To: <20221028132304.829103-1-thuth@redhat.com>
References: <20221028132304.829103-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
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

From: Christian Borntraeger <borntraeger@linux.ibm.com>

Ilya has volunteered to review TCG patches for s390x.

Signed-off-by: Christian Borntraeger <borntraeger@linux.ibm.com>
Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20221019125640.3014143-1-borntraeger@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 17ff0a0138..0a331eec7a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -303,6 +303,7 @@ F: target/rx/
 S390 TCG CPUs
 M: Richard Henderson <richard.henderson@linaro.org>
 M: David Hildenbrand <david@redhat.com>
+R: Ilya Leoshkevich <iii@linux.ibm.com>
 S: Maintained
 F: target/s390x/
 F: target/s390x/tcg
-- 
2.31.1


