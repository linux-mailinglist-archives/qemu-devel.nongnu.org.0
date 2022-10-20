Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FEB6065AF
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 18:22:00 +0200 (CEST)
Received: from localhost ([::1]:41864 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYIv-0000dA-6M
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:21:58 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olY4L-00078O-UF
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olUDP-0000bT-7s
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:00:19 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:39835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olUDL-00050K-0m
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:59:57 -0400
Received: by mail-wr1-x433.google.com with SMTP id f11so34013404wrm.6
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m7sr6GL5lJZB4yWjZF5gxqBspzZ6Uelo42T5ViAMf8s=;
 b=fYp5WT/AkF5xJsmgCzENpVosfUTaVkm84oDXMMAnSgCM1cyVGw8+CMfF6SdZf/asWB
 fer1rU1YZtzr5/T6A0j+GsFIDXkWyTSglf/rQ3iq+vvDRqTNdsF1iaNeqqQPJ3TppxN0
 R7olrWwPFtnuImSym3908hNkSmeNMugioLPw2AngBw5mj6A5zZxSnAVxKFHQKv7HchIS
 YCNDs9XmAM+DYFE5FPZ5CwqNIIvBAeyRdjnMnJzv9WTNweCGzUb/rPw+aMIv2ftddmjk
 KwXcFxAld/F66hgbvZecAq6FKWQIti6QdnoNXz9FgZ2+UuYRS1kTcbmPt58ph8dngpgu
 uATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m7sr6GL5lJZB4yWjZF5gxqBspzZ6Uelo42T5ViAMf8s=;
 b=B5RzRw7lZFbqb3Vj9GEE/NCOWQx/Va62KLNMCUEC68Sc+FuPgpX7Brw5CVrSOen7qr
 qMSoSmGiqrH3Mi3qPJ8gcTRyH4EFxdpWzWGFhJQ5LrtjtX0QpEZOhYpJ5R6M3dWUoe8r
 bpuF417ZnLCFTK03/XC42HsGNwBmj1/uTsxE2+vPMFxdS0aoOWKhspKZwTGxrwjmrA/A
 PptdeofaWtl68IAeQAVv4xoBgNmqIH0YMFNYtiSNqTvNbgXmaznzqESef6YzGuQBVUVp
 2AWltrIpxi5kcdGEQQsE6PjIifw/fkTD6d1mz+hG3abqTM/4oi3r/9IsD4GzXXb4HDYS
 wkbQ==
X-Gm-Message-State: ACrzQf3px4gZViYbTggsrTFSEOuFF4tCzyMz9yQnBOpA96LPPT0sQ2CK
 V/WlA6cSB3SIifimtMeP6JEJOg==
X-Google-Smtp-Source: AMsMyM5inNCIaDi2i/YqZgZBRcEdPMysYU/3iQ9Mq6hLKjt6B/dfvwrKdUQLIDYJR8TvC76vvqtkqg==
X-Received: by 2002:a05:6000:1c5:b0:22e:3c0b:5c8 with SMTP id
 t5-20020a05600001c500b0022e3c0b05c8mr8211291wrx.622.1666267193217; 
 Thu, 20 Oct 2022 04:59:53 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a7bca51000000b003c6237e867esm2711807wml.0.2022.10.20.04.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:59:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 18E531FFCC;
 Thu, 20 Oct 2022 12:52:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH  v3 22/26] tests/tcg: re-enable threadcount for sh4
Date: Thu, 20 Oct 2022 12:52:05 +0100
Message-Id: <20221020115209.1761864-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115209.1761864-1-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This test was marked as broken due to bug #856 which was fixed by
ab419fd8a0 (target/sh4: Fix TB_FLAG_UNALIGN). Local testing shows this
is solid now so lets re-enable the test.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 tests/tcg/sh4/Makefile.target | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/tcg/sh4/Makefile.target b/tests/tcg/sh4/Makefile.target
index 32b019bdf1..47c39a44b6 100644
--- a/tests/tcg/sh4/Makefile.target
+++ b/tests/tcg/sh4/Makefile.target
@@ -12,9 +12,3 @@ run-signals: signals
 	$(call skip-test, $<, "BROKEN")
 run-plugin-signals-with-%:
 	$(call skip-test, $<, "BROKEN")
-
-# This test is currently unreliable: https://gitlab.com/qemu-project/qemu/-/issues/856
-run-threadcount:
-	$(call skip-test, $<, "BROKEN")
-run-plugin-threadcount-with-%:
-	$(call skip-test, $<, "BROKEN")
-- 
2.34.1


