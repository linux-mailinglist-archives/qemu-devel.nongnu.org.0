Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7D03D056E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:31:57 +0200 (CEST)
Received: from localhost ([::1]:34468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zDQ-0002xU-4k
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z8w-0003Ot-Ih
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:18 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:35577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5z8u-0005eV-WD
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:27:18 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 m11-20020a05600c3b0bb0290228f19cb433so2431433wms.0
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dBuLdb6xrfb8bf5JLU0n3V85VzdE7/ohZ6HC7UUdwdw=;
 b=YdwFs2j71Yo6r6gUWkVuUzjpJxG5Fb0PbT9/04eWC5t5KsDoMUBplmbzIE21uMArnI
 UIfxEYePhiE4LXTyELaBJOt67KUCUQqLS0DxfOdUFwBR73QR507a2Jbu5yBXlTT5Nikd
 NJqtvFllki61u1AtVQHBK+ylh2Feo2eGc5jjrQrU8mPU53JNmwampygzfiWM9vo0Ljj5
 NtXP1W8b1XOCoKANegi/cfdjpWLWogPinT4UCzcJ7hYPyatl+RugkgE9c6FSsBX7w6hG
 BW3KqiYgW+Hcmya/imZARmlyax5WTo2biB9FCFtPdjJBhS1vLTuf1jNrfo70hWV2PWAt
 zN2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dBuLdb6xrfb8bf5JLU0n3V85VzdE7/ohZ6HC7UUdwdw=;
 b=fFKExrNzvncqomh/UDaUN6SWgUzwjoNcJUNCwM8gozW0nqLt5gCnLDtEF8L4W2LGc0
 3HqepdAFoJAuN8mGWS0P7MHkVyAoXhH2rengdh95sghm9RZXV6NNzyDrSgYOUzVll2L2
 mo4yuqQolifQWKFvleAe5kT4jbXqk32ZPWMgt85rl4NqJDiO9Y2ApPb1/p1cQdeRY0Op
 QsZ73IVoLzGhUrG62tL31qzKJtuaAF3A2ld2ZV41NjCNu4yde6ueaqSfZCyDBhGLQRl1
 4WZIXXLxABSuIwJBwB83FB9XzWm6Q+LZzxs/IN6BJiY36cXKmM1Hpvckd5Elk7s1+NBN
 MfuA==
X-Gm-Message-State: AOAM531tbx4NCfWnHM4bNCWXyJhqYlUCfIT2n1w2BuOs38a1HCbgzAWe
 tzLKJI8TuayZIFqY56ah2oEuyw==
X-Google-Smtp-Source: ABdhPJwZ22KP2kIrWWUEZlH9BDhycWDk9CsaD49J8YTuE/AQqvxSfIoblim2oiAmYzDqt0rNpDv2VQ==
X-Received: by 2002:a7b:cb92:: with SMTP id m18mr34350418wmi.29.1626823635724; 
 Tue, 20 Jul 2021 16:27:15 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u12sm25788770wrt.50.2021.07.20.16.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:27:08 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5A85D1FF92;
 Wed, 21 Jul 2021 00:27:04 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 06/29] .mailmap: fix up some broken commit authors
Date: Wed, 21 Jul 2021 00:26:40 +0100
Message-Id: <20210720232703.10650-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
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
Cc: fam@euphon.net, berrange@redhat.com, Marek Dolata <mkdolata@us.ibm.com>,
 f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 Nick Hudson <hnick@vmware.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes: 49a6f3bffb ("target/arm: Correct the encoding of MDCCSR_EL0 and DBGDSCRint")
Fixes: 5a07192a04 ("target/i386: Fix handling of k_gs_base register in 32-bit mode in gdbstub")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Nick Hudson <hnick@vmware.com>
Cc: Marek Dolata <mkdolata@us.ibm.com>
Message-Id: <20210714182056.25888-7-alex.bennee@linaro.org>
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
2.32.0.264.g75ae10bc75


