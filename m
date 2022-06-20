Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C7E5522ED
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 19:49:00 +0200 (CEST)
Received: from localhost ([::1]:58186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3LWF-00057M-6Z
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 13:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o3LPj-0005Gw-32
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:42:15 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:37571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o3LPh-00082N-Fp
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:42:14 -0400
Received: by mail-io1-xd2c.google.com with SMTP id n11so11846368iod.4
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UuJHHejPBwIaugX7fDadtLkXriXIC3ahCHAaQC5ubvM=;
 b=z/+F3FS8t6/upUJHwXVBLUtAd1Yj87nCu56yI0nmvCs+0F8eYJLdN5biDezHahUaIy
 AFeKi6ECYH1tcYUvZuOsOnUgdcrQARGf2acT6bqfwnDGVPtRjfpnl0YRjw65rs69uj5e
 ZO7DLTxQts04Z20+cIPHbpB69uupt3p6edlaNO68sBA6kQqZgXaSrDAhfOUC+z8uVTWe
 dFjLJVz61lLm2lvqAJdffxZIOfi0gU80T3/nQdpGjF3bW2hG8JiKCsb+pG37Wp38TjyB
 FM6vuqUStHsxcuvG6eJeaAQsj6dDDVHZExJdm2giVIlNEhTMQcswkLNnolg7M7Nsj0P+
 rUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UuJHHejPBwIaugX7fDadtLkXriXIC3ahCHAaQC5ubvM=;
 b=j3gIub0bVwrFJS2Dz09Z7S9W5/mPUATYKOoVvm09YyGaPN4YUhTkLOpGCR3ZBkN5DL
 UkDACc50EqU2IoELjQI1xEfdbJlkhWVCFzlj5vln1ibhxdn2wcElIn3eiNFpEyZNwZnS
 6JgZeFumkDf/c1MCTcCAlRgxiCIhlZkUwdcc8m+Sdbife4oHJzKFWAzgKkO4hb/No/w1
 EM860i4LSJ4gVPl434qm2E9ZhbUTRPdc+0dabKUQiq6U4lk/zzj5QgU5Ilz6k/uhNKpP
 rY9QrHKyrRE2IKmxLfvdoYBkRdsOL/sdXYEJIETTt1FxFKtoxvf2boeVq3i09L9UBjRQ
 houg==
X-Gm-Message-State: AJIora8fTSwR1j6psKyF6939kUO/mEkB8ogn+yjawUE9xZakAMywkjcv
 UbwopidI9pAGPXQGl+KEsPbDPClXh1JUeA==
X-Google-Smtp-Source: AGRyM1ujZupBOqmlxmhRNJ1FzRX/vPX65+TaqcYFbgf61nKkfnP4viy36+ObYu8j0rdBLd4jQ+0oUQ==
X-Received: by 2002:a05:6638:1a0e:b0:331:9a26:57c3 with SMTP id
 cd14-20020a0566381a0e00b003319a2657c3mr13697473jab.310.1655746932072; 
 Mon, 20 Jun 2022 10:42:12 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 k19-20020a02c773000000b00331e4e4fac9sm6202953jao.47.2022.06.20.10.42.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:42:11 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 05/10] bsd-user: Implement chown, fchown, lchown and fchownat
Date: Mon, 20 Jun 2022 11:42:15 -0600
Message-Id: <20220620174220.22179-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220620174220.22179-1-imp@bsdimp.com>
References: <20220620174220.22179-1-imp@bsdimp.com>
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
---
 bsd-user/bsd-file.h           | 48 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 16 ++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 3be832b2a74..152579ad541 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -781,4 +781,52 @@ static abi_long do_bsd_mknodat(void *cpu_env, abi_long arg1,
 }
 #endif
 
+/* chown(2) */
+static abi_long do_bsd_chown(abi_long arg1, abi_long arg2, abi_long arg3)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(chown(p, arg2, arg3)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* fchown(2) */
+static abi_long do_bsd_fchown(abi_long arg1, abi_long arg2,
+        abi_long arg3)
+{
+    return get_errno(fchown(arg1, arg2, arg3));
+}
+
+/* lchown(2) */
+static abi_long do_bsd_lchown(abi_long arg1, abi_long arg2,
+        abi_long arg3)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(lchown(p, arg2, arg3)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* fchownat(2) */
+static abi_long do_bsd_fchownat(abi_long arg1, abi_long arg2,
+        abi_long arg3, abi_long arg4, abi_long arg5)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg2);
+    ret = get_errno(fchownat(arg1, p, arg3, arg4, arg5)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg2);
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index fea6a857b78..4d10334ef21 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -433,6 +433,22 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         break;
 #endif
 
+    case TARGET_FREEBSD_NR_chown: /* chown(2) */
+        ret = do_bsd_chown(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_fchown: /* fchown(2) */
+        ret = do_bsd_fchown(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_lchown: /* lchown(2) */
+        ret = do_bsd_lchown(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_fchownat: /* fchownat(2) */
+        ret = do_bsd_fchownat(arg1, arg2, arg3, arg4, arg5);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


