Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8893C8211
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:51:58 +0200 (CEST)
Received: from localhost ([::1]:37382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bYb-0008MI-PK
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:51:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bKX-00031L-NI
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:25 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:42997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bKV-0004e1-9L
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:25 -0400
Received: by mail-wr1-x42e.google.com with SMTP id r11so2368358wro.9
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=07qbnshrUSR72AAoluEeIei2r45399bnXGyWSV2iqis=;
 b=LLpud6mnRvLIhwWl54RDAYtpSBwwyWH3wo+z7q7z/w+ePxSOyGvZ5H0j4dLUBsjOpE
 D9ExwFpaIaL9jCmsdkhxvPc5pCQQH4iRUiO+RSah3bCdy8LccRFkifWqVMM0GlLbo0HI
 aqdZj40nAVbVOZZZqWFW0ip4pcqenWqoh9/Pm5qUssZoP3YWngd2Brw4PtcG10eN1G/h
 oPXGQ4NLbifS8XNHSNcXqkqfLd8zntqahm/And7XmHWUXQ5OZuX4M4bOeS2+iJGV3yno
 yqEA58M2E9GBtNBedoaI4YCxk4X/stl3PiLhyZGlj2teu7BfEdnEciqkc7s3QyL5TIS3
 t+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=07qbnshrUSR72AAoluEeIei2r45399bnXGyWSV2iqis=;
 b=eGni4Vf2ctBbSdlKQY4NTRyy1STTGQE2Fdy2Z20dbafacJIGavbnBXZMYhDrqsAJHA
 5N6f/JT8NtMrEft8TKfeL+lcsNP6Rdv2KzrOZRNDMhtoPYfU4QEeo/ZFHBlH+iV1g3qp
 UUiL3Y0yL+aQml7TkiB2IifVbE5HR7hgdCca5HYa6tpfW2ntUnDT1/CphHB4RsRx7+MK
 jHrSRugp8UeQE9avgFkKVnME8QyzGowT4YnPJazo8otOtlv3n034HCfxumAAWEXsry7d
 kZroXAXxrFsqBDNmx0zpQLIYqCh9TocgtYCR8cdrfsDZLNs0+F7hBfGmF4MycPuv5X5u
 ygfQ==
X-Gm-Message-State: AOAM5338UAyobbfP+F6osAMMdX4eUtiDfvRecoOUgnJBLG/sjSeM3Wz8
 zYu69gCvdnkgAnthdQ4nYgQuAg==
X-Google-Smtp-Source: ABdhPJwdmJGAeeMnNH2lePELGsquxN13XKm7eNkizCCu2cLuk3E14xKLFd+LUd4AIwusC94mpmZjYg==
X-Received: by 2002:a5d:6302:: with SMTP id i2mr11676268wru.366.1626255441831; 
 Wed, 14 Jul 2021 02:37:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w3sm1884949wrt.55.2021.07.14.02.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:37:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B53A11FF92;
 Wed, 14 Jul 2021 10:37:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 01/21] gitignore: Update with some filetypes
Date: Wed, 14 Jul 2021 10:36:59 +0100
Message-Id: <20210714093719.21429-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714093719.21429-1-alex.bennee@linaro.org>
References: <20210714093719.21429-1-alex.bennee@linaro.org>
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Viresh Kumar <viresh.kumar@linaro.org>

Update .gitignore to ignore .swp and .patch files.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <79262dbe1f7888eb02e1911501eebafa6f2f6400.1616583806.git.viresh.kumar@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitignore b/.gitignore
index 75a4be0724..eb2553026c 100644
--- a/.gitignore
+++ b/.gitignore
@@ -13,3 +13,5 @@ GTAGS
 *~
 *.ast_raw
 *.depend_raw
+*.swp
+*.patch
-- 
2.20.1


