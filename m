Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0C24AF4A2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 16:02:45 +0100 (CET)
Received: from localhost ([::1]:49352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHoUU-0000O3-CL
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 10:02:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnll-00030Q-H0
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:16:30 -0500
Received: from [2a00:1450:4864:20::631] (port=44943
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nHnlK-0007qi-Ef
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 09:16:12 -0500
Received: by mail-ej1-x631.google.com with SMTP id ka4so7653405ejc.11
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 06:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=87HcQPKX55O5gBg8zHpB1mv+YHA8UaRm2nWImo48Fuk=;
 b=K7Oy5kfiYfrTkOjygQrKiXGuJ8S2ByBM+rQjArulgoyGluWDCsjfisw4XTvxaPqGF5
 pZ3nC2wrLCpAYKJtDGJvKmyqHGvno3mamgQapTk+GeuXEUiwNsqfAjIvqEbtfcw9hxqY
 j2aW07N40yPKhzw1j+hIxDXxa1CNGDbfSQj+tBKKreD4T+soT0jKCtz0ln+Byb2fpW55
 yd+zmHMCqYv6khOEymfFvNowlc0RAndMcunj+Z46G8IT2UnmjEqtlumGj8dvzBCXB14V
 ewPuEOjBfH6XpPY82qZ+pCjjggC30eu4rsbLnig0mO5x6H5FCjgsIXao/b0hxIqdQV8A
 9jlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=87HcQPKX55O5gBg8zHpB1mv+YHA8UaRm2nWImo48Fuk=;
 b=weK5hRf9f7faoHxoLxKVFPoLEAYED2MfSzWgdEFcGtAvmrjNwBZpWFrXONGE/V0vs/
 A+zR1ksaCA6OVJ60F3YMW7PlpoAoLeJAVvB7y3zIWAfk0itCWR1kQx+/voJpP3K4n0O/
 MUMqacmfgwev66NoFhH+7lvJ/riSmY75mJeX8XD1UYQciPPJmEy7jzedrGKC41wNzHfv
 rU3dPOkz/RuA7Y43GcrBpfiSHwu3Ls6k7Hr5vTDPFiBLYP8KYfL3RnAZX9rbu9V3X++h
 mNiJI5bIpMhGr91SMIki9UFAMgxACRiWmV01RPIgbPyMyo0J6dVPbQcLgKHZQrdOZWaR
 K5lA==
X-Gm-Message-State: AOAM532BnZabcB3ttrboLl1K1n75zUpsFBBH7JIztGnD9DOukEsJN6J2
 6gLUkzABbUNWAyd4uybdqC8eZA==
X-Google-Smtp-Source: ABdhPJztLWtFLaNMsK0Z1vXYvHb29GXdvGwWQnwj63zRkvYoKC1hrGm6oEvSDney+W00pY6q5AVrmw==
X-Received: by 2002:a17:907:da3:: with SMTP id
 go35mr2161293ejc.456.1644416134708; 
 Wed, 09 Feb 2022 06:15:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c10sm3926355edr.6.2022.02.09.06.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 06:15:31 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7EF1E1FFBB;
 Wed,  9 Feb 2022 14:15:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 03/28] Makefile: also remove .gcno files when cleaning
Date: Wed,  9 Feb 2022 14:15:04 +0000
Message-Id: <20220209141529.3418384-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209141529.3418384-1-alex.bennee@linaro.org>
References: <20220209141529.3418384-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Left over .gcno files from old builds can really confuse gcov and the
user expects a clean slate after "make clean". Make clean mean clean.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220204204335.1689602-4-alex.bennee@linaro.org>

diff --git a/Makefile b/Makefile
index db9a788601..e5fd1ebdf6 100644
--- a/Makefile
+++ b/Makefile
@@ -206,7 +206,8 @@ recurse-clean: $(addsuffix /clean, $(ROM_DIRS))
 clean: recurse-clean
 	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean || :
 	-$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) clean-ctlist || :
-	find . \( -name '*.so' -o -name '*.dll' -o -name '*.[oda]' \) -type f \
+	find . \( -name '*.so' -o -name '*.dll' -o \
+		  -name '*.[oda]' -o -name '*.gcno' \) -type f \
 		! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-aarch64.a \
 		! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-arm.a \
 		-exec rm {} +
-- 
2.30.2


