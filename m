Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C2D383979
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:17:06 +0200 (CEST)
Received: from localhost ([::1]:49472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lifvV-0002jt-49
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifpD-0007Og-8o
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:10:35 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:56273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lifpA-0005yu-GN
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:10:34 -0400
Received: by mail-wm1-x32d.google.com with SMTP id b7so3302951wmh.5
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SOwWByj9Hv79uAoR3pk2Na/zMM2B+Ft68GAsD76YMDs=;
 b=m5kdpHyuVO9axp0VY4KcVWIAZKdDSOoPpTS5FT6SsGp/fN12q54Nn4g8GytekdU9zB
 pp2zWoPcJ5djDLV+Wu9LucUT0TU95cXSn7iHvJdrfyZY1kfp/NyeB7c8akzSJUEo//hP
 7S2beQU2N2nE3eBGUfELN6rIqBrGv53a1mRMkxLTZuycpN1LM0yYFYl3scR9qLY6W7YU
 Q2Jwlnr8cmgEFAGYjxtW8zhGfw/Kbx7qrdhoSyKryvso0v8sSX8VCsHlMRgBO2UbxxQT
 r699VrVQ67knWBTg8GNRWOCaY5C0pcW/foQckM+zMxMZjmT98uKDJ/FO/4BBIh/8LpIz
 BUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SOwWByj9Hv79uAoR3pk2Na/zMM2B+Ft68GAsD76YMDs=;
 b=KX/9ujvHQyMSjuEkvdgUxMVHOYIpce4S+xwvor7Yfhdx8U6WaZdNyGizZSOnJvZEHY
 KvoyN6AyPOyUbni6pSgt2TRrkTMQQYqgvWW8e7LXN2yYWSPd3yf6l9H0KCxG8/fuCmgp
 MpF9J+MQc8Tm7AWf9KCAFYsnG2k5bHTNBDhXSE1pFOeY2PbxBpoyk5N/2VV6JpxbXBas
 ZctU8ah5KTLUK3QmKOwj577wAvjYMjxehjK1PzPYjupYioP9pNaaDtgmC4fmPhte9/RQ
 Bspu0ZAv6PkO1W54xZq5coZ0Pv57TwETBOTil6sfeROQnnwzPy8okKAyiSS549WtlMvP
 tekg==
X-Gm-Message-State: AOAM530ksfyjXQxZV9k+Be4m/kwFd8qCjqbFtqybrYWTsCk8sYyLhTM7
 YWHdEJZHwXxCEVCvdqsEX8VYOA==
X-Google-Smtp-Source: ABdhPJynLjXWbDzshxMVNXnpiV7J/UBqg3Y5eXTqkCmA2wF3+7eLR+jj9O0t6D15JWY0BO8HXvOSTA==
X-Received: by 2002:a05:600c:190e:: with SMTP id
 j14mr371904wmq.145.1621267831082; 
 Mon, 17 May 2021 09:10:31 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g11sm17805818wri.59.2021.05.17.09.10.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:10:27 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CDE5B1FF96;
 Mon, 17 May 2021 17:10:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 08/29] tests/tcg: Run timeout cmds using --foreground
Date: Mon, 17 May 2021 17:10:01 +0100
Message-Id: <20210517161022.13984-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517161022.13984-1-alex.bennee@linaro.org>
References: <20210517161022.13984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

when trying to run successful short tests from the Makefile timeout would not
terminate. Rather it would wait until the time runs out. Excerpt from the
manpage:

--foreground
    when not running timeout directly from a shell prompt,
    allow COMMAND to read from the TTY and get TTY signals; in this mode, chil‐
    dren of COMMAND will not be timed out

Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210305170045.869437-3-kbastian@mail.uni-paderborn.de>
Message-Id: <20210512102051.12134-13-alex.bennee@linaro.org>

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index cab8c6b3a2..b29fae4630 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -43,9 +43,10 @@ quiet-command = $(if $(V),$1,$(if $(2),@printf "  %-7s %s\n" $2 $3 && $1, @$1))
 
 # $1 = test name, $2 = cmd, $3 = desc
 ifdef CONFIG_USER_ONLY
-run-test = $(call quiet-command, timeout $(TIMEOUT) $2 > $1.out,"TEST",$3)
+run-test = $(call quiet-command, timeout --foreground $(TIMEOUT) $2 > $1.out, \
+	"TEST",$3)
 else
-run-test = $(call quiet-command, timeout $(TIMEOUT) $2,"TEST",$3)
+run-test = $(call quiet-command, timeout --foreground $(TIMEOUT) $2,"TEST",$3)
 endif
 
 # $1 = test name, $2 = reference
-- 
2.20.1


