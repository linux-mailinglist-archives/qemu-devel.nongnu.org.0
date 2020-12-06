Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F38142D0834
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 00:50:15 +0100 (CET)
Received: from localhost ([::1]:60292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km3nC-0005w4-Ux
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 18:50:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3dc-0005MI-N6
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:40:20 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:36643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3db-0007bf-6w
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:40:20 -0500
Received: by mail-wm1-x342.google.com with SMTP id y23so469354wmi.1
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 15:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wgUivnHTiFsBsZUJynu5sdeZ+qIl0Vpz/g/o+OzVfXc=;
 b=E/w6I/YA1QBm/TJRhjJKH6UCcB0vEAmhPTcnvK9MTghg2gfjSoujrDqduMv9seuqeQ
 vwzngALnI38rHHDk/z6aPvSXmgAIICymbKJoWZ4aaTDbSICad7V+kstgPc8wIs8BZH8M
 evZ6S0kfYSiEMF1QCXoRCBZNScSp2fkR4k3GEBL1vJjmMuZ6JSZQKl0RT5Ztm2yM73fv
 VcoczWisynMrLtCBosob12MrLxCZwNz35lJU1p91FHy0ePl8G68zg9Pce1+qt15sH+tF
 UHK7tDRu+L6oCSIRI0kI6hy5jyg0Ux5mG5dJMTBGwDn9k6BqNACTUgdCwCxY6ViIhoeK
 zjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wgUivnHTiFsBsZUJynu5sdeZ+qIl0Vpz/g/o+OzVfXc=;
 b=dLnduFk7IMlUr9fW1YQyIdMSbE6enIRufzUK7831GSUZw1I6PIZ7yVRfpor7KIwO2f
 EovJXUjxWv6thqEZk0Dmoo7e3ZeRkFEhZgC8jIXgk62bKATyrq2DqpjdzzpDpaQtOyXF
 vyexcwNWebLd6+GAw39A6yWwCy8PRLU64i+m9pVB6xETdDisTL7o7A8fXv1gCx8jnnbY
 WA3/oNMpUclnYjlexmDw3JA9UPOv06N290cjhHaF5jSKxfD1LftxZ9ZfjUuXdgx/kRPo
 sD4iwB0plqX7Lcofatwv5HmscfNHk7ocvdEV2r8j8XjhbT94IfKJuAD/lxg1eALEWaAX
 LBEQ==
X-Gm-Message-State: AOAM531XL4ajuUfUCNWEOFDBEHAesiIhGSzYAg0H411AgfqKAplcUj6G
 am77mnX/Fy4YXDff4F4rZtn5QsdyuaU=
X-Google-Smtp-Source: ABdhPJyn3aNUhSifbgw9ga7ggzYpifzBJNJITGXqPHS89nq/anekJvKjvBXt16wY19n9bHCAzW5XYQ==
X-Received: by 2002:a1c:e309:: with SMTP id a9mr15672224wmh.172.1607298017714; 
 Sun, 06 Dec 2020 15:40:17 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id o203sm12394160wmb.0.2020.12.06.15.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 15:40:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/19] target/mips: Remove unused headers from op_helper.c
Date: Mon,  7 Dec 2020 00:39:35 +0100
Message-Id: <20201206233949.3783184-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201206233949.3783184-1-f4bug@amsat.org>
References: <20201206233949.3783184-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/op_helper.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index 5184a1838be..5aa97902e98 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -19,15 +19,11 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/main-loop.h"
 #include "cpu.h"
 #include "internal.h"
-#include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
 #include "exec/memop.h"
-#include "sysemu/kvm.h"
 
 
 /*****************************************************************************/
-- 
2.26.2


