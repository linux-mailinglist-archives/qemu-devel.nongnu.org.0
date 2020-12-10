Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0612D6634
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 20:18:55 +0100 (CET)
Received: from localhost ([::1]:42614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knRSo-0004D0-Fn
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 14:18:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1knRNG-0002HJ-If
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 14:13:11 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:50960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1knRNB-0005yQ-Uu
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 14:13:09 -0500
Received: by mail-wm1-x343.google.com with SMTP id c198so5610572wmd.0
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 11:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iPexDg4GXGfQgq6Gz8FVP+n3F7gioW16lvhAIwjoxBw=;
 b=sli9caHu65MCkfJWWXLFlLR4AzDFFlL3SNB2B4ZLeYx5pHm6Xjgd9xbRXqJZMjxekG
 33n3X0pwVaIQrw0zMkH1ltS3IAgXrXLL5m1PSYG318FX/L4+wItstZfi8i3OQN6PTF8G
 mfIBPK9TMFzNF4IbVybHB0qDl68ANYKJyKNC5tBjK0rmYP8hYrw73aX7NwkvvpYvEX2q
 G6zKHeXQxpS9Hb5hjgB16SLe92I0wevIPLTKXJ+g9e6j4LoYsCfacJtlwsD+cS2dHMCW
 5jWpRjZNPYnE0qGh/FGEWC5nocJjzCNnBbW/AT/uuRxRDh1IXt//Lm7t3/8f/9B6ctHA
 jL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iPexDg4GXGfQgq6Gz8FVP+n3F7gioW16lvhAIwjoxBw=;
 b=bbPL5ygcszwR9prcFd8AdsRMGrc6eWeUd2CJIbQkF96jGnIPd9qLXI1bXtHUM7sKuI
 230glLB5DbhsyvN81HcpL4cO0YipBdUqDgoaWZ6fJUwhYn7Xr0jtkpeYQdPf2TUQD162
 9MAC03rWV+kUXYXIff4S23/LO5nDDUqtJGoCDQGVFyLdq6Juqfm6cLvw8NhF3+Uipbh0
 p7cfB9UJCIGdbQ/JUIQxUEInug5QVIdrCiqiZU+jwEywiJzvTWsdTHjhR8GmRl1oCn25
 nwlKgpE+ePhTX0lEmPXSVf/x/IdBUvrAnfX5gEuePZH3yyp8/ZiIKamOk9nm5Gy5CoUZ
 NHiA==
X-Gm-Message-State: AOAM531KdrLKFQhpOpcLqJS8mATQXSgse+2woubzVWfBjBMhYa2r2ftR
 va81CfhfmXR53xRwgVHHngLxSA==
X-Google-Smtp-Source: ABdhPJyMmTYOuxaDS3o6TZ6DARIOmwDpbWCsPycfQwDwCB8kTCp7lbBDRaHtqtcIrIN1Smw3y41s8g==
X-Received: by 2002:a1c:2d8a:: with SMTP id t132mr9955415wmt.128.1607627582610; 
 Thu, 10 Dec 2020 11:13:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n126sm10987041wmn.21.2020.12.10.11.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 11:12:55 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AD71B1FF96;
 Thu, 10 Dec 2020 19:04:18 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 8/8] tests/tcg: build tests with -Werror
Date: Thu, 10 Dec 2020 19:04:17 +0000
Message-Id: <20201210190417.31673-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201210190417.31673-1-alex.bennee@linaro.org>
References: <20201210190417.31673-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hopefully this will guard against sloppy code getting into our tests.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/Makefile.target | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 2ae86776cd..24d75a5801 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -94,7 +94,7 @@ ifdef CONFIG_USER_ONLY
 -include $(SRC_PATH)/tests/tcg/$(TARGET_NAME)/Makefile.target
 
 # Add the common build options
-CFLAGS+=-Wall -O0 -g -fno-strict-aliasing
+CFLAGS+=-Wall -Werror -O0 -g -fno-strict-aliasing
 ifeq ($(BUILD_STATIC),y)
 LDFLAGS+=-static
 endif
-- 
2.20.1


