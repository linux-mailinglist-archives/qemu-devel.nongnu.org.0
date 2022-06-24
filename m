Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A474B55A42C
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jun 2022 00:04:24 +0200 (CEST)
Received: from localhost ([::1]:58076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4rPb-00070w-PV
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 18:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o4r9G-0002nI-Ib
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 17:47:30 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:33448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o4r9B-0007Vb-NA
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 17:47:30 -0400
Received: by mail-il1-x12f.google.com with SMTP id p13so2366419ilq.0
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 14:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IUq6K6+TLwzMF9mxiNvWb9xoCrCozKtJXeSE/WgpCmc=;
 b=W3e6pxZKlCCuwjpG+9rIKvmgE6Cs3bgXuCXaegjo3jhkTyPLo5J5f8gAJanjQBwwp7
 fEtXPICK//8pjIC7ijNuqN/xoguEenuuK9p3GSshZajQGrzpLa7awYygRyMTrI4LGYYK
 EB6Y+B+vEzCfySsxDq/0u6FQDyxuJlmRVumOrJwWIE514Djrhm/AjFAiKmLXFQbWuvhD
 m7sEa2V0cYIKnHevtzEg6SUdqlEqg9NfJRAttQ+kPiAeacgOHupF4S4RIvSBCKbOziVV
 X1baCQV57wCVvhfSObCoKm8dUPOHMA7dUq0O050nvWveskI5I7PkbLvzgJVW0SZyEfb2
 sqxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IUq6K6+TLwzMF9mxiNvWb9xoCrCozKtJXeSE/WgpCmc=;
 b=jfOiDucacbBlMtWHI0oPGD5i1ND7CXxaEZUc3eRYB+cR/oEF3kGS4GRQ2QcUUtNgyk
 e8VcoVER63YdoiBvCO8g/9TaHolMvDVKhSXSUDjd39nfjIAz8WKIljLCy4DExXCeUn2u
 6MaCQuoArc0qVIgcIf+DBq5LiwBLBYhzz7EOpQSmrM39x8Wz/xqEZhAtpss1/6rF7o97
 3XQVQHWLigsm6hILybLsrNH8qivr/vKGVaH3UwsAUoubGik42iDU+7We5iGv27YslmJk
 o9xuMlCfS0zSH+dmvPicd6rMxKN2gZir3DbFk3uKpKHLpGx2Z07HywVXSsjKA2aq9u+v
 wrvg==
X-Gm-Message-State: AJIora8O80SCFWXHvQnWcbdVZLDBwtmXqLpNO4eYCKnYofggRtSWAW33
 gH31Ld604G6hna2y80AnNXo6YCMmHxA2rQ==
X-Google-Smtp-Source: AGRyM1tQg4o2gIFoz4h7iJIVRsa2sLVeJShxnuvUAQPEC+ks1olHSOOvjwP+dRxRo9R+y/jZiPhmKg==
X-Received: by 2002:a05:6e02:168f:b0:2da:72fc:feec with SMTP id
 f15-20020a056e02168f00b002da72fcfeecmr368573ila.185.1656107244307; 
 Fri, 24 Jun 2022 14:47:24 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 q45-20020a056638346d00b00331563be3ecsm1553561jav.121.2022.06.24.14.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 14:47:23 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 06/11] bsd-user: Implement chflags, lchflags and fchflags
Date: Fri, 24 Jun 2022 15:47:37 -0600
Message-Id: <20220624214742.89229-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220624214742.89229-1-imp@bsdimp.com>
References: <20220624214742.89229-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12f;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


