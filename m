Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E78DA31B6C1
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 10:53:57 +0100 (CET)
Received: from localhost ([::1]:48682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBaZp-00031h-0u
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 04:53:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaPL-0000J8-OL
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:43:08 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaPJ-0004St-5M
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:43:07 -0500
Received: by mail-wr1-x42b.google.com with SMTP id v1so8079035wrd.6
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 01:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f2IEkjM81r5SYAy7mQIsVMnjra8RgSV/rhAVqqV8yLc=;
 b=rMza0s+tlGl9/XU9x+e6gYo/7K7srdUkrQ3quz3P+Je1D/qEORid8ERGg1stcwJn7Q
 sA31yN03/VlNTo1GKPwdEWFRXQI1N1NrGflT/k78W/AGVrHPm3cL+eLgyfVrNT8nMaFu
 xx28z9Awp7plqVy3ILwlWfJCdGwP7U8ZZ13uHbFUvAIRRH+2i0Pjip/HgLf+92DmTubU
 O3xKc1Of/TFyM1MKDbXIHwYIsshm2vrpjQ07+p4S69WV9y1xLJnBkv4qhEtoaRlpmHPs
 9zXlXWcvSK+ZwzBnp7OgPlSRCWmNgmEun9MyDDeV0xu9xh5S1qCCUUxmRTHDwqxUAc8x
 LxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f2IEkjM81r5SYAy7mQIsVMnjra8RgSV/rhAVqqV8yLc=;
 b=gucQO5LBjUEqAX86zoyumsVNwPywrC/9/VfYmQoN22BgX13QJ5tCgZczH+cu0s36Jc
 PF7ly7jwZYbS9FFReY10o4An6WosOXdPOzmlgf0i+6/LdQHuUUmFrmztLEeV4ZJomsQr
 ei3DeT8App5mfVuNLJKIBxmsCJ3BRjEmEnRLTXYSgrhsR86lj0fmlXRPSV7aoWlyB8mK
 jlEfKhXH4F51To/JncJx08Kdi9dNjX4HiBBTekIyQnbAD6zMPGZwSAtKqpgOjcGguHeQ
 uib1MMO0YFkI9gnXhTKK7xAFaoQ69+IcDPHlrruMfHobU7hjvMyjSzPfha/HvE2E5yCQ
 eM8w==
X-Gm-Message-State: AOAM532aUOvSLKVVWZoJDc903HFGGMGVdfyuAWlzH0bccj3g4tGIxV71
 GSFn31larjfOSE7N0rcka5W3D0fqBYBIBzwu
X-Google-Smtp-Source: ABdhPJz8gk1upOJcwk5NgmXgku0SvKaHCxkKuROZGhld/HmsLa7YhPHnjriJDpqVqVmIujlk0/DY8Q==
X-Received: by 2002:a5d:52ce:: with SMTP id r14mr17946309wrv.71.1613382183853; 
 Mon, 15 Feb 2021 01:43:03 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w3sm11643033wrr.62.2021.02.15.01.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 01:43:03 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5E7601FF9E;
 Mon, 15 Feb 2021 09:42:46 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 15/15] tests/tcg: fix silent skipping of softmmu gdb tests
Date: Mon, 15 Feb 2021 09:42:44 +0000
Message-Id: <20210215094244.12716-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215094244.12716-1-alex.bennee@linaro.org>
References: <20210215094244.12716-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210211122750.22645-16-alex.bennee@linaro.org>

diff --git a/tests/tcg/multiarch/system/Makefile.softmmu-target b/tests/tcg/multiarch/system/Makefile.softmmu-target
index 4657f6e4cf..625ed792c6 100644
--- a/tests/tcg/multiarch/system/Makefile.softmmu-target
+++ b/tests/tcg/multiarch/system/Makefile.softmmu-target
@@ -27,5 +27,9 @@ run-gdbstub-memory: memory
 		--bin $< --test $(MULTIARCH_SRC)/gdbstub/memory.py, \
 	"softmmu gdbstub support")
 
-MULTIARCH_RUNS += run-gdbstub-memory
+else
+run-gdbstub-%:
+	$(call skip-test, "gdbstub test $*", "need working gdb")
 endif
+
+MULTIARCH_RUNS += run-gdbstub-memory
-- 
2.20.1


