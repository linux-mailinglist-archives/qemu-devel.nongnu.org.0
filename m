Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B27E2D7944
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:30:41 +0100 (CET)
Received: from localhost ([::1]:56950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knkNT-0002IR-VS
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:30:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knkIA-0004sm-LC
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:25:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knkHy-00064B-Ec
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:25:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607700292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uD3bwiLfZSeE77ZhrfiaGPQPE9beiYi3hGOaOFdxX/Q=;
 b=HsnOCfl93NjU/0YChJKF9pfLowrAOWtyhlLLnhslTjSRBgt8sKgmLbYYrsL4fySMggB8zI
 h4u9w/JdHxFu8gd1o+ErCGjfTa+gYsSw43gj6Yfnz0nO+UcO9ppWOUCecqNqZYxS/yCWlv
 18+adnC3a9oO2AOXSRQjf9sB1BUOk7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-uwW6qcfSMN66xwv_zX-U_w-1; Fri, 11 Dec 2020 10:24:49 -0500
X-MC-Unique: uwW6qcfSMN66xwv_zX-U_w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC5FC801817;
 Fri, 11 Dec 2020 15:24:47 +0000 (UTC)
Received: from thuth.com (ovpn-113-76.ams2.redhat.com [10.36.113.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D8C5100239F;
 Fri, 11 Dec 2020 15:24:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH 09/12] target/sparc/win_helper: silence the compiler warnings
Date: Fri, 11 Dec 2020 16:24:23 +0100
Message-Id: <20201211152426.350966-10-thuth@redhat.com>
In-Reply-To: <20201211152426.350966-1-thuth@redhat.com>
References: <20201211152426.350966-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chen Qun <kuhn.chenqun@huawei.com>

When using -Wimplicit-fallthrough in our CFLAGS, the compiler showed warning:
target/sparc/win_helper.c: In function ‘get_gregset’:
target/sparc/win_helper.c:304:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
  304 |         trace_win_helper_gregset_error(pstate);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
target/sparc/win_helper.c:306:5: note: here
  306 |     case 0:
      |     ^~~~

Add the corresponding "fall through" comment to fix it.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Artyom Tarasenko <atar4qemu@gmail.com>
Message-Id: <20201030004046.2191790-7-kuhn.chenqun@huawei.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/sparc/win_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/sparc/win_helper.c b/target/sparc/win_helper.c
index 5b57892a10..3a7c0ff943 100644
--- a/target/sparc/win_helper.c
+++ b/target/sparc/win_helper.c
@@ -302,7 +302,7 @@ static inline uint64_t *get_gregset(CPUSPARCState *env, uint32_t pstate)
     switch (pstate) {
     default:
         trace_win_helper_gregset_error(pstate);
-        /* pass through to normal set of global registers */
+        /* fall through to normal set of global registers */
     case 0:
         return env->bgregs;
     case PS_AG:
-- 
2.27.0


