Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9175C1EFD22
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jun 2020 18:00:10 +0200 (CEST)
Received: from localhost ([::1]:56688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jhElN-0004Zn-KF
	for lists+qemu-devel@lfdr.de; Fri, 05 Jun 2020 12:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jhEbR-00046C-B2
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 11:49:53 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:40411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jhEbQ-0004MS-DE
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 11:49:52 -0400
Received: by mail-wm1-x342.google.com with SMTP id r15so9584116wmh.5
 for <qemu-devel@nongnu.org>; Fri, 05 Jun 2020 08:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pky+yimT92Xz7KJNz6g2LcHXO4hPPJkZ2uiDnLp8dpE=;
 b=F42v3kl098ZKeiXj15ucvofj8I2hTIbiyujfDKvRUhoR1jvuS6Mdm9fdqX+V4MW8vN
 1EmfoVCp4TfRaZqW1E3qD/UGg91yL3NVaq5hz/nJ6w99hRgCANGaXuaN5Z94ml53jvQ9
 EliQJINRgIc8nZElmH6nOqXE4KouIwPWS7VgZvJ18L5jgfVaEPGnBuRm4ihjuf6bK4VJ
 ZVmCrWsIKyq3+1JbSwSqoMIywoJxk2t0ITwXgGAExi3r86ETGubt4xmX83d1YuHGnOaB
 MpMae/XpG1HnYaTU8LKwOpfR6PS0fpyLg8yAGRbep9284bo96bNY6vmPtpCJhiLfSGvY
 inSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pky+yimT92Xz7KJNz6g2LcHXO4hPPJkZ2uiDnLp8dpE=;
 b=UCpRi5zFUWL2uzdiiOmFseUx+7o8kVRorCHLRJsfMrq+xdr0bNlWzk3RYOyZAHtNJu
 hCXm0Ah6xvg2M8sfVRhXz9RZeYz3LiXgj6ATFjDI6yz1cTEZSDuOexeo2jzAVV+bOO4T
 B5OeDxVu8PdDsaCbbwziYyDBuNN27+p0RsgBwCEAC50qvbW1QhNdsgRqNUhYGE5u3rkK
 8T+r/lz9tRPyqGP3hSR4kLE64Mv1oS1gIqAQ00ebjFUYUbFb0Zt43r49nH55LjPq7DMY
 OpOzIZETSp8fPtyMWYxZoUxqidg4HAD1OP1y4xoK9IK+Bxh8QtwV8/TclVfwzsQbhEiA
 hB6g==
X-Gm-Message-State: AOAM530vMeT/+2aAqpmL8urN2+h3HOcm8bjAr4/GLcr1nq2FYpTTsSH5
 i9f7uqLWi+t+EN4yEWpVHOe5/A==
X-Google-Smtp-Source: ABdhPJzTqpabZLG6eKC9VOXHXFmIIVQQkKEjszCmJ9xHjXUdZ1kOtUP+DQaItTnOSg7KBdx/EXiQmA==
X-Received: by 2002:a1c:df57:: with SMTP id w84mr3581446wmg.52.1591372191049; 
 Fri, 05 Jun 2020 08:49:51 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k12sm12583836wrn.42.2020.06.05.08.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 08:49:49 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 621D31FF9D;
 Fri,  5 Jun 2020 16:49:30 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 14/14] linux-user: detect overflow of MAP_FIXED mmap
Date: Fri,  5 Jun 2020 16:49:29 +0100
Message-Id: <20200605154929.26910-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200605154929.26910-1-alex.bennee@linaro.org>
References: <20200605154929.26910-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Riku Voipio <riku.voipio@iki.fi>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Relaxing the restrictions on 64 bit guests leads to the user being
able to attempt to map right at the edge of addressable memory. This
in turn lead to address overflow tripping the assert in page_set_flags
when the end address wrapped around.

Detect the wrap earlier and correctly -ENOMEM the guest (in the
reported case LTP mmap15).

Fixes: 7d8cbbabcb
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 linux-user/mmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index e3780337974..2e05bd499e6 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -467,7 +467,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
          * It can fail only on 64-bit host with 32-bit target.
          * On any other target/host host mmap() handles this error correctly.
          */
-        if (!guest_range_valid(start, len)) {
+        if (end < start || !guest_range_valid(start, len)) {
             errno = ENOMEM;
             goto fail;
         }
-- 
2.20.1


