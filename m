Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9C131CE56
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:46:23 +0100 (CET)
Received: from localhost ([::1]:43022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3UU-0005eH-LI
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:46:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC33N-0000OS-Go
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:18:21 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32W-0002YF-Vq
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:18:21 -0500
Received: by mail-wr1-x429.google.com with SMTP id v15so13789895wrx.4
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=o04V8OAF/AbV4swogzM64bdrvlvxNjU/Edl1NkQw/Ms=;
 b=UEBzzyNtVelHkyUfVzxpZnDHF4AqGTk9LGheHxfPQ3Wqzg43aLmXE8im8uQgwKVHCu
 oQS1jVDA8MVsLGXK7pQJSGQGzbbOtZUIYzPGutN2lkxyPBoFf6/R2HnXvXoUQOQfNZla
 HYXzB3HY2AwqoM3sX25mfpH8ZB1wVoid2pkusFValhWB9RkjP/08pZKEMQeQaOjH9UeG
 JtZ9hs8ZnlqT67qymYawnPzK6l++lZ551VndhMebT7l/fazj2dmc0gvlWiNg6+8xPHBC
 BHQvWi7wIj9WBXljRqVcxJSu/oiX0wMI4rKzDj79vrDWz1fEBLI3fkO9ff+I2y/bkqng
 zOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o04V8OAF/AbV4swogzM64bdrvlvxNjU/Edl1NkQw/Ms=;
 b=fDcU/1+9JLQEcO73w0hDXdyjrKOGmgL67nImNauU7ITM420NIXjfy0bm3Lb/N7/IMs
 +MddTAM7BPnrBtj3o3Vs3j9frcTgy0un/zCkwcS8SxIpDy+lpIdg5q6zaOiQqlUiYdIt
 1tUmrA6C2uFbnbn3gTGGnYEsa/+F1kqY2s5A1Dm+TxnvMvllXZQ9vqnGeQCpC3hbAan0
 WanolZ+KswBNgLMAyAfXE2zFunvcb+TESZkzBFXHhKlrMs7UjMwZK3JBZZWfx90GJWzp
 4i81uL5xc2gc2AQ56OR8Ju5m6tKIuoGiiFEPGdi8eM8/n0+ygMm8uoyb3ULSLwp6knVh
 MuDg==
X-Gm-Message-State: AOAM530lp6dTFtqmr1wCBlxgb4Y9h12L6/II4G2SIoqlXi2dp5Dd6SAc
 AzN46haQ6x3Eyw2zvXZ56rrY0jwanDSWJQ==
X-Google-Smtp-Source: ABdhPJxiY9UvgprIcw8TgijxPyHEnIcXmFJHROASnroIqT+MNoG1qfMadhcJE1uiNuOf3jtCNyifeQ==
X-Received: by 2002:adf:9546:: with SMTP id 64mr25388994wrs.247.1613492247524; 
 Tue, 16 Feb 2021 08:17:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:27 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/40] MAINTAINERS: add myself maintainer for the clock
 framework
Date: Tue, 16 Feb 2021 16:16:55 +0000
Message-Id: <20210216161658.29881-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luc Michel <luc@lmichel.fr>

Also add Damien as a reviewer.

Signed-off-by: Luc Michel <luc@lmichel.fr>
Acked-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210211085318.2507-1-luc@lmichel.fr
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8201f12271b..68ee2717926 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2855,6 +2855,17 @@ F: pc-bios/opensbi-*
 F: .gitlab-ci.d/opensbi.yml
 F: .gitlab-ci.d/opensbi/
 
+Clock framework
+M: Luc Michel <luc@lmichel.fr>
+R: Damien Hedde <damien.hedde@greensocs.com>
+S: Maintained
+F: include/hw/clock.h
+F: include/hw/qdev-clock.h
+F: hw/core/clock.c
+F: hw/core/clock-vmstate.c
+F: hw/core/qdev-clock.c
+F: docs/devel/clocks.rst
+
 Usermode Emulation
 ------------------
 Overall usermode emulation
-- 
2.20.1


