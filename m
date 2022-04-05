Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E434F2977
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 11:33:14 +0200 (CEST)
Received: from localhost ([::1]:37772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbfYn-0005ly-HI
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 05:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbfT0-0003G2-Al
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 05:27:14 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:34313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbfSs-0002vh-1I
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 05:27:08 -0400
Received: by mail-wr1-x42c.google.com with SMTP id m30so18387360wrb.1
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 02:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=lsohAJa/MA/mjLv/PPlheDMOK3bZmGd4+SXCx0qUM4I=;
 b=QJUrA3Q94b4o5BhWi0iEJUo3pMpi+aSO6LrmJ3UVGzAfe9XFf7PLsHgTiuzZdCs1Cj
 D76dyvTSh+aBQgiD+axfXCkvdV6pJavp0IxqbXH73vQB/2+owjU/C5rsmiKj3pESOFtL
 qJnSzYeuMgJISwXqtql8mTHUskClqZID+7C0RUnZSRtSKpJipgUqkuGP14XJcMeXch5a
 xvNsD4IDiMVCRuFX68zPs9qS5A2gffMs2vhv/zi02yFDNb1l2qwJk/EPa5Efrxnp/WuZ
 k/RUjhS2+K9a88ECvHWvfgFocpmiDfbxtmiaSNOeYv/EYaJw+cDnQbXEgn3g5SdOtZn+
 GPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lsohAJa/MA/mjLv/PPlheDMOK3bZmGd4+SXCx0qUM4I=;
 b=Xaqrh2tj5rD343vM7Z7GHjwdiz+FukUQ60eBzF29g4svDd7P6C4pS0Jj/zXrvH+o5I
 Awx8GWnqSJw9SD+ukGNpwBdR/aKxKuiBZ/o6ng04He3YlIiDyQlaFNyFFsB99YXxT2mH
 Ux8jbwTBDT+H+eXB7HPfeiEWYMbhYXp9uvveYLSKacMOGSi6AuKSzo6Z12dOEAFJ849I
 RTuh7qz5BEiBToZG+LqybH6oPbyUy/twrfC/vSUyzo8dq59VyaRReZtphTtCLt8HOuGn
 31Ltp1SplqzBUI5Ve68Jz/iqfMJMuupWGbgydSg7H7D/ku4uNz4pv3yti3u65dvblgd2
 WgoQ==
X-Gm-Message-State: AOAM532AlyOomwLU8NhJtj5u10wJeT4IOACXWdQn6SCnOl/0GGXqmtCx
 kSfgQie4so3KyLDfjfdtK39qRsK7mTmXaw==
X-Google-Smtp-Source: ABdhPJwoHlRbWanThMJX8flu1oIePG6xco2LQ6sGL0NeGgNnUr1nuB96QqEdUP1Zg3NfE9MdX/vpbQ==
X-Received: by 2002:adf:b605:0:b0:205:ce51:ccc3 with SMTP id
 f5-20020adfb605000000b00205ce51ccc3mr2000785wre.75.1649150817266; 
 Tue, 05 Apr 2022 02:26:57 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a5d6c6f000000b002040552e88esm13467159wrz.29.2022.04.05.02.26.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 02:26:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] xlnx-bbram: hw/nvram: Fix uninitialized Error *
Date: Tue,  5 Apr 2022 10:26:50 +0100
Message-Id: <20220405092651.725041-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220405092651.725041-1-peter.maydell@linaro.org>
References: <20220405092651.725041-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Tong Ho <tong.ho@xilinx.com>

This adds required initialization of Error * variable.

Signed-off-by: Tong Ho <tong.ho@xilinx.com>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/nvram/xlnx-bbram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/nvram/xlnx-bbram.c b/hw/nvram/xlnx-bbram.c
index b70828e5bf1..6ed32adad9f 100644
--- a/hw/nvram/xlnx-bbram.c
+++ b/hw/nvram/xlnx-bbram.c
@@ -89,7 +89,7 @@ static bool bbram_pgm_enabled(XlnxBBRam *s)
 
 static void bbram_bdrv_error(XlnxBBRam *s, int rc, gchar *detail)
 {
-    Error *errp;
+    Error *errp = NULL;
 
     error_setg_errno(&errp, -rc, "%s: BBRAM backstore %s failed.",
                      blk_name(s->blk), detail);
-- 
2.25.1


