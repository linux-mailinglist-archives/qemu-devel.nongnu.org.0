Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 278214C7738
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:13:52 +0100 (CET)
Received: from localhost ([::1]:51682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkWs-0002cN-Tm
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:13:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkUw-0008AF-94
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:11:50 -0500
Received: from [2607:f8b0:4864:20::d36] (port=42679
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nOkUu-0006YI-R7
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 13:11:49 -0500
Received: by mail-io1-xd36.google.com with SMTP id r8so2089141ioj.9
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 10:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ofnHKkN8PdXzijWUIHfVMI1oGobWCqOzmD9JyEB/pSk=;
 b=3qpHrYLweCoHCrtGv6oO8qm8Uq94v2y93Py29lKDT9UhJMuIZyxdl+6HtThc+ZG/wy
 q4K00kEzun9v04k8/D4rjENt1ve/TTQFUky/DNHkkMmQKFlYo+mm4aEGMr8a3wREMCxc
 FMUShZfxXM4YSyXxpNzf/HM37DHZxPD0309prXXP0OJTx/y6SSynEs08Z5Y9rT7m2371
 5e+pMtJNQ60D2gl7odq/VEEAj+LzOCF2kNtpIjW1rsES7saCxh+37AChb87/5a5Neath
 ikTiIE7xXyh6nHjvFkpljxW/jlaucSlVEFvH/V/mcpm5AlKu1ox7Y/+g4SnB7u65DlE9
 IjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ofnHKkN8PdXzijWUIHfVMI1oGobWCqOzmD9JyEB/pSk=;
 b=7JzUtJ6sRuaZQWBjWD7iOHsShNQRru4GL3dOhn/QkkLQDBjT+Lk+iYXuYYhOOEAUm0
 LskEf+lpkokGxhSUWywlD+L2sGZFlgwbcDAm0/xyVww7KiqwW9Vhk3EXTlE5pif4Zxsc
 r1Fk+DHDLFN3LLpkXC3+gWEJfWkarGW7DIMz1KfSAD7QGL/6y2RhQGL4vrkbbK0k+PZj
 HoKLRh3zC5ivIkHYQwyDjnyLoBiYLe8Kx749BWiAWmnVB/iyPxzfdLpQpTDtSTztJb6Z
 scXJ5sAl/yIMcU8VTA2kUnfIKMT3otsGl6YKF60sJNGYDEuZWkxdf+zCycT/1xVtpgbV
 5HSg==
X-Gm-Message-State: AOAM533nZMcQJcgCOqFIfjAPPewetd+yy4jUG6/yB+NIlPHiPIXQhhJC
 DDrovB2cDlwoLFXEBDOdKPeUziLkUW5DAA==
X-Google-Smtp-Source: ABdhPJwfsBhEzIG5ihiUbPu2NhjZtwlog2QlqXLQFDJGkL1t44FTGSk6jmHbGY82sCK14lmpM3dsXw==
X-Received: by 2002:a5d:8d03:0:b0:612:608:9a67 with SMTP id
 p3-20020a5d8d03000000b0061206089a67mr16096101ioj.19.1646071907541; 
 Mon, 28 Feb 2022 10:11:47 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 s13-20020a6bdc0d000000b006408888551dsm6015396ioc.8.2022.02.28.10.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:11:47 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/16] bsd-user/arm/target_arch_thread.h: Assume a FreeBSD
 target
Date: Mon, 28 Feb 2022 11:12:04 -0700
Message-Id: <20220228181214.2602-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220228181214.2602-1-imp@bsdimp.com>
References: <20220228181214.2602-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d36
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we can't run on anything else, assume for the moment that this is
a FreeBSD target. In the future, we'll need to handle this properly
via some include file in bsd-user/*bsd/arm/mumble.h. There's a number
of other diffs that would be needed to make things work on OtherBSD,
so it doesn't make sense to preseve this one detail today.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/arm/target_arch_thread.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/bsd-user/arm/target_arch_thread.h b/bsd-user/arm/target_arch_thread.h
index 11c7f765838..fcafca2408c 100644
--- a/bsd-user/arm/target_arch_thread.h
+++ b/bsd-user/arm/target_arch_thread.h
@@ -62,9 +62,7 @@ static inline void target_thread_init(struct target_pt_regs *regs,
     }
     regs->ARM_pc = infop->entry & 0xfffffffe;
     regs->ARM_sp = stack;
-    if (bsd_type == target_freebsd) {
-        regs->ARM_lr = infop->entry & 0xfffffffe;
-    }
+    regs->ARM_lr = infop->entry & 0xfffffffe;
     /*
      * FreeBSD kernel passes the ps_strings pointer in r0. This is used by some
      * programs to set status messages that we see in ps. bsd-user doesn't
-- 
2.33.1


