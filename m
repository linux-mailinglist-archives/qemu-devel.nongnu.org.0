Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DA657E522
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 19:15:07 +0200 (CEST)
Received: from localhost ([::1]:48044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEwF0-0001Dr-Iw
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 13:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEw5R-0002Nl-7T
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 13:05:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEw5P-0000sI-O7
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 13:05:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658509511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LYGYSZ/ViMUNXuMyvj+UnhkpUrIpVeF9nrlgNYf68qo=;
 b=aXzXkcLkflvTaTPbxBnTOLjNgXCIqtmf0PzOGSDyAGcm5MhUjZSxE8nMy+GKLttyGfiqyI
 Ta2vAlOhrW493kulcgGe3ntkmaDVWXNG8Q5e1qROCkuwqTcdPbRH9qhYg1aJ3vPXBV7yee
 j9eVBTXUdGxGYR90YSK7rc6CaMMXp8I=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-211-fg8qzzR9N9G5bCx_qGL3tg-1; Fri, 22 Jul 2022 13:05:09 -0400
X-MC-Unique: fg8qzzR9N9G5bCx_qGL3tg-1
Received: by mail-ed1-f70.google.com with SMTP id
 y8-20020a056402358800b0043bcb538b85so1954621edc.10
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 10:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LYGYSZ/ViMUNXuMyvj+UnhkpUrIpVeF9nrlgNYf68qo=;
 b=1swZY1TXI+IhZ8GTV+I/bmdZXdYYoZhjUdLyoCeND3wkKO3oDyhqkYyz8BDiWE+Rpg
 mSgiw/R2K0Id6Ec4j9rzBtMEGZFKxthRwy9GKl1ByhZCyqMKF4vijJiQzVZXkyxcc1Ap
 Ia++FehZwrWJhN72DehrnSSJdPHcQgLDvBtP4sHi5BpC+7n1JvmgzNxg/kZdX1VQmRlZ
 ZxzbBrb3i3HoaF0RMAUWWkv7ngaiYyngoJS5jkH2ViqZlFFxMoZiRIBwEpvmVTo5Zqcw
 0mtd/0Ml5w+QYj5gYZIOZPHcD3GjSBd0hyJpLypxJuKJaDHv3ueAZ6o+7rwfsYOr4eeu
 QBpA==
X-Gm-Message-State: AJIora+crWFrajw5TfW6F/qReb6UKs4PKqROa2eUqFPtnuT/IDTsvMBC
 Fu7NH4w29agrD2DZtCisYfFtZvu/SEGPT6bc+Hs0CpDRHvjSo4cL1zAtfta9FVwJ80tH3WOv7dz
 3c0iXsjOdEwfgdqUMrG7HIMbxTDiiIngTvtC7zCnTicAPQS+bwjMP139PixHrZkkf4tg=
X-Received: by 2002:aa7:d9d3:0:b0:43b:c457:fb06 with SMTP id
 v19-20020aa7d9d3000000b0043bc457fb06mr804851eds.5.1658509507727; 
 Fri, 22 Jul 2022 10:05:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u5op6bUtaiArTdHq8pylbBCGtodePuA9oJmavgnC7d1wkpWE19KpYAV/0zz6gbSLAilg4VKg==
X-Received: by 2002:aa7:d9d3:0:b0:43b:c457:fb06 with SMTP id
 v19-20020aa7d9d3000000b0043bc457fb06mr804836eds.5.1658509507505; 
 Fri, 22 Jul 2022 10:05:07 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 c14-20020aa7d60e000000b0043b240ce57bsm2834771edr.82.2022.07.22.10.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 10:05:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PULL 7/8] hw/rx: pass random seed to fdt
Date: Fri, 22 Jul 2022 19:04:48 +0200
Message-Id: <20220722170449.853222-8-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220722170449.853222-1-pbonzini@redhat.com>
References: <20220722170449.853222-1-pbonzini@redhat.com>
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



