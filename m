Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6BF3FF83C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 02:05:33 +0200 (CEST)
Received: from localhost ([::1]:58698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLwi4-00040h-SR
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 20:05:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRH-0006zK-Bv
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:11 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:42760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRD-000330-Kl
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:10 -0400
Received: by mail-il1-x130.google.com with SMTP id s16so3568089ilo.9
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eEkC4W7uTDt5OeWX/S5kHSE0qmVobg9OD2eDr+oF0C4=;
 b=RAtsTBYpB1AfAxND9WLoWvi7nchUdK11AiQx62fQ9qqyhUBUydkCtEhXmvCtKU5ZU0
 ZF2HzJTEEfOpyA+w3TMzpAfCgiCj4giOqODOYHyQJWiUUBdTqIOOX2WMTeMAi58h6MRC
 opsF37USwJZTNO80ULlAJdoN829xyHQmW+1sGGMxmjErK6K7fUNOp+MuCfUGDuM91UzI
 BfG+OUysqTE5pPM17k2CKdj2EbRq8Fc2owtQC1Ir1SPaCKM6wJ4tyK3YU+j1IPaahTGY
 +RjOy2QTevFJ65c35qLU8Rthjv4igvNEo6tFtTQQ/vO1KuVKcIYopMITMLJTBiekxZ4K
 mTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eEkC4W7uTDt5OeWX/S5kHSE0qmVobg9OD2eDr+oF0C4=;
 b=Tpg0Aekk/D1kQ2iHWU5Nn/xop0WmibAXX3lHJRCLXbtbgyLIzY0eI5efCV2qufwJXX
 imMpowetOJb8nPgZwu/nmQ5K3aeaHXtltI1yNThzwK7hIEiL0F3R4hJhblS45SUe1E2Z
 xS1hp6JZNr2en4pHMrW3pqIAPR38tqEm0kPnntDNHjsFzdPnDYDvhkJWuuCaRhY5D8Vs
 DAb8QAQSLnC0qnqjillWt9sCRZyGHDnu8+Lxh6K8b3Ha1ucsRGaxLpo+fLnWr22ft5lG
 tRWwvqqv1qYze4Sht4UiPVm3qcJMcxvQMKaNYX2rsF+Jhn1UIWRaHeY/F0APNswrST53
 0q7g==
X-Gm-Message-State: AOAM533Qpjskl5L/PFfDZh3HuVCypNXKozHj1I731zJleS83HtKebys/
 zk4FWZqeywirOQNcDntOWfxT7ZDxPk+fPg==
X-Google-Smtp-Source: ABdhPJzQkwq+NE8qYPmcdQS/YGTRr02p4JHq08bCULCJ8wsVKRBJREBlfvZ9BzznBoyzDNLeHN5XHA==
X-Received: by 2002:a05:6e02:1d05:: with SMTP id
 i5mr507869ila.245.1630626485186; 
 Thu, 02 Sep 2021 16:48:05 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:48:04 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/43] bsd-user: Include more things in qemu.h
Date: Thu,  2 Sep 2021 17:47:08 -0600
Message-Id: <20210902234729.76141-23-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Include more header files to match bsd-user fork.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 5e4cbb40d4..55d71130bb 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -18,12 +18,12 @@
 #define QEMU_H
 
 
+#include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/cpu_ldst.h"
+#include "exec/exec-all.h"
 
 #undef DEBUG_REMAP
-#ifdef DEBUG_REMAP
-#endif /* DEBUG_REMAP */
 
 #include "exec/user/abitypes.h"
 
@@ -36,6 +36,8 @@ enum BSDType {
 };
 extern enum BSDType bsd_type;
 
+#include "exec/user/thunk.h"
+#include "target_arch.h"
 #include "syscall_defs.h"
 #include "target_syscall.h"
 #include "exec/gdbstub.h"
-- 
2.32.0


