Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AA2547C14
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Jun 2022 22:53:22 +0200 (CEST)
Received: from localhost ([::1]:56290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0UaH-0005id-Ia
	for lists+qemu-devel@lfdr.de; Sun, 12 Jun 2022 16:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0UVr-0005cT-HJ
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 16:48:47 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:42691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o0UVq-00006a-2j
 for qemu-devel@nongnu.org; Sun, 12 Jun 2022 16:48:47 -0400
Received: by mail-io1-xd32.google.com with SMTP id a10so4284625ioe.9
 for <qemu-devel@nongnu.org>; Sun, 12 Jun 2022 13:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R1mzDwKIeIW7quk19UbE4bGD0UX6piyaXSXw0/n5EbY=;
 b=yUYkMLWP6ULYwUvdm2U5JZh+G3enM7RSItkcVbsv4jQk9VVacEnd7Q+ZBsziN1BU4w
 JeX7orDDH7RdxW8TqZbmL8DXi1/NCb122Oj1Eg8KmrHNKZmKd7Di1Wx2LHR0P9NKJGKw
 vvC0f8+XYDoFSd8Uo9Idvp4lodXbvMp9SjiblRxLqw0Vk/Vqi7YnV/jxdDLVarf2TSEO
 2pRXqfa9QROACAlmT4Ily5tA1aQ5Tjv3QUCX0c+3dqBH1tbxyRZQAE835fnPkpeiwz8w
 DMEgu2f1CVWiAZNbzgdKdvlOR20XISyiMN3edU25fyIBxEfbftkQ8qbEWrvd2PIS5qY2
 u2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R1mzDwKIeIW7quk19UbE4bGD0UX6piyaXSXw0/n5EbY=;
 b=Rm7P+/usqAhVFZ6dVXlguZaenOKV9ah43pOtRAuPRHI02zxlPI6mfVWvqWuD6IOxFv
 mC6NxSYkNBSFg49WFChVpqdEtoxtV2xWcEVXy6Re7u9oc9boq29acGBlLOK7AxEGYhqO
 breXuy57sGu4/IVurHi03EpfWBt1ZX6+W8eJ70fd6/46m5iGpbiTI6ZeHBvCd4CAW8bG
 /9IS0y3u/B9UVkKZ9lhVIjhebNc/U7tajJih0zXj4weYGP4ZWmwTONk2Hpbso7ps9kC4
 ptx+hJZtykPGPap5iNLX7fINKdyXg4dk8lPDQsyLYIOrYSfMK/yZHdvI7/zdIe5C/lzO
 d54g==
X-Gm-Message-State: AOAM531VVRkrpjlzUpp+1r1vp+Mk3s6BuRs+PbQubp/GLO0P0StGR7KK
 KkzJuh9V3cmuihXscs3acCJvZDAXjDNuLQ==
X-Google-Smtp-Source: ABdhPJzeTZ3wV+azKHH6ZfkLtWpQlDUbpkmFRXI+wM1Mwoyg8NH4JI4EbNMeF3a2f9bbSHCwqpaPmg==
X-Received: by 2002:a05:6602:27c6:b0:657:7e7a:11f3 with SMTP id
 l6-20020a05660227c600b006577e7a11f3mr26508932ios.40.1655066925215; 
 Sun, 12 Jun 2022 13:48:45 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 j2-20020a056e02124200b002d1d8de99e7sm2911612ilq.40.2022.06.12.13.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 13:48:44 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>, def@FreeBSD.org,
 arrowd@freebsd.org, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 07/11] bsd-user: Implement mkdir and mkdirat
Date: Sun, 12 Jun 2022 14:48:47 -0600
Message-Id: <20220612204851.19914-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220612204851.19914-1-imp@bsdimp.com>
References: <20220612204851.19914-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
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
 bsd-user/bsd-file.h           | 27 +++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  8 ++++++++
 2 files changed, 35 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 08b1d3a53a9..35036364ad8 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -434,4 +434,31 @@ static abi_long do_bsd_unlinkat(abi_long arg1, abi_long arg2,
     return ret;
 }
 
+/* mkdir(2) */
+static abi_long do_bsd_mkdir(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(mkdir(p, arg2)); /* XXX path(p) */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* mkdirat(2) */
+static abi_long do_bsd_mkdirat(abi_long arg1, abi_long arg2,
+        abi_long arg3)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg2);
+    ret = get_errno(mkdirat(arg1, p, arg3));
+    UNLOCK_PATH(p, arg2);
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index c847e4d20c6..9381ddb5be1 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -333,6 +333,14 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_unlinkat(arg1, arg2, arg3);
         break;
 
+    case TARGET_FREEBSD_NR_mkdir: /* mkdir(2) */
+        ret = do_bsd_mkdir(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_mkdirat: /* mkdirat(2) */
+        ret = do_bsd_mkdirat(arg1, arg2, arg3);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


