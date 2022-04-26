Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD0250FBBF
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 13:11:32 +0200 (CEST)
Received: from localhost ([::1]:55234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njJ6Q-0004xY-57
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 07:11:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1njIzV-0004ft-5V
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 07:04:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1njIzT-0004Y5-Lp
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 07:04:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650971059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hW+idUemzWypyT6LHhDhKKKh85nJdc/SBTBGvca/61g=;
 b=Rj0Ib7vYdLVxV6YJhki6c/jP5blDyhJ9Mm+JeS9gET7yNn8EI9rONxL6osdCcb2noKRnFG
 7E+32rN/dZv6hrSfoqyKZNv8MP8oQipKyxCvWTfY39yN2TOyMMQ6DdMPXF+tloc5YnOhyP
 L70OD/+l4ygOcQirciJcuX3Y5wsPX9M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515--DQNLr9FNDSXoxa5qW4DRw-1; Tue, 26 Apr 2022 07:04:13 -0400
X-MC-Unique: -DQNLr9FNDSXoxa5qW4DRw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 302A929ABA1E;
 Tue, 26 Apr 2022 11:04:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D32C5401E97;
 Tue, 26 Apr 2022 11:04:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 690031800902; Tue, 26 Apr 2022 13:03:59 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/9] i386: move bios load error message
Date: Tue, 26 Apr 2022 13:03:55 +0200
Message-Id: <20220426110358.1570723-8-kraxel@redhat.com>
In-Reply-To: <20220426110358.1570723-1-kraxel@redhat.com>
References: <20220426110358.1570723-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Xiaoyao Li <xiaoyao.li@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch to usual goto-end-of-function error handling style.
No functional change.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Tested-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20220425135051.551037-2-kraxel@redhat.com>
---
 hw/i386/x86.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index bb6727279097..ced31f67b9a8 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1120,9 +1120,7 @@ void x86_bios_rom_init(MachineState *ms, const char *default_firmware,
     }
     ret = rom_add_file_fixed(bios_name, (uint32_t)(-bios_size), -1);
     if (ret != 0) {
-    bios_error:
-        fprintf(stderr, "qemu: could not load PC BIOS '%s'\n", bios_name);
-        exit(1);
+        goto bios_error;
     }
     g_free(filename);
 
@@ -1143,6 +1141,11 @@ void x86_bios_rom_init(MachineState *ms, const char *default_firmware,
     memory_region_add_subregion(rom_memory,
                                 (uint32_t)(-bios_size),
                                 bios);
+    return;
+
+bios_error:
+    fprintf(stderr, "qemu: could not load PC BIOS '%s'\n", bios_name);
+    exit(1);
 }
 
 bool x86_machine_is_smm_enabled(const X86MachineState *x86ms)
-- 
2.35.1


