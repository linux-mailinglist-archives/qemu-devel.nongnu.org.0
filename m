Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7509C2D0826
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 00:43:26 +0100 (CET)
Received: from localhost ([::1]:43290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1km3gb-0007Ab-Hf
	for lists+qemu-devel@lfdr.de; Sun, 06 Dec 2020 18:43:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3da-0005LT-FH
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:40:18 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:46106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1km3dW-0007WS-40
 for qemu-devel@nongnu.org; Sun, 06 Dec 2020 18:40:17 -0500
Received: by mail-wr1-x441.google.com with SMTP id l9so1888334wrt.13
 for <qemu-devel@nongnu.org>; Sun, 06 Dec 2020 15:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Huxnn0HKIdijL4gbDxvVYsr519/EqwJmDm79CM0bGZ0=;
 b=uVdfWSV6oUgZ0RiBN0VekDdzex+vaiVx3ppBSPyv8R4HRoXN21n157Z2WSmR4CJMKk
 fUz87yDqjpCG/qH9w8yUaCetBRGhe0xzl3F5Xd3pklPupaMHTSm6M7ET/yssBcOYdpGN
 2uRgK1t4dwtBQjw6zdunVOzomlQ2YacmUjTzTvri/2781e2tucLYNBD/gPWtB2TkdXs6
 CTaUmyNyHwzcHhAlEWPmkytqph/KxajjPNDXWXDaHM3+u8n4Q08nnih5MyRcn15evzpj
 26EfgVj1L6Z/9WkC72aFaU2xjXyPITodgdhCAKDZvllotVcqaV82URkQnStqKtZ/f+gH
 mT6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Huxnn0HKIdijL4gbDxvVYsr519/EqwJmDm79CM0bGZ0=;
 b=ck4MZLseV99Fw2rzS+zDxmt+Jf05iTAwBkQxsngjWi+wXgZx7dQo9gqNclwNjtxiyk
 icByo7PZ3incpoqUPSSXC0OYAkNeo4UOIPQtFi174ylFzMIpcOOrDrKRTqSEaKh+uKcD
 XXr+5GHMZIrBiqF8y00k6DrmR87M5LXUSw7KklzF/188FWNXUPaB5BIN93wmEeA1yjtx
 hfD6Jo4r3OGcyIeUToI63NMHnmnXtUtnUVIKH4llafi8EpQlrwJ8fBq3vRUJwRy78knp
 mIBdb4OjoumZgwJFEJeZbuB//tRjV3gQZuAmbznWi1tvzF5jtP/I3oGJzG8GqT1ZDjWB
 Sehg==
X-Gm-Message-State: AOAM533BuK5646Ny5UWQt5kYbUrlrmi1bfoU/TRW046L0tc3vG25NBWK
 +NJFS13igBXbIdfvnAeoe5MIiVRdZXg=
X-Google-Smtp-Source: ABdhPJzYcEqcflYGeZNH2yRDKKaaaIcgG6lb7OML9NbCgUdNxk0iaBY70qO18HQkTUwOQy8wR+faaQ==
X-Received: by 2002:adf:db45:: with SMTP id f5mr7587571wrj.153.1607298012630; 
 Sun, 06 Dec 2020 15:40:12 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id y130sm12336620wmc.22.2020.12.06.15.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 15:40:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/19] target/mips: Remove unused headers from cp0_helper.c
Date: Mon,  7 Dec 2020 00:39:34 +0100
Message-Id: <20201206233949.3783184-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201206233949.3783184-1-f4bug@amsat.org>
References: <20201206233949.3783184-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x441.google.com
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

Remove unused headers and add missing "qemu/log.h" since
qemu_log() is called.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/cp0_helper.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/mips/cp0_helper.c b/target/mips/cp0_helper.c
index a1b5140ccaf..d8749658945 100644
--- a/target/mips/cp0_helper.c
+++ b/target/mips/cp0_helper.c
@@ -21,15 +21,13 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
 #include "internal.h"
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
-#include "exec/memop.h"
-#include "sysemu/kvm.h"
 
 
 #ifndef CONFIG_USER_ONLY
-- 
2.26.2


