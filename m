Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD3622EC14
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jul 2020 14:25:33 +0200 (CEST)
Received: from localhost ([::1]:44632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k02CD-0000Eo-1C
	for lists+qemu-devel@lfdr.de; Mon, 27 Jul 2020 08:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1k02Aq-0006ww-6F
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 08:24:08 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:40787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1k02Ao-0006QR-Jd
 for qemu-devel@nongnu.org; Mon, 27 Jul 2020 08:24:07 -0400
Received: by mail-wm1-x334.google.com with SMTP id k20so6900021wmi.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jul 2020 05:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BEKbRdaWfA3EKdWk/JBxm74i5sf9oIyCkFpxTRpGyXY=;
 b=Za26vszNCFXvCPy9yuU7fyuU8ug2Lf44IhLIK8d0YpO8Vlrp8FWyk/4LopByn2DQXT
 cexUQDfnw0qWhawEzbNMai6mDv0YzXA7Dtce1FjLnv2XgrxgELa3e//0lIrten7B24dj
 m7ssmasbu9z8jX8xNbCF7DWH7CRUheF/S9bMKF5m5jTyJzfhYhA4em0Pk6XhhPmLHXpG
 2Kvl/0yL09MixOLMmRAMK+RW36lKh8Im+1wNWocW3WDbMZVwfjkJp5ewh117w9uk3dkv
 tck2R86abZMT/UgvmaJfI/BT5mOlq+7Pzlaoa1AhVNboKe74Irs3SgRJrHfYUUIr+fS0
 8VmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BEKbRdaWfA3EKdWk/JBxm74i5sf9oIyCkFpxTRpGyXY=;
 b=UeLeHLMasKmpIrXuLuGz2Lsq4ADe3SZNCkWvqPkG9011q8Gt1pHjlkeueaFlivE/GS
 1R02P/Fgq+TkQIEXg7iwZfTvkGRVuaFaTd1ze0dqyWT0FD15TnMztnT5taHMYiQT9Ye6
 Kqeo+dklBo3XHVXLdpZdsJBItXg/ooU91qDsRU4s8xihCllY3ozhk7IVDNRIuwpI0v1i
 gVZovHcBWzRcP+j/UZ67seQaldfMG2s/QH6UshKBdLlmvaCn+BZjJRcHKJAowfRLv78c
 QC749MpMGbsU3tw3rXlIMYof3LuWS7FYBZTCZtxSMd4cIxS+/ePpzXb2d3tourt7dUzX
 pwNQ==
X-Gm-Message-State: AOAM5303tD5m4I+ZBsv2bEf2tkWPOErjNBE7fZX3VL6i5PqxIF7FwZRQ
 0umFq/yjn3jkzKQEZcgNByNhKA==
X-Google-Smtp-Source: ABdhPJwXTSOYs4ZvHk/GFis1bWeuq/gmRZyXp50vRZvYWJskl213SBalrkhry6LlUgs8qY4g/004rw==
X-Received: by 2002:a1c:9e4c:: with SMTP id h73mr21829259wme.177.1595852645233; 
 Mon, 27 Jul 2020 05:24:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h13sm12119585wrx.17.2020.07.27.05.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 05:24:01 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D56781FF91;
 Mon, 27 Jul 2020 13:23:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 05/16] util/oslib-win32: add qemu_get_host_physmem
 implementation
Date: Mon, 27 Jul 2020 13:23:46 +0100
Message-Id: <20200727122357.31263-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200727122357.31263-1-alex.bennee@linaro.org>
References: <20200727122357.31263-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Compile tested only.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Message-Id: <20200724064509.331-6-alex.bennee@linaro.org>

diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index 31030463cc9..c654dafd937 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -831,6 +831,11 @@ char *qemu_get_host_name(Error **errp)
 
 size_t qemu_get_host_physmem(void)
 {
-    /* currently unimplemented */
+    MEMORYSTATUSEX statex;
+    statex.dwLength = sizeof(statex);
+
+    if (GlobalMemoryStatusEx(&statex)) {
+        return statex.ullTotalPhys;
+    }
     return 0;
 }
-- 
2.20.1


