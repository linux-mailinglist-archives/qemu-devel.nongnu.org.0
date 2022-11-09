Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9419E622F7E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 16:58:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osnSL-0001fP-Mx; Wed, 09 Nov 2022 10:57:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1osnS9-0001cr-6h
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 10:57:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1osnS4-0005cL-F7
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 10:57:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668009439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LyiN0TBFB/Dby1NbZclwz2V/BozZkXfFitgGbnIb02I=;
 b=YTtI2UAOO8KZqfCM/PBVVlajoEp+bFIGuyBbQwfHbZwjSTo86uGSJJzU8LLX+QEiNpJhOV
 P0sPXmihcbvRSh/ZSisI8KMpkUJjCioIVYAHoDZLLMGVYpdhhXg605cAU5UJVNTSjckvPs
 u/qypGmp7aaKG9bZhhn/EG0kg1nUG9U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-oZ9nH_2NOUqMLzxHHVIa7g-1; Wed, 09 Nov 2022 10:57:18 -0500
X-MC-Unique: oZ9nH_2NOUqMLzxHHVIa7g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3284F101E15A
 for <qemu-devel@nongnu.org>; Wed,  9 Nov 2022 15:57:18 +0000 (UTC)
Received: from wi2021.rezanina.moe.rezanina.moe (ovpn-193-213.brq.redhat.com
 [10.40.193.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A69A40C2087;
 Wed,  9 Nov 2022 15:57:17 +0000 (UTC)
From: mrezanin@redhat.com
To: qemu-devel@nongnu.org
Cc: Miroslav Rezanina <mrezanin@redhat.com>
Subject: [PATCH 2/4] tulip: Remove unused variable
Date: Wed,  9 Nov 2022 10:57:12 -0500
Message-Id: <02e1560d115c208df32236df8916fed98429fda1.1668009030.git.mrezanin@redhat.com>
In-Reply-To: <cover.1668009030.git.mrezanin@redhat.com>
References: <cover.1668009030.git.mrezanin@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Miroslav Rezanina <mrezanin@redhat.com>

Variable n used in tulip_idblock_crc function is only incremented but never read.
This causes 'Unused but set variable' warning on Clang 15.0.1 compiler.

Removing the variable to prevent the warning.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
---
 hw/net/tulip.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/net/tulip.c b/hw/net/tulip.c
index b9e42c322a..c2b3b1bdfa 100644
--- a/hw/net/tulip.c
+++ b/hw/net/tulip.c
@@ -870,11 +870,10 @@ static const MemoryRegionOps tulip_ops = {
 
 static void tulip_idblock_crc(TULIPState *s, uint16_t *srom)
 {
-    int word, n;
+    int word;
     int bit;
     unsigned char bitval, crc;
     const int len = 9;
-    n = 0;
     crc = -1;
 
     for (word = 0; word < len; word++) {
@@ -887,7 +886,6 @@ static void tulip_idblock_crc(TULIPState *s, uint16_t *srom)
                 srom[len - 1] = (srom[len - 1] & 0xff00) | (unsigned short)crc;
                 break;
             }
-            n++;
             bitval = ((srom[word] >> bit) & 1) ^ ((crc >> 7) & 1);
             crc = crc << 1;
             if (bitval == 1) {
-- 
2.31.1


