Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C182D3AE8CE
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 14:12:21 +0200 (CEST)
Received: from localhost ([::1]:38294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvImq-0005wt-R0
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 08:12:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lvIcj-0000GM-Gg
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 08:01:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lvIcY-0001NE-Ry
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 08:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624276902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c8ZxVEDn0eQKukUONRkgn/GD+d8ake3x1LSGP9bkpZc=;
 b=Dl3WtiiDKTWQZjhWBJylh1lVR4adn9X0zCY0X+bxwobIjTSJ0aUuFiwpdEJq5wm3CZGmp7
 HCT3Buv5awHaAeF/GuSpXTEVjb1nLhFO1PPhq7JKEBLZDddi2CLTXm8LPOQnh5JxHO6b0x
 1qCYXBSdvOknJ/guM46DBPWSKnGBsJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-frH7BdXZOY-4I1SIdfkILQ-1; Mon, 21 Jun 2021 08:01:38 -0400
X-MC-Unique: frH7BdXZOY-4I1SIdfkILQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57BAC1018721;
 Mon, 21 Jun 2021 12:01:37 +0000 (UTC)
Received: from thuth.com (ovpn-112-31.ams2.redhat.com [10.36.112.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48AEB19D7C;
 Mon, 21 Jun 2021 12:01:36 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 6/7] fuzz: Display hexadecimal value with '0x' prefix
Date: Mon, 21 Jun 2021 14:01:24 +0200
Message-Id: <20210621120125.116377-7-thuth@redhat.com>
In-Reply-To: <20210621120125.116377-1-thuth@redhat.com>
References: <20210621120125.116377-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Use memory_region_size() to get the MemoryRegion size,
and display it with the '0x' prefix.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210612195842.1595999-1-f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/fuzz/generic_fuzz.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index cea7d4058e..6c67522717 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -841,9 +841,9 @@ static void generic_pre_fuzz(QTestState *s)
 
     g_hash_table_iter_init(&iter, fuzzable_memoryregions);
     while (g_hash_table_iter_next(&iter, (gpointer)&mr, NULL)) {
-        printf("  * %s (size %lx)\n",
+        printf("  * %s (size 0x%" PRIx64 ")\n",
                object_get_canonical_path_component(&(mr->parent_obj)),
-               (uint64_t)mr->size);
+               memory_region_size(mr));
     }
 
     if (!g_hash_table_size(fuzzable_memoryregions)) {
-- 
2.27.0


