Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BF9265F67
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Sep 2020 14:19:57 +0200 (CEST)
Received: from localhost ([::1]:52416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGi20-0002qs-50
	for lists+qemu-devel@lfdr.de; Fri, 11 Sep 2020 08:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kGi11-00027D-K1
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 08:18:55 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:28866
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kGi10-0007Rl-9j
 for qemu-devel@nongnu.org; Fri, 11 Sep 2020 08:18:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599826733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=0sonYEoIK5vfUm9HV1fIji2OCjDdFDC+pHgrtmXxuUc=;
 b=aFHJHOdSCeQkV39gk6dMedC3NChdT/3wDYA4eFxuAaFbZ1m4U+t4Nu16N+HZvtH3FqSNib
 GZ6JfKFg66Ef8XY8mvBL4KuiDEcJaTIJb3wKEqgTy8g/2AF1Gr13j+MGW1HPQByGcK8Xrq
 OzEdZd/a1lFKovUnQCeM2MRVhHLowwg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-S6Q7ZHrENDKE6GmYZaanVQ-1; Fri, 11 Sep 2020 08:18:49 -0400
X-MC-Unique: S6Q7ZHrENDKE6GmYZaanVQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85C228030DD;
 Fri, 11 Sep 2020 12:18:48 +0000 (UTC)
Received: from thuth.com (ovpn-115-1.ams2.redhat.com [10.36.115.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2755C7E8F1;
 Fri, 11 Sep 2020 12:18:46 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] hw/arm/pxa2xx: Add missing fallthrough comment
Date: Fri, 11 Sep 2020 14:18:44 +0200
Message-Id: <20200911121844.404434-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/11 03:40:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's make this file compilable with -Werror=implicit-fallthrough :
Looking at the code, it seems like the fallthrough is intended here,
so we should add the corresponding "/* fallthrough */" comment here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/pxa2xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 76975d17a4..c1f45b2adf 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -443,7 +443,7 @@ static void pxa2xx_mm_write(void *opaque, hwaddr addr,
             s->mm_regs[addr >> 2] = value;
             break;
         }
-
+        /* fallthrough */
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Bad write offset 0x%"HWADDR_PRIx"\n",
-- 
2.18.2


