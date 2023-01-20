Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A417867545F
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:28:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqU0-0002i0-Nr; Fri, 20 Jan 2023 07:27:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqTp-0002RM-H8
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:26:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqTn-0000HS-4B
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:26:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674217605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u2xJSazmcgHDGqVbV332HtLx10BqSvaJsXJvtTjSebc=;
 b=EFjdMtED6ejasL/bEu65v9DRoZJfx2zPFosEpadFyZpyyLYpPYYyipCJVjJtmBC3tt+88q
 HfMm0TDGMzpx8DWkmHW3pKMjM+fz9SGIg3gkMQudQSnZtDdGquvskSXtR2zOzA6/JmQlVQ
 RDOxLxXjWauIJgX8h9JlfKyUEvzbYJs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-k_mXCjldMBuFutsH0zFm4w-1; Fri, 20 Jan 2023 07:26:42 -0500
X-MC-Unique: k_mXCjldMBuFutsH0zFm4w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35E263C16E85;
 Fri, 20 Jan 2023 12:26:42 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BA9440C6EC4;
 Fri, 20 Jan 2023 12:26:41 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 04/38] coroutine: annotate coroutine_fn for libclang
Date: Fri, 20 Jan 2023 13:25:59 +0100
Message-Id: <20230120122633.84983-5-kwolf@redhat.com>
In-Reply-To: <20230120122633.84983-1-kwolf@redhat.com>
References: <20230120122633.84983-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Alberto Faria <afaria@redhat.com>

Clang has a generic __annotate__ attribute that can be used by
static analyzers to understand properties of functions and
analyze the control flow.  Furthermore, unlike TSA annotations, the
__annotate__ attribute applies to function pointers as well.

As a first step towards static analysis of coroutine_fn markers,
attach the attribute to the marker when compiling with clang.

Signed-off-by: Alberto Faria <afaria@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20221216110758.559947-2-pbonzini@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/qemu/coroutine.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 89650a2d7f..b0c97f6fb7 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -42,7 +42,11 @@
  *       ....
  *   }
  */
+#ifdef __clang__
+#define coroutine_fn __attribute__((__annotate__("coroutine_fn")))
+#else
 #define coroutine_fn
+#endif
 
 typedef struct Coroutine Coroutine;
 
-- 
2.38.1


