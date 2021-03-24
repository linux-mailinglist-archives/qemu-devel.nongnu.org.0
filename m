Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA45347AD9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:36:06 +0100 (CET)
Received: from localhost ([::1]:57744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4c9-0003QP-BH
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4Wq-0006Rd-3J
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:30:36 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4Wn-0007Mr-CI
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:30:35 -0400
Received: by mail-wr1-x42e.google.com with SMTP id x13so24655521wrs.9
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 07:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6sNcGE+fxfYDvF8wTWBRRUANizKHbS8OY1p/YPeXwYg=;
 b=q1D5XAJXxz/IjI2QtEcZ6MaZFNkIOgUblNX80XEri///tovh+QEARHnbDk7QZlnp/O
 01JEtIdsVLeLaRMF8mPHOhm9JlUTp/4iePTRreiTVc2R4oLGLVpX9AYmgexeKB4OZCG0
 +lk7MNz7h7CO1z/aUErKjmgtzB430MEU23pTqCIKl7bpZCFROoTzDTotKSMVuWk4yRwl
 XFSU1vkmxNZ3l/m36i2GQc6V8Z+tAhnPMI+auZcB1/kSf6ErhfiN9zJSsWPJwWLF7od6
 BZXfDZthZbKBX7/dbnClsDPfWWQut5NWoIQg0Iya8MzytXExTI95OL7xBo7TBVwuoGym
 ry9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6sNcGE+fxfYDvF8wTWBRRUANizKHbS8OY1p/YPeXwYg=;
 b=mGI86L+khHIH7GbT1PTwudEB4iEkh2BWVdEjZbS3MI/9OZymiiHWSkxhadmpgb/rde
 CrFMEv+CHk+ERPE4l0diYXlIKxLluug0zINZPGN+5zIzOdQzIx2quPo3L/8JX/Rdi2Lt
 z/oN/GNeBlDiPdcFtTtnA65an+4JhwJv36Js2L8ENfN0wPqp8ByOegQqyzh05hSZJbrx
 90qmXCR+63y9YKe7+CXJAhG2A1z1ZaXm2rNcuh9CRy16gJF64yryDBNvkMgJkTGYZBdm
 ygz+BoXqFKCfYJH94FEPVbpZD44g+qdzZm98ajfeeO/zOKuYKKGE/N651UQdcl7+Yz1n
 okjQ==
X-Gm-Message-State: AOAM530XRlHnReiHEW/qFxvI8bLeagUepnWt79iEf0PCW04xzK2B8899
 fnJ4LoedhsnnTUNj6IaHUiMagkXJtJ2VLep5
X-Google-Smtp-Source: ABdhPJyhHCKpu26GCsjevqQCDNNB00XBR1PhsWlGycDMT6kQyfuI8miLAEdwOqLTJjH4V8ro9oojsw==
X-Received: by 2002:adf:e392:: with SMTP id e18mr3941538wrm.189.1616596231935; 
 Wed, 24 Mar 2021 07:30:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v14sm3234965wrd.48.2021.03.24.07.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 07:30:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6598B1FF93;
 Wed, 24 Mar 2021 14:30:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 07/22] semihosting/arm-compat-semi: don't use SET_ARG to report
 SYS_HEAPINFO
Date: Wed, 24 Mar 2021 14:30:06 +0000
Message-Id: <20210324143021.8560-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324143021.8560-1-alex.bennee@linaro.org>
References: <20210324143021.8560-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: Bug 1915925 <1915925@bugs.launchpad.net>, Keith Packard <keithp@keithp.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As per the spec:

  the PARAMETER REGISTER contains the address of a pointer to a
  four-field data block.

So we need to follow arg0 and place the results of SYS_HEAPINFO there.

Fixes: 3c37cfe0b1 ("semihosting: Change internal common-semi interfaces to use CPUState *")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Cc: Bug 1915925 <1915925@bugs.launchpad.net>
Cc: Keith Packard <keithp@keithp.com>
Bug: https://bugs.launchpad.net/bugs/1915925
Message-Id: <20210323165308.15244-8-alex.bennee@linaro.org>

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 0f0e129a7c..fe079ca93a 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -1214,7 +1214,11 @@ target_ulong do_common_semihosting(CPUState *cs)
             for (i = 0; i < ARRAY_SIZE(retvals); i++) {
                 bool fail;
 
-                fail = SET_ARG(i, retvals[i]);
+                if (is_64bit_semihosting(env)) {
+                    fail = put_user_u64(retvals[i], arg0 + i * 8);
+                } else {
+                    fail = put_user_u32(retvals[i], arg0 + i * 4);
+                }
 
                 if (fail) {
                     /* Couldn't write back to argument block */
-- 
2.20.1


