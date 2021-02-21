Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F26C320B27
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 15:56:29 +0100 (CET)
Received: from localhost ([::1]:57754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDq9r-0007KO-Tw
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 09:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpqp-0007lO-KI
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:36:47 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDpqT-0003Ag-ES
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 09:36:47 -0500
Received: by mail-wr1-x42b.google.com with SMTP id u14so16355669wri.3
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 06:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mTEXW5LTfQRgc4V4bZmD0GoSDNu+cidmCKPRdeIGV08=;
 b=TnzcuOE1b81LtnLzK1sU+dvhOL97LY4FhYz5yljj7nDTcYZTqiWUkaaHXve2+TK6un
 yjE7xpVItCCo4anRS+YB/eRQPu8ls1D93DcvjEHUDudAnILeFXCFlOzqqJ8iz9uleZX5
 EIzrcS2gWOtrTWyX1k1PYJKeivKihVS5yBggs/RevPXsgVibPYgx7hvbbrCw8zcrKGwP
 J5ee1Di5slxGXa/hsqingnrYcQhZi9ZZ6ISuYM9aJAW05zc6c2vUZJ1/bCiju0lNm1IN
 MMeOKmBMjPFmhS2txAi78I3VdqzaKox/Q1n9bgW9dHfiwLd9KEljxAZG98lZNhvK7AY2
 qz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mTEXW5LTfQRgc4V4bZmD0GoSDNu+cidmCKPRdeIGV08=;
 b=LxBwC6xaS6Z7YEDacQRGw7v3qONXmzbWhP71yAVlPb9wCDSIG6/nPmE4syc044/A/l
 glOr1EM2mmuKf7Yag2xstLP9aAkLKvhngDekUZBPSkA/GAZOSj12ca1Ry+wZhhN8w3Bb
 MVFLTNN8ITwrGz/8bNjeVJupUBKhltkeqRXQu8ZKyEad3bWH7ls+AW6kBi9CQs+oYF8y
 3bnL2gw/5h3RMwvktXdkEovmLYSRzbFrS92KulphdFCVjP8mrcubmHTtBMXO9prjGRYB
 XN+yr6taFZc7X3WN0v6EeRUtNRVhhsbD2NZ+cjTVUgmIbZ0Dk/oJquQvRw2W7yj0vRTI
 piJQ==
X-Gm-Message-State: AOAM530jIeS0go9Wj/A7FtkxibGzGkBiyq57UrinM4hc+ddlTps5+QRD
 DxlBcgIfgPeaw7YffT2kYEkejudtIbg=
X-Google-Smtp-Source: ABdhPJxwbIIBDKT9Dlr1h05GaMkVlm59OycVz8htDJPwwAZX2o3Pnjzu5H4zIygUl6HPqQRoto2XWQ==
X-Received: by 2002:a5d:5441:: with SMTP id w1mr17587242wrv.366.1613918183462; 
 Sun, 21 Feb 2021 06:36:23 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t74sm26718292wmt.45.2021.02.21.06.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 06:36:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/43] target/mips: Include missing "tcg/tcg.h" header
Date: Sun, 21 Feb 2021 15:34:11 +0100
Message-Id: <20210221143432.2468220-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221143432.2468220-1-f4bug@amsat.org>
References: <20210221143432.2468220-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 83be6b54123 ("Fix MSA instructions LD.<B|H|W|D> on big endian
host") introduced use of typedef/prototypes declared in "tcg/tcg.h"
without including it. This was not a problem because "tcg/tcg.h" is
pulled in by "exec/cpu_ldst.h". To be able to remove this header
there, we first need to include it here in op_helper.c, else we get:

  [222/337] Compiling C object libqemu-mips-softmmu.fa.p/target_mips_msa_helper.c.o
  target/mips/msa_helper.c: In function ‘helper_msa_ld_b’:
  target/mips/msa_helper.c:8214:9: error: unknown type name ‘TCGMemOpIdx’
   8214 |         TCGMemOpIdx oi = make_memop_idx(MO_TE | DF | MO_UNALN,  \
        |         ^~~~~~~~~~~
  target/mips/msa_helper.c:8224:5: note: in expansion of macro ‘MEMOP_IDX’
   8224 |     MEMOP_IDX(DF_BYTE)
        |     ^~~~~~~~~
  target/mips/msa_helper.c:8214:26: error: implicit declaration of function ‘make_memop_idx’ [-Werror=implicit-function-declaration]
   8214 |         TCGMemOpIdx oi = make_memop_idx(MO_TE | DF | MO_UNALN,  \
        |                          ^~~~~~~~~~~~~~
  target/mips/msa_helper.c:8227:18: error: implicit declaration of function ‘helper_ret_ldub_mmu’ [-Werror=implicit-function-declaration]
   8227 |     pwd->b[0]  = helper_ret_ldub_mmu(env, addr + (0  << DF_BYTE), oi, GETPC());
        |                  ^~~~~~~~~~~~~~~~~~~
  cc1: all warnings being treated as errors

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210207232310.2505283-4-f4bug@amsat.org>
---
 target/mips/msa_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index 1298a1917ce..4caefe29ad7 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -20,6 +20,7 @@
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "internal.h"
+#include "tcg/tcg.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 #include "exec/memop.h"
-- 
2.26.2


