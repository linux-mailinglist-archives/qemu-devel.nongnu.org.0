Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B95872F7CAA
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:31:16 +0100 (CET)
Received: from localhost ([::1]:60604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PC7-0005zw-Nj
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:31:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0P08-0005Dd-Jb
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:18:52 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l0Ozz-0002Ks-K6
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:18:52 -0500
Received: by mail-wr1-x434.google.com with SMTP id a9so5794848wrt.5
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CjGD2CqnC4W2kjPV2Ui5zP08M1Vc7R0wTAQHoMDZ3xQ=;
 b=SM0pcsPuMYzaCKr7m9/Ke5cDRK1VhdyqwArzqAC8q2c1k+YfMrbbE6j7FybqRPBg0I
 FBEHTu1NUQkJkDlNx8MBoza5SfV4aZqZmvozQmL4+153bZFxW9kmyYqBOWIrwYYOTctI
 zcYD38VMH0TM3gMnEiSH93IOpQvG0snlThD1NoqHAf6TWqnnIyme6r7skywlIlCxqdTB
 0Ek1c/8oo0Vi+3y3qWY5/Bs1PFNnBEx5pqCeImWninSkw6wDFRRT38g7PItg7HeUDWSE
 2pl/XKDpll1j4Dfhxu8d7hAluROoA2d3LacjuY/BE7WqmC3XUv+WD2HPz1L2DC0C7D6U
 K+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CjGD2CqnC4W2kjPV2Ui5zP08M1Vc7R0wTAQHoMDZ3xQ=;
 b=I1fewPaKpKhLz5udjrFmDVRoxRcWGNpefXxGwY0Jx1x0vaNoQHfo7liaIsgtVhuHop
 D0nSbhTAW1IL9WXd5agS202BZ1UTaTn17aMoY51WkpX5QVVJBHPnPgRy7FoUlEKJkWIw
 2/cYrmcXGCG5awCSZ7jKm/022phHIhY8aq7CK8sDb13A0FOGMVzIEhWizTf5Qf/rMjHo
 UheBK+9nrJhjfOtgz9+ceJWZw+Qzy1fg0qTS3kkbcT0fBxZcSElDD3CCOnYUWDQuExP6
 itw2BEqefdrz1TKTpYKiJVOWQmZ0vzbPxAuKELVKWAUFXS1BHbdbbXadUj+roXdAn3+h
 4gDQ==
X-Gm-Message-State: AOAM531arV9laz5tVO4BuYKR91gNgFZS82K8qcIBgnNYc/rkb3MbL96T
 HBd5L8rHignm1XCJlDbViU6aKg==
X-Google-Smtp-Source: ABdhPJyrfgYZ1GxOHTnWtkEkNGEZLWdzAgDWP3GQ6giEx6fq3oc2PmfmwQCiN3HRwirOpNkTtXNbAA==
X-Received: by 2002:a5d:4712:: with SMTP id y18mr13303498wrq.229.1610716722332; 
 Fri, 15 Jan 2021 05:18:42 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z130sm12761226wmb.33.2021.01.15.05.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 05:18:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9749D1FFB5;
 Fri, 15 Jan 2021 13:08:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 30/30] semihosting: Implement SYS_ISERROR
Date: Fri, 15 Jan 2021 13:08:28 +0000
Message-Id: <20210115130828.23968-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210115130828.23968-1-alex.bennee@linaro.org>
References: <20210115130828.23968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keith Packard <keithp@keithp.com>

Part of Semihosting for AArch32 and AArch64 Release 2.0

Signed-off-by: Keith Packard <keithp@keithp.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210107170717.2098982-10-keithp@keithp.com>
Message-Id: <20210108224256.2321-21-alex.bennee@linaro.org>

diff --git a/hw/semihosting/arm-compat-semi.c b/hw/semihosting/arm-compat-semi.c
index a631904fb0..23c6e3edcb 100644
--- a/hw/semihosting/arm-compat-semi.c
+++ b/hw/semihosting/arm-compat-semi.c
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


