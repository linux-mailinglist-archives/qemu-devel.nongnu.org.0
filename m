Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 116EF2C04DC
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:48:09 +0100 (CET)
Received: from localhost ([::1]:58928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khAKD-0002L3-PU
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:48:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFm-0004Ol-Fb
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:30 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFk-0002hw-Sd
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:30 -0500
Received: by mail-wr1-x429.google.com with SMTP id m6so18256396wrg.7
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Lgmq4Bw1lEGnlMYGRXdg5Ksgs52CYJP0J9cZK1wb87k=;
 b=SsHn0r9yBORafh4/WoWY3BCL7S1Vawy6IPQ8po628XXG1ppN6/cUXSeerhAdMk2Uu8
 pg2vZetM7aYTmGgoYPyFAEyn1jtJnW7cMltgGUefiH+561G79zZtwdY3Lxe0lVik7cAN
 V+N4KvxQuyYzZSvlTmllG1d5iqVqTnEy1H+oYaVTR7ljsapH/nSrNQl0xqH9Y1AgO6sz
 NZJdammbMzB6iyBe0PgeEayrhjq4E6jbqDbWF8sn4B0Y9345yOSyySp0VZE7A8vOvin7
 GJfxNYfBUBllB5dcgBzjkZugP1KI75vCgziOwpe201N5PX2PcCJDnVVnrQw24OuEJnix
 VSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lgmq4Bw1lEGnlMYGRXdg5Ksgs52CYJP0J9cZK1wb87k=;
 b=kUl+xkThz87VmqkSevAi6PCgqW8XwmuaojotRgcJ/Z2qP+Fyif6gt8/wI0iOGdvLh+
 6zHX9B9Zh7Z30KBkH+VBW+w0WOIVmRYNGLQJrGbQ7RN86A6HLccpw9xtSpJ/85UsGrLg
 fHmb7/9rbMRu3sHFR/7UEKk1VUZcLf3l3CxmmPsgkXgl6Sd8zjOgJXRDSPg8l7NWOzyt
 3w7Y8vSHJQw/T42NseMWLWVaNnoJ6iSXWkNpAS0fEhmBC2TXEItnA2909pEtvnVixVUM
 tNM75r2lhyedOyddh9vPttJWSYr36rVmGg4LJ4gFQEE38ZiIg+9sImIieWxTVycqhzge
 ca3A==
X-Gm-Message-State: AOAM532TdFaRg9Vw6WeLIK32L1MLU6Z8J90o7Nye0taH2x5RU/nNfSWW
 gIPIf6nYcs4+rzw+t7EnFmy/kxQtUGsKeA==
X-Google-Smtp-Source: ABdhPJz0csDaSaWcMsgmaI2I4q0f6qEKSwrUlmyelkhhAmQTOtVpmpM2c8SImGyudiOXAfajpFA9Ng==
X-Received: by 2002:a5d:5482:: with SMTP id h2mr31007304wrv.18.1606131807332; 
 Mon, 23 Nov 2020 03:43:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g186sm50836495wma.1.2020.11.23.03.43.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:43:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/24] MAINTAINERS: Cover system/arm/sx1.rst with OMAP machines
Date: Mon, 23 Nov 2020 11:43:00 +0000
Message-Id: <20201123114315.13372-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123114315.13372-1-peter.maydell@linaro.org>
References: <20201123114315.13372-1-peter.maydell@linaro.org>
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20201120154545.2504625-7-f4bug@amsat.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 33e44b023ae..6f4639f00d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1607,6 +1607,7 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/*/omap*
 F: include/hw/arm/omap.h
+F: docs/system/arm/sx1.rst
 
 IPack
 M: Alberto Garcia <berto@igalia.com>
-- 
2.20.1


