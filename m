Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6BB241AA1
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Aug 2020 13:49:56 +0200 (CEST)
Received: from localhost ([::1]:32978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k5Smx-0000VB-WF
	for lists+qemu-devel@lfdr.de; Tue, 11 Aug 2020 07:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1k5Shy-00027Q-Fx
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 07:44:46 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:28434
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1k5Shw-0008Lp-M5
 for qemu-devel@nongnu.org; Tue, 11 Aug 2020 07:44:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597146283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w+40PRmSG+ie3kIVNK984GsCnZNEYARZaSwfaWAALM4=;
 b=cFxWb7rLnIEtcGzh1HAt/d/vsvxU4FVJ97cZBjfDBgnBUfF/SYAH/cKJ68FCx8V4Fc0we7
 9sBwhZXHotGCJ/bXNyTUUOQ6DuVteB4F5rbLmTkCL7TGt0UpW7NHuljebFQOH+AFeUvmlx
 jxtV61ARMnPswamOeD+nGzf3/fhBn2A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-np2jQmmYOmCKKacUNOl_NA-1; Tue, 11 Aug 2020 07:44:40 -0400
X-MC-Unique: np2jQmmYOmCKKacUNOl_NA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7C3E800465;
 Tue, 11 Aug 2020 11:44:38 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.74.8.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 634135F9DB;
 Tue, 11 Aug 2020 11:44:32 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 7/9] tz-ppc: add dummy read/write methods
Date: Tue, 11 Aug 2020 17:11:31 +0530
Message-Id: <20200811114133.672647-8-ppandit@redhat.com>
In-Reply-To: <20200811114133.672647-1-ppandit@redhat.com>
References: <20200811114133.672647-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/11 06:40:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Lei Sun <slei.casper@gmail.com>, Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

Add tz-ppc-dummy mmio read/write methods to avoid assert failure
during initialisation.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
---
 hw/misc/tz-ppc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

Update v4: add Reviewed-by tag
  -> https://lists.nongnu.org/archive/html/qemu-devel/2020-07/msg05303.html

diff --git a/hw/misc/tz-ppc.c b/hw/misc/tz-ppc.c
index 6431257b52..36495c68e7 100644
--- a/hw/misc/tz-ppc.c
+++ b/hw/misc/tz-ppc.c
@@ -196,7 +196,21 @@ static bool tz_ppc_dummy_accepts(void *opaque, hwaddr addr,
     g_assert_not_reached();
 }
 
+static uint64_t tz_ppc_dummy_read(void *opaque, hwaddr addr, unsigned size)
+{
+    g_assert_not_reached();
+}
+
+static void tz_ppc_dummy_write(void *opaque, hwaddr addr,
+                                        uint64_t data, unsigned size)
+{
+    g_assert_not_reached();
+}
+
 static const MemoryRegionOps tz_ppc_dummy_ops = {
+    /* define r/w methods to avoid assert failure in memory_region_init_io */
+    .read = tz_ppc_dummy_read,
+    .write = tz_ppc_dummy_write,
     .valid.accepts = tz_ppc_dummy_accepts,
 };
 
-- 
2.26.2


