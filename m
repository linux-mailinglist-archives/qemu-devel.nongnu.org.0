Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBDC55230B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 19:51:46 +0200 (CEST)
Received: from localhost ([::1]:37454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3LYv-0001uA-7R
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 13:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o3LPq-0005Z2-78
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:42:22 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:35463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o3LPo-000834-N2
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:42:21 -0400
Received: by mail-io1-xd2b.google.com with SMTP id y79so11848064iof.2
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LLLWy6je7ZpzT8Wv1poVhDNL/22MkEnIbTh/HAesy/U=;
 b=Xtp0A2lHvtl9nfw0NVwFQTs1NeBfExbUc+S5V19D7DChpItHGPyJvafkjW8X9Dplut
 eTcT7hQWJQ2yO/r5Gkf/R62AljgD9yNtm9G2W45ipCpj1DhtoGKlC1dssvKcVEvF98oj
 nNeg6N2hKL74+1h3LmIfNGtqCfoH8rFzgvAltFeCjK9+An7Afecou6RwSMyQDLTfpohh
 M3Xc7ICIn2HtDdMDCTfBl74twR6srttrSeJ4rYeY30s/y8VXTvkIr+yycmvs2lJ/cHNF
 oafVQu5FFQkFXWSrqyJZUxOPR/2H+O954VyRji96qnp1q43ClT2I5ijl1KEZxNxxZCII
 1UaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LLLWy6je7ZpzT8Wv1poVhDNL/22MkEnIbTh/HAesy/U=;
 b=F2FxAef5HC/1vrBGqHhkpuLDElLE81WKqR6+AgYykeMplB11d11lxuT1edG5+9hb0s
 unMGrqG3imU92Q0DSndjBE1LaGB0TgkUs4wTNp8Nab6luoZDoiyd8PH1BkTo35ye90/h
 SFigd4b6fmFjdt05miJIFAI69yc5LtL2obNRWrhg5GjBLLplipt/ih5WGWhLFMPIe89S
 aHIGcDBrKlie+mM+gcSQwGp9nO2xQAu7nAbmVVqX5Xs1bp6kzTNr1vt40lC4Kvs0Q6lu
 hlEnTnc044TbwhFwjBlJSH5OuXyZJN+Ik+7Ng9COXaxE7dy9pjIJfzPuAThp72hT5M3F
 Pbng==
X-Gm-Message-State: AJIora+B1vPHJyf0ZaDe5AzRJPjwRZiQNhf0LVZRqil2wKC80u8cpwwk
 rmRyRqrfXnvw2eJ3c+1NtIvKRedgcS7btQ==
X-Google-Smtp-Source: AGRyM1vYo1/j1NowR73lSNg/e/aO1+W21rWrbtSvM9OGFlDMYCFt7ShdDxWvMDxdurcD3apepepURg==
X-Received: by 2002:a05:6602:148d:b0:66a:308a:d169 with SMTP id
 a13-20020a056602148d00b0066a308ad169mr12374922iow.152.1655746939365; 
 Mon, 20 Jun 2022 10:42:19 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 k19-20020a02c773000000b00331e4e4fac9sm6202953jao.47.2022.06.20.10.42.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:42:18 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 10/10] bsd-user: Implement undelete
Date: Mon, 20 Jun 2022 11:42:20 -0600
Message-Id: <20220620174220.22179-11-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220620174220.22179-1-imp@bsdimp.com>
References: <20220620174220.22179-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2b.google.com
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
 bsd-user/bsd-file.h           | 13 +++++++++++++
 bsd-user/freebsd/os-syscall.c |  4 ++++
 2 files changed, 17 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 79eb5a73a9b..94e756ae550 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -939,4 +939,17 @@ static abi_long do_bsd_fpathconf(abi_long arg1, abi_long arg2)
     return get_errno(fpathconf(arg1, arg2));
 }
 
+/* undelete(2) */
+static abi_long do_bsd_undelete(abi_long arg1)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(undelete(p)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index ee08b74bdd5..7d791aeb91b 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -489,6 +489,10 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_fpathconf(arg1, arg2);
         break;
 
+    case TARGET_FREEBSD_NR_undelete: /* undelete(2) */
+        ret = do_bsd_undelete(arg1);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


