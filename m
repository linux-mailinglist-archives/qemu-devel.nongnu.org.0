Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B7B564090
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 16:02:29 +0200 (CEST)
Received: from localhost ([::1]:35566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7dhc-0006DI-Ne
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 10:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o7dc9-0006jG-QJ
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 09:56:49 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:43965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o7dc8-0000Zy-1d
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 09:56:49 -0400
Received: by mail-io1-xd2c.google.com with SMTP id p69so4709411iod.10
 for <qemu-devel@nongnu.org>; Sat, 02 Jul 2022 06:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IUq6K6+TLwzMF9mxiNvWb9xoCrCozKtJXeSE/WgpCmc=;
 b=gWUR8bQWxA7FZLlbLMmCfHGXPu9Ecx/o/iWY/6a7u1Y3HEfnZR+wHAaYKUc8AG5sFx
 Ms7jb5GQDqNJ7FQI68E6jB2MWh5EJToZ9IeyqqjSEbeT9WRGqv/G99Ifs6e0q1lcp5kt
 SQBzFVBcK82ij+r8UUb/bRFY0hPGYBx1pXXRV30rZXtqGuetPNDUx099XMX562tquiqW
 Azxt9/GjnF0EIu25wMifEPNuARNEi+upigZvyJ9ykUDXWhdoVq94DvTbpQZ6R5dFwYJE
 5Q9mOkmuvgSuk5NQ3s99fDyZQvI7k0xr8Mm/vGALLL0t0jQrsJzlaNMDURVLqd+PCuyJ
 DDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IUq6K6+TLwzMF9mxiNvWb9xoCrCozKtJXeSE/WgpCmc=;
 b=RWgoS99ju031mvf4sq+qSIHaQE3ONzr2LbTscySqxogHMfH7VR7/jXuDWBOH01IprE
 7fBf2QGCBGkNufjQpBp7ubtJ/U82OZMGiXhJ893PisZeUUvANpM0ekw8Ll48J9GEhOae
 DeSdJgItBh+hoCSdLn0jbZXytimasjeYpCcQ0oYdFk+tEpviOseCJDCkJK6MUPKS88D9
 lZc6WV9A1l5lZ6y4NpF22cwU4c9uSWNXIa6eE0VNuXJ8RGtPwpo2bFIAtFnxZ2FZAMDS
 zUeCDgF+J+tcrb5+lzNbPPnSX2t7BWJoz+WuOCQqy/OIq8cW+8287LiyvPVFhkiQYVdA
 YgiA==
X-Gm-Message-State: AJIora9u4oBy0W2UqKlHZm5x4vjv/cT1SVPuIMtGhktMn0xsZoWff23O
 CJklSKQ9qorCoR+K7yhEHm2zWFcPaTHe4w==
X-Google-Smtp-Source: AGRyM1vPgI9FVbYq8oEwltwNcTKuD1vcGdluCSbfzgwxNoge5N9lp23TK2dlRo7sXOQ95EYC21sk7A==
X-Received: by 2002:a05:6638:19a:b0:33c:8ce3:8346 with SMTP id
 a26-20020a056638019a00b0033c8ce38346mr12389207jaq.204.1656770207112; 
 Sat, 02 Jul 2022 06:56:47 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 q189-20020a6b8ec6000000b0065a47e16f4esm11584278iod.32.2022.07.02.06.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jul 2022 06:56:46 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 06/11] bsd-user: Implement chflags, lchflags and fchflags
Date: Sat,  2 Jul 2022 07:57:01 -0600
Message-Id: <20220702135706.73622-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220702135706.73622-1-imp@bsdimp.com>
References: <20220702135706.73622-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsd-file.h           | 32 ++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 12 ++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index ac171c409ca..a1c80428d98 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -816,4 +816,36 @@ static abi_long do_bsd_fchownat(abi_long arg1, abi_long arg2,
     return ret;
 }
 
+/* chflags(2) */
+static abi_long do_bsd_chflags(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(chflags(p, arg2)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* lchflags(2) */
+static abi_long do_bsd_lchflags(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(lchflags(p, arg2)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* fchflags(2) */
+static abi_long do_bsd_fchflags(abi_long arg1, abi_long arg2)
+{
+    return get_errno(fchflags(arg1, arg2));
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 8090666b0d9..06bc76a326b 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -447,6 +447,18 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_fchownat(arg1, arg2, arg3, arg4, arg5);
         break;
 
+    case TARGET_FREEBSD_NR_chflags: /* chflags(2) */
+        ret = do_bsd_chflags(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_lchflags: /* lchflags(2) */
+        ret = do_bsd_lchflags(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_fchflags: /* fchflags(2) */
+        ret = do_bsd_fchflags(arg1, arg2);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


