Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 376373C8AC6
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 20:23:12 +0200 (CEST)
Received: from localhost ([::1]:45628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3jXL-0006TE-9x
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 14:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVN-0003Y5-Ox
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:09 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVM-000238-DP
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:09 -0400
Received: by mail-wr1-x42a.google.com with SMTP id r11so4352155wro.9
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 11:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=byn+kGIvX+lTVYP8YxjnR9UyOrNPI2QDvVtI9P3dF28=;
 b=k1HChWhDsiZoE6EiC7CJ86hVkpwVKUSXige5fcu6cpcmqukh6p66KCAauyTkbP+OVt
 WV6otgWLWOZ+MtMr0zFx9Mz7Yw1KCiuKeJ9KR6Re41LiRnlvKFmhTHhUbDo3xyMmivUC
 IG2npOQ5JUubZUSZtWt0RCWPTHQKK07K1UYYdQV4SEMje71RgQob4b0diYLC+EYKvk1W
 KWcPXLHLfT7ivvFD4hSYK8BmyS+3oxaYyygaUdM2a0oGp8ihP+a2JGANyb15vCo5qFAB
 e4jNsMhePOtWmOxGA7Zu8Ii7XJeQtqTNwrSxI6rD2yv6e/PJW7J+SD5h4ZJ/y/+FiVyf
 LB+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=byn+kGIvX+lTVYP8YxjnR9UyOrNPI2QDvVtI9P3dF28=;
 b=X7RXdiv21K/rvjvTHUOmDDDu4dTB+TV599WtnHx93XJ9340PtxnCrB/5VyrmvkyOks
 nD2TGTX7nawjNEblBELLwToQL75JLqKfxmyMh4t0aFee1saH961jvujkMwfMkKkcrxdW
 5GxT+448abmUCS0pP/KlTvIoaGnyPK/468qZCrBfLPA8P8iX+om9WWFYFTO/j2GCIssx
 zWqh04uUUwVCXiWazI1F5KqV8kJOaV2Rc2VVeIoPhEs9eYPDZNfyU552G5il51xVlYN1
 e/UQ8wlZB2WO+aCOk0aTF59U5jTUA3IMtyM7Ec9H3cefkGzn21NfwcIO1UYld5oMCYfF
 I0zQ==
X-Gm-Message-State: AOAM532BpjsHyZ8Fn6una5vVy6hDfjD1PEdv2jlLdLfyAOrtGGZIDK3z
 fV79Ts3+YJerFDHi9p5Jk8eqcw==
X-Google-Smtp-Source: ABdhPJxIl7b7zqC1uc6IZU5vnFiGh8G59Ogl7qtEPY7HyP51/KzbXuKIxOQe95wzvZ3L3ICn9aP0kA==
X-Received: by 2002:adf:cf10:: with SMTP id o16mr14349462wrj.426.1626286867084; 
 Wed, 14 Jul 2021 11:21:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v21sm5965417wml.5.2021.07.14.11.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:21:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 32F131FF92;
 Wed, 14 Jul 2021 19:20:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 06/21] .mailmap: fix up some broken commit authors
Date: Wed, 14 Jul 2021 19:20:41 +0100
Message-Id: <20210714182056.25888-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714182056.25888-1-alex.bennee@linaro.org>
References: <20210714182056.25888-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: Nick Hudson <hnick@vmware.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marek Dolata <mkdolata@us.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes: 49a6f3bffb ("target/arm: Correct the encoding of MDCCSR_EL0 and DBGDSCRint")
Fixes: 5a07192a04 ("target/i386: Fix handling of k_gs_base register in 32-bit mode in gdbstub")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Nick Hudson <hnick@vmware.com>
Cc: Marek Dolata <mkdolata@us.ibm.com>
Message-Id: <20210714093638.21077-7-alex.bennee@linaro.org>
---
 .mailmap | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.mailmap b/.mailmap
index a1bd659817..082ff893ab 100644
--- a/.mailmap
+++ b/.mailmap
@@ -27,6 +27,10 @@ Paul Brook <paul@codesourcery.com> pbrook <pbrook@c046a42c-6fe2-441c-8c8c-714662
 Thiemo Seufer <ths@networkno.de> ths <ths@c046a42c-6fe2-441c-8c8c-71466251a162>
 malc <av1474@comtv.ru> malc <malc@c046a42c-6fe2-441c-8c8c-71466251a162>
 
+# Corrupted Author fields
+Marek Dolata <mkdolata@us.ibm.com> mkdolata@us.ibm.com <mkdolata@us.ibm.com>
+Nick Hudson <hnick@vmware.com> hnick@vmware.com <hnick@vmware.com>
+
 # There is also a:
 #    (no author) <(no author)@c046a42c-6fe2-441c-8c8c-71466251a162>
 # for the cvs2svn initialization commit e63c3dc74bf.
-- 
2.20.1


