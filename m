Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4DE3E3742
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Aug 2021 23:55:14 +0200 (CEST)
Received: from localhost ([::1]:60422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCUHh-0001mS-Te
	for lists+qemu-devel@lfdr.de; Sat, 07 Aug 2021 17:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU6C-0007bx-5t
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:20 -0400
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:46879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mCU69-0004yi-FU
 for qemu-devel@nongnu.org; Sat, 07 Aug 2021 17:43:19 -0400
Received: by mail-io1-xd2a.google.com with SMTP id x10so9097420iop.13
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 14:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OpW9OtKEIHGLi60Nnl3ufVXKZFtdnv/u5brokEZV4oc=;
 b=XBIrWku2ljZ0/brF4xhFkV1peY2+34eDX0nMcOXZJ075cHkw8NthMETWzicrE8X1WE
 5h/Fx3aRqk78bnpdhjxmt8DYJ2FZ0ZvcXVzatCcY+Vw26MQ56WAr7O10mTiUz88qBrwK
 +exR5UC8SaCkyeCPfQDzdk4XmlzQ0r34xGK0JZAx8j8oeS/e1IQ322GOhrgsvjhOkqor
 XI7w0rVdGF6sXe/rSclb+dpsdYC85+QW3b2MqvY3o9HHoaATYnv4SWNK5sUvw1Eh5fzC
 HQ9fTzaROVYju+AqA/LXrVHcIvdLDtECrEjf5TyFuFxuRs9vYkrQ59bH2d+iCyrlhfv6
 /0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OpW9OtKEIHGLi60Nnl3ufVXKZFtdnv/u5brokEZV4oc=;
 b=pyDsLfBvLBQ6wDH0xASwbh/yBEC8Qe873FywP0ija7EjUt7Fu7nZqEzyA7vRlMWyeB
 cYul4kZU50Ik+rwC2c+ROGvTTz7peQVoEo1EekMLdMDVDHx62p/jaKtDcVRWsLSQsLz1
 jDq+5pmtvKmsGJsAgyahm+3wW4m4xZ6NdE52Vgw5QRlcnjGcrwYBjqyclsdqtNmaZvzF
 Wr0UopBrc97WJ2lWYvyb0XVAotXe25axKwIgDooEoM2JF4SHHy/yN6HyCj3DJ287yKqL
 0Iy8BlQP9fBHx8oScBagcR1hYK279fjnuNQhsy6UsDXEiBRVY5BSEBsJ8cfpuh2dhaIQ
 vpIA==
X-Gm-Message-State: AOAM533ucRmg6uFX3jcxfE/9NyESoeU4RdIBducgJT62a08dywPZ7tbr
 369AFn9QC4gaIPn1zCo01vMc0cy0+syENHe2
X-Google-Smtp-Source: ABdhPJxFseufeD3Qv4TS3M7uryEm895X0ZgcAmYwiLy5dKncuIrL0HlVchLx/f/6gROp7IdYEtGPXw==
X-Received: by 2002:a02:cc21:: with SMTP id o1mr15872180jap.114.1628372596196; 
 Sat, 07 Aug 2021 14:43:16 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm8062827ios.36.2021.08.07.14.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 14:43:15 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.2 24/49] bsd-user: Include more things in qemu.h
Date: Sat,  7 Aug 2021 15:42:17 -0600
Message-Id: <20210807214242.82385-25-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210807214242.82385-1-imp@bsdimp.com>
References: <20210807214242.82385-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 bsd-user/qemu.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 6c4ec61d76..02e6e8327a 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -18,11 +18,15 @@
 #define QEMU_H
 
 
+#include "qemu/osdep.h"
 #include "cpu.h"
 #include "exec/cpu_ldst.h"
+#include "exec/exec-all.h"
+//#include "trace/trace-bsd_user.h"
 
 #undef DEBUG_REMAP
 #ifdef DEBUG_REMAP
+#include <stdio.h>
 #endif /* DEBUG_REMAP */
 
 #include "exec/user/abitypes.h"
@@ -36,8 +40,13 @@ enum BSDType {
 };
 extern enum BSDType bsd_type;
 
+#include "exec/user/thunk.h"
+#include "target_arch.h"
 #include "syscall_defs.h"
 #include "target_syscall.h"
+//#include "target_os_vmparam.h"
+//#include "target_os_signal.h"
+//#include "hostdep.h"
 #include "exec/gdbstub.h"
 
 /*
-- 
2.32.0


