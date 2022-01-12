Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4C148C34B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 12:38:22 +0100 (CET)
Received: from localhost ([::1]:53784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7bxN-0000E9-EP
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 06:38:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bmw-0002cZ-Ri
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:34 -0500
Received: from [2607:f8b0:4864:20::935] (port=43936
 helo=mail-ua1-x935.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bmu-0003Nx-MW
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:33 -0500
Received: by mail-ua1-x935.google.com with SMTP id i5so4035648uaq.10
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=COu1PeHtLU/9lCIB+cZx16YusyKpa48++X4AOAyvvOI=;
 b=dyykPUuHxfHwnADwrzp2NzVWdtiiF6/CMu7vfQPx2IKPinSm8qt0s862t+aea5ocwl
 BEtB41jfA9uPkfRnRiWunAAF6H+B7+imWFDAEcwP6IZf5x9WA1Ncj9edlxAurox6knEH
 yKqA1XEDzmrRvPQ8VnKQKnGCyTOVprleqLPCbxhpsVwdiz37C9s85LLOrWUPuiJ1vihd
 /NuWhnrhSzBBGim5R6EZtVdGCSw1xtS7m+54YyH2lnPhZXHEYPZauRq7MOIIcxobPxf3
 g4vuZIKEwMC/28upuqpG5T28avhiDTTFNqLrDFVZJwrcJ2hjGKkZ2f3QBTK8i0BBUhnm
 l5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=COu1PeHtLU/9lCIB+cZx16YusyKpa48++X4AOAyvvOI=;
 b=TdCpRwpeY/TeBEotEig6gO5hrQPoL3CldxmL4gReu4R1cn60smkafpGqGp3cCBP6QQ
 Z9RyEAO9+QZoycrUrAVH/ZLv+FHQ2krsvwLdQb7BSZsBdGSm1VmHxp4hr1SVuYPKISUh
 yKjuXCLMpOVf1cu50Fp5bZc0xelr6vRUx4+sfzJq8n4q1fdirQOp6mhhiAVjDDcNkYx0
 qlkz2RZx3MI8/nPT87qniaUNVS5sLlAy2+EbK6Yh7eQXeKw63PqguXV3S7FNGb+HJbzi
 fR/med/CVGjSXUz9n8d0FHAP3nHB/XVUKzH+didKFPxx1XkhkPFTGmN9j51+4OtRt8bO
 FJBw==
X-Gm-Message-State: AOAM530pxD+5MHp8NRoMW52BzhZLCrioSg3ExuREQ+8QQBmKre0NMJyN
 3FpfcT2gYVmC5ekVN2smyF3jNg==
X-Google-Smtp-Source: ABdhPJy6G+FlZsCYO/R4O0O0sytAs52wrT0A8BcG9ItPlIfVmbO5PGDkvhY92LcX3rDV4aLfkkdUXg==
X-Received: by 2002:ab0:2904:: with SMTP id v4mr3737243uap.57.1641986851601;
 Wed, 12 Jan 2022 03:27:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j187sm7178444vkj.37.2022.01.12.03.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:27:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9D8B01FFBC;
 Wed, 12 Jan 2022 11:27:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 04/31] ui: avoid warnings about directdb on Alpine / musl libc
Date: Wed, 12 Jan 2022 11:26:55 +0000
Message-Id: <20220112112722.3641051-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112112722.3641051-1-alex.bennee@linaro.org>
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::935
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::935;
 envelope-from=alex.bennee@linaro.org; helo=mail-ua1-x935.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

On Alpine, SDL is built with directfb support and this triggers warnings
during QEMU build

In file included from /usr/include/directfb/direct/thread.h:38,
                 from /usr/include/directfb/direct/debug.h:43,
                 from /usr/include/directfb/direct/interface.h:36,
                 from /usr/include/directfb/directfb.h:49,
                 from /usr/include/SDL2/SDL_syswm.h:80,
                 from /builds/berrange/qemu/include/ui/sdl2.h:8,
                 from ../ui/sdl2-gl.c:31:
/usr/include/directfb/direct/os/waitqueue.h:41:25: error: redundant redeclaration of 'direct_waitqueue_init' [-Werror=redundant-decls]
   41 | DirectResult DIRECT_API direct_waitqueue_init        ( DirectWaitQueue *queue );
      |                         ^~~~~~~~~~~~~~~~~~~~~

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211215141949.3512719-5-berrange@redhat.com>
Message-Id: <20220105135009.1584676-5-alex.bennee@linaro.org>

diff --git a/include/ui/sdl2.h b/include/ui/sdl2.h
index 71bcf7ebda..8fb7e08262 100644
--- a/include/ui/sdl2.h
+++ b/include/ui/sdl2.h
@@ -5,7 +5,18 @@
 #undef WIN32_LEAN_AND_MEAN
 
 #include <SDL.h>
+
+/* with Alpine / muslc SDL headers pull in directfb headers
+ * which in turn trigger warning about redundant decls for
+ * direct_waitqueue_deinit.
+ */
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wredundant-decls"
+
 #include <SDL_syswm.h>
+
+#pragma GCC diagnostic pop
+
 #ifdef CONFIG_SDL_IMAGE
 # include <SDL_image.h>
 #endif
-- 
2.30.2


