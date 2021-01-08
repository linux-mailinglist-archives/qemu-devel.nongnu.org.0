Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1EB2EFB86
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 00:03:14 +0100 (CET)
Received: from localhost ([::1]:44492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky0mo-0001BN-1H
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 18:03:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0cX-0006tj-O3
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:52:37 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:47081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ky0cV-0008He-V2
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 17:52:37 -0500
Received: by mail-wr1-x432.google.com with SMTP id d13so10366014wrc.13
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 14:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YCv8UW6H2mK8ZNblVt5e7KAX8pnHx7CAKvXlS1nI3d4=;
 b=Y25tmef2EFI3UfID9ApkObWoQUCwtYubh471fFSFDsatHS0vROszyeC2SUM6vVSjvv
 buSF1QeQ9T+GP4wmIqKmRHsmmfXgGRdKyK2xvBk4vk93Fy132zcqCGJ98LpV3eu0S6F1
 JmbWdQZgeyY71SVoTeC5bh713SGmF5qqblvrkmVHmiDXvjbfnrBCTyYwh22JhqSAZEMU
 +TL5OBL4xEUDkfR/PEUMVN3iwQkxv4H788SQUyDt4aLvTb0GhrDf7fAqEpRwsS8ktHAm
 0C0zRfUwqKU9HGV2s4S9QIQ0d+97n6xO1Jt6Q75LAy5Lg9/H3fYAatN5u6apnLdiWThq
 36EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YCv8UW6H2mK8ZNblVt5e7KAX8pnHx7CAKvXlS1nI3d4=;
 b=WiLpxrGnbcBGWDWFVIyOlFRUmgSGMsbNpGbQgWyn5RH7DEKzROvP5o/cxNVYjgNZHb
 V8uEaRSC+mJsgUB3/v3oZTqbZGbHT9n3sNPgBqqmRLLbJOT3RvO3XoqwqV1Mc25skYpa
 8NHq9sk9irnoNxl55UA1XU1uz9Msd3XPEMhBHFhBcc2d9dBjTslcZnWjJ9RUxwlP2ul5
 /8dO3vcMtEqh6ar9s/kURaJQ7vU/ILqyyHoYupUWdRihBvaxCSYOQkGw5j1hpoeRrB6V
 z07cLnSzdsGI1VyGAZ+KW8HLFwt3pDwuy0NtIcXMbe7mS6GB53MTfu1A2aNjqjc5Scuu
 voBA==
X-Gm-Message-State: AOAM530R9xqpQA7thYdF8OuiG93VofTpWjB9jEUCMXdf+s7n7GwJKWwZ
 A4nPBoHHuiQ52zX9f8ImGXrDzg==
X-Google-Smtp-Source: ABdhPJyT5S2t8Mvc+u5g22R57g3O99Rir2Y1C50feFtdb15vB10yLDKAjALAJBaqDqOb4P8yOR8SQA==
X-Received: by 2002:a5d:6902:: with SMTP id t2mr5593305wru.214.1610146354155; 
 Fri, 08 Jan 2021 14:52:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o125sm13470870wmo.30.2021.01.08.14.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 14:52:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0490C1FFA9;
 Fri,  8 Jan 2021 22:42:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 20/20] semihosting: Implement SYS_ISERROR
Date: Fri,  8 Jan 2021 22:42:56 +0000
Message-Id: <20210108224256.2321-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108224256.2321-1-alex.bennee@linaro.org>
References: <20210108224256.2321-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Keith Packard <keithp@keithp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keith Packard <keithp@keithp.com>

Part of Semihosting for AArch32 and AArch64 Release 2.0

Signed-off-by: Keith Packard <keithp@keithp.com>
Message-Id: <20210107170717.2098982-10-keithp@keithp.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/semihosting/common-semi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
index a631904fb0..23c6e3edcb 100644
--- a/hw/semihosting/common-semi.c
+++ b/hw/semihosting/common-semi.c
@@ -59,6 +59,7 @@
 #define TARGET_SYS_WRITE       0x05
 #define TARGET_SYS_READ        0x06
 #define TARGET_SYS_READC       0x07
+#define TARGET_SYS_ISERROR     0x08
 #define TARGET_SYS_ISTTY       0x09
 #define TARGET_SYS_SEEK        0x0a
 #define TARGET_SYS_FLEN        0x0c
@@ -967,6 +968,9 @@ target_ulong do_common_semihosting(CPUState *cs)
         return guestfd_fns[gf->type].readfn(cs, gf, arg1, len);
     case TARGET_SYS_READC:
         return qemu_semihosting_console_inc(cs->env_ptr);
+    case TARGET_SYS_ISERROR:
+        GET_ARG(0);
+        return (target_long) arg0 < 0 ? 1 : 0;
     case TARGET_SYS_ISTTY:
         GET_ARG(0);
 
-- 
2.20.1


