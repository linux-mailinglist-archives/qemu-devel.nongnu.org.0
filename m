Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 654CE332879
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 15:23:38 +0100 (CET)
Received: from localhost ([::1]:55872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJdGr-0006cM-CF
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 09:23:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJdB2-0001Ne-Ha
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:17:36 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:51748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lJdB0-0001ic-Qn
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:17:36 -0500
Received: by mail-wm1-x32e.google.com with SMTP id l22so2074385wme.1
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nN/o3NC1BjCVaVugecWZFPBtRdcQ9Jd3TS2cKRxBLsA=;
 b=Psti3gEGTHOBatFrhi4usMelQDLv5p8QRvNUVI/4Uoae3py2vs0WNWnGKO/nPJWwGm
 fSFSvl4Wf6kgg/LCrzn6tQMNHbqv4U2OfSPobYy5r5VCtsDvfBQ6ouoZqmG9ixhIx1cm
 4qx83HoQ7fjQDSuK1qq3w5UEPZZFx7XvQIyiNhsUP4l9iLamqrrvPbsWJ5qHPF+pRRlo
 mYv1wpajO6eViNo/iac3GoKje1tbICYAl8ed7MdRF7+UHFk4SQdbqBFaplXClBwKzsGN
 BMPn9SGGsWCdjIJ0rZktraW0rHVZPAUZxyEuSB41OniVQFzlRyPGAYzyCCzAcZx2NY5m
 I8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nN/o3NC1BjCVaVugecWZFPBtRdcQ9Jd3TS2cKRxBLsA=;
 b=RGvaz88DW0K3UYJtyiVQwFozdYT9C711UU2KvZTU23Ak9YK3vVIAjj0zbS/YeHS7SG
 wUYe0+uzGpEbAd8garQ+G+t/lhUrMOgyFN6OJcW08bTnHcVt9A6/d/GtsSqgBqXL0An3
 jh1a3EwOp4UAidU0jWwkjIta9oye11Oltdnd1I2jC5Y1kEVcIlq9rTS/aa47NzIibizX
 WhB+0GOMISTQBLBNU58W6BGDt9ovI01aOXUpetsueZ2DQLs2tNCZpf6E1l40xyU3/kZM
 XvSius3EF8vBANvaXArMXkHSQwjvfhpPEUOair8fRtiuN7CszB2RVplTIJCKTaA3MyvW
 TynA==
X-Gm-Message-State: AOAM533vcxAMvzK7/bKZ+bfZ3qPr4qwNV7PfCFN7X8yjmPL+LY1J/xQI
 DcB3HHqwxXOEwipHTsOqk+l0uQ==
X-Google-Smtp-Source: ABdhPJzO+tvxGegk80s1X5KlUsYXn7t8Lnib0hp0VfXOCz1DZ80zXK+eotHW9jiopzxWXu0O8d2UUg==
X-Received: by 2002:a05:600c:4ba2:: with SMTP id
 e34mr4308715wmp.121.1615299453372; 
 Tue, 09 Mar 2021 06:17:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f22sm4147037wmc.33.2021.03.09.06.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:17:31 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5CB931FF8F;
 Tue,  9 Mar 2021 14:17:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] semihosting/arm-compat-semi: deref parameter register
 for SYS_HEAPINFO
Date: Tue,  9 Mar 2021 14:17:26 +0000
Message-Id: <20210309141727.12522-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210309141727.12522-1-alex.bennee@linaro.org>
References: <20210309141727.12522-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: Bug 1915925 <1915925@bugs.launchpad.net>, keithp@keithp.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As per the spec:

  the PARAMETER REGISTER contains the address of a pointer to a
  four-field data block.

So we need to follow the pointer and place the results of SYS_HEAPINFO
there.

Bug: https://bugs.launchpad.net/bugs/1915925
Cc: Bug 1915925 <1915925@bugs.launchpad.net>
Cc: Keith Packard <keithp@keithp.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 semihosting/arm-compat-semi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 733eea1e2d..2ac9226d29 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -1210,6 +1210,8 @@ target_ulong do_common_semihosting(CPUState *cs)
             retvals[2] = rambase + limit; /* Stack base */
             retvals[3] = rambase; /* Stack limit.  */
 #endif
+            /* The result array is pointed to by arg0 */
+            args = arg0;
 
             for (i = 0; i < ARRAY_SIZE(retvals); i++) {
                 bool fail;
-- 
2.20.1


