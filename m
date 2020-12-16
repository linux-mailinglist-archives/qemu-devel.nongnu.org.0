Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E7C2DC579
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:40:39 +0100 (CET)
Received: from localhost ([::1]:50944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpan1-0001Pg-2h
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:40:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpad8-00009o-41
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:30:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpad0-000171-BH
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:30:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608139817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pdUbxTX+q6YKRPARrZpe1fhHGFVxbcfXLLGU7vrquUY=;
 b=DVuwUMGaXtonYb7s2h4roop5HcWvXaG8dB50Y5+6PIdveVKvH9Z2XxgWlxrpzWDmMeKJ5c
 1V8DfwGtaFrdOq4Jv5NCdwoLWeY30aW39o/SBOEGki9NVe2KPz72ajU+5VngJweCa0o9C+
 HZptRuXjqKzoRVM38PLV/nJ13KDa2Zk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-_CpI4VY8OiOkSU8khnpRew-1; Wed, 16 Dec 2020 12:30:15 -0500
X-MC-Unique: _CpI4VY8OiOkSU8khnpRew-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D922E180A086;
 Wed, 16 Dec 2020 17:30:13 +0000 (UTC)
Received: from thuth.com (ovpn-113-7.ams2.redhat.com [10.36.113.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0934A10016F4;
 Wed, 16 Dec 2020 17:30:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 09/12] target/sparc/win_helper: silence the compiler warnings
Date: Wed, 16 Dec 2020 18:29:46 +0100
Message-Id: <20201216172949.57380-10-thuth@redhat.com>
In-Reply-To: <20201216172949.57380-1-thuth@redhat.com>
References: <20201216172949.57380-1-thuth@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Artyom Tarasenko <atar4qemu@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201211152426.350966-10-thuth@redhat.com>
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


