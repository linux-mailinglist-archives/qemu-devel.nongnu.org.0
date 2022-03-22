Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF684E3D88
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 12:25:37 +0100 (CET)
Received: from localhost ([::1]:32894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWcds-0000Ib-2K
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 07:25:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWcbT-0005rP-2a
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:23:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWcbP-00017B-HE
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 07:23:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647948182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1R6IqOS/D7geX/Uj3bwwye6kZQYLjq8mLpbhxpo3YG4=;
 b=X5s16j3QzbUy6z3MusAoJz7iV9pSVRYuwWlKLO9J/mW4Lk7JHk613m4Twbj2Y5cQ8MQ+k6
 YDgzAZR1x0Ag8IEXmfm5z5CS1I0sjtIu2/rTkYwRF74G5xmScGP0eR6vgQyYpN/kPq7TEX
 XzXu1eW6dRz0wMrDjWgVgHZg46PAbgM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-Bi7qF2jOPxCDJ7Jn0BR-eQ-1; Tue, 22 Mar 2022 07:23:01 -0400
X-MC-Unique: Bi7qF2jOPxCDJ7Jn0BR-eQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0114A3804503;
 Tue, 22 Mar 2022 11:23:01 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.68])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1EDB240D2822;
 Tue, 22 Mar 2022 11:22:58 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/2] s390x/cpu_models: drop "msa5" from the TCG "max" model
Date: Tue, 22 Mar 2022 12:22:55 +0100
Message-Id: <20220322112256.118417-2-david@redhat.com>
In-Reply-To: <20220322112256.118417-1-david@redhat.com>
References: <20220322112256.118417-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
for MSA, exclusing any real subfunctions.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/897
Signed-off-by: David Hildenbrand <david@redhat.com>
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
2.35.1


