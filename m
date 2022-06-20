Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAAE5522EC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 19:48:59 +0200 (CEST)
Received: from localhost ([::1]:58208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3LWE-00058A-M8
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 13:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o3LPf-00057X-Cc
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:42:11 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:39643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o3LPd-00081s-Qm
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:42:11 -0400
Received: by mail-io1-xd30.google.com with SMTP id i16so11830566ioa.6
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pFbmvEHAivgEtRGUWfo6E/E11O0d1kI4WUFngQaszpg=;
 b=JZLzNhHPo5gra7LseTfC743RWemXG/Z0YfBuV/i3bYH0WppvfsUAoNwB26OgKzXTeM
 m89BmFy8dysLk5EtArl+ShJ0kaxNhFFL13G+EaOyGWgIayr+Z6mEltGaAnJTZwg9UdXP
 PL1oagZApuf5u0Jxv0jB55+8ZLwyOuJmlphKVWEH14pkt+BBzBpojjMW8aYwBnkuO314
 lE4NYAAkq+r2saMv17cP6rpKmowK9XKIyKOV8rgCMsg/ljc53S7mjRQs2EqYadGCgOzb
 DlA9OtuczMDiH6htDSrc8PLlnvsqa4+L8TvwgDcOpLrKHfTOhqDEJ4s2yaXeulPFfyiy
 zfEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pFbmvEHAivgEtRGUWfo6E/E11O0d1kI4WUFngQaszpg=;
 b=Ogj2T6TYPJuU+n+1v+z5ShlFofKNGmOrrtTiZu8b3UwamU9P3T3ktD4Xs+1ItwnJrp
 vxXPquWSYqaPzwigW/iKJ1dsNV/bShIEk91yfbvpsYtLc9uOShE6y8xbsUjzwqBANNpX
 zBAXgTllihm6Q0sl+zajLuMIRihSGWqeg3f0UtSxE7CqpKmYDseygzmknLTEgo6RsAGa
 qENFnfJW6Px/O/G7p/B6FCQTERLBsvMfUK3qhmpG38idqU1E0WP8HAOAFbUiGETQKc6A
 pC8giQo7Jf6+LvUJ6GKZmTI7kF8fRtACz9WRrdLF0bpaV102p8S4dAy+t1BJaUkzScjj
 YODg==
X-Gm-Message-State: AJIora8ZSwwAkhVbkYRuYrfKX7eNzfiU/pY4WUhmZgQWwZ8w2+G/2oj/
 oyvOw0+gpmA6HceiUxEewcQEk5kAd5klfg==
X-Google-Smtp-Source: AGRyM1tS3/hlK2Xpf2ub4C5AcAEJwZFPXbMR1JdAylb7F7Bum9w/0T9vUyV8YcLdNYR8wstr/zHPtg==
X-Received: by 2002:a6b:2c89:0:b0:669:aa1e:7790 with SMTP id
 s131-20020a6b2c89000000b00669aa1e7790mr12368245ios.49.1655746928509; 
 Mon, 20 Jun 2022 10:42:08 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 k19-20020a02c773000000b00331e4e4fac9sm6202953jao.47.2022.06.20.10.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:42:07 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 03/10] bsd-user: implement chmod, fchmod, lchmod and fchmodat
Date: Mon, 20 Jun 2022 11:42:13 -0600
Message-Id: <20220620174220.22179-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220620174220.22179-1-imp@bsdimp.com>
References: <20220620174220.22179-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
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
---
 bsd-user/bsd-file.h           | 46 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 16 ++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index e5133268546..0585f6a2a40 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -676,4 +676,50 @@ static abi_long do_bsd_readlinkat(abi_long arg1, abi_long arg2,
     return ret;
 }
 
+/* chmod(2) */
+static abi_long do_bsd_chmod(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(chmod(p, arg2)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* fchmod(2) */
+static abi_long do_bsd_fchmod(abi_long arg1, abi_long arg2)
+{
+    return get_errno(fchmod(arg1, arg2));
+}
+
+/* lchmod(2) */
+static abi_long do_bsd_lchmod(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(lchmod(p, arg2)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* fchmodat(2) */
+static abi_long do_bsd_fchmodat(abi_long arg1, abi_long arg2,
+        abi_long arg3, abi_long arg4)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg2);
+    ret = get_errno(fchmodat(arg1, p, arg3, arg4));
+    UNLOCK_PATH(p, arg2);
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 80ec9dd4954..b33d548a4b6 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -402,6 +402,22 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_readlinkat(arg1, arg2, arg3, arg4);
         break;
 
+    case TARGET_FREEBSD_NR_chmod: /* chmod(2) */
+        ret = do_bsd_chmod(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_fchmod: /* fchmod(2) */
+        ret = do_bsd_fchmod(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_lchmod: /* lchmod(2) */
+        ret = do_bsd_lchmod(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_fchmodat: /* fchmodat(2) */
+        ret = do_bsd_fchmodat(arg1, arg2, arg3, arg4);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


