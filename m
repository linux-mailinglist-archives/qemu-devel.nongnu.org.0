Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3259485424
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 15:14:41 +0100 (CET)
Received: from localhost ([::1]:59286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n573o-0006oJ-F1
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 09:14:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56q2-0004Zd-Ft
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:00:32 -0500
Received: from [2a00:1450:4864:20::433] (port=40950
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n56pz-0006Ra-Iv
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 09:00:26 -0500
Received: by mail-wr1-x433.google.com with SMTP id l10so1855278wrh.7
 for <qemu-devel@nongnu.org>; Wed, 05 Jan 2022 06:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LPoVhQKsg3Eu+tUEr379OtBtiTbCaE3mXiKV/4jCcdw=;
 b=aSRmf0PtpDuWNYRu8R8hnExkKgjoxY4PBI2raJwCaTck33FNjmNuqafjPzBA+3sNU/
 flqD7NKFnYuJz1z0nnl+0B6sc6V5sfx90rfXVDg4Xvk7QcuArsTL06rOpFzsoPmCaN8Z
 i8OPZWi7hW+slZ1cpIKkNQnoOa3UnjkGMolvLQQZT30gqXdThAxJkyhDwCE2DSaKRDGg
 Jy91hrGQRhUzy/hwT7zzfQ/lrn0MsiDbkUsMfyjLOPe8PXGL0hIseYtM8rkXJCjvVmBx
 0yfn0fHG+9l7wsKhpTpCbdLK78XA+7H9LpxXXqVR6drXB8f9Ec16M/qVG0pTE2Uh4sv1
 eaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LPoVhQKsg3Eu+tUEr379OtBtiTbCaE3mXiKV/4jCcdw=;
 b=zOF7KTILH/gTVRJig0jf/tv85SZvK2o/RjYPljUxKSBp6aWzqbI/iw7VKincRtbjFq
 DB2jg0dvK/HSnGVvXldQvuiZDXQeVhCGwr26Y5zUgxWqb60c7cBlcros+ztKuZxb+lAa
 JjI0cPioaLjglRfAbiddoFqjcTCId++wLgqU+8ekkQFPcn6e25QmEysFIKepsO8iWdMt
 ZN+R4R7fvO7uXsduLyDjP6scDPpZ3BUCuDMeWqXxoZezk0HghIsGDQRQjDim/Ovw+6dh
 pnImZw0pUuxL8/8ARIyXOJR0vfaaObHRTUOGajnuxGaW5saK803yN5ix1Kg9USqXZh85
 kIzw==
X-Gm-Message-State: AOAM532ujwrmb6oNBW2OyuCfypyEDuppOXm3Si54yu7XxlaDYnc1zz99
 WOUL6etD0CEnjgvRGXgmtwXyng==
X-Google-Smtp-Source: ABdhPJzRt57lqu+lcxlrz/GZuqD8sLTPSKXEmqkO1MhWGTfMJOfFCOsNHyZywHPm4CtngMivBMmjLg==
X-Received: by 2002:adf:f20f:: with SMTP id p15mr47524097wro.536.1641391220776; 
 Wed, 05 Jan 2022 06:00:20 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z17sm2626763wmi.22.2022.01.05.06.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 06:00:19 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 361581FFCE;
 Wed,  5 Jan 2022 13:50:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 23/34] docs/devel: update C standard to C11
Date: Wed,  5 Jan 2022 13:49:58 +0000
Message-Id: <20220105135009.1584676-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220105135009.1584676-1-alex.bennee@linaro.org>
References: <20220105135009.1584676-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since 8a9d3d5640 (configure: Use -std=gnu11) we have allowed C11 code
so lets reflect that in the style guide.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211215152055.1748462-1-alex.bennee@linaro.org>
---
 docs/devel/style.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 9c5c0fffd9..4f770002a7 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -483,11 +483,11 @@ of arguments.
 C standard, implementation defined and undefined behaviors
 ==========================================================
 
-C code in QEMU should be written to the C99 language specification. A copy
-of the final version of the C99 standard with corrigenda TC1, TC2, and TC3
-included, formatted as a draft, can be downloaded from:
+C code in QEMU should be written to the C11 language specification. A
+copy of the final version of the C11 standard formatted as a draft,
+can be downloaded from:
 
-    `<http://www.open-std.org/jtc1/sc22/WG14/www/docs/n1256.pdf>`_
+    `<http://www.open-std.org/jtc1/sc22/wg14/www/docs/n1548.pdf>`_
 
 The C language specification defines regions of undefined behavior and
 implementation defined behavior (to give compiler authors enough leeway to
-- 
2.30.2


