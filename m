Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F215522EE
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 19:49:05 +0200 (CEST)
Received: from localhost ([::1]:58592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3LWJ-0005O5-6b
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 13:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o3LPo-0005UI-NQ
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:42:20 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:37571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o3LPn-00082N-6z
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:42:20 -0400
Received: by mail-io1-xd2c.google.com with SMTP id n11so11846368iod.4
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xvO8Ov8iFiJB19am3BYEej1ZbpHltJs2lcNLKpDVVpY=;
 b=H2skOZpwMDgnyI6/PX7uI5sWq28bS/77X/5hy4r2VgE0DOxsjFTyr99P/XT4QoVPZH
 9xkLZWJJq9Kmv3wsQlLfkVZxBnExXuL1pmqBwAhcbrjSIZGk911I5gSnPxMA+zQGZnl4
 f/zF0cz6uFtyWKwFK0Yqb7eXZUFRl1a+FkvsMxRJmOEnkSMVesgtTtcME49BR6j+4RFW
 +wJywO2PL00il+jXVJd+2CuOsdFwXfDsZoB52vUiwglX0fqQ/WN1X4PJvgsI8Pf2s8tN
 2cjfNnCFQs1PrAfGDja4WFbBOLARbltsKpljI1ugerZH71RidOeM8fAL2x8uQu72FnN6
 Vxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xvO8Ov8iFiJB19am3BYEej1ZbpHltJs2lcNLKpDVVpY=;
 b=BFrn0x+F9syvDWGVY1guvEoDihawvqmPvbZyIr/HMLkz4uj6J0Fo4kd+35snAzVLXX
 1lPvArmoVSFmLxeUX+Nv2ZOqy8Q4SQo7Fj4nDKhLjwq2ZdMoRwy2uPZQ7ZKlUKi2za4E
 YgEh7bQg7xLSF5cHO+wugilJRLAzUKjkgyl6oddn/9fPQcYSCjyzhwDQTqb9CtSN1mcR
 vuzziemjwWTbOK6pBdnlKmNxSHx/OaQcon8z9swK2neIDnA1I7jtjOUgpCtiK99AU2r3
 W0WAcYcvAp0B3Szhryr0tSdi6eKJz4vevJ9IcSlRCWCAsFS1DFqI/YBSlV74h+m/DhNt
 NKeg==
X-Gm-Message-State: AJIora8Ef7F5/gAJiuY//5oCLH/lefZYvxbG4hvs+4LIkQ2pDY9xyyhc
 VcUQsydB4yrZvxqBw6/0ibbnG4g14bBT4Q==
X-Google-Smtp-Source: AGRyM1toMgBS6i/f2N3w1ybmCpVMyFoMbBn5r2QfCI1BIJMWxQ0X1Lfu1BHiKLnEV7OyUf7BP+MNIA==
X-Received: by 2002:a05:6638:4115:b0:332:2a5:2b15 with SMTP id
 ay21-20020a056638411500b0033202a52b15mr13608383jab.189.1655746938276; 
 Mon, 20 Jun 2022 10:42:18 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 k19-20020a02c773000000b00331e4e4fac9sm6202953jao.47.2022.06.20.10.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:42:17 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 09/10] bsd-user: Implement pathconf, lpathconf and fpathconf
Date: Mon, 20 Jun 2022 11:42:19 -0600
Message-Id: <20220620174220.22179-10-imp@bsdimp.com>
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
 bsd-user/bsd-file.h           | 32 ++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 12 ++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 0b4b89c8d5c..79eb5a73a9b 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -907,4 +907,36 @@ static abi_long do_bsd_mkfifoat(abi_long arg1, abi_long arg2,
     return ret;
 }
 
+/* pathconf(2) */
+static abi_long do_bsd_pathconf(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(pathconf(p, arg2)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* lpathconf(2) */
+static abi_long do_bsd_lpathconf(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(lpathconf(p, arg2)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* fpathconf(2) */
+static abi_long do_bsd_fpathconf(abi_long arg1, abi_long arg2)
+{
+    return get_errno(fpathconf(arg1, arg2));
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index ff3893b9197..ee08b74bdd5 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -477,6 +477,18 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_mkfifoat(arg1, arg2, arg3);
         break;
 
+    case TARGET_FREEBSD_NR_pathconf: /* pathconf(2) */
+        ret = do_bsd_pathconf(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_lpathconf: /* lpathconf(2) */
+        ret = do_bsd_lpathconf(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_fpathconf: /* fpathconf(2) */
+        ret = do_bsd_fpathconf(arg1, arg2);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


