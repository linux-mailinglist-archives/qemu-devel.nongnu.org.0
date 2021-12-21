Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D145447C42F
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 17:50:37 +0100 (CET)
Received: from localhost ([::1]:41380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mziLU-0002ea-Ng
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 11:50:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIh-0008FT-VL
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:47:43 -0500
Received: from [2607:f8b0:4864:20::632] (port=35720
 helo=mail-pl1-x632.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziIg-0007aJ-9v
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:47:43 -0500
Received: by mail-pl1-x632.google.com with SMTP id n16so10441749plc.2
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gw1Elmr7+CuPQ1NTU/QmJ2gSIrEw0R9sp9nE9zFCam0=;
 b=gaDZlvC4vO2HyN3FbQ6EnHt7o+YbPtuI8Kbg9RnMMdLovsjCjRx35JaRGB8E4w/Npk
 QQJYaxbwyuwJJvfm/4w+TuB41Xd5Nu8t3TWE93H6fiXP1pIknZXkRwVRiP9Tv0OLWqHy
 w0WZJBq7pVJW0rvJwwSI1UZyqJ0pwuIWhhExhgSK7UE5u9qBJruxOVXdnGPxWEcXq+CX
 iNuITYNNnSPGgYEEwlgyApd/VY3qJVibBaZk6LOkof4JGxIffKIlDL3DDzBiw0akbY6Z
 cM/OwMkWMZIoJ48IiLlKlYkTbxqKCKlTqJ3V9yfPBixb7CgLgFnwfIrO8s9NqpB2D97z
 FGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gw1Elmr7+CuPQ1NTU/QmJ2gSIrEw0R9sp9nE9zFCam0=;
 b=Gmlql+5QJ1ppATsO7PtciGHEQFLBsam29+v2eNLH+Ma3f5z+8onllMhOLyRRxW24Tc
 crPlsQ/IPVeIdC2bkvp6KLK8IFMMjyD+fLyaktRet93D/xjAm/UGPiJsIFbpXTLohZry
 neYR0wcBg0M7egj2/eJNNajPAPk8Pn9x6qvbaPgldxizGhUFYTKuXSXm3W9mpuJHsVKx
 8USlBB7C5qWws9NdZRfCruvgNXDkWNqiOHv6e5Jn6G976gbh8dufdvyWkkq2J4yXlO85
 D5/0NfRF/zSoEy1hyG8ql1YQ4QNTeBoEG8iJzyEYw4Zy37IxbcFXUgqzWX2iEjLNO6r4
 bpLg==
X-Gm-Message-State: AOAM5339OI6BuZDSxAQ9PLS84Am1jJfwAk5TJrTBRqXvmG65+Lf5SfOd
 W7tKR+hRjFnZS354pPckxJKn+Yx0H0/JbA==
X-Google-Smtp-Source: ABdhPJzFLp12nbaXVJ4afV5WxznQ02zO3KVsvYtbYos12Dy6FSPbRCV6dWIEtyUF6KkqbY6s2846ZA==
X-Received: by 2002:a17:902:8347:b0:148:ac82:998e with SMTP id
 z7-20020a170902834700b00148ac82998emr3828465pln.92.1640105261021; 
 Tue, 21 Dec 2021 08:47:41 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:47:40 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/31] MAINTAINERS: Add tcg/loongarch64 entry with myself as
 maintainer
Date: Tue, 21 Dec 2021 08:47:08 -0800
Message-Id: <20211221164737.1076007-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::632
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <git@xen0n.name>

I ported the initial code, so I should maintain it of course.

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211221054105.178795-3-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1de6ce6e44..4f6e0de3fb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3139,6 +3139,11 @@ S: Maintained
 F: tcg/i386/
 F: disas/i386.c
 
+LoongArch64 TCG target
+M: WANG Xuerui <git@xen0n.name>
+S: Maintained
+F: tcg/loongarch64/
+
 MIPS TCG target
 M: Philippe Mathieu-Daudé <f4bug@amsat.org>
 R: Aurelien Jarno <aurelien@aurel32.net>
-- 
2.25.1


