Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8A74030C2
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 00:13:53 +0200 (CEST)
Received: from localhost ([::1]:52972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNjLk-0001d6-Ln
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 18:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2X-0005sl-Hu
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:02 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:41933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2V-0000xQ-UO
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:01 -0400
Received: by mail-il1-x12c.google.com with SMTP id l10so157378ilh.8
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 14:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fTBjf6x0isJLv0ohb+3+66WCltin+WfJuhYt3u89IiA=;
 b=VaTfr+FqqGcVblhtOv0+gmxy/mqwEIslp3oqV7/z3CoMUYqWVQ7sDabcoLqh2Va5mP
 v5on7Y+HGuPlswAf99mnibbDZxOFs2vAZkv8p478yHmRc1TMLLZloFU5tREcy+PxLd45
 2FCM3TAquX+wui551e+wEABNvV27kMLK6Xq2cZaQG17Mc8qzTAn1963gBk//F/1Lo7vu
 8Ak2hMms4IVqiBmjEA7D+VeyrZaYEaAv6APM65bs1ouk0yUSfBg9kCqgFahoIQXhJAvm
 eHz1V0IJqVxfyx5ZTraB87ydZEAqQTYMggVrpc0td0mrezyZlp9PdHFvFy78ala20Uqw
 1cwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fTBjf6x0isJLv0ohb+3+66WCltin+WfJuhYt3u89IiA=;
 b=KagthyVvSsa7uYStMzgBUvjL2CslxsI+3tQaHcYaNuk0rT2lI5QE9n6fAum+aAL5Au
 HOFyOw781iNu1zV8n224NJf97YW+4KikzaMW4u3thfK6lRL8oz2S+NtO6vpMvpBgfZa4
 hkRdv2GWMXFTe5OUc6pvAqbkzmbjftkS0UlqtPHEE9DG1SAJCKRrtEBf2oZvyHQ7g4TL
 tsuqBKJ5R/c8yU7Nsr3IFZU4Lb75UeJKi+W5/ZvGBRy3o8eLPOG/NUZhwZtb9GDC1y4+
 HCzTprmebbd9gYMZYFLvcmSPaxOJw/KikCjgMR1l9miDJt6oWLdCZ2qM4zkXsfrK3jeb
 41uw==
X-Gm-Message-State: AOAM532ImLEt2+1svk3pKvdvTDcmUZVaUZW9AyYXmoVH7I2SvlZpOeqA
 I7ftiMMAoww13ON5V0jggTFIFM5UuQLH1hAHPS0=
X-Google-Smtp-Source: ABdhPJzerRNABdHnxml78sH+bFI3eOvdsJxMJ7U/MUwzElaa44gLv5/wg3V+nuEP68sRN04DXyUI7Q==
X-Received: by 2002:a92:d410:: with SMTP id q16mr275591ilm.71.1631051638417;
 Tue, 07 Sep 2021 14:53:58 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id t17sm192477iln.24.2021.09.07.14.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:53:57 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 22/42] bsd-user: Include more things in qemu.h
Date: Tue,  7 Sep 2021 15:53:12 -0600
Message-Id: <20210907215332.30737-23-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12c.google.com
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Include more header files to match bsd-user fork.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


