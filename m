Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C1D298F79
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 15:36:57 +0100 (CET)
Received: from localhost ([::1]:56676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX3cG-0001BH-3I
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 10:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kX3WF-0004IK-BS
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 10:30:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kX3WB-00080C-Nk
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 10:30:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603722638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JzuUETko1M4XpcmxoRdk/zERLpcZe1vbNqseE2+QiSg=;
 b=etZKggf+kZ8LqTIVKto1uqhaw0qZ7VaowK29jp/1TCAygliYrBr5o9NPsoV/D3Jk2FYRi/
 flkbQYS4o/oJ0GJksyGG208YLv34/H41VFJKOy8m0qYbtKncQSICi6vOJycgs4M1rrYD95
 mjF+LK74uNcFSn2w+UUps+gX1W8pbjY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-SLVC6vxbMLOdxRzTXKMcGw-1; Mon, 26 Oct 2020 10:30:37 -0400
X-MC-Unique: SLVC6vxbMLOdxRzTXKMcGw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B5C3804355;
 Mon, 26 Oct 2020 14:30:36 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3FD175C1C5;
 Mon, 26 Oct 2020 14:30:35 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/15] sh4: remove bios_name
Date: Mon, 26 Oct 2020 10:30:26 -0400
Message-Id: <20201026143028.3034018-14-pbonzini@redhat.com>
In-Reply-To: <20201026143028.3034018-1-pbonzini@redhat.com>
References: <20201026143028.3034018-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/25 21:03:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: philmd@redhat.com, Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/sh4/shix.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/sh4/shix.c b/hw/sh4/shix.c
index f410c08883..d9a9fcbc59 100644
--- a/hw/sh4/shix.c
+++ b/hw/sh4/shix.c
@@ -49,6 +49,7 @@ static void shix_init(MachineState *machine)
     MemoryRegion *sysmem = get_system_memory();
     MemoryRegion *rom = g_new(MemoryRegion, 1);
     MemoryRegion *sdram = g_new(MemoryRegion, 2);
+    const char *bios_name = machine->firmware ?: BIOS_FILENAME;
     
     cpu = SUPERH_CPU(cpu_create(machine->cpu_type));
 
@@ -63,8 +64,6 @@ static void shix_init(MachineState *machine)
     memory_region_add_subregion(sysmem, 0x0c000000, &sdram[1]);
 
     /* Load BIOS in 0 (and access it through P2, 0xA0000000) */
-    if (bios_name == NULL)
-        bios_name = BIOS_FILENAME;
     ret = load_image_targphys(bios_name, 0, 0x4000);
     if (ret < 0 && !qtest_enabled()) {
         error_report("Could not load SHIX bios '%s'", bios_name);
-- 
2.26.2



