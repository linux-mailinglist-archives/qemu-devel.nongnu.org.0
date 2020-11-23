Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D94AC2C0513
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:59:55 +0100 (CET)
Received: from localhost ([::1]:43950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khAVd-0002ZR-JB
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:59:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1khAO7-0000X0-MU
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:52:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1khAO5-00062I-Um
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:52:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606132325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=TcX0psA/sn3EC/SWVnbeG9cu37ZwbRBS5hp9Nm1uZSc=;
 b=KFRZceMZpkDg51Y3mb/uvkMJnxTWex9yFKzX39rPKPY5NZ1//MHY6nsq8Iz/CTPSHIpD3t
 nPQhujciQHinYRSdsQBkCpl9JWC/rG/rkgpWt/D3ATgyhJVgqWjMwVzPZAybBLZQFxBe2t
 2EekseFDFEEXPNgdNncQ52CcosJZYa4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-TdNCpRbIOJGc8zucUulCpA-1; Mon, 23 Nov 2020 06:52:01 -0500
X-MC-Unique: TdNCpRbIOJGc8zucUulCpA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E85021005E48;
 Mon, 23 Nov 2020 11:52:00 +0000 (UTC)
Received: from thuth.com (ovpn-113-17.ams2.redhat.com [10.36.113.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1A8FE19746;
 Mon, 23 Nov 2020 11:51:59 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/3] pc-bios: s390x: Clear out leftover S390EP string
Date: Mon, 23 Nov 2020 12:51:54 +0100
Message-Id: <20201123115155.232335-3-thuth@redhat.com>
In-Reply-To: <20201123115155.232335-1-thuth@redhat.com>
References: <20201123115155.232335-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

From: Eric Farman <farman@linux.ibm.com>

A Linux binary will have the string "S390EP" at address 0x10008,
which is important in getting the guest up off the ground. In the
case of a reboot (specifically chreipl going to a new device),
we should defer to the PSW at address zero for the new config,
which will re-write "S390EP" from the new image.

Let's clear it out at this point so that a reipl to, say, a DASD
passthrough device drives the IPL path from scratch without disrupting
disrupting the order of operations for other boots.

Rather than hardcoding the address of this magic (again), let's
define it somewhere so that the two users are visibly related.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
Message-Id: <20201120160117.59366-3-farman@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw/jump2ipl.c  | 2 +-
 pc-bios/s390-ccw/main.c      | 6 ++++++
 pc-bios/s390-ccw/s390-arch.h | 3 +++
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/pc-bios/s390-ccw/jump2ipl.c b/pc-bios/s390-ccw/jump2ipl.c
index fbae45b03c..b9c70d64a5 100644
--- a/pc-bios/s390-ccw/jump2ipl.c
+++ b/pc-bios/s390-ccw/jump2ipl.c
@@ -78,7 +78,7 @@ void jump_to_low_kernel(void)
      * kernel start address (when jumping to the PSW-at-zero address instead,
      * the kernel startup code fails when we booted from a network device).
      */
-    if (!memcmp((char *)0x10008, "S390EP", 6)) {
+    if (!memcmp((char *)S390EP, "S390EP", 6)) {
         jump_to_IPL_code(KERN_IMAGE_START);
     }
 
diff --git a/pc-bios/s390-ccw/main.c b/pc-bios/s390-ccw/main.c
index fc4bfaa455..5d2b7ba94d 100644
--- a/pc-bios/s390-ccw/main.c
+++ b/pc-bios/s390-ccw/main.c
@@ -178,6 +178,12 @@ static void boot_setup(void)
     memcpy(lpmsg + 10, loadparm_str, 8);
     sclp_print(lpmsg);
 
+    /*
+     * Clear out any potential S390EP magic (see jump_to_low_kernel()),
+     * so we don't taint our decision-making process during a reboot.
+     */
+    memset((char *)S390EP, 0, 6);
+
     have_iplb = store_iplb(&iplb);
 }
 
diff --git a/pc-bios/s390-ccw/s390-arch.h b/pc-bios/s390-ccw/s390-arch.h
index 6da44d4436..a741488aaa 100644
--- a/pc-bios/s390-ccw/s390-arch.h
+++ b/pc-bios/s390-ccw/s390-arch.h
@@ -95,6 +95,9 @@ typedef struct LowCore {
 
 extern LowCore *lowcore;
 
+/* Location of "S390EP" in a Linux binary (see arch/s390/boot/head.S) */
+#define S390EP 0x10008
+
 static inline void set_prefix(uint32_t address)
 {
     asm volatile("spx %0" : : "m" (address) : "memory");
-- 
2.18.4


