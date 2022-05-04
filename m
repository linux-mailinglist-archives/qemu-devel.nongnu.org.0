Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5CF519F04
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 14:11:38 +0200 (CEST)
Received: from localhost ([::1]:43350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmDqy-0007dU-W5
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 08:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmCpf-0001r7-7T
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:06:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmCpc-0001gU-6h
 for qemu-devel@nongnu.org; Wed, 04 May 2022 07:06:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651662367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S37tfZNxt4KTZ48igifsXi5wEo4+FmrsGNouHiyyoqA=;
 b=Tiv1vg0x6TiDf+4oZE2k9p1JUGfw/BIqwVc4+w98MwlNwwIvaWMH776sepAg03uEN9MNWQ
 5aZhq77GHVM9oJ8kP+FzRJYgzdTVb0PUk4cZohNavraFqE8olIKo3vqNS3gZ32tNhzdH+H
 37bGEuG7c8k0ijoKpvd76pvk+6QZrec=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-WvSuMFzEPh2ytS9uHw0bWQ-1; Wed, 04 May 2022 07:06:04 -0400
X-MC-Unique: WvSuMFzEPh2ytS9uHw0bWQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECA34802803;
 Wed,  4 May 2022 11:06:03 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7AB3C111E40B;
 Wed,  4 May 2022 11:06:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PULL 15/15] tests/tcg/s390x: Use a different PCRel32 notation in
 branch-relative-long.c
Date: Wed,  4 May 2022 13:05:21 +0200
Message-Id: <20220504110521.343519-16-thuth@redhat.com>
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
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Ilya Leoshkevich <iii@linux.ibm.com>

Binutils >=2.37 and Clang do not accept (. - 0x100000000) PCRel32
constants. While this looks like a bug that needs fixing, use a
different notation (-0x100000000) as a workaround.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20220502164830.1622191-1-iii@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/s390x/branch-relative-long.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/s390x/branch-relative-long.c b/tests/tcg/s390x/branch-relative-long.c
index 94219afcad..8ce9f1c2e5 100644
--- a/tests/tcg/s390x/branch-relative-long.c
+++ b/tests/tcg/s390x/branch-relative-long.c
@@ -13,8 +13,8 @@
         #_name "_end:\n");
 
 DEFINE_ASM(br_r14, "br %r14");
-DEFINE_ASM(brasl_r0, "brasl %r0,.-0x100000000");
-DEFINE_ASM(brcl_0xf, "brcl 0xf,.-0x100000000");
+DEFINE_ASM(brasl_r0, "brasl %r0,-0x100000000");
+DEFINE_ASM(brcl_0xf, "brcl 0xf,-0x100000000");
 
 struct test {
     const char *code;
-- 
2.27.0


