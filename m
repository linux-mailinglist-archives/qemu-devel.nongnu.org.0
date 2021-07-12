Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F12F3C5C34
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:33:37 +0200 (CEST)
Received: from localhost ([::1]:60660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2v7w-0004O9-5R
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:33:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v1j-0004Km-AR
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:27:11 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v1h-00082x-40
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:27:11 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 j25-20020a05600c1c19b02902269686f585so1094186wms.0
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bEWuCkwFDvQybyyjFP+c74u0XYV/S/sranziec9O85Q=;
 b=IAEAWMTbJaEV/Zqskyl07NJOz/Kc1J8SRYEh0mndMToX355KfIeIG7mx3N0piaYeSp
 LSRQPA0KKev1aa9ax7eZ9GHTjB2h89xjEaBCxKADP7uecGxOyF1cgpyBgQ6AblA8jcRz
 mbP+uWEU43NySiS71e6zTMWzUfKyQ1GZXCghD2GnwAfvXNXzvRIMt+IlsnnTnvMCsGNY
 TpRMBVMyWiTRJ/2fQC5nuuJFkhLJIscHYm5KXXEnmCm6tF5O/3rh0JECLAqmZvG0tp9l
 mRMaZ0X7uKIEfu16RrCOZM9I+aj8WU052Dp5fsbLO6dtyLG5P1r+HX568ezhcgb+NmQH
 z3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bEWuCkwFDvQybyyjFP+c74u0XYV/S/sranziec9O85Q=;
 b=UkJ1+jqRINy17O7Lxph5QhlyS9ty6GG0fPW8E5Mh0rkw/mF3CBNkSh5ldtYkGBSnLW
 +F3qsDgbmlPbxZscDhAAuuSG767mTEmicBJBMKu+rtEw/jObtakFioZ7802xIaVnRsWk
 ZmBeAaStgxk+Q6fCzCAF7JY4LK5LTBqh22rNO1pIJ4ZGfAYvnFK+pB7E/eMYHyEVZjQw
 5lxtzKlEuVDTkrRdFvZHdZGas8Tw940DbRWQPaC3oSUtkg9+LNZpoTmUW/g4kUdSohXh
 kGOvOQZYC3n7WyXppAfvVEHeOO8KF/dzUkZDiXYneDd0njuHMu6n8ZGv8pPuxmtRt8Nu
 NzSQ==
X-Gm-Message-State: AOAM530MGFfi+vCdNR1UAWN7AW+qkl1Vpu/I0DTCBOjrSj2ZooVtqESs
 Y8krSzSBQ/lBpH3IzUTHea0GyQ==
X-Google-Smtp-Source: ABdhPJwyxpwsPRefwS+iGzNQejQ30OIwbCu1sQfa9PkKLvaD61xGyn/krxXqEUP3Iv3+5ilnbH8dhg==
X-Received: by 2002:a05:600c:354e:: with SMTP id
 i14mr3071871wmq.96.1626092827782; 
 Mon, 12 Jul 2021 05:27:07 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v9sm2454369wml.36.2021.07.12.05.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:27:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 44A6C1FF91;
 Mon, 12 Jul 2021 13:26:54 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 05/40] tests/tcg: also disable the signals test for plugins
Date: Mon, 12 Jul 2021 13:26:18 +0100
Message-Id: <20210712122653.11354-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will be more important when plugins is enabled by default.

Fixes: eba61056e4 ("tests/tcg: generalise the disabling of the signals test")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210709143005.1554-6-alex.bennee@linaro.org>

diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index d57a115873..85a6fb7a2e 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -37,6 +37,8 @@ signals: LDFLAGS+=-lrt -lpthread
 run-signals: signals
 	$(call skip-test, $<, "BROKEN awaiting sigframe clean-ups and vdso support")
 
+run-plugin-signals-with-%:
+	$(call skip-test, $<, "BROKEN awaiting sigframe clean-ups and vdso support")
 
 # We define the runner for test-mmap after the individual
 # architectures have defined their supported pages sizes. If no
-- 
2.20.1


