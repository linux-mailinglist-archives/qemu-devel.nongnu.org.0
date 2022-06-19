Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D8A550C7A
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jun 2022 20:12:37 +0200 (CEST)
Received: from localhost ([::1]:40006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2zPZ-0004NR-2b
	for lists+qemu-devel@lfdr.de; Sun, 19 Jun 2022 14:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o2zIc-0000yZ-7V
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 14:05:26 -0400
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36]:43745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o2zIa-0001M1-Oc
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 14:05:25 -0400
Received: by mail-io1-xd36.google.com with SMTP id d123so9110901iof.10
 for <qemu-devel@nongnu.org>; Sun, 19 Jun 2022 11:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=slM5mo+lyEYK7BDCjCyKBMpfdnmv0SN6/iCP+sM1rKE=;
 b=V6BnCgFCrQDM/FGPPHVtN+YkvrRve5wzOL0DtfkTx9I7LZkRfskkGCZNWFoWXGk7jo
 Tl3wTWOnWCZaZAV2nNPQUGlT37VBhgvHuwIhxQaKy3gkm/sa5mgwfbzOFJ7Z/ywdF74f
 +ubz9pBoJMNo/ihEqnp4wZevHbc6sU5JK9WoQ0RO9eCIhAMiVZbnPVSkNtG4HS9Tzkm4
 uJv6JdlWRvzMplZ2Url0XRpv2I+QkenzdMJebQCebhV7+hAaNq3tHd2tA3dEI1ByeZMN
 PZcxFA4KW+vKCy/DWPxPvOIu3ZuzXAMyOStGBZyY489iVPQSWb0BpXybiJEPFW4Ik09j
 T/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=slM5mo+lyEYK7BDCjCyKBMpfdnmv0SN6/iCP+sM1rKE=;
 b=Y3j/HldnCSLlWg02RwdQb9M4eZfcGYA5djHuEEbcstqA+g1Yjn75IuCnWG2MGcz4fT
 h04sV6nv9LyQ4Zr9w5+YDQXh7u60tpraFOzIvRXl6kLCySeVllGiOSso9O4FFMTGa0Vc
 sKzifiQWSbo0hS9oCvBU/TzDk31zrUJDREETR5015WqcK3grLaSsCWmClB96W/9dS4/L
 MhjPkOcWD+KEKQx0uTaJ0+9Ci3iyEy6UXraGz/wCz5gy4ZSfyrrele9BWsToKycw+c+/
 pvGaZZLbEaFsKKa7roIZR/lEeEj7ab1YRkA/0s7BkwQjAwBoCf3sxmw5PstG6aBLPkAN
 GWdQ==
X-Gm-Message-State: AJIora8G/Lxn/mQbzqUzeqpEptjHa4YiSgHpuH2X4yF+W1WoIPDM/6KB
 lQ2B0zOA9SSCJhuu9JgIsQCbJ53gHL2puQ==
X-Google-Smtp-Source: AGRyM1uryGx/xSYgkauVUzDSfx3hJO5CqBlXyw7Bt/TcoBo65YoiR2G7UxfA8FOLlljbVhHaHOcm8w==
X-Received: by 2002:a6b:3ec4:0:b0:669:b9e6:cd97 with SMTP id
 l187-20020a6b3ec4000000b00669b9e6cd97mr10116142ioa.128.1655661923494; 
 Sun, 19 Jun 2022 11:05:23 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 63-20020a6b1542000000b00669b8999911sm5556897iov.15.2022.06.19.11.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 11:05:23 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, jrtc27@FreeBSD.org, arrowd@freebsd.org,
 def@FreeBSD.org, Stacey Son <sson@FreeBSD.org>
Subject: [PULL 09/11] bsd-user: Implement dup and dup2
Date: Sun, 19 Jun 2022 12:05:29 -0600
Message-Id: <20220619180531.9161-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220619180531.9161-1-imp@bsdimp.com>
References: <20220619180531.9161-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
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


