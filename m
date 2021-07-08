Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C2B3C19F7
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:39:51 +0200 (CEST)
Received: from localhost ([::1]:49502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZsE-0001lg-FL
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWR-0002Dq-Bk
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:19 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:42936)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m1ZWP-0007UA-38
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:17:19 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 j16-20020a05600c1c10b0290204b096b0caso4723078wms.1
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1tFxEjWS8ph3QIQaLzB5s7JcBmanfU2D2gi2t0MWK88=;
 b=ADKU35rsfvrjNghrFP9PT6FD3RydEny2MgPTdG/I5tPhCw5xkJq4iKUpFC9Vbvl+RU
 5W6kAtBSi1i6sjS4/jugdFEUzq5FXx6YEadKsZKryW/HXb3G2i1OXUYTyXLScmB3g9nM
 /O5mG3boY4p4H6yl10SrJdadE6ugQZUwRLaLyOA4RcPrxaP4mrv4kB48zU3OnlPwHJTD
 rmbqjDUUyoAkkUMONvli6QerVMHLJ0XdRKSufbyns4VjB6xgVQFNY23/ZYInlkADnVj3
 520X5BfchpM0oUZKPt5Ld5ESS8Aq2Na/TYAVoHvqnxd/C0AyfVs+q+SDDkk4jAsa3QRu
 J+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1tFxEjWS8ph3QIQaLzB5s7JcBmanfU2D2gi2t0MWK88=;
 b=j3aTPNtZrG7NOm1tW9kMhfRbsQKNMFhL1VWntbfu4vnPpb1DyGHAsBpk5BJ4eb3W8x
 OaODT6YBpv+BM415HVVEfyXBbYZiJnvcE/rI8YIo1eQ1TNKt/byLtdO/dX15+FwlTXXy
 XVbjCViclm4w5OHRxIeqHDckIN1bkDST4N+w8arn0Mm+fhjs6B4JWrtAxjPQe1VayZfP
 1xZhAeusKoSYGm2V0FgoH+aj1EHitUXVCZSNLpDqMPVJ1fLBpXbLbZAwgw2+rdhPjp1c
 +DLr8BoWFq4tJuV9LykRRBPQYuioT9Fkkp9TUwImyZAQpL1GarlJn607fhZu6hupe0rQ
 wnQw==
X-Gm-Message-State: AOAM530sduHWG31BMXy3Wft+3C0gYh4UVvxsf1p/KJqiyQgGFzLOE/5U
 JOo/kIanUE/W2vTlr4UsDJ7TyA==
X-Google-Smtp-Source: ABdhPJze+O+QEn6tXS1dKsQ1sTfCdmkvUsKsukuqWBgQ3LCC/f2vvHIj/hB1MlurS3lHY3VvoiMATg==
X-Received: by 2002:a7b:ca45:: with SMTP id m5mr4512671wml.46.1625771835319;
 Thu, 08 Jul 2021 12:17:15 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p15sm2641544wmq.43.2021.07.08.12.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 12:17:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 36FC91FFB5;
 Thu,  8 Jul 2021 20:09:45 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 30/39] configure: stop user enabling plugins on Windows for
 now
Date: Thu,  8 Jul 2021 20:09:32 +0100
Message-Id: <20210708190941.16980-31-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708190941.16980-1-alex.bennee@linaro.org>
References: <20210708190941.16980-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net, Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are some patches on the list that enable plugins on Windows but
they still need some changes to be ready:

  https://patchew.org/QEMU/20201013002806.1447-1-luoyonggang@gmail.com/

In the meantime lets stop the user from being able to configure the
support so they don't get confused by the weird linker error messages
later.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Yonggang Luo <luoyonggang@gmail.com>

---
v2
  - move targetos check to if we try to --enable-plugins, default no otherwise
---
 configure | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 7f906be68d..43f4d3220a 100755
--- a/configure
+++ b/configure
@@ -708,6 +708,7 @@ MINGW32*)
     audio_drv_list=""
   fi
   supported_os="yes"
+  plugins="no"
   pie="no"
 ;;
 GNU/kFreeBSD)
@@ -1510,7 +1511,11 @@ for opt do
   ;;
   --disable-xkbcommon) xkbcommon="disabled"
   ;;
-  --enable-plugins) plugins="yes"
+  --enable-plugins) if "$targetos" = "MINGW32"; then
+                        error_exit "TCG plugins not currently supported on Windows platforms"
+                    else
+                        plugins="yes"
+                    fi
   ;;
   --disable-plugins) plugins="no"
   ;;
-- 
2.20.1


