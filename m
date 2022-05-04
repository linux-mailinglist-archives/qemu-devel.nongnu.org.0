Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59350519E86
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 13:50:07 +0200 (CEST)
Received: from localhost ([::1]:34724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmDWA-0006F8-CX
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 07:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmCpC-0001fn-Jl
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:05:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmCp8-0001Ya-Cl
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:05:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651662336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AbZrWAwNYrYvnQ8yuxZtHZXZ5n5QM7U+TfznPLFSoU8=;
 b=f9YcuTcpCqDZpiOePlHER4N0tRjmss75l1pLrgeyNbXtbZO+DLkfZZAxni2+ZTftpxmXPC
 r3YaKHorOhHpqz/r5cxYtiXVeiELWkQGuW4+Kuc1Y8Mjx/7DdQ8qiZIOcmWw1wxJkU/olL
 DUz5JylSIqYOtS0kWnyROsloaN643KA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-jIPPdAl7MLKxKpPL_yBKeg-1; Wed, 04 May 2022 07:05:35 -0400
X-MC-Unique: jIPPdAl7MLKxKpPL_yBKeg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 147B73C977C1;
 Wed,  4 May 2022 11:05:35 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB471111D78A;
 Wed,  4 May 2022 11:05:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [PULL 02/15] s390x/cpu_models: drop "msa5" from the TCG "max" model
Date: Wed,  4 May 2022 13:05:08 +0200
Message-Id: <20220504110521.343519-3-thuth@redhat.com>
In-Reply-To: <20220504110521.343519-1-thuth@redhat.com>
References: <20220504110521.343519-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

We don't include the "msa5" feature in the "qemu" model because it
generates a warning. The PoP states:

"The message-security-assist extension 5 requires
the secure-hash-algorithm (SHA-512) capabilities of
the message-security-assist extension 2 as a prereq-
uisite. (March, 2015)"

As SHA-512 won't be supported in the near future, let's just drop the
feature from the "max" model. This avoids the warning and allows us for
making the "max" model match the "qemu" model (except for compat
machines). We don't lose much, as we only implement the function stubs
for MSA, excluding any real subfunctions.

Signed-off-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/897
Message-Id: <20220428094708.84835-3-david@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/s390x/gen-features.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
index 22846121c4..7b4430f9de 100644
--- a/target/s390x/gen-features.c
+++ b/target/s390x/gen-features.c
@@ -743,8 +743,6 @@ static uint16_t qemu_LATEST[] = {
 };
 /* add all new definitions before this point */
 static uint16_t qemu_MAX[] = {
-    /* generates a dependency warning, leave it out for now */
-    S390_FEAT_MSA_EXT_5,
 };
 
 /****** END FEATURE DEFS ******/
-- 
2.27.0


