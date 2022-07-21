Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE4257D1E2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 18:47:46 +0200 (CEST)
Received: from localhost ([::1]:52738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEZKz-0007ex-0V
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 12:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEZAJ-00077A-BE
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:36:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEZAH-0007gx-Qx
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:36:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658421401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LYGYSZ/ViMUNXuMyvj+UnhkpUrIpVeF9nrlgNYf68qo=;
 b=ejCRYvF62S7qD9hdJmoo20k1o/vGY672vdtV2SWJOySbkLoumKqUh3CsPV/a5xbc4fzSEB
 EYZPRJQDGw7awDDL4T9QkB1pNbq0q1hUEDU+5eeswBFmkY5aYdSivl1TPo9MYN82oLQynL
 GsHUdkFspm1I111a5ZgMYvVXQ7rRJ5Y=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185--cffi3eZMKy7rA9JcSKbYg-1; Thu, 21 Jul 2022 12:36:39 -0400
X-MC-Unique: -cffi3eZMKy7rA9JcSKbYg-1
Received: by mail-ej1-f72.google.com with SMTP id
 hb41-20020a170907162900b0072f044ca263so980335ejc.15
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 09:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LYGYSZ/ViMUNXuMyvj+UnhkpUrIpVeF9nrlgNYf68qo=;
 b=XIvSqY2j8F4WGbkyEoY/Ln4RePm7M2/X2lL3VJBArxldOB3BHmg1wgaKBe7r8JZLut
 t30MAD5aaOghRTDzXe8r6yLyC5TGPEP5mwOv80Ig19yJILsEJQ+9hw8QuBsa037rQsE0
 0IiBLidrxUnifiyOUKTl193UiS93ThijqQBNyfBArqo9x5MtfdTTfwGp0w4iNkABc/it
 rrKeFdE4Pc5SXay4/qgUWdzCEKcuLvyrn9gMs6AJ5TtLsM5U8ZtXjx3Z7EVL3UKRWV5z
 HIR6yiWtfvkxIIbpZlDb3+fjCwB8DqWrqbeNIXtOi6+J3smjP/TZJrUQRq4hUAJDza7K
 0sFA==
X-Gm-Message-State: AJIora9DoW07UUQNw0YGK9jtClGiTxKjsbOPtsTkL3DRs63Z7zewxNi1
 LZ89gXMZIhKe44SrYzIBNAzUAB5vO5erOsMmJcGABlTFcjuUuYUAWxizaeATDHzz1/eJksEp0Uz
 HxXjPBjJdTmTBScNiuld3wwvY3bSAjhz9iROOtEB1Y9BV5qrUo59mNPVs/XgrsLRDc14=
X-Received: by 2002:a17:906:5d08:b0:6ff:8ed:db63 with SMTP id
 g8-20020a1709065d0800b006ff08eddb63mr41618519ejt.408.1658421398566; 
 Thu, 21 Jul 2022 09:36:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uQlUagquuX4Q/c8Oj9Vcjslnt1yRVJKaA33R1sPtmmkPwAChBH4Q37sbsRS86ISt73wyWfuQ==
X-Received: by 2002:a17:906:5d08:b0:6ff:8ed:db63 with SMTP id
 g8-20020a1709065d0800b006ff08eddb63mr41618495ejt.408.1658421398257; 
 Thu, 21 Jul 2022 09:36:38 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 y10-20020a056402358a00b0043a8f5ad272sm1296282edc.49.2022.07.21.09.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 09:36:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PULL 8/9] hw/rx: pass random seed to fdt
Date: Thu, 21 Jul 2022 18:36:20 +0200
Message-Id: <20220721163621.761513-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220721163621.761513-1-pbonzini@redhat.com>
References: <20220721163621.761513-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Jason A. Donenfeld" <Jason@zx2c4.com>

If the FDT contains /chosen/rng-seed, then the Linux RNG will use it to
initialize early. Set this using the usual guest random number
generation function. This FDT node is part of the DT specification.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Message-Id: <20220719122033.135902-1-Jason@zx2c4.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/rx/rx-gdbsim.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
index be147b4bd9..8ffe1b8035 100644
--- a/hw/rx/rx-gdbsim.c
+++ b/hw/rx/rx-gdbsim.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "qemu/cutils.h"
 #include "qemu/error-report.h"
+#include "qemu/guest-random.h"
 #include "qapi/error.h"
 #include "hw/loader.h"
 #include "hw/rx/rx62n.h"
@@ -83,6 +84,7 @@ static void rx_gdbsim_init(MachineState *machine)
     MemoryRegion *sysmem = get_system_memory();
     const char *kernel_filename = machine->kernel_filename;
     const char *dtb_filename = machine->dtb;
+    uint8_t rng_seed[32];
 
     if (machine->ram_size < mc->default_ram_size) {
         char *sz = size_to_str(mc->default_ram_size);
@@ -140,6 +142,8 @@ static void rx_gdbsim_init(MachineState *machine)
                 error_report("Couldn't set /chosen/bootargs");
                 exit(1);
             }
+            qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
+            qemu_fdt_setprop(dtb, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
             /* DTB is located at the end of SDRAM space. */
             dtb_offset = ROUND_DOWN(machine->ram_size - dtb_size, 16);
             rom_add_blob_fixed("dtb", dtb, dtb_size,
-- 
2.36.1



