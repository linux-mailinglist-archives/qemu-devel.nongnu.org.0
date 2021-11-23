Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3608845ADD2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 22:05:01 +0100 (CET)
Received: from localhost ([::1]:48178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpcyK-0004NL-9q
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 16:05:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mpcrD-00020o-H8
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 15:57:39 -0500
Received: from [2a00:1450:4864:20::429] (port=39928
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mpcrC-0006NV-4O
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 15:57:39 -0500
Received: by mail-wr1-x429.google.com with SMTP id a18so193593wrn.6
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 12:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=005IHjqRWRJJaQave6epZYUIKBv/Z2a1tVz3K5hRNcs=;
 b=c5+qjBgp/zfDS1P6GO9Fi9ryK0mupmn6f9SqtQWDNJa/g7MgbiQGl1PHxu+GpBVXdn
 gXvUC+ADiE2xawH+2J8UZj4TvoDgbd5ZIBpNFGfsEkcl28J/nj5OggGPImOjSZTEicsa
 gu7dS5VjQaQbHup23MIATaU4gwYKcVcM2iQ3+XdPVSPB1WBKjZvTYtSpWfzQa4G0ADha
 58GTnABO7BGWQQl2awt3rYDbLbGh9hNrycEhjFYkRpquoAFPyaeNPOWSupXi/bcckobY
 +qam/Cn2oSjnm6OFclEJ6ufBep3gU2h/JN0fnUwpGZ0sDV8JKJBLLamiFZgURWg7NFSd
 fkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=005IHjqRWRJJaQave6epZYUIKBv/Z2a1tVz3K5hRNcs=;
 b=Y+jRvO64qcwJVh/BgIsEAX+WBisY75NAqtE+AhpEJFzSSUdRG/Wtz9IbZ/8d5k49d9
 aXO0CH22ORdDkngrKZb/KJFD4bnjd844XbpQvgNiW/zDSR35kV3pzESXI+ATMpYsF6HU
 Hw8cNGidE4rIWe20mieUhY8qsZflz1KKdxD24W7lo92DdwJET361pDoEpoh746liPE0L
 o/pNGbn/5xxZgHONr9K/MLlFjq7WUhI/HiqyMAUAavuK0Shvp43baVoDS6ZqOj1Zzu+W
 dR7uFgupzYDi+9+m2QtbvxCptrQiADB+6oYy3QSxIE8lDzehHStUuoZqXFM28fOyBS+E
 iviQ==
X-Gm-Message-State: AOAM530NgsK2kah5RfaSDTSKg1Iq7uYzU7y7r6KU+sR34osV/tByTLQr
 xGk+W+JLZZUJfW2PqAXlMyUuow==
X-Google-Smtp-Source: ABdhPJw2bcYyLmKUfSpDz0r7tPRyJYoQwkNgsQ77PbONQge6131aX3D5tL1kh2ZcKtYxiHSJe1yK+g==
X-Received: by 2002:a5d:47c7:: with SMTP id o7mr11809126wrc.204.1637701056896; 
 Tue, 23 Nov 2021 12:57:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h7sm12498573wrt.64.2021.11.23.12.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 12:57:30 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 643441FF9A;
 Tue, 23 Nov 2021 20:57:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 3/7] tests/avocado: fix tcg_plugin mem access count test
Date: Tue, 23 Nov 2021 20:57:25 +0000
Message-Id: <20211123205729.2205806-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211123205729.2205806-1-alex.bennee@linaro.org>
References: <20211123205729.2205806-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we cleaned up argument handling the test was missed.

Fixes: 5ae589faad ("tests/plugins/mem: introduce "track" arg and make args not positional")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/avocado/tcg_plugins.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/avocado/tcg_plugins.py b/tests/avocado/tcg_plugins.py
index 9ca1515c3b..642d2e49e3 100644
--- a/tests/avocado/tcg_plugins.py
+++ b/tests/avocado/tcg_plugins.py
@@ -131,7 +131,7 @@ def test_aarch64_virt_mem_icount(self):
                                                  suffix=".log")
 
         self.run_vm(kernel_path, kernel_command_line,
-                    "tests/plugin/libmem.so,arg=both", plugin_log.name,
+                    "tests/plugin/libmem.so,inline=true,callback=true", plugin_log.name,
                     console_pattern,
                     args=('-icount', 'shift=1'))
 
-- 
2.30.2


