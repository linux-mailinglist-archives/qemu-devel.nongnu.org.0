Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48F04E568F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 17:34:31 +0100 (CET)
Received: from localhost ([::1]:37120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX3wM-0002xl-V8
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 12:34:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3PY-0005bN-Jf
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:00:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nX3PV-0005TT-JH
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 12:00:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648051232;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qGxtt6bNqSjLNBQnDfDNsfC82s94nwJI5ftCZJPEego=;
 b=L26LeIqYffYkSegV/BM/RsS141LmPTPVSXRKjgQ1/x9h4qPx6Y1SnV4mHJlbLE1K/cekim
 b8M9OhrUsNJ90qhsVZWnbxDaEUPB8dWlwkxyVXQD1maM3/ATPkTTYyiEL7oIU9NF5LbALO
 ASJq3LvTLm5lSSIERWocnctOHWM1PCk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-TAEYIq53MpSAjfk5gybN5A-1; Wed, 23 Mar 2022 12:00:30 -0400
X-MC-Unique: TAEYIq53MpSAjfk5gybN5A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A73680231F;
 Wed, 23 Mar 2022 16:00:30 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 871AA1454538;
 Wed, 23 Mar 2022 16:00:29 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 22/32] include: move cpu_exec* declarations to cpu-common.h
Date: Wed, 23 Mar 2022 19:57:33 +0400
Message-Id: <20220323155743.1585078-23-marcandre.lureau@redhat.com>
In-Reply-To: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
References: <20220323155743.1585078-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/exec/cpu-common.h | 3 +++
 include/qemu-common.h     | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 5979fc1f8e1b..5968551a0556 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -19,6 +19,9 @@ typedef uint64_t vaddr;
 #define VADDR_PRIX PRIX64
 #define VADDR_MAX UINT64_MAX
 
+void cpu_exec_init_all(void);
+void cpu_exec_step_atomic(CPUState *cpu);
+
 /* Using intptr_t ensures that qemu_*_page_mask is sign-extended even
  * when intptr_t is 32-bit and we are aligning a long long.
  */
diff --git a/include/qemu-common.h b/include/qemu-common.h
index 08f40a9d1ed3..ced260d08be0 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -24,9 +24,6 @@
 int qemu_main(int argc, char **argv, char **envp);
 #endif
 
-void cpu_exec_init_all(void);
-void cpu_exec_step_atomic(CPUState *cpu);
-
 /**
  * set_preferred_target_page_bits:
  * @bits: number of bits needed to represent an address within the page
-- 
2.35.1.273.ge6ebfd0e8cbb


