Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF76A31E822
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 10:53:54 +0100 (CET)
Received: from localhost ([::1]:45404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCg0P-0004sL-Pw
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 04:53:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfuA-0006re-JK
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:26 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfu8-0007Fm-OB
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:26 -0500
Received: by mail-wr1-x42a.google.com with SMTP id 7so2223036wrz.0
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 01:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BOuZLIcS4uaxLwRAzY9t0EkJ3Dn2/0awYiFNeWK3R2w=;
 b=bXovATF4y2Xza73C97gAn+bYW018ZEfh6+AnKO1r0WwJ7dLst+sDK+z8WePLCkpCFY
 Vf7pVNkvzLUZn3UFu/Ix0w+9wF2jPvMsZbfpkL4WQYAUc2mF50eZGKquzXXdpS3cbUsg
 GXuV/ABN0DrSSy/hylIr5tUN50nrrPy0j+iemPCpwPx5yWVELHJOKX1+68ieO+71w7Wa
 5fQVa8znGBEIqXKEwMgbIJr+T8PNFveRbDlOuhNNxUH/fnTq0Het89DkOp5NIqnrfgWp
 DDWiAGiJap3vQAwOd6y2njLQztIZgIQdXjFB44iKZkZc3Tmhwen54l5/64bJToldNEcV
 MxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BOuZLIcS4uaxLwRAzY9t0EkJ3Dn2/0awYiFNeWK3R2w=;
 b=AyE1mAGjx+D+DiYasU5Fkej91VA89wwdFbjGCd418EqfeBIWzjqNbJDaU3STLR1d4r
 yKszoqbjTrXngVgJvsOqFaMI7EIMvgeqYMR5kxgBlwsTl7MtsIR9WlV4/JoQHctT07UE
 Kmmm0V5kwsh/udfttQ65qMorV96yoCp/US2GpGxLWQj67nDaxZGCeu+17azAyzHsyQ1B
 j15HmsyfGio5HW0A9s0C1mEnwFWFIzaD+SXuRJGXzC4SPtxh7US+2J2OEpkdoNb+JnlM
 UYA/IrFncdkKRh91RdPaQmG1cJ73LrFv1utEHelOgOQpl70O0O4H1xZ/LsSQASgelgwT
 oGBg==
X-Gm-Message-State: AOAM531KSVLDdcXiFsbJQU/8V0OVvLVfHxpaivBUuYNQw0ajcLta/shV
 YkXEFLSUPP2m2A3BQl9zTvL9VQ==
X-Google-Smtp-Source: ABdhPJyK4OrOkhtmfNAl6KCLL4hFci9nUOrbw3lT/oTUYpEi2WP7Do7g+WwDOyl/7tQhSP6+4yb5SA==
X-Received: by 2002:a05:6000:1092:: with SMTP id
 y18mr3614520wrw.248.1613641643267; 
 Thu, 18 Feb 2021 01:47:23 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f8sm7813238wrp.65.2021.02.18.01.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 01:47:15 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7D0ED1FF92;
 Thu, 18 Feb 2021 09:47:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 06/23] contrib: Add spaces around operator
Date: Thu, 18 Feb 2021 09:46:49 +0000
Message-Id: <20210218094706.23038-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210218094706.23038-1-alex.bennee@linaro.org>
References: <20210218094706.23038-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, zhouyang <zhouyang789@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: zhouyang <zhouyang789@huawei.com>

I am reading contrib related code and found some style problems while
check the code using checkpatch.pl. This commit fixs the issue below:
ERROR: spaces required around that '*'

Signed-off-by: zhouyang <zhouyang789@huawei.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210118031004.1662363-4-zhouyang789@huawei.com>
Message-Id: <20210213130325.14781-7-alex.bennee@linaro.org>

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


