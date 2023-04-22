Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFCA6EBAAE
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 19:29:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqH2Y-0006uP-U1; Sat, 22 Apr 2023 13:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <itachis6234@gmail.com>)
 id 1pqFy0-00023i-7q
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 12:20:04 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <itachis6234@gmail.com>)
 id 1pqFxw-0007Hc-2v
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 12:20:02 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-24b3451b2fcso2252257a91.3
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 09:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682180394; x=1684772394;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mDPdeLBQukeDnq85V7V0rxAb4+em9pAzyCAxjlswg6M=;
 b=W4+CVHtgIkZrbMr2uR8aJG98bLQSgD9i/qEU0V/DUvfyXKpy1eP3d2BPn/EyOFEU40
 6TqE27c+pp3LSDSA69CND2AW2ksNGoawUucbe9uXIJJdQJYDwerngrp/U56rJJv362mw
 /yOmXt+3Oh8ROAybUZB+qVtw+hTYZGvT+N6H/9y1FQAO+H94/bGDdAxsiKbHeRPzklEM
 whiSFcjgO+38UpdIcBFG3nLZpseXsKnKhlqYVbPA+JeBlxyRUMUCzATde65xDN9wjv4p
 krAcnTD+THmJAvSvsoK06N6Dps2EMcLQYBkV4AGHNbveoGr1Xcm2hY3CfftKi9np5lwl
 W4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682180394; x=1684772394;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mDPdeLBQukeDnq85V7V0rxAb4+em9pAzyCAxjlswg6M=;
 b=Wo6gwNckugodduZEPiamD2iRPHpqHyvovLVl8w0dB9cnxn8ycAGY6AcGqQt1S5g7or
 Di8lrENxFxBdL4Y4SCOCR84PC1IHSVEgOfitEbBtt4XiaOGmfR/ZJ35Qu6BRe1HCBQdz
 TYaVb4ijuWvRtnoXmDTL42A/HrcRazleKLjxW5T4LFNjHYTCTVlD2ClWWBK0qQOB0x9e
 iTMgG98l9JO9ak8SYUgg/VZivXlSt5sWp5TFSFwpQWUz4l0Rxw30gFPRvq+Wnj8SiYOQ
 XAHabYm/tPfMttolZR1e6ow+wx2o8zRJiugm9zftD8kxYtqHNfOfM72llJg+SUhkCXnu
 lDjQ==
X-Gm-Message-State: AAQBX9c7Vza5D08OUSJaGR3ex9a9sxTlRog0Rdefl8NUkk7vEU9Z4Ozm
 ECqtuMu8Ko/ztd7N9U09wEA=
X-Google-Smtp-Source: AKy350bU4XOvC0UPvrAZcTESjwlcm7BJLs9vT9imAyjX4BA05stUtjpV6ZENnB6+TI9g2JKLa15mjA==
X-Received: by 2002:a17:90a:e556:b0:247:4ad1:f69b with SMTP id
 ei22-20020a17090ae55600b002474ad1f69bmr8531894pjb.26.1682180394424; 
 Sat, 22 Apr 2023 09:19:54 -0700 (PDT)
Received: from apple.localdomain ([182.65.27.4])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a655b8e000000b0051f14839bf3sm4241667pgr.34.2023.04.22.09.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 09:19:54 -0700 (PDT)
From: Ajeets6 <itachis6234@gmail.com>
To: itachis6234@gmail.com,
	qemu-devel@nongnu.org
Cc: imp@bsdimp.com,
	Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 4/7] Added clock_gettime(2) and clock_getres(2)
Date: Sat, 22 Apr 2023 21:49:31 +0530
Message-Id: <20230422161934.2311-4-itachis6234@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230422161934.2311-1-itachis6234@gmail.com>
References: <20230422161934.2311-1-itachis6234@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=itachis6234@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 22 Apr 2023 13:28:49 -0400
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Stacey Son <sson@FreeBSD.org>

+Added clock_gettime(2) which gets the time
+Added clock_getres(2) which finds the resoultion of the specidfied
clock

Signed-off-by: Ajeets6 <itachis6234@gmail.com>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
---
 bsd-user/freebsd/os-time.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/bsd-user/freebsd/os-time.h b/bsd-user/freebsd/os-time.h
index 29d2c8d02a..f76744e808 100644
--- a/bsd-user/freebsd/os-time.h
+++ b/bsd-user/freebsd/os-time.h
@@ -63,3 +63,35 @@ static inline abi_long do_freebsd_clock_nanosleep(abi_long arg1, abi_long arg2,
 
     return ret;
 }
+
+/* clock_gettime(2) */
+static inline abi_long do_freebsd_clock_gettime(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    struct timespec ts;
+
+    ret = get_errno(clock_gettime(arg1, &ts));
+    if (!is_error(ret)) {
+        if (h2t_freebsd_timespec(arg2, &ts)) {
+            return -TARGET_EFAULT;
+        }
+    }
+
+    return ret;
+}
+
+/* clock_getres(2) */
+static inline abi_long do_freebsd_clock_getres(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    struct timespec ts;
+
+    ret = get_errno(clock_getres(arg1, &ts));
+    if (!is_error(ret)) {
+        if (h2t_freebsd_timespec(arg2, &ts)) {
+            return -TARGET_EFAULT;
+        }
+    }
+
+    return ret;
+}
\ No newline at end of file
-- 
2.34.1


