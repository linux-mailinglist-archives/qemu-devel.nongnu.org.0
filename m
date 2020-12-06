Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA0E2D082F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 00:47:51 +0100 (CET)
Received: from localhost ([::1]:54000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km3ks-0003Ky-9F
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 18:47:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3dh-0005QE-SU
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:40:25 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3dg-0007dx-Ed
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:40:25 -0500
Received: by mail-wr1-x430.google.com with SMTP id u12so11068826wrt.0
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 15:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LGB1WfqGgk+E2BwfN1znIYNM8Z3EDS1Ck0ntTTU7ae8=;
 b=BjYNpSuhMXRN3yzz7v8F0ddsWC0Dvd7e9EXTpN8f3LCl6fgx4hk8n+tmByOePqfT6S
 XfaNjCg5xXOg8+uwLVvYX+zXVIX/t2N0WAXA8sP1Jbc8xhghOg7Vm0mGuK93ye8H/hkC
 b+u3WSZBJZcjSc9M01II3aRCYoJSnNHw7s+2vUdsr+rTiy/LGwy7YujgIws3OhDDRweH
 HOh9PKLKPbtO4TVkaL8vOxQPgPygx0uhcpkLLJOFU5tD8vtHJpQk9jN1wFX2Fhgg1hYV
 WRm2JD7yO+uNSaaxeQhf+L/EqUlVwVaos4WJAC1uUydp9X6iP+m0P0BPosgXhb5mAcI+
 WJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LGB1WfqGgk+E2BwfN1znIYNM8Z3EDS1Ck0ntTTU7ae8=;
 b=hAzLIEFEOESOs8TC37QP2vkcbPCsksefyQlUuZuY8IFyAXmhFMyIw6SZZhob7beYlL
 tJqm4Wa1Sw455WbfEtlTGxhQyasKtPMwXNEJgryfbEUXqv+pc2h8NrPxRWCil9nQjN1W
 0NWH4jNAn89VDkYWSCPlZ6pR1MRkQWtKsAj/ojGYpsv3DZymvBbcb19dhrx5Jg6PzupW
 g67dlPbCpyBzXRSE6HQLK2LrTS6XvhWax/EcirHuVnrJdVO6RreSrKHBOGGNNx2fNs8u
 4h/e9P3XHQx5+v1dV+BPBTVJvPfhHp2XfymoB169vlZmuvF9kEr0jGB/6SRXaBIWJUnS
 rPjQ==
X-Gm-Message-State: AOAM532Sf1QEmJ/SjeJBl7NsFmmY64jSXTQ1r+E4bTvnJEJXC47F5YRE
 9U3DwAs53bxW37HohaDb4gtQBfcmdQ8=
X-Google-Smtp-Source: ABdhPJysqiCEfdLErNwAUUYoVp5/a3euOcrunaaXOC5+fFMPXtLaIPATX703omSt4u8PEH29fpe5vQ==
X-Received: by 2002:a5d:6191:: with SMTP id j17mr16516791wru.299.1607298022902; 
 Sun, 06 Dec 2020 15:40:22 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id 125sm12128389wmc.27.2020.12.06.15.40.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 15:40:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/19] target/mips: Remove unused headers from kvm.c
Date: Mon,  7 Dec 2020 00:39:36 +0100
Message-Id: <20201206233949.3783184-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201206233949.3783184-1-f4bug@amsat.org>
References: <20201206233949.3783184-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
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
 target/mips/kvm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/mips/kvm.c b/target/mips/kvm.c
index 72637a1e021..b3f193f7764 100644
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


