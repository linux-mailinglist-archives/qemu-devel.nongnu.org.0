Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E036B2D9069
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Dec 2020 21:21:55 +0100 (CET)
Received: from localhost ([::1]:45388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koXsQ-0002O3-SK
	for lists+qemu-devel@lfdr.de; Sun, 13 Dec 2020 15:21:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXqi-0000qo-Ay
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:20:08 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1koXqf-00054H-ES
 for qemu-devel@nongnu.org; Sun, 13 Dec 2020 15:20:07 -0500
Received: by mail-wr1-x42e.google.com with SMTP id a12so14374115wrv.8
 for <qemu-devel@nongnu.org>; Sun, 13 Dec 2020 12:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vNFKJu+n4IZ/CMsPrcMiCbRPKxOJx+sfVgOoT8DzTzM=;
 b=CyOXhXqwoUkfAHoDJ5+Gr9Hbrb+VgeWX8hIQ/FNHc3Hb7BLFVqGC3+E3dFjW5fWpK2
 NRW34VR85opUiAoszJTDQUgchzByaZeYWoCmzg/UHX6imyHI2CIfws6UhWbrpp2JG8lN
 DTVs8W9OoeRiDkStjIGXi9phFLw/ahtRXN4O9fCNObwvwM05BNrZu7grhxs5ZqHpc1I9
 kHi5SMU83DA3eaCC9teGDk+Fi5d2G7J9SdtY2nH5Igv9F1sfBYmzRaWoSXFaoftMVp9w
 XALx4Whce6OghuL7VrmTJH8frRaQ09eyU3UiJAn+ft+nb1E2OQE++y9J76PKMuPOPpEw
 2Uew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vNFKJu+n4IZ/CMsPrcMiCbRPKxOJx+sfVgOoT8DzTzM=;
 b=GsZhRvOrL3gScSDAukeSQljgUta4APndw21bR/364pxX1IKXpsHitsB6vWsmO3GHkr
 x3/UsllrsL0MIWzIodJiCovSNSfLCXur2Pe34yuibyyLCGiqG46jpaynL1nuKMhiLr9g
 tkhpqC/BZFr2ZGpJ95WfMBwYBEkKFb+EHlNwUIzuu2ihQX38q2yr30wAhcMhzBepZ9e1
 fNGLXHqBePeLKiB04kjSQ4i3xp1d67L+SAXzdGpOcEhkDaLQZQ2KrMQ7JIlVD1quSy6D
 FJE1S61Kxb/LCtcRpLnjfpNzC6SnhFUkHeqUolJNy86Ta8eU3RQfzcUQYB+CZ0mE0qmt
 /rwA==
X-Gm-Message-State: AOAM533QmNqF+iIYaY3VkDrj8/fQPgBUg7ai0bk9u/xT/wOZ8ns/V53B
 nFE+iHHiA/C6X7Cwhili+BWfwzYp5lI=
X-Google-Smtp-Source: ABdhPJw3B2k1CxOd1n/33Sb1EtYQBldcALPKmiH+xNbh4q3vPykzdo6PwXeiPFYLzDkgmyv3WTcvCw==
X-Received: by 2002:a5d:4242:: with SMTP id s2mr25494476wrr.187.1607890803857; 
 Sun, 13 Dec 2020 12:20:03 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id d9sm29807500wrc.87.2020.12.13.12.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 12:20:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/26] target/mips/kvm: Remove unused headers
Date: Sun, 13 Dec 2020 21:19:23 +0100
Message-Id: <20201213201946.236123-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201213201946.236123-1-f4bug@amsat.org>
References: <20201213201946.236123-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201206233949.3783184-7-f4bug@amsat.org>
---
 target/mips/kvm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/mips/kvm.c b/target/mips/kvm.c
index cbd0cb8faa4..94b3a88d8f8 100644
--- a/target/mips/kvm.c
+++ b/target/mips/kvm.c
@@ -19,11 +19,9 @@
 #include "internal.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
-#include "qemu/timer.h"
 #include "sysemu/kvm.h"
 #include "sysemu/kvm_int.h"
 #include "sysemu/runstate.h"
-#include "sysemu/cpus.h"
 #include "kvm_mips.h"
 #include "exec/memattrs.h"
 #include "hw/boards.h"
-- 
2.26.2


