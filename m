Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A2039BD6E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:42:36 +0200 (CEST)
Received: from localhost ([::1]:57518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCu3-0001GP-OE
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCHy-0008Eb-Ac
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:03:17 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:40492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpCHa-0005np-SF
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:03:09 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 b145-20020a1c80970000b029019c8c824054so8223358wmd.5
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eiyi2LcRkeghzxLmudkb7UCv7ec33DEm9YuMgjwgL/o=;
 b=vacE7HdjcpWPgUumrSNZEOF3qw07fr8B1Qu26YUcXuDLeqDZ0e1Qkt8ZO1TxFI1AqD
 y7XXzcXx2vaUqDrxko6A/BIRc9PEUGryjoLx8yLgBPYdEess0deUWI0j0vrH75CUj/Si
 ENV2+/aOkQiOmGIrMzBwUUnFJ2odvZc3gj6slnbi1pU6qXC8LzNDcSPRvp8yyRPuuYJ1
 TJOSIQdDBDPW7A3Wk7OOMADWxho4OBUQElUoz4RIpBsjLAsb/pfBxBP9JAMDjCiThSwG
 jqJH/MuqkHnOVOXMAOIp0fp5lpK4ZbVOYdyFV+5EGmkQSv+oNCnguZDUNwcwj/dHiGxv
 /P3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eiyi2LcRkeghzxLmudkb7UCv7ec33DEm9YuMgjwgL/o=;
 b=T8xFFjvyINkTOnCW6yIqhe7m7TH7cgovdzMuc2bMCmP0nvQQC7bzqSnIzyWl8qrLAM
 siTsWUR1KsW2ElRYE66pZXrwupATGvFT0IgwpmTpQx++8TB8sSZjAWNVg6XBDSPaot6L
 /YChFGv7DeF94ANsqybBDFMFg2scVBWEGeCiu34km9nIPinKIfIlu+fMmaGJFs+YrvS2
 ypcWrJZ/9fRPm7vx21uI27A31zkdAynDsO0Ga7+FDAxCuPTtutSVrMhPgm7kthbvSDjF
 AemXwMgVEez1o2q8pJEKM9xp3a/MIJGVGhZIkVsQEACI0We/t0mRwFJM/Y9wZLCJhXEz
 /myQ==
X-Gm-Message-State: AOAM533PRTmZawQslD0ZE/cgUHfRIV96iCl/rwQ2bGwh/WZWaXy0Sni1
 xb+9ruy03skW9Yad4ddC8UaCfw==
X-Google-Smtp-Source: ABdhPJz3IqEecahNg5ErsLEktyvWhgf83rsd8EhhgL+rsVqMebH8qTatk4L7yNEr6FnYRfg7rfDcYQ==
X-Received: by 2002:a05:600c:35c8:: with SMTP id
 r8mr3262410wmq.168.1622822569577; 
 Fri, 04 Jun 2021 09:02:49 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l16sm9378070wmj.47.2021.06.04.09.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 09:02:43 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 644F61FFD3;
 Fri,  4 Jun 2021 16:53:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v16 62/99] target/arm: remove kvm-stub.c
Date: Fri,  4 Jun 2021 16:52:35 +0100
Message-Id: <20210604155312.15902-63-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Claudio Fontana <cfontana@suse.de>

the functions used in machine.c are now protected via
if (kvm_enabled()), so the stub is not needed.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/kvm-stub.c | 24 ------------------------
 1 file changed, 24 deletions(-)
 delete mode 100644 target/arm/kvm-stub.c

diff --git a/target/arm/kvm-stub.c b/target/arm/kvm-stub.c
deleted file mode 100644
index 56a7099e6b..0000000000
--- a/target/arm/kvm-stub.c
+++ /dev/null
@@ -1,24 +0,0 @@
-/*
- * QEMU KVM ARM specific function stubs
- *
- * Copyright Linaro Limited 2013
- *
- * Author: Peter Maydell <peter.maydell@linaro.org>
- *
- * This work is licensed under the terms of the GNU GPL, version 2 or later.
- * See the COPYING file in the top-level directory.
- *
- */
-#include "qemu/osdep.h"
-#include "cpu.h"
-#include "kvm_arm.h"
-
-bool write_kvmstate_to_list(ARMCPU *cpu)
-{
-    abort();
-}
-
-bool write_list_to_kvmstate(ARMCPU *cpu, int level)
-{
-    abort();
-}
-- 
2.20.1


