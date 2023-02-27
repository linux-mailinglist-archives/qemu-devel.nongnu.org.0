Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B723D6A44C8
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:39:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeDP-0007VR-DF; Mon, 27 Feb 2023 09:10:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeCl-0006lT-Nu
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:10:16 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeCk-0000t1-0l
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:10:15 -0500
Received: by mail-wr1-x431.google.com with SMTP id bw19so6331217wrb.13
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=kuw+OhxNdrwt9CAbe1bEPP31vgWl625e+HsfVN1rpYc=;
 b=uR+/dHq2aTDSeEnJxrTAN+I6eft9VC4AAMH8rdiWfQ4KUBMb0+e7cdlaT8qBRfl1mW
 yzsRI/YsscTvBjJwNu0cTjgkEhxIzjEk2WBWEro5JiMsbyMtPhGOYhGuPEzPCOK8aXpw
 nxwCWRM7hBZu9+8Ub71FmxXmASJcinWSILU3tuof88ub6hFDmZs7WTueNXZHzoVGKyPM
 /hb5P2NZEhD70fD7pIzS8GKnxjxrMQFgUekKPZOUqxkVSyMuaUq0HbJMMZteT/lvs3L6
 Eb025XTIM90W1cG/+SUsPdX+C4C8TKQgoEprvbvEL5G3U1gi2YIlh51WrAdIAeT4A5A8
 4vfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kuw+OhxNdrwt9CAbe1bEPP31vgWl625e+HsfVN1rpYc=;
 b=Pd6lqFBrYMq12TeZRAvP67FPhGpbMz0dF8u1UyD2lzmbf0wGwALVrWKZ4N2r8FGPYq
 dxc2kv7EN5JI296+7LMOg/tdrgkA7RWLApIk/csXn7+6i/8rV1/Vqep7etG2lO6oG4gl
 IiibSgbful15n8S2e6Lwme3UDVU3Yr1mTM0hzqAhErtWk/JnYkGqNu1hiIRlKcP50Vgr
 VMhvwDrcfJ1N03U0XhLaYHuUyW692Xw8TGz0aCA+XpkgiugyJr+7Rjevfq7SidqP/8rN
 g4xSBtIEoQP9uJElSmMmd7rKG1Ek6K2AN9jCZcjktdnjZ9bmgyoCLbApjiLq5nHzIivS
 5fAw==
X-Gm-Message-State: AO0yUKXe9UKW87LGHJD65Eroj1EEpP0sEfE4Zr8izX0aHcP/JGRqTUQx
 vuJgfW4q/cO7qHyaa/WS3HRtpTbXdIeUuP2s
X-Google-Smtp-Source: AK7set+0QH9sliZcVaro/mY3SphWi9eOq5DCdHtp6zSO/1fDc0cp8EgYeONv0w9YlWw0czI8SXbeeg==
X-Received: by 2002:a5d:6d0a:0:b0:2c5:5938:e6d6 with SMTP id
 e10-20020a5d6d0a000000b002c55938e6d6mr7688542wrq.35.1677507012354; 
 Mon, 27 Feb 2023 06:10:12 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a5d4203000000b002c57384dfe0sm7061551wrq.113.2023.02.27.06.10.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:10:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 097/126] hw/i386/xen: Remove unused 'hw/ide.h' include from
 header
Date: Mon, 27 Feb 2023 15:01:44 +0100
Message-Id: <20230227140213.35084-88-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: Paul Durrant <paul@xen.org>
Message-Id: <20230220092707.22584-1-philmd@linaro.org>
---
 hw/i386/xen/xen_platform.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 66e6de31a6..3795a203d4 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -25,7 +25,6 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include "hw/ide.h"
 #include "hw/ide/pci.h"
 #include "hw/pci/pci.h"
 #include "hw/xen/xen_common.h"
-- 
2.38.1


