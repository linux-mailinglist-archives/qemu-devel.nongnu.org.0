Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2C36061C2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 15:38:00 +0200 (CEST)
Received: from localhost ([::1]:46344 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVkE-00056s-9R
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:37:59 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olV3x-0003Vu-Si
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU61-0002dY-Tk
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:30 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:33678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olU5y-0000nz-RV
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:52:20 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 n16-20020a05600c4f9000b003c17bf8ddecso2365895wmq.0
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ga4vzH2veazcKCRinBLnrJ8/fVJBJ2PbX9ZSmpCZ7fE=;
 b=jqh0c80CXpXn9kPEW1ccC+xk/3ycif7RA5QE6AIi7VZrmuEGo0HvM3fUN7Y675Vbl6
 DN1sVurBevqmOgifMpJ67cYaWl1nEzQ8jRNUUhJ2jLoj/e3ar4ZEIWUfml+AxBbm7s48
 i8FCKNxGYqrE9Ja0d6HvVw74ab6Fno8zNw7hdkYD0Pnw9IoqRUVyTn01sFje569wXRtc
 C317ZHiWvo8VgFD61tUEdKttolftpmN3Cc8nBnIqIEUC2ypW+6dabI9hKZjHHMxkuIf4
 uaEEqoOXK4PHcPds1/F94O0nXmJ+nM4IUw1xENHZNCaZ+VmdAD1+rqRu50LKPC2QVTs5
 XHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ga4vzH2veazcKCRinBLnrJ8/fVJBJ2PbX9ZSmpCZ7fE=;
 b=1prKQt/CdrCHGI7Wxr+Z3IbDVs6dJY/wL1Nbl4f/F4ZfO+8hr59HFSjm0G3j2QhtNm
 sy1RJV+uj68upgKEBnk+BHOAACygxt4d3vFg9e5m0iEvvyZFbnkGoWQjb93xF++9eMcy
 AX/MI7bfUaPsx15ndNt2O9AdVSiYUruKQ3UMB9bxYOlnBR3DtScGh3jTw8buVpZp1dwb
 SV7s/rJFBOccHo3Y+PxSriTVfCpgS4GBE94Lsl3/UNCjZzJHVWyIpnpxTi2BeK/48Vhm
 LaWkMRBmI5rDn9F5w4FTAyzACg5QCEDpwE76tGkEVyRhwwPRDIu3OPkmFec0RnO/Hbm1
 Pdxw==
X-Gm-Message-State: ACrzQf2ejc7bcJTmiqPh80oUDyph7VQ8EJsitpUrnPTGUKf2kDb0nMa/
 HUBf5tJHZbdDkkdcOOai9XQJ/VxRuzcQ/A==
X-Google-Smtp-Source: AMsMyM5YTYEitm69SjsUJP0xdd2j+Z5SpXE66K7K9S7uMTcj5Z/VthoS/iMl7xYJMdRD94lRHB3yKA==
X-Received: by 2002:a05:600c:21d1:b0:3c6:ea1d:cf32 with SMTP id
 x17-20020a05600c21d100b003c6ea1dcf32mr20909128wmj.108.1666266735678; 
 Thu, 20 Oct 2022 04:52:15 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c3b8900b003b4ff30e566sm5599365wms.3.2022.10.20.04.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:52:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AF5651FFBF;
 Thu, 20 Oct 2022 12:52:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v3 07/26] tests/docker: Add flex/bison to
 `debian-hexagon-cross`
Date: Thu, 20 Oct 2022 12:51:50 +0100
Message-Id: <20221020115209.1761864-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115209.1761864-1-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anton Johansson <anjo@rev.ng>

debian-hexagon-cross contains two images, one to build the toolchain
used for building the Hexagon tests themselves, and one image to build
QEMU and run the tests.

This commit adds flex/bison to the final image that builds QEMU so that
it can also build idef-parser.

Note: This container is not built by the CI and needs to be rebuilt and
updated manually.

Signed-off-by: Anton Johansson <anjo@rev.ng>
Message-Id: <20221014223642.147845-1-anjo@rev.ng>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/dockerfiles/debian-hexagon-cross.docker | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/dockerfiles/debian-hexagon-cross.docker b/tests/docker/dockerfiles/debian-hexagon-cross.docker
index 8d219bb81d..c4238e893f 100644
--- a/tests/docker/dockerfiles/debian-hexagon-cross.docker
+++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
@@ -43,7 +43,7 @@ RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.lis
 # Install QEMU build deps for use in CI
 RUN apt update && \
     DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
-    DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy git ninja-build && \
+    DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy bison flex git ninja-build && \
     DEBIAN_FRONTEND=noninteractive eatmydata \
     apt build-dep -yy --arch-only qemu
 COPY --from=0 /usr/local /usr/local
-- 
2.34.1


