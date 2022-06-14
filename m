Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADEF54A82E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 06:34:15 +0200 (CEST)
Received: from localhost ([::1]:60302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0yFq-0007B4-6N
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 00:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0y2D-0003ix-TT
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:20:09 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:43662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0y2C-0001qT-CT
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:20:09 -0400
Received: by mail-io1-xd35.google.com with SMTP id d123so8216301iof.10
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 21:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=slM5mo+lyEYK7BDCjCyKBMpfdnmv0SN6/iCP+sM1rKE=;
 b=afAzmoN0Ktm7JxfI1yQT0yS+toFTAyhg/GSpJxW2J3/QAUlmIdl+MMKfxj/RxzYSNP
 XKkM/oMRbX6uLtvjrPQWrc5oejHhS5y9mQEp1ISsGq4SC1UGVDoyODf6U4quKLWHH8fa
 O5a/YY15pAFlI2VGyg/oo3GBJN9W4tJWMFEZVz4ZHmtF07H9BWMV2WJlVCHlY5Jmlcwz
 Yz9YXVo7IVQNuCCfySNv3ylo7IKHTUAHeFSemRlD2Png8jWxr1q8wwoq28r8pZp7SmRr
 hMRTJl2QXa0FqwH7hYJn+ZEEf6TdM5wkZ65lSSgJUxCMivUcBc8UFgdqYNUEdVUJLXkH
 mlng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=slM5mo+lyEYK7BDCjCyKBMpfdnmv0SN6/iCP+sM1rKE=;
 b=Isex5z3yyS5Qxq+2slPPc/ea9LS2MlujsekQTs3Py2TW/jqFSWZV9Domh4FxlnfXUM
 bcx01cotzyopaNHgixy6gGM9D9BiQ+XK9M9j9hXEstXrLKGQFdDAOGS7+SQMuZqpwTEK
 KkYj8V78+OID+j/UYLIw/BvTP4XJSv9YJlaQqygwjJhkWjXMuFZh4a+nV4uWME66dHqK
 F8idQDo7obfpPepXCeJzbuHpRAPmdO7/C1IcJnCH2ceSiHaiz/3pEFqkaC45wnjJRblv
 OgzRZGGeUvEdhidaZfvO3pr5101XSGGZZIsaxsluAm5a4KQEAje5+qCNyZIWxFtDm5TK
 zy6w==
X-Gm-Message-State: AOAM530aXbz7yQwoktKn1Azs7TLOwecMesqKavkI4LhmO/fRo1TKnPo2
 Cam42ABfImoWPZmvnjLP4NbosLkrJu9bqw==
X-Google-Smtp-Source: ABdhPJyUzF/q2I7/jbHiaZ3kZoat/EHxfO47yT0QFbd7RIbsSs6YW/c0n64Vu41Cwf5qNjAdRptcow==
X-Received: by 2002:a05:6602:2b0b:b0:64f:acc1:52c3 with SMTP id
 p11-20020a0566022b0b00b0064facc152c3mr1520854iov.38.1655180406725; 
 Mon, 13 Jun 2022 21:20:06 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 a3-20020a5ec303000000b0066579afd3cbsm4803742iok.50.2022.06.13.21.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 21:20:06 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, arrowd@freebsd.org,
 Richard Henderson <richard.henderson@linaro.org>, jrtc27@FreeBSD.org,
 Warner Losh <imp@bsdimp.com>, def@FreeBSD.org,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH v2 09/11] bsd-user: Implement dup and dup2
Date: Mon, 13 Jun 2022 22:20:08 -0600
Message-Id: <20220614042010.40327-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220614042010.40327-1-imp@bsdimp.com>
References: <20220614042010.40327-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
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
 bsd-user/bsd-file.h           | 12 ++++++++++++
 bsd-user/freebsd/os-syscall.c |  8 ++++++++
 2 files changed, 20 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 8ec53145894..021541ad2e0 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -485,4 +485,16 @@ static abi_long do_bsd___getcwd(abi_long arg1, abi_long arg2)
     return get_errno(ret);
 }
 
+/* dup(2) */
+static abi_long do_bsd_dup(abi_long arg1)
+{
+    return get_errno(dup(arg1));
+}
+
+/* dup2(2) */
+static abi_long do_bsd_dup2(abi_long arg1, abi_long arg2)
+{
+    return get_errno(dup2(arg1, arg2));
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index e28a566d6c3..d9ebb9d50d6 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -349,6 +349,14 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd___getcwd(arg1, arg2);
         break;
 
+    case TARGET_FREEBSD_NR_dup: /* dup(2) */
+        ret = do_bsd_dup(arg1);
+        break;
+
+    case TARGET_FREEBSD_NR_dup2: /* dup2(2) */
+        ret = do_bsd_dup2(arg1, arg2);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


