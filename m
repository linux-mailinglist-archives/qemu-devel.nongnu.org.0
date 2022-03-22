Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 005F24E3ECC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 13:51:48 +0100 (CET)
Received: from localhost ([::1]:53660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWdzH-0000yc-M9
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 08:51:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nWdc6-0006MQ-0r
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:27:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nWdc4-0002mc-N1
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 08:27:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647952068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SKuhfTZ7r0r1xNhdqbtDZbZAj/gwTHsepxONeEFevrc=;
 b=b9HRf5HCl4VSI3RwZC0A08HwqAnBDhuANgQVLKtzZRf0b70fqWNJfhey0A8IWtGBaQc7jU
 DYwtaFbsgr9GXuOm3kxfJ0niaezSgQC31XPv+WuKI9LchR2TngEN+OC1TSNngXuTWVt2UK
 E0C2wLWiAL1tJudSt1eZirT7beL9hGs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-Lik53tbDPtyhv-KHUuLJxA-1; Tue, 22 Mar 2022 08:27:47 -0400
X-MC-Unique: Lik53tbDPtyhv-KHUuLJxA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C055180159B;
 Tue, 22 Mar 2022 12:27:46 +0000 (UTC)
Received: from localhost (unknown [10.39.208.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69F9C2026985;
 Tue, 22 Mar 2022 12:27:32 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 16/21] qapi: remove needless include
Date: Tue, 22 Mar 2022 16:25:56 +0400
Message-Id: <20220322122601.927238-17-marcandre.lureau@redhat.com>
In-Reply-To: <20220322122601.927238-1-marcandre.lureau@redhat.com>
References: <20220322122601.927238-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/string-output-visitor.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/qapi/string-output-visitor.c b/qapi/string-output-visitor.c
index 5506c933deef..71ddc92b7b98 100644
--- a/qapi/string-output-visitor.c
+++ b/qapi/string-output-visitor.c
@@ -14,7 +14,6 @@
 #include "qemu/cutils.h"
 #include "qapi/string-output-visitor.h"
 #include "qapi/visitor-impl.h"
-#include "qemu/host-utils.h"
 #include <math.h>
 #include "qemu/range.h"
 
-- 
2.35.1.273.ge6ebfd0e8cbb


