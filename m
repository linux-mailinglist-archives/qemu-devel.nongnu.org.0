Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CE94D9BD3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:08:46 +0100 (CET)
Received: from localhost ([::1]:49162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6ur-0003Av-PX
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:08:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6jZ-0006UK-92
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:57:05 -0400
Received: from [2607:f8b0:4864:20::42e] (port=42953
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6jW-0008Qa-GP
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:57:04 -0400
Received: by mail-pf1-x42e.google.com with SMTP id g19so19518858pfc.9
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zubi5RZ0f61EYBlqb1Tf66OZVOTwoIeVsz9h2LG5oA0=;
 b=gEfDWA3LPAwAJDBs1NlFtlD8hDXb9nb14hIdrTZEVERD88nS2djb4CoRPLBFj4bJXl
 oxjaMitrb0sqnyYbkV29TTPgYQNXLxjpj8VE4A1cfHHD2EB397vcULF0gKl1E4Xe6/Am
 GFT8gASEvzc/7bzpoYilBui/wUWZBK1jKrep+cKGP8sUi4kivEiBC4tctfMbWZF02mQ7
 85lwwj0E2BBGXqViVcq4NMw8V970FWNjpEsLI/gpsh0WYJPp4Z/vLojop1psSXr9ymI8
 5zkd8IoLLGVeI2QvTNpFCEVCol9QAynmLR9vEhdSNhNVhNQ1DFq+1G77AZRfeKC9Tocu
 k5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zubi5RZ0f61EYBlqb1Tf66OZVOTwoIeVsz9h2LG5oA0=;
 b=QXGiUS8SVNjiAy3d+hRBdgtQxOTQp2mCd4z+U6ORhTE8y7xPtlfYuGTPn1bxBfgDXV
 wO520LchJyFbLlhmC1zIb843g9j6PjAeGkTqxgxjVN57dnTKHuHMeaBi2yCObZYj7Czu
 gtix28IZK6OSxmfKfHItirnoFNTWY6hx+SnD6Z9wcfNx18UbnUpatR+h5OnKAiByNH9e
 N4biI5Yc/nnrnO14q+pKfXWw7CUkPh4E9/K2mBtYnBlL/e8TsEfY1X4BGYm9oITY2MKM
 FDefDqnYPIVtI95SQpvDsHcj547dfCKiE3fCx6g5DMTPwJb2KCIz2qiEU2fGpi0yvxIV
 RzkA==
X-Gm-Message-State: AOAM5303xzt8RM9k2bkpocbj9yGWo/ta1/tOXVspMh1RkbDrXNhjmJoR
 +TVtYIMwVPb/kAgDjjmQTsAaHUjH7RQ=
X-Google-Smtp-Source: ABdhPJwP4wxIkUT+evCLNTksATwfFsHyUd83qZS1d4xWiXBMEojdxQOEp/BXz8EXvJPUSAmlHNzUNg==
X-Received: by 2002:a63:41c5:0:b0:378:3b1e:7ac7 with SMTP id
 o188-20020a6341c5000000b003783b1e7ac7mr24003539pga.266.1647349020774; 
 Tue, 15 Mar 2022 05:57:00 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a056a00241000b004f3a647ae89sm24104971pfh.174.2022.03.15.05.56.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Mar 2022 05:57:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/21] MAINTAINERS: Volunteer to maintain Darwin-based hosts
 support
Date: Tue, 15 Mar 2022 13:53:50 +0100
Message-Id: <20220315125350.82452-22-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
References: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

While I am not an experienced Darwin OS user, I now have to
use a macOS based workstation and alike CI, meaning I should
easily spot regressions and test fixes. I therefore volunteer
to collect Darwin related patches and keep QEMU in good state
on macOS, and to some extent iOS.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Joelle van Dyne <j@getutm.app>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f2e9ce1da2..caea42c259 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -548,6 +548,12 @@ F: include/*/*win32*
 X: qga/*win32*
 F: qemu.nsi
 
+Darwin (macOS, iOS)
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
+S: Odd Fixes
+F: .gitlab-ci.d/cirrus/macos-*
+F: */*.m
+
 Alpha Machines
 --------------
 M: Richard Henderson <richard.henderson@linaro.org>
@@ -2414,6 +2420,7 @@ F: audio/alsaaudio.c
 
 Core Audio framework backend
 M: Gerd Hoffmann <kraxel@redhat.com>
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
 R: Christian Schoenebeck <qemu_oss@crudebyte.com>
 R: Akihiko Odaki <akihiko.odaki@gmail.com>
 S: Odd Fixes
@@ -2671,6 +2678,7 @@ F: util/drm.c
 
 Cocoa graphics
 M: Peter Maydell <peter.maydell@linaro.org>
+M: Philippe Mathieu-Daudé <f4bug@amsat.org>
 R: Akihiko Odaki <akihiko.odaki@gmail.com>
 S: Odd Fixes
 F: ui/cocoa.m
-- 
2.34.1


