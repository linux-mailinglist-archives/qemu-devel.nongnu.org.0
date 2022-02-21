Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D404BD8EB
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 11:05:35 +0100 (CET)
Received: from localhost ([::1]:44410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM5ZW-00083a-DS
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 05:05:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zq-0000ES-Ub
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:47 -0500
Received: from [2a00:1450:4864:20::430] (port=38514
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nM4zZ-00013f-9M
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:28:42 -0500
Received: by mail-wr1-x430.google.com with SMTP id d27so25926572wrb.5
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=shiikXU0x3kJ4rRPp+Q84tEp6CxEG3V5LoAvTu9ia4Y=;
 b=ktOsIhpQ4i6S/PqMh8IrilValkUrZX+aTHowsw7YT8FiM5TmmhhlNBJLnQceiuUBJa
 oA9+6nXp3FvDhHx+vyDw9fPl60jcdXQo/7ZKKpWxrgPR4to6GIbODXN84QGEMZLNoiki
 l/RLNllRGrX1WVW54/TvbnF4qwoeEiaNErCdXEqYJjNbE7whPiphlMowBhTiJCF3iTdo
 HRHXxB8KFalU7Z168sbDoYfAzoHgiBBa/iZRQTmtlRHUSEHhJhwLFLtARY/Ko2/Yx7/3
 5e/CYCm9D+n0tg2pCPNkI0vYSHPH6w0k6NTpoDzMXvIxWMyx6H/Z7TkS6Qkt8E82dKny
 o38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=shiikXU0x3kJ4rRPp+Q84tEp6CxEG3V5LoAvTu9ia4Y=;
 b=LTIIu3nm3M5uWDvDpfurr4eWw4aAn6cKrrUpihiX9mBLYWpFzPCjPTvT5ey8IsYN47
 sorGS3Jy1NICweV6M7WKy0F6EtyBQ7V8cks7/84FI21yyRaS5pK08YFBLWQFTOzDszvk
 wimg5s6z3Ebgieqt7zyYBx1iQqlTpo5E9/j08f4Sz/qpe4xjaxIROitCWgSHpFr8bEj2
 cV2KYrTjwEnCDyHInUj0h6ZpmGlqQvd6v1zNwAwGeu77xmAJ1hjH85Fz/6afm5b3RRcO
 YeS+c4h2PXRDrItrqKfoTkKkJi8D5Bg9PYbKEmBrBHb8YDXT7tFfWJr9a/llSkw4nJoc
 CvAA==
X-Gm-Message-State: AOAM532GLiGD0+qC4tz7lfA5FMvHs+P3aj+noyAYvZSj/nQ4ewjqPAnd
 8fCOVNJQFcb/sggCSPOTI0kQIXpt/qkEVw==
X-Google-Smtp-Source: ABdhPJzFr12944VB24TyZW1ON43Y7p7RFyhGdHxzKXNWueGmPijWK0oY9LyyP7+j5OUGwSKKhLl1Mg==
X-Received: by 2002:a05:6000:18ad:b0:1e8:cbe1:afd with SMTP id
 b13-20020a05600018ad00b001e8cbe10afdmr14676674wri.352.1645435702404; 
 Mon, 21 Feb 2022 01:28:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id q76sm7555778wme.1.2022.02.21.01.28.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 01:28:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/26] ui/cocoa: Do not alert even without block devices
Date: Mon, 21 Feb 2022 09:27:59 +0000
Message-Id: <20220221092800.404870-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221092800.404870-1-peter.maydell@linaro.org>
References: <20220221092800.404870-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-id: 20220215080307.69550-13-f4bug@amsat.org
Message-Id: <20220213021418.2155-1-akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 ui/cocoa.m | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 7a1ddd4075f..f585a5c177d 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1709,11 +1709,6 @@ static void addRemovableDevicesMenuItems(void)
 
     currentDevice = qmp_query_block(NULL);
     pointerToFree = currentDevice;
-    if(currentDevice == NULL) {
-        NSBeep();
-        QEMU_Alert(@"Failed to query for block devices!");
-        return;
-    }
 
     menu = [[[NSApp mainMenu] itemWithTitle:@"Machine"] submenu];
 
-- 
2.25.1


