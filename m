Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9953348C399
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 12:55:34 +0100 (CET)
Received: from localhost ([::1]:38024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7cE1-0002gS-M9
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 06:55:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bvM-0007Ib-EJ
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:36:16 -0500
Received: from [2a00:1450:4864:20::52d] (port=36754
 helo=mail-ed1-x52d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bvK-0004jC-Mz
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:36:16 -0500
Received: by mail-ed1-x52d.google.com with SMTP id 30so8787669edv.3
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OCzjWzCVd+L9u3XmPscDUfJmJhGYdo58k6lI3HO///Y=;
 b=xOEtUyX8vbMTFtOuKPGR8C6KHZlap1ggEHvJFVLzVtGIM57likoScDw658Zwg5/9sj
 rVczOQzeGDTOmXCiZwozLdJ366jaMRDSMR4yPju9a2Q7Yq07icqIpip8xwdlorP0IaAs
 nvFEEAbjMP5eSgWNq+jKUbczyJ/uUwRxcZzCY4xcackiphtyhVqqZ4ITgSeOfAJ8FTdu
 UXyWTHTfH7QG3jpLjalTVPuUwQU6C+RO6PdOZcdFJEB9R/AnYCFU3STEoPhj6/Gg+g24
 oA6a2WK0IHD+PmFICVQuiEDikUQDySfnvy0XJJD/SHgSWGJvUZPETNdfsBRa5PqRt39r
 DOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OCzjWzCVd+L9u3XmPscDUfJmJhGYdo58k6lI3HO///Y=;
 b=Kz40SLGOrZ5x/ouRSdByu81WU98dfy8NNgbMNBLMp68BAV/3ZxaLMXRRUkx4bRF2OS
 bt8dLMPBWtUo5bu7uyQh/vWLjrqYMMN1XrLSlmMa5TzxK/xqtR85t6H8c3IfNjvva494
 O4Y6Q6RzLpsmhhmJWsdPSJaGMsdmkGnpu1uqZZyYOL9JQLOBLWhm6xfdzmoUddahK/ve
 iY1P66h89tdGj4shSXrD7ODuYwxnGKQZ7Dr+Hbe3F959eZj9BwZhFY+mayershKyR3n0
 6ywpkDxMf7T6v15gUedpmte/96IxClHEd3Mjr3j6YPGQnPIscB1v9K9J+65noFnwMzfD
 8SNw==
X-Gm-Message-State: AOAM530v1IDYKHEe4C+bV6J1w93nYRlC63oFBEsEkFgv3a3a7/SoYB6T
 AFWaAbhf0VGm0MY3v3pH20l2ChsbKNC4Rw==
X-Google-Smtp-Source: ABdhPJzXWgYCfIvFWXFld7zxulmDorbczC/IuAPESl/90Mdt0zb2TvBoHxLSSiuJ/FghqmaTlLQApw==
X-Received: by 2002:a17:907:6d1b:: with SMTP id
 sa27mr7788923ejc.526.1641987373398; 
 Wed, 12 Jan 2022 03:36:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a3sm1551853ejd.34.2022.01.12.03.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:36:10 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 61F9F1FFCF;
 Wed, 12 Jan 2022 11:27:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 23/31] docs/devel: update C standard to C11
Date: Wed, 12 Jan 2022 11:27:14 +0000
Message-Id: <20220112112722.3641051-24-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112112722.3641051-1-alex.bennee@linaro.org>
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since 8a9d3d5640 (configure: Use -std=gnu11) we have allowed C11 code
so lets reflect that in the style guide.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20220105135009.1584676-24-alex.bennee@linaro.org>

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


