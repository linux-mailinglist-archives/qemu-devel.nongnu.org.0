Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C12531ABB5
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 14:28:31 +0100 (CET)
Received: from localhost ([::1]:40644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAuyM-00052B-CY
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 08:28:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaT-0001tG-OC
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:49 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lAuaE-00065M-RL
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 08:03:46 -0500
Received: by mail-wr1-x432.google.com with SMTP id v14so2893457wro.7
 for <qemu-devel@nongnu.org>; Sat, 13 Feb 2021 05:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ItSo5UVnQD3t4VnO6SQFmiB07KxKjva0YU8E4FQu5Rs=;
 b=W/o44oBvQL8YZfrwywiG2XMMCtxJYSkmhm26nuT96tFyjUeddkRXIDY8CNt6efQ9U8
 1xRiTg/sdBg8/2ZVpfjZJ1g1n80eiJrGHEi3J1plJvhnH8bYh9P6xxrkZ6hMLIyRu6sg
 Nh7ujCgJy8NXU6izSj++DGNczqJal1ykaAkg2P0+Wvaw/mj+WnYQjSQ/Gtjvtpab+bDA
 8SL+o/ht6FQwd2vA9SxwCB5nwTlGmPVX15gc1bC/YigjpZsdr6MHQy45piZjhcJmtCkx
 0Nx5oEPCHLFcCXJGNA7/v/iqHs2fJakheGTcfDmlGz9/giW4POZ7UQpQQ2/Fw/9PFGIW
 1pdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ItSo5UVnQD3t4VnO6SQFmiB07KxKjva0YU8E4FQu5Rs=;
 b=boDOUEBbj7Qn1PiMJ/h2tC0ccQz+zdlcLc3gWFqxCCqgrE+v8e7ofWDnMmv3QKaeV7
 icC5LfpawTExFIuzb4zx++bzAMNYQTZJRnvm3Zrfgw+2ahFPjANeu1GDR5+mrdtpftVS
 l/injRK1b57HIT2/nyKMQTGzI6+s2EuuIafqjFeSybbCQNeGYzbWBX5t3l8RijKLjvgk
 Rh/+aSEXdFzfixebxFgmqlH9Dz/vmLj9rTpHoZGWwODSP4dxf7ItQ9WXXZS0ZumFZokT
 HCd/Zt7epAvh/OA+4x0phAJDwlLcQWC9fPjzNiWi5vI8YaoHX8m/QIp3j7EN9F34tXAc
 8bLA==
X-Gm-Message-State: AOAM531sSvEDWiTEwEPCxYtiRiJV9jvNq2i6LnSCfWI+zRtClrqij5Gj
 Xsfgj2o6cOgKRug9zTi75m9heQ==
X-Google-Smtp-Source: ABdhPJyPE8SdTUgV3zlWaJF52/UqF/TzPCBnZnxhFONECWleNWgUoPtjglgtfWA5TfYY6pTVXsBjYQ==
X-Received: by 2002:adf:ea12:: with SMTP id q18mr8457655wrm.79.1613221413551; 
 Sat, 13 Feb 2021 05:03:33 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w8sm14958803wrm.21.2021.02.13.05.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 05:03:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 166621FF92;
 Sat, 13 Feb 2021 13:03:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v3 06/23] contrib: Add spaces around operator
Date: Sat, 13 Feb 2021 13:03:08 +0000
Message-Id: <20210213130325.14781-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210213130325.14781-1-alex.bennee@linaro.org>
References: <20210213130325.14781-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: zhouyang <zhouyang789@huawei.com>, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: zhouyang <zhouyang789@huawei.com>

I am reading contrib related code and found some style problems while
check the code using checkpatch.pl. This commit fixs the issue below:
ERROR: spaces required around that '*'

Signed-off-by: zhouyang <zhouyang789@huawei.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210118031004.1662363-4-zhouyang789@huawei.com>
Message-Id: <20210210221053.18050-7-alex.bennee@linaro.org>
---
 contrib/ivshmem-server/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/ivshmem-server/main.c b/contrib/ivshmem-server/main.c
index ee08c4ced0..224dbeb547 100644
--- a/contrib/ivshmem-server/main.c
+++ b/contrib/ivshmem-server/main.c
@@ -17,7 +17,7 @@
 #define IVSHMEM_SERVER_DEFAULT_PID_FILE       "/var/run/ivshmem-server.pid"
 #define IVSHMEM_SERVER_DEFAULT_UNIX_SOCK_PATH "/tmp/ivshmem_socket"
 #define IVSHMEM_SERVER_DEFAULT_SHM_PATH       "ivshmem"
-#define IVSHMEM_SERVER_DEFAULT_SHM_SIZE       (4*1024*1024)
+#define IVSHMEM_SERVER_DEFAULT_SHM_SIZE       (4 * 1024 * 1024)
 #define IVSHMEM_SERVER_DEFAULT_N_VECTORS      1
 
 /* used to quit on signal SIGTERM */
-- 
2.20.1


