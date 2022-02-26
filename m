Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA46A4C56F8
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 18:12:54 +0100 (CET)
Received: from localhost ([::1]:42242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO0co-0008Ec-1G
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 12:12:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0Xa-0008Kl-EI
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:30 -0500
Received: from [2607:f8b0:4864:20::d36] (port=37557
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nO0XW-0000Qo-CK
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 12:07:27 -0500
Received: by mail-io1-xd36.google.com with SMTP id c23so10209249ioi.4
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 09:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VjL7Mev6xqaa0v+8+i8B7VWCn7P7IPzcwixzN9m4rZc=;
 b=4pyid3TVD4uNIxYBUCoIvu5H/nqMYC9lkPTpRUbauaZDgCdC1P1dDe+FvnnDyhQr98
 HR/w0Rv+TcqS5o+Ableiotl2EC3tAVVu6Qa3lktKCEmZCj7SqOpW5kkQlHC7SLp2b+hD
 6HYDwdR2U7Vtm17XIuC1d5vVc+d5pmtEWBFTHyNK4s3iNCWUtVgBPICH4+PL+3Esyznc
 sjm07f98kim7M7uVRa5zFcG168f4SH7Vi+cmjwTbpK7q2DeydwM4jaEzFUdaAHrRavvG
 ZO2ihEMj++09mA1HlJSHr0sRfFHjc6WRyd2XByRZzUvgBdLy7trQTfUEJl69ky7GklrZ
 /iJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VjL7Mev6xqaa0v+8+i8B7VWCn7P7IPzcwixzN9m4rZc=;
 b=fXmNkbeL69LTsfxdKOjH2PTx0nHS9wY3o0NVjDjOwzy7XQ1OILfBRxdySJEDnn0yiI
 uxXqJKW06xZSPVhufUJdhOdIdqpozxoGZ0l04QZ8/tqJH7adG6BOqqcdZGrijyVgVsF/
 kPXS/cYmzYdlRVlCOjnhLnqKndGfD7PyLdGYC7HXw5nmWqjwIcnm+Cq1v15w+gP4q5yk
 mLWpMCaRGMaFP1jhvecASPA+34sLf2P0U1kskvloq31tn9qp/rBOU0rPZwACpHdDfBo8
 avG7eLzjFmYHELkAigqW1nNTh8ITHu8ya6XqfPIWtTPv89+xInilQc2wwgCA/hbFF+Lv
 sZRw==
X-Gm-Message-State: AOAM530aPKzTK4z+NC4/s4k4mLeKX89yDiqjsyE2tTljO99dc5YZArAo
 3dMOw2hyW9pi8knITq0wZpM54A3nTLTPkA==
X-Google-Smtp-Source: ABdhPJw6YqGvarNshSzfKWOw1qW7j972vcAW0IFXLQTnlTQ0Kxe9iNXf2mYK3oiDJe9TmKQpDlHWww==
X-Received: by 2002:a02:69cc:0:b0:314:3518:780b with SMTP id
 e195-20020a0269cc000000b003143518780bmr10202373jac.133.1645895244375; 
 Sat, 26 Feb 2022 09:07:24 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 e23-20020a6b5017000000b00635b8032d45sm3138764iob.22.2022.02.26.09.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Feb 2022 09:07:24 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/16] bsd-user/freebsd/os-syscall.c: Add get_errno and
 host_to_target_errno
Date: Sat, 26 Feb 2022 10:07:40 -0700
Message-Id: <20220226170744.76615-13-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220226170744.76615-1-imp@bsdimp.com>
References: <20220226170744.76615-1-imp@bsdimp.com>
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

Add the helper functions get_errno and host_to_target_errno. get_errno
returns either the system call results, or the -errno when system call
indicates failure by returning -1. Host_to_target_errno returns errno
(since on FreeBSD they are the same on all architectures) along with a
comment about why it's the identity.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/os-syscall.c | 23 ++++++++++++++++++++++-
 bsd-user/qemu.h               |  3 ++-
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index fc57e324173..597a41c2f50 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -45,9 +45,30 @@ void target_set_brk(abi_ulong new_brk)
 {
 }
 
-bool is_error(abi_long ret)
+/*
+ * errno conversion.
+ */
+abi_long get_errno(abi_long ret)
 {
+    if (ret == -1) {
+        return -host_to_target_errno(errno);
+    } else {
+        return ret;
+    }
+}
 
+int host_to_target_errno(int err)
+{
+    /*
+     * All the BSDs have the property that the error numbers are uniform across
+     * all architectures for a given BSD, though they may vary between different
+     * BSDs.
+     */
+    return err;
+}
+
+bool is_error(abi_long ret)
+{
     return (abi_ulong)ret >= (abi_ulong)(-4096);
 }
 
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index e5742bd6c03..56042ddbc5d 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -246,9 +246,10 @@ extern unsigned long target_dflssiz;
 extern unsigned long target_maxssiz;
 extern unsigned long target_sgrowsiz;
 
-/* syscall.c */
+/* os-syscall.c */
 abi_long get_errno(abi_long ret);
 bool is_error(abi_long ret);
+int host_to_target_errno(int err);
 
 /* os-sys.c */
 abi_long do_freebsd_sysarch(void *cpu_env, abi_long arg1, abi_long arg2);
-- 
2.33.1


