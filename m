Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 192B2402A1A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:48:00 +0200 (CEST)
Received: from localhost ([::1]:33772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbSB-0004Zn-3V
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNawt-0003Ln-U6
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:15:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNawq-0002Yy-26
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:15:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631020534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b6ZVTQs70Xpb7FE0bSCZCezQeMVdMSEdhwlbYGBkpt0=;
 b=WRAk+55QxK1fS/smVk9h2TvZ2qWJlqnNOHvKZSrXzN9sZfgMzr+NF0HeXsVa5xtrMo4Q+d
 +mkxplSNW0z0fRxBGU3s8Q0f7bXHR6FqBsjBa1P0YOaokHfEmT2AJwC8e2Bg+N7jQkRmuF
 i0eD8fhdmzxtdwI7ExcJeDDWqABKJeo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-HuJYy8-MPKyBGau-mg33Og-1; Tue, 07 Sep 2021 09:15:33 -0400
X-MC-Unique: HuJYy8-MPKyBGau-mg33Og-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D0DA802937;
 Tue,  7 Sep 2021 13:15:32 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AB835C1B4;
 Tue,  7 Sep 2021 13:15:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 11/20] s390x/mmu_helper: fixup mmu_translate() documentation
Date: Tue,  7 Sep 2021 15:14:40 +0200
Message-Id: <20210907131449.493875-12-thuth@redhat.com>
In-Reply-To: <20210907131449.493875-1-thuth@redhat.com>
References: <20210907131449.493875-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.391, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Looks like we forgot to adjust documentation of one parameter.

Signed-off-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210903155514.44772-7-david@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
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
2.27.0


