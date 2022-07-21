Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F3C57D206
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 18:52:40 +0200 (CEST)
Received: from localhost ([::1]:35900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEZPj-0007Nk-6q
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 12:52:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEZAu-0007pI-Ny
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:37:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59264)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEZAs-0007rQ-KR
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:37:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658421437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VrhJSXJvP21ZKY3MLFzDpxyPH0MrTn07yHLUULeWY6o=;
 b=cQZLa0EriQcCb0dzKmLD/azawR6HwIPJ6/b/c6/SwS+WS0Ee0W300xjIcNnNGBfuNZYbT9
 X6VWoo+9Nap7gsrkrn/rT3B0Y9dze89jld1XjohDqm8aWDoKva2mnr1nqPxBcujKO2mxiN
 BKTgPpBfx9DS8Ja1skeD59CUTRYiRtg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-ND5cQVaENj6XPJxjMff02A-1; Thu, 21 Jul 2022 12:36:46 -0400
X-MC-Unique: ND5cQVaENj6XPJxjMff02A-1
Received: by mail-ed1-f69.google.com with SMTP id
 z1-20020a05640235c100b0043bca7d9b3eso530988edc.5
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 09:36:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VrhJSXJvP21ZKY3MLFzDpxyPH0MrTn07yHLUULeWY6o=;
 b=kp8XKZHJW7eLkB65TwO6sTq3uW3bp/15ZMqm/RgnHYJ+cc6UlxNxfMGvEiy+IC95tC
 YU5tdPalW5nEoOl1Fzj8s88f5QO+ruOys3Pr0yhotXN1ZhkN43Ugr2slTMjJ9BPQ+e3B
 OozebFhDS6uBaAEy6+zER8mrHxO8SRT7cSE3ZbzAY5rWjr8ySuBOv2v65Y4K9XA9xsKC
 6nQ+RH/3C41lkT3tlvRLgQOM+csx3TKirGSJQhpTRwyMhnvOj4AzH5+uSGYVsAKYomSj
 /l2R4cKMyMGDiJzUKUKDQwe+5jtR5bN+bG7EsKckoIyY0bcvc14Nn8VTcuKfEvE3SCk0
 Em0A==
X-Gm-Message-State: AJIora+iiudVAl7CVCHanzZAu2Ne/WK1jf9GpWyuaqkWK/P1BDPdc49C
 EOnJLq0PYCphKi2ZsXWM43xJoc+v62cQBAh2PpVCTqdPdJ+7w2f1/UylohBjMLA9rmtLoolIx9y
 oQQr48k5DsDytyaTva1NEbytu3R5SF0uY4mUrhARJoJU0UJXQaoeJEMKiMkgK5zGtfP0=
X-Received: by 2002:a17:907:1dca:b0:72b:3cb2:81f7 with SMTP id
 og10-20020a1709071dca00b0072b3cb281f7mr38965598ejc.567.1658421393243; 
 Thu, 21 Jul 2022 09:36:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tsECSeVTp3UGbHqYdS9CqQvDXmJmpIR7oiDbMK1Ew0HfQJ/s0xvaBFxZx13k3JJjYSKWz4SQ==
X-Received: by 2002:a17:907:1dca:b0:72b:3cb2:81f7 with SMTP id
 og10-20020a1709071dca00b0072b3cb281f7mr38965567ejc.567.1658421392750; 
 Thu, 21 Jul 2022 09:36:32 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 gn36-20020a1709070d2400b007262b9f7120sm1001564ejc.167.2022.07.21.09.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 09:36:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>
Subject: [PULL 5/9] hw/nios2: virt: pass random seed to fdt
Date: Thu, 21 Jul 2022 18:36:17 +0200
Message-Id: <20220721163621.761513-6-pbonzini@redhat.com>
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

Cc: Chris Wulff <crwulff@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Message-Id: <20220719120113.118034-1-Jason@zx2c4.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/nios2/boot.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
index 07b8d87633..21cbffff47 100644
--- a/hw/nios2/boot.c
+++ b/hw/nios2/boot.c
@@ -34,6 +34,7 @@
 #include "qemu/option.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
+#include "qemu/guest-random.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/reset.h"
 #include "hw/boards.h"
@@ -83,6 +84,7 @@ static int nios2_load_dtb(struct nios2_boot_info bi, const uint32_t ramsize,
     int fdt_size;
     void *fdt = NULL;
     int r;
+    uint8_t rng_seed[32];
 
     if (dtb_filename) {
         fdt = load_device_tree(dtb_filename, &fdt_size);
@@ -91,6 +93,9 @@ static int nios2_load_dtb(struct nios2_boot_info bi, const uint32_t ramsize,
         return 0;
     }
 
+    qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
+    qemu_fdt_setprop(fdt, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
+
     if (kernel_cmdline) {
         r = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
                                     kernel_cmdline);
-- 
2.36.1



