Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FD21F6EF6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 22:47:53 +0200 (CEST)
Received: from localhost ([::1]:57612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjU76-0000F0-Oo
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 16:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjTAi-0002IW-R5
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:47:32 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50625
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jjTAg-0001TR-5M
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 15:47:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591904849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hAgpDV7ETO7HWYBmzxQHQly/laq7iYSgNQ/cLQz9mUo=;
 b=GhWR/Kn0i0ZaOoU6pyPxdE20RxGP51PkoiNeZJfVBYj09C+iJKU1GkyODr3qLzZdp+iHTY
 ffoPv2bnYTFy/8+VHI3ov2TXoniYXpKB5k0QiTbXHibL7WVBpAr6RhZFPz6y+48Wo5yJEJ
 1GkZHKDZRO9Fdm46ztf0R09UEFfjIpI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-6gHnSJAUO-mlMCOVAUtcRA-1; Thu, 11 Jun 2020 15:47:27 -0400
X-MC-Unique: 6gHnSJAUO-mlMCOVAUtcRA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC96C107ACCD;
 Thu, 11 Jun 2020 19:47:25 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69CCF707C6;
 Thu, 11 Jun 2020 19:47:25 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 110/115] exec/memory: Remove unused MemoryRegionMmio type
Date: Thu, 11 Jun 2020 15:44:44 -0400
Message-Id: <20200611194449.31468-111-pbonzini@redhat.com>
In-Reply-To: <20200611194449.31468-1-pbonzini@redhat.com>
References: <20200611194449.31468-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 14:52:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Since commit 62a0db942dec ('memory: Remove old_mmio accessors')
this structure is unused. Remove it.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20200601141536.15192-2-f4bug@amsat.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/exec/memory.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index af8ca7824e..7207025bd4 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -50,12 +50,6 @@
 extern bool global_dirty_log;
 
 typedef struct MemoryRegionOps MemoryRegionOps;
-typedef struct MemoryRegionMmio MemoryRegionMmio;
-
-struct MemoryRegionMmio {
-    CPUReadMemoryFunc *read[3];
-    CPUWriteMemoryFunc *write[3];
-};
 
 typedef struct IOMMUTLBEntry IOMMUTLBEntry;
 
-- 
2.26.2



