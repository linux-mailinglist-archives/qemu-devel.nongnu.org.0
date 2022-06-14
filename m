Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F228654A7FD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 06:25:30 +0200 (CEST)
Received: from localhost ([::1]:43506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0y7O-0002qq-2A
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 00:25:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0y28-0003UV-5d
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:20:04 -0400
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130]:45825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0y26-0001dr-Ki
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 00:20:03 -0400
Received: by mail-il1-x130.google.com with SMTP id a15so5728589ilq.12
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 21:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9QIqkwwLRQpn8xMyw5K6t843YHf8OffHXasVl+JrrV8=;
 b=fNwVpleXz1XLSy9/cYV+NDzdze2R59kcWPOKPDNk5LA6QZYn9baxSPTji47D4KGrss
 6kr2QT223c/uZ99St0v1JlZef15j5Nb1DAkXIslP3mf3ThMYP1pkktqNd3NTyCo+0OCQ
 DfkHD4oh/Ta4oVTk4M6pn2x4Ey5Fy98JIjI9Sls4Xmo5AFBO4KkomOIEk2v5gNAYIDH1
 C6qMScQhdTYs5OKejuIolplTOVUuoPTOjkshYJ3XSsbpjeuqRksN+K8sTtcckN7PFove
 oV4Q4INkgPDFeng0nghsLEHed4Y9YmvHVmC5GfziQ/2idzyKHW7IOcd4jkhi87ou6gdV
 mP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9QIqkwwLRQpn8xMyw5K6t843YHf8OffHXasVl+JrrV8=;
 b=rYDnF74ZjPK6pTdcTNLMRlJTHVa333cQPTDr8CnifCDrYxMnTdOGFCnVHsLcrAEbCQ
 Rx/R50s/6BXRSJRbKmGzH7qWOONHBThqe7qCF4vgLweZMmUeet7akXa9NaTuNWQUYICi
 HPDt0sCl5nkobRsKQtY82Kr+WAhm6cMu2cXbXQSyfjjlJ27nAfl7NKy5SyKUuyRJyrCo
 yuTpMi3RHFgt/boG+wqmIl6ZKP5OUXMRL0WPA70PnnPa5yEsbVlROvTql4ejDzgz1xFE
 A3t4QElnl8mR/KBqMN1G29yIlN6Gab+IbP4CrhDOoZZRi3CCdnA3JCCT/SRHB1NEp6of
 5Xfg==
X-Gm-Message-State: AJIora+LBHmgVtV9+J9GG0nJUHHsMwo3LlUH0oBjBtTyhcQ8WiDV+bWS
 /gVUEYIlnbuCtnZdgIgVX7RvFXC7N/ExQA==
X-Google-Smtp-Source: AGRyM1umOoDDTC+W4Nq+v8Ri7pg0TJ/WXXE1DwlMrxCrU/a0dNyDucDNgkyxirYWPBcZDUwN3djTMA==
X-Received: by 2002:a05:6e02:1709:b0:2d1:a79b:3166 with SMTP id
 u9-20020a056e02170900b002d1a79b3166mr1864095ill.83.1655180401326; 
 Mon, 13 Jun 2022 21:20:01 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 a3-20020a5ec303000000b0066579afd3cbsm4803742iok.50.2022.06.13.21.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 21:20:00 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, arrowd@freebsd.org,
 Richard Henderson <richard.henderson@linaro.org>, jrtc27@FreeBSD.org,
 Warner Losh <imp@bsdimp.com>, def@FreeBSD.org,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH v2 04/11] bsd-user: Implement chdir and fchdir
Date: Mon, 13 Jun 2022 22:20:03 -0600
Message-Id: <20220614042010.40327-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220614042010.40327-1-imp@bsdimp.com>
References: <20220614042010.40327-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::130;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x130.google.com
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
 bsd-user/bsd-file.h           | 19 +++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  8 ++++++++
 2 files changed, 27 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 6ff2be24e30..bc0a0c08d55 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -311,4 +311,23 @@ static abi_long do_bsd_faccessat(abi_long arg1, abi_long arg2,
     return ret;
 }
 
+/* chdir(2) */
+static abi_long do_bsd_chdir(abi_long arg1)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(chdir(p)); /* XXX  path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* fchdir(2) */
+static abi_long do_bsd_fchdir(abi_long arg1)
+{
+    return get_errno(fchdir(arg1));
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 7b7af914e49..8698db358c1 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -301,6 +301,14 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_faccessat(arg1, arg2, arg3, arg4);
         break;
 
+    case TARGET_FREEBSD_NR_chdir: /* chdir(2) */
+        ret = do_bsd_chdir(arg1);
+        break;
+
+    case TARGET_FREEBSD_NR_fchdir: /* fchdir(2) */
+        ret = do_bsd_fchdir(arg1);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


