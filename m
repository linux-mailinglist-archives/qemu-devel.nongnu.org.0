Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 477993E8CFF
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 11:14:00 +0200 (CEST)
Received: from localhost ([::1]:39844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDkJD-0007Cy-Cl
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 05:13:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mDkBR-0003cN-MG
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 05:05:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mDkBQ-00081J-5i
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 05:05:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628672755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wiY5CmPNZqXMtJWZ/fgLd7xkq85LpX5IToi2MNmjMHg=;
 b=SjWpJzXtNhsDhItUdgLXnn20kPIP1ga+DcxvTDpTXnFLesW/Xj3P4QkEGLVnBTbFsi6CMP
 /mbw/ifl3DV4/eOYAKPEir4pH6fcKLl3Jbi6uMvmXrMtgIN2y10HIVSA5He2DALjMlIjM8
 ryXkdF+DkZK4wJJfqRiclccMbbOZ9zo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-9wcpyUInMeK_V0qV2yzVxg-1; Wed, 11 Aug 2021 05:05:54 -0400
X-MC-Unique: 9wcpyUInMeK_V0qV2yzVxg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D1C1801B3C;
 Wed, 11 Aug 2021 09:05:53 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6C355B826;
 Wed, 11 Aug 2021 09:05:50 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/13] s390x/mmu_helper: fixup mmu_translate() documentation
Date: Wed, 11 Aug 2021 11:05:20 +0200
Message-Id: <20210811090527.30556-7-david@redhat.com>
In-Reply-To: <20210811090527.30556-1-david@redhat.com>
References: <20210811090527.30556-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Imbrenda <imbrenda@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looks like we forgot to adjust documentation of one parameter.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/mmu_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/s390x/mmu_helper.c b/target/s390x/mmu_helper.c
index 167f1b1455..ca25dadb5b 100644
--- a/target/s390x/mmu_helper.c
+++ b/target/s390x/mmu_helper.c
@@ -374,7 +374,8 @@ static void mmu_handle_skey(target_ulong addr, int rw, int *flags)
  * @param asc    address space control (one of the PSW_ASC_* modes)
  * @param raddr  the translated address is stored to this pointer
  * @param flags  the PAGE_READ/WRITE/EXEC flags are stored to this pointer
- * @param exc    true = inject a program check if a fault occurred
+ * @param tec    the translation exception code if stored to this pointer if
+ *               there is an exception to raise
  * @return       0 = success, != 0, the exception to raise
  */
 int mmu_translate(CPUS390XState *env, target_ulong vaddr, int rw, uint64_t asc,
-- 
2.31.1


