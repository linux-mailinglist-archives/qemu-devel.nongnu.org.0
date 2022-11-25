Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38055638E14
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 17:10:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oybHT-0001P8-5A; Fri, 25 Nov 2022 11:10:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <evgeny.v.ermakov@gmail.com>)
 id 1oybHR-0001NY-2K; Fri, 25 Nov 2022 11:10:21 -0500
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <evgeny.v.ermakov@gmail.com>)
 id 1oybHP-00008J-9d; Fri, 25 Nov 2022 11:10:20 -0500
Received: by mail-lf1-x135.google.com with SMTP id j16so7538232lfe.12;
 Fri, 25 Nov 2022 08:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lvAiJHQ5F2NFfPh83n4oDZZTeYW5qPPx8pNjJyeV06k=;
 b=QjXwXjwYlbgLon1l1X7pKij6YG0mbNIHPEjzIq61GTjdMvKbDYOnwuLY/RzZppI0/5
 lJ6kGLmd5luBrmLyHDKmGT0qHjbCIMtG6PG7lw3lX6H2JPEoGEXw+wXQBF7OLruq6GNK
 Xoiv5gNY+DhLYfaLx7Ws9fZZmm8iCKN3r8BXfs63ko2BUL+aXrbMqfKVvY0vH+pALOhZ
 FXjvtor7CI7/kPrvJla2p/bl82wWgRfUk44nR+Cv8XMAuJHOfE6MQM5y8sdUelDdxF9J
 4DFowuGa/pNtBBjaC5htmfIYjMlScNsyqTkz92DIK6mxNBaZXYua+Y4ELC73b0WSzxwz
 Nbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lvAiJHQ5F2NFfPh83n4oDZZTeYW5qPPx8pNjJyeV06k=;
 b=B8HdEWUQ6BmI4Q+pWem2nXQ8Ebj51jmOOxtTKCYTTcYIzAJM1tBtveeRBU4dMdTyQU
 s8B3vmiFXCebf+Cdr1CzWv5XCe0qjbig3NswPWLVvgj5XGbk7lHzv8oAxwAnmT7pWql5
 ZpVSLmsuLRuJ/SviVHYkH9ZWq+lWNKG8O1adwvcXXTmJjCJns9vY/lDSlI8VLWOJCwtW
 wkv86zjynzzqf2Y4DL/53m0dqBDT9cGB0QktIyi+1gzgpj6EH5Q9BIGjC8/dR9eUu1ru
 /zQNhCQvnnHzFl37tB6JSPfwLrgDvOJkb1Cbx2BamWajK7T4MEwdbD1ZeGnDyqPUK+Hl
 +edw==
X-Gm-Message-State: ANoB5pmQGa8KIrD3GX63XbOa2f9N8iiTPNX+sHfZl5/ydDpHh8dGE+zf
 uDye43Xk+TgraLLDBmbMm81JiRGbxKE=
X-Google-Smtp-Source: AA0mqf4HbSklTw0wdYaLn9ucs++JDXd3iF1UY/gP/HzfaHJrSOcFg0n9vxAwYs0+WNytIGcEdvLY2Q==
X-Received: by 2002:ac2:51b6:0:b0:4ae:8510:646f with SMTP id
 f22-20020ac251b6000000b004ae8510646fmr13788213lfk.432.1669392615871; 
 Fri, 25 Nov 2022 08:10:15 -0800 (PST)
Received: from front.loc ([80.83.239.100])
 by smtp.googlemail.com with ESMTPSA id
 v4-20020ac258e4000000b004b3db0a3d9csm561577lfo.117.2022.11.25.08.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 08:10:15 -0800 (PST)
From: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, huth@tuxfamily.org,
 Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
Subject: [PATCH] hw/display/next-fb: Fix comment typo
Date: Sat, 26 Nov 2022 03:08:49 +1100
Message-Id: <20221125160849.23711-1-evgeny.v.ermakov@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=evgeny.v.ermakov@gmail.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
---
 hw/display/next-fb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/next-fb.c b/hw/display/next-fb.c
index dd6a1aa8ae..8446ff3c00 100644
--- a/hw/display/next-fb.c
+++ b/hw/display/next-fb.c
@@ -126,7 +126,7 @@ static void nextfb_class_init(ObjectClass *oc, void *data)
     set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
     dc->realize = nextfb_realize;
 
-    /* Note: This device does not any state that we have to reset or migrate */
+    /* Note: This device does not have any state that we have to reset or migrate */
 }
 
 static const TypeInfo nextfb_info = {
-- 
2.38.1


