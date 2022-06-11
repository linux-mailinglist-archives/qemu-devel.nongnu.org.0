Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADEE5477D0
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jun 2022 00:04:49 +0200 (CEST)
Received: from localhost ([::1]:55260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o09Dr-0003iY-2j
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 18:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o09AU-0000Qv-6h
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 18:01:18 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:41705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o09AS-0003cr-Jp
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 18:01:17 -0400
Received: by mail-ej1-x62d.google.com with SMTP id u12so4312049eja.8
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 15:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iPjTRxHZq8tOyzV5DXJJkNosIgstAZbTwTvDVuAPHIM=;
 b=YSPu0bMCTA5WzjFEWaiOQdpw4bZtZlmafvZh8QhoQVfcnsB47NrrlQuWCD25yeTySl
 k7z7OS+oN8a+TrLr9OQM2VNMgxSbLB+A8OU3aeGXxqy6d1utPUwjta/YYlZ5rFVdnBNV
 RdiW7RxmGKj6rL8ef95w342tCfveQsDMsYKXrS4biiX8VLP/bwwB8JkyGxiBMCwNKo2v
 5fIO15lthossqSHHlceuYphF9mqI/KUDw0t8FHeTS4mG4LdX3f0tELCcepXMgzSgi/SF
 AUjHTGWmMwQObv9BYtgoKrzBqxB1cExBdlNmtENNSurWfz0Fntd005TkWO/XWji8mga/
 rZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iPjTRxHZq8tOyzV5DXJJkNosIgstAZbTwTvDVuAPHIM=;
 b=hvz8Pq30ICVZY8fF+DcuiDAWEx//7BiHKksCHy2G7Gz07oMhw7baz+iGjIQGcc+t5f
 bCqHvrckobLlTF2x4cAYVHj7cq/gln5YSYfRvrX3nx1NSz/JvX9VT1SEsQNEbv0EOYTG
 Wf7KTIe1TQcVSqK6NogthWgEEdsD7Jm7nWub3yuuh0ti4aMyBEi+HXsVwjDR7qsBPtqC
 WD6cIikqKauJJCNmnMZD+KYQOgCRwVkW+kp/6ih+jnP3NhCUaX1HHF9DX0m+ZC1oTbMz
 kf5RM2MJLlO3N+CoN22BqOMZuZddOAHIJe6ZHPKjcSDXTxjT8ruHYwkJwqayL1he3MvG
 67Jg==
X-Gm-Message-State: AOAM5306gI7TJgU9/bvFzdLwrofEr+5Dhd5LP5TVTkhrg0luvp0PJwMB
 RPnmWJIuvXngiivUGWaIO3MRu/ulWBw=
X-Google-Smtp-Source: ABdhPJwyOSDr+ysXx34xSLhrmSkvqab5UgQ2cH00N3GaWEn38P+1y1Q5ufhtaFxDT+Y7M8FflKqAjw==
X-Received: by 2002:a17:906:7a56:b0:712:4037:91c2 with SMTP id
 i22-20020a1709067a5600b00712403791c2mr4995993ejo.164.1654984874960; 
 Sat, 11 Jun 2022 15:01:14 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 eg43-20020a05640228ab00b0042db87b5ff4sm2061346edb.88.2022.06.11.15.01.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 15:01:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: 
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL v2 47/50] hw/mips/boston: Initialize g_autofree pointers
Date: Sun, 12 Jun 2022 00:00:53 +0200
Message-Id: <20220611220053.69027-2-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611220053.69027-1-philippe.mathieu.daude@gmail.com>
References: <20220611220053.69027-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Bernhard Beschow <shentey@gmail.com>

Fixes compilation due to false positives with -Werror:

  In file included from /usr/include/glib-2.0/glib.h:114,
                   from qemu/src/include/glib-compat.h:32,
                   from qemu/src/include/qemu/osdep.h:144,
                   from ../src/hw/mips/boston.c:20:
  In function ‘g_autoptr_cleanup_generic_gfree’,
      inlined from ‘boston_mach_init’ at ../src/hw/mips/boston.c:790:52:
  /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: ‘dtb_load_data’ may be used uninitialized [-Werror=maybe-uninitialized]
     28 |   g_free (*pp);
        |   ^~~~~~~~~~~~
  ../src/hw/mips/boston.c: In function ‘boston_mach_init’:
  ../src/hw/mips/boston.c:790:52: note: ‘dtb_load_data’ was declared here
    790 |             g_autofree const void *dtb_file_data, *dtb_load_data;
        |                                                    ^~~~~~~~~~~~~
  In function ‘g_autoptr_cleanup_generic_gfree’,
    inlined from ‘boston_mach_init’ at ../src/hw/mips/boston.c:790:36:
  /usr/include/glib-2.0/glib/glib-autocleanups.h:28:3: error: ‘dtb_file_data’ may be used uninitialized [-Werror=maybe-uninitialized]
     28 |   g_free (*pp);
        |   ^~~~~~~~~~~~
  ../src/hw/mips/boston.c: In function ‘boston_mach_init’:
  ../src/hw/mips/boston.c:790:36: note: ‘dtb_file_data’ was declared here
    790 |             g_autofree const void *dtb_file_data, *dtb_load_data;
        |                                    ^~~~~~~~~~~~~
  cc1: all warnings being treated as errors

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220605151908.30566-1-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/boston.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 59ca08b93a..1debca18ec 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -787,7 +787,8 @@ static void boston_mach_init(MachineState *machine)
 
         if (kernel_size > 0) {
             int dt_size;
-            g_autofree const void *dtb_file_data, *dtb_load_data;
+            g_autofree const void *dtb_file_data = NULL;
+            g_autofree const void *dtb_load_data = NULL;
             hwaddr dtb_paddr = QEMU_ALIGN_UP(kernel_high, 64 * KiB);
             hwaddr dtb_vaddr = cpu_mips_phys_to_kseg0(NULL, dtb_paddr);
 
-- 
2.36.1


