Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 876BC306736
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 23:44:51 +0100 (CET)
Received: from localhost ([::1]:58356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4tYQ-0007vN-Hg
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 17:44:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4tWw-0006Ze-0y
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 17:43:18 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l4tWu-0001f6-Ip
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 17:43:17 -0500
Received: by mail-wr1-x434.google.com with SMTP id g10so3575527wrx.1
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 14:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rVntcXlDQ+FXs02aG9vIA8WUeQl9eOoJE84BzHT5YTk=;
 b=TzAomfbmboMDw99J7qiKCQjofw9W5CrwukeGApODoV8LBksGmwvTcXXybPxtnurtgj
 XbLTcCsOuCmv8HEqRPHenFOncgMiRXWEL3NFtuH0xwovTbwuHiaIHXoZ5NRdfTks1EeL
 B01LlH+pqaoehfZV6io4V1om6GPk88SoyW6qGtInL/dkdjuAHRv5qy7JlUjxxd04GO+6
 9Vwk88Lrq/65cvjwfFg7FjvpVNIhVkZ7jKRx3yE9VkWaj4kLpCJnJInX2PVlEYGQZ1qd
 PnQT3iIILwAV/DHOuu7afw5eWMR6GC1b65/TXDn5QLpBLc/pnnJvDZGrv4FGG/vEwxOl
 np7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rVntcXlDQ+FXs02aG9vIA8WUeQl9eOoJE84BzHT5YTk=;
 b=l5clOCZbh5ymeV2frHudhxvynzO4z8T385T4fOXWb9weZ+HyOTSlRtSeasZk2Um5Ih
 cNfSpN22ReFVy33HveZd12c2qvj+dkCMh5DqMaUobS+035SwuKFbcRfuBu2MAW0j6Gdn
 urwRDb+T50tEo8g2rjNdpWYcOlhYXhrHcOhl/NcFSOmb4uiNpIo5bXnQ4XsbkfZVUc1v
 QpbFx4z4DJR28/TIxHctwaqFnkeA+2fABXl+tsp21OfrlK65KXQ0SsVeUQVl8+9ZaTnp
 Q2oSbSsTwGZzUzIB5sP8xLrnoP2QaoOyzIhVxpA6cJmFTxwknxLTuY8/fcZ08xa6Bvfu
 1Cbg==
X-Gm-Message-State: AOAM532TYymFYUEIxfwaJ01xrC4Sgzu8Z9GoXPbfZjZjqgXPOncWexGk
 3SQ6AxCSkohY3KPrrrou1vENSVMpylc=
X-Google-Smtp-Source: ABdhPJyXvDkc+wDmWHR136i9MZXOkLPpLcbesBfrx/bBgrgW4Vly/+xojSUAxAZkyvLiZU+UmzCfsg==
X-Received: by 2002:a05:6000:104f:: with SMTP id
 c15mr13063012wrx.239.1611787395017; 
 Wed, 27 Jan 2021 14:43:15 -0800 (PST)
Received: from localhost.localdomain (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id r13sm4063126wmh.9.2021.01.27.14.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 14:43:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] target/tricore: Remove unused definitions
Date: Wed, 27 Jan 2021 23:42:55 +0100
Message-Id: <20210127224255.3505711-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210127224255.3505711-1-f4bug@amsat.org>
References: <20210127224255.3505711-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Joe Komlodi <komlodi@xilinx.com>, David Brenken <david.brenken@efs-auto.org>,
 Andreas Konopik <andreas.konopik@efs-auto.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove these confusing and unused definitions.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/tricore/cpu.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index b82349d1b10..4b61a2c03f8 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -375,18 +375,6 @@ typedef TriCoreCPU ArchCPU;
 
 #include "exec/cpu-all.h"
 
-enum {
-    /* 1 bit to define user level / supervisor access */
-    ACCESS_USER  = 0x00,
-    ACCESS_SUPER = 0x01,
-    /* 1 bit to indicate direction */
-    ACCESS_STORE = 0x02,
-    /* Type of instruction that generated the access */
-    ACCESS_CODE  = 0x10, /* Code fetch access                */
-    ACCESS_INT   = 0x20, /* Integer load/store access        */
-    ACCESS_FLOAT = 0x30, /* floating point load/store access */
-};
-
 void cpu_state_reset(CPUTriCoreState *s);
 void tricore_tcg_init(void);
 int cpu_tricore_signal_handler(int host_signum, void *pinfo, void *puc);
-- 
2.26.2


