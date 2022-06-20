Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB6E552308
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 19:51:33 +0200 (CEST)
Received: from localhost ([::1]:37298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3LYi-0001nV-94
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 13:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o3LPk-0005Ls-C1
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:42:16 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:35832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o3LPi-00082X-UB
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:42:16 -0400
Received: by mail-il1-x12b.google.com with SMTP id k6so3287624ilq.2
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SRYz6Q4Bnejs49gwvdXs+qzdTzurNm/Hy6aJzVGr/pU=;
 b=NBL5x8b3w+3zMWZxMmkLIwgkSgGuwURbrWytFRenBG5xX+OeGY9yB2x4w/gxhJj7on
 JLk/AgYaJCZBatJ2VzC4bVkvsoVK/HRR+98K2xIjth30DLfTnbU4r5AZXL9CieKmMbC3
 4rkWCG4qkgrevM6CFelEEE2SPzLhyH8ZTXZXofIagWurcRMYauxj7EDtJbAI9Kzq2BIv
 8/1ymsiZ7Y4mvzFkAfYmn4N/6iXezU80QHYObflmVKOq+7/e5+c+D7vrSpOvteJRsCOS
 WX17sTreebqJHyKLdosikLK6ScLW91dsT/2rZwlMriLN3faUoXGxSONWsHHdLe76fvof
 Ip1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SRYz6Q4Bnejs49gwvdXs+qzdTzurNm/Hy6aJzVGr/pU=;
 b=ck14kaFnPB2ox92obOtBuMbN1FJ/BXZjNNp1rq3Tk4b7gt693UfMuBPaAoA/XEA5Nm
 DurGYnsfyNxNylWzbNuPAoRN00TwKS7OYvl7jtWBt2NABf6ILUDS2heDdmN+4+O1PPqf
 sX4lIcndt5Up5mQ7DFlINIx1JV3CbtiC71wjnpNsyaLcsJMbzEsfWyKaqfT1noEqE61e
 z070NT6tPx59FHqhJ13T0Mt2sFssPtcrk30xre1FrQxX+OkA5NYymvpVxQUdCZNszVvE
 r18pXINZ+wg5EJZHft7pO15eE3M3SVZquHrXDcNvBKXTozGDr2cgJngfPR8SX30s3VbC
 g+Bw==
X-Gm-Message-State: AJIora8+CDPiy3D9gyhnMlo6SJinuBYIJvSFl+XcODTOlbJ55wiXwjRd
 fgnnDYqwTHKR2q/Bjz2TOu8UxKmXsQ328A==
X-Google-Smtp-Source: AGRyM1vRTnviDqAUy1yMNnA+E4hQjftVnkDNt1jsAR+E0ZsWOSsvjX1h4NXalYz6oCmLoPTySv64Cw==
X-Received: by 2002:a05:6e02:1a05:b0:2d9:1613:9f9b with SMTP id
 s5-20020a056e021a0500b002d916139f9bmr2703442ild.164.1655746933656; 
 Mon, 20 Jun 2022 10:42:13 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 k19-20020a02c773000000b00331e4e4fac9sm6202953jao.47.2022.06.20.10.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:42:12 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 06/10] bsd-user: Implement chflags, lchflags and fchflags
Date: Mon, 20 Jun 2022 11:42:16 -0600
Message-Id: <20220620174220.22179-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220620174220.22179-1-imp@bsdimp.com>
References: <20220620174220.22179-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
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
 bsd-user/bsd-file.h           | 32 ++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 12 ++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 152579ad541..f5375a39a2c 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -829,4 +829,36 @@ static abi_long do_bsd_fchownat(abi_long arg1, abi_long arg2,
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
index 4d10334ef21..d10635eae05 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -449,6 +449,18 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
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


