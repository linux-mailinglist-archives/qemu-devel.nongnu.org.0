Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9EE3E1CD2
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 21:36:15 +0200 (CEST)
Received: from localhost ([::1]:55246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBjA6-00041o-2Q
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 15:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mBj8e-0001aZ-8q
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:34:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mBj8c-0001ps-Ti
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:34:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628192082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jO6PvYQDdrFyYx+s190YH3G0JTIuyT3cOHqZtG1/Szc=;
 b=RyAtXT12FsdzJDHRN5FfuaPJnt6v8+SNVl91JmsyAlTZ9ZkMMXi534gGuL/VCmppQ7Gl+2
 uWSri02PWrxqtDKZZ+HlsTcbwMcyETEPukFGq73zX2tVREJjOSRQedcGiuRRIrYqS6/lkC
 qx6V6OLDIcGjLTTGN9iWhJupyNoiVTI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-AlOic_BdMQSNKHvNTXyZ8g-1; Thu, 05 Aug 2021 15:34:41 -0400
X-MC-Unique: AlOic_BdMQSNKHvNTXyZ8g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5527EC73AB;
 Thu,  5 Aug 2021 19:34:40 +0000 (UTC)
Received: from localhost (unknown [10.22.11.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71CEF60CC9;
 Thu,  5 Aug 2021 19:34:39 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 2/6] sbsa_gwdt: Delete broken SBSA_*CLASS macros
Date: Thu,  5 Aug 2021 15:34:27 -0400
Message-Id: <20210805193431.307761-3-ehabkost@redhat.com>
In-Reply-To: <20210805193431.307761-1-ehabkost@redhat.com>
References: <20210805193431.307761-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Those macros never worked and never will, because the
SBSA_GWDTClass type never existed.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Shashi Mallela <shashi.mallela@linaro.org>
---
 include/hw/watchdog/sbsa_gwdt.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/hw/watchdog/sbsa_gwdt.h b/include/hw/watchdog/sbsa_gwdt.h
index 70b137de301..dcb13bc29dc 100644
--- a/include/hw/watchdog/sbsa_gwdt.h
+++ b/include/hw/watchdog/sbsa_gwdt.h
@@ -19,10 +19,6 @@
 #define TYPE_WDT_SBSA "sbsa_gwdt"
 #define SBSA_GWDT(obj) \
     OBJECT_CHECK(SBSA_GWDTState, (obj), TYPE_WDT_SBSA)
-#define SBSA_GWDT_CLASS(klass) \
-    OBJECT_CLASS_CHECK(SBSA_GWDTClass, (klass), TYPE_WDT_SBSA)
-#define SBSA_GWDT_GET_CLASS(obj) \
-    OBJECT_GET_CLASS(SBSA_GWDTClass, (obj), TYPE_WDT_SBSA)
 
 /* SBSA Generic Watchdog register definitions */
 /* refresh frame */
-- 
2.31.1


