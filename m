Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DE92CB749
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:35:39 +0100 (CET)
Received: from localhost ([::1]:52814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNbu-00080d-CD
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:35:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCK-0002u5-NJ
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCD-0003f3-HR
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EjCStdknq4FEjbmN/Y/QLI+NE1a7K5RD0Yequ6vWOgo=;
 b=gpd0HnkiLSdliqkxv6St0ckmxzsE/xDCEHvUZNHWAS09RMniXxMqYaRaxrcvuIabwtTEOg
 ANrS3tS/x7ur3OIXKSdusnwXqWELxsqwf1B03AphAmoeAm0TNnWEObNaQNIPAWeWnobZ1K
 6RuIrune+uuElRshR6C/DIKDuH/D3I4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-IB95nDApPDWNfzd6Yk1yBA-1; Wed, 02 Dec 2020 03:09:03 -0500
X-MC-Unique: IB95nDApPDWNfzd6Yk1yBA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 304F7803651
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:02 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFDCD60855
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:01 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 032/113] sh4: remove bios_name
Date: Wed,  2 Dec 2020 03:07:28 -0500
Message-Id: <20201202080849.4125477-33-pbonzini@redhat.com>
In-Reply-To: <20201202080849.4125477-1-pbonzini@redhat.com>
References: <20201202080849.4125477-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201026143028.3034018-14-pbonzini@redhat.com>
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



