Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1733C2CB756
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 09:38:17 +0100 (CET)
Received: from localhost ([::1]:33060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkNeS-0003BO-2t
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 03:38:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCL-0002v8-5p
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkNCE-0003g7-Dj
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 03:09:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606896545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3qFRcD58D/EahANoDQESLAiNhgElFlK0zCzXfS2LcPs=;
 b=VA0gn8y3Yf23mAvc3htvFDWPqjmoHpeiQ3LQXfw6rbVzb1WQoa81gZvqk/HekUP+Egkm+4
 Z3Kr112l5VqzavUdRLEq+Up23n9DF15pOGU5jiG1C1Dh8DFwICDkaUmQEU4X3y3ggBTfJr
 ZMrJUo6j7QDB79hFT24Uy9xxNVop6ps=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-4zA-KBEjOX6E3NyvPQFvNQ-1; Wed, 02 Dec 2020 03:09:04 -0500
X-MC-Unique: 4zA-KBEjOX6E3NyvPQFvNQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B106185E48B
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:03 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB53D60854
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 08:09:02 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 035/113] vl: remove bios_name
Date: Wed,  2 Dec 2020 03:07:31 -0500
Message-Id: <20201202080849.4125477-36-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

bios_name was a legacy variable used by machine code, but it is
no more.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20201026143028.3034018-16-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/sysemu/sysemu.h | 1 -
 softmmu/vl.c            | 2 --
 2 files changed, 3 deletions(-)

diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 817ff4cf75..1336b4264a 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -8,7 +8,6 @@
 
 /* vl.c */
 
-extern const char *bios_name;
 extern int only_migratable;
 extern const char *qemu_name;
 extern QemuUUID qemu_uuid;
diff --git a/softmmu/vl.c b/softmmu/vl.c
index bbe65d3742..2b82e6f5cd 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -119,7 +119,6 @@
 
 static const char *data_dir[16];
 static int data_dir_idx;
-const char *bios_name = NULL;
 enum vga_retrace_method vga_retrace_method = VGA_RETRACE_DUMB;
 int display_opengl;
 const char* keyboard_layout = NULL;
@@ -4212,7 +4211,6 @@ void qemu_init(int argc, char **argv, char **envp)
     kernel_filename = qemu_opt_get(machine_opts, "kernel");
     initrd_filename = qemu_opt_get(machine_opts, "initrd");
     kernel_cmdline = qemu_opt_get(machine_opts, "append");
-    bios_name = qemu_opt_get(machine_opts, "firmware");
 
     opts = qemu_opts_find(qemu_find_opts("boot-opts"), NULL);
     if (opts) {
-- 
2.26.2



