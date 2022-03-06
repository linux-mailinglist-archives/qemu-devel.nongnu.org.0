Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5CB4CEBBD
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 14:33:46 +0100 (CET)
Received: from localhost ([::1]:38110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQr17-0000n5-8u
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 08:33:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqWZ-000274-Sy
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:02:17 -0500
Received: from [2a00:1450:4864:20::42a] (port=34402
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQqWY-0004FC-GX
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 08:02:11 -0500
Received: by mail-wr1-x42a.google.com with SMTP id j26so8965395wrb.1
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 05:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HWZy0WuZKRxWd4y7UfOWRQLRZyNZR4YbZ0QP9F4IRvw=;
 b=Xgflv735MpUo1fyLSqFN3Oi/CdnRQdSzGJksw+xwupbScfmH3NafsXTo5HbsM3idaC
 D49A17eBihOVx90KKNBRhWu4fah0wi48OAWehwFm4bz/luz69LBXcROEtf3nWvNPZI5M
 koXmdkN+YeUUmwmes5PIWWfGOmmnTWcI/flFYha/W9mV7RH26zLIzHePVE+fXzhENcpv
 3G9tL/VExLfBvcR0TUdkmMNshpyZc0ujQIypfUZkbSy3frGUH/DzrPqWimDbZ2VpRYuG
 7FbC8yAJxXxUYy9h9/GEDrd3EJKe707Pg+WJzkCkXC+zJkw4pV71AkJ6uT2tgsAduTPZ
 IkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HWZy0WuZKRxWd4y7UfOWRQLRZyNZR4YbZ0QP9F4IRvw=;
 b=f0yEj1NbByMdB9yXNUUor+zVnl9ts9aOCU3FJobk3IpYhQUTR2Rj05kv5iVOq2AE9A
 tC5Uarwe6EgmYhxSbq9Sen4RuQiEE/hBC1ET4D4YCf/hhMpZnNrL86EkAA2ok7OZSaXE
 +pC+MDtxk4F0Hf/t7L6bZRVXGMz04obeCO9qIjXQQE/l0THUgJZ5uQqoDTu2T7uEm4c6
 ch/pJQ2I+slQ7MrFiW4St0Kg98JBgJWZJl9G389MFK3MUDNvNcAsl9XnUx5qt7lPBMIA
 bYCMe3dNPNqFz/CxMISHtM8XwlaXG3pEjaVj4oDLJfcM4MXyyjVB2M1MpmvWjt7gMWTY
 vLaw==
X-Gm-Message-State: AOAM531LO5o1ff0kyeoyxOT+gR8O0VfjPQc7n4rKbQjeObkic2K0Hykx
 b6gUQzvBnEymhPSAfSYXlPH0WodFod0=
X-Google-Smtp-Source: ABdhPJyt1+MuNy9aeCZwu9blx1vc+t60yE8GIW8J2MyyzG4diMzaNfvI0ThdQZoQKy9O+V+9ukvnpg==
X-Received: by 2002:a5d:6d85:0:b0:1f1:d876:67d3 with SMTP id
 l5-20020a5d6d85000000b001f1d87667d3mr5157339wrs.114.1646571728316; 
 Sun, 06 Mar 2022 05:02:08 -0800 (PST)
Received: from nuc.lan ([185.126.107.38]) by smtp.gmail.com with ESMTPSA id
 v6-20020a5d5906000000b001f0639f69e6sm7499979wrd.55.2022.03.06.05.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 05:02:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/33] target/i386/tcg/sysemu: Include missing
 'exec/exec-all.h' header
Date: Sun,  6 Mar 2022 13:59:51 +0100
Message-Id: <20220306130000.8104-25-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

excp_helper.c requires "exec/exec-all.h" for tlb_set_page_with_attrs()
and misc_helper.c for tlb_flush().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220214183144.27402-8-f4bug@amsat.org>
---
 target/i386/tcg/sysemu/excp_helper.c | 1 +
 target/i386/tcg/sysemu/misc_helper.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 5ba739fbed9..5627772e7c3 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "exec/exec-all.h"
 #include "tcg/helper-tcg.h"
 
 int get_pg_mode(CPUX86State *env)
diff --git a/target/i386/tcg/sysemu/misc_helper.c b/target/i386/tcg/sysemu/misc_helper.c
index 9ccaa054c4c..3715c1e2625 100644
--- a/target/i386/tcg/sysemu/misc_helper.c
+++ b/target/i386/tcg/sysemu/misc_helper.c
@@ -23,6 +23,7 @@
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
 #include "exec/address-spaces.h"
+#include "exec/exec-all.h"
 #include "tcg/helper-tcg.h"
 
 void helper_outb(CPUX86State *env, uint32_t port, uint32_t data)
-- 
2.35.1


