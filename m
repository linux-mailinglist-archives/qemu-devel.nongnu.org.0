Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1E24446D3
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:16:47 +0100 (CET)
Received: from localhost ([::1]:48448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJsU-0005AD-Vx
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJoA-00056V-Bl
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:12:18 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:46947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJo8-00073i-UM
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:12:18 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so2360650wmb.5
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 10:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gN/nCnYHg37RzH2ySF2xwAPVmqvP9Hor2tdZRDmd/rA=;
 b=s+G9BvPTYfVKT1SAmnx1/GFQ8ofROLhHCRma2cBRlmtLxmlpVHMTD4iRRHiPHh4rBm
 qy3ZBQWSvvad7B+QSqRH/VeSX5u1u+5xJ3C3odi6YPuT+1Z0YXtCfgQv81cMLpYWk/8A
 Fk4Z9MKWClaUqWyS9kYx/IBHfk72yW9j+G1GGwNE3b7opk63Xc9vfKFpDYpoqJv/A02a
 qRN52z3RsplMKJvPuA5teKrc2ap5X3QZr6dEvhTEQL2Ucvx4dBjtHZ6F0NUmmznvPYd5
 tpuSIcRXLsurMYD1DqQ55kqnvKfy710QcVf0nxfNaGEekstSxhHJgHyXuy7HkTRbTUXH
 h9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gN/nCnYHg37RzH2ySF2xwAPVmqvP9Hor2tdZRDmd/rA=;
 b=YME+W9l00NxyESQEPNadDGN87iNLrxdzMuBQn3Xc0SY9m9Ow1yzQHgdVex6PhT0v1G
 9P9Hy5guvyKRDEIGbxknRQ1P/HHTu2JidW61kQCW7S0SiyCQRuSsqfx2N5b7OMy1hKi7
 58x78N7kEDSwWmPA63YcyVQmhWFvRlkX7BbwsxevbIZSE+FxDJuWV36FO0nNbMSc6D9y
 08vNrbaMVgDKkDu9bdOzhcEBn76P+uRHJIFDrpvusdfhrJU2faZjZIImCWoNhXbzye5P
 4oIVptaX39gWZe2NK0v0DlRPAvDCZpSmGscz8HFH3ybdRXRg6q4ylq1Po6fA73gQ00Pj
 HcNA==
X-Gm-Message-State: AOAM530hNtF9WwLqy7Ao33vr/yCf+KQ/F5J2sxXmh469vFxprClNf/GF
 k5k8o1JxJw1xLVaXWfhu6OHhNQ==
X-Google-Smtp-Source: ABdhPJzUJbXeT8QBGvEDuw0w7BgYItQR5DENAXoM21CX99wY6ygoWXm1B8NpaQ6NTB403xsK5DqxXQ==
X-Received: by 2002:a1c:2507:: with SMTP id l7mr16478349wml.186.1635959535351; 
 Wed, 03 Nov 2021 10:12:15 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n7sm2463588wro.68.2021.11.03.10.12.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 10:12:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0C7021FFB3;
 Wed,  3 Nov 2021 17:06:00 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 18/21] tests/tcg: remove duplicate EXTRA_RUNS
Date: Wed,  3 Nov 2021 17:05:55 +0000
Message-Id: <20211103170558.717981-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211103170558.717981-1-alex.bennee@linaro.org>
References: <20211103170558.717981-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We set it bellow outside the #if leg.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211026102234.3961636-28-alex.bennee@linaro.org>

diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
index 6ccb592aac..c0d9e638e9 100644
--- a/tests/tcg/multiarch/Makefile.target
+++ b/tests/tcg/multiarch/Makefile.target
@@ -61,8 +61,6 @@ run-gdbstub-sha1: sha1
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/sha1.py, \
 	"basic gdbstub support")
 
-EXTRA_RUNS += run-gdbstub-sha1
-
 run-gdbstub-qxfer-auxv-read: sha1
 	$(call run-test, $@, $(GDB_SCRIPT) \
 		--gdb $(HAVE_GDB_BIN) \
-- 
2.30.2


