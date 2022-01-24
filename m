Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D124992A1
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jan 2022 21:23:35 +0100 (CET)
Received: from localhost ([::1]:53640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nC5sE-0003jg-BO
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 15:23:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5lA-0006ZS-5m
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:16:21 -0500
Received: from [2a00:1450:4864:20::52e] (port=40701
 helo=mail-ed1-x52e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nC5l7-000386-5v
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 15:16:15 -0500
Received: by mail-ed1-x52e.google.com with SMTP id a18so58492468edj.7
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 12:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2JKLnYKPM+EQcQ5BAumwl8ZRfWG1GUNMSMDRrhS3n0Y=;
 b=CfwSh7tsecuebpy3FVrlZglL5FeFYi3HTXT2Hqzh75pEIuv6EHQ+Vw4zVdGfVkWWd8
 PQQDh7EudT8cbWIFzUuKFwRw3aEIT+PwuCvLHTlvQIyCL3UBE+uXQ3ooVgXJoFo04xZS
 bLEPMsqiMB/k8nW4+yKgVQOSTVKFC3Bs85PEZ0J3NDmZiWFBR6YSlrHAzVR5n/hdaZyu
 6VG7fZRpcfZXWfZZKXnBCzMA13IEeiNZ+2Pb9rUgpImx20T0d5Mw5967R1azxk2Z+dm1
 XK+qNRbBGrbVip+xh0iJPgus4rtyyijv+ftAIrme2ZohjTDR/hdsUNvpATqelwxYa2SA
 IMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2JKLnYKPM+EQcQ5BAumwl8ZRfWG1GUNMSMDRrhS3n0Y=;
 b=sHCPgaNbfEWhtse2IpEMZZ/ef8ZHQGGZ+4XAxJ+psZTV/Cg0yBYEoUbSHwmhGcnRYu
 SlThiS9Wthq79X00GiwqOMFfqahwMAAndhHBDih1F/PSP6lEZ/F2SS9hPNaUCA3zV3LP
 cnTGS7RC9P7gESCw6NvrzCGBFY1eOdWjK2xaPiULqsOIvyOf1eAapVywcgwyjiAY8f+j
 fbINwVrCmozWhelSiXyz+WDCvb+Dhp9icr8/rfPAYTf89rmscDlBXBlrrfwQPKNQ9YzC
 U7sWiApsgsyOarOTU/MjMG/Q0a1ZnBP8cskmJqDMN4TcnarSZjMaJwk75TM2gZFe2BAI
 FWVw==
X-Gm-Message-State: AOAM533Uqfxp75FOvAh6iih4uYg8VxFhhRO/Ue0tFPE72987DZhO92pI
 ySas7CJGQx4lsPuAlMEvgC5PXg==
X-Google-Smtp-Source: ABdhPJxyX1OtV7yWh/m9ao6r7VDqI8WZq7Tyj7YO91b0Rn/EDdXWPavFH/xEyxHXMWmilx+5aJ+FsA==
X-Received: by 2002:aa7:d3c2:: with SMTP id o2mr17699363edr.207.1643055370306; 
 Mon, 24 Jan 2022 12:16:10 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id gg14sm5297191ejb.159.2022.01.24.12.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 12:16:09 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7ECAE1FFB8;
 Mon, 24 Jan 2022 20:16:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 01/22] tests/Makefile.include: clean-up old code
Date: Mon, 24 Jan 2022 20:15:47 +0000
Message-Id: <20220124201608.604599-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124201608.604599-1-alex.bennee@linaro.org>
References: <20220124201608.604599-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: aaron@os.amperecomputing.com, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 Luke.Craig@ll.mit.edu, kuhn.chenqun@huawei.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is no longer needed since 5516623020 ("meson: convert migration
directory to Meson")

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/Makefile.include | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 3aba622400..47cc7bc40c 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -34,10 +34,6 @@ endif
 ifneq ($(wildcard config-host.mak),)
 export SRC_PATH
 
-# Get the list of all supported sysemu targets
-SYSEMU_TARGET_LIST := $(subst -softmmu.mak,,$(notdir \
-   $(wildcard $(SRC_PATH)/configs/*-softmmu.mak)))
-
 SPEED = quick
 
 # Build up our target list from the filtered list of ninja targets
-- 
2.30.2


