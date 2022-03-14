Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 419D74D8E22
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 21:29:56 +0100 (CET)
Received: from localhost ([::1]:57274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTrKE-0002RB-RQ
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 16:29:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTrIF-00008n-1B
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 16:27:51 -0400
Received: from [2607:f8b0:4864:20::62d] (port=33342
 helo=mail-pl1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTrID-0000RN-Aj
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 16:27:50 -0400
Received: by mail-pl1-x62d.google.com with SMTP id t22so3275544plo.0
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 13:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S/1SHTKhae5UFSgHvAVB/gIrFoCZj+VkeA/hnfH1kC4=;
 b=YLFrjTmt5HZZw8vVbVdIwV5j0EoaZBK8bTkLVUJ4tESxJNOPLw3xQY4fQnT/Kc/sGz
 600YQv7IHtxeBpGxDOsvgzGRkAVxphqTlS9CQ2M4ThkWH1J317u550y2L4YXTWSVpwgI
 XdLFCIaxOyU81j/xXRX5j05NF2ti02NiGV+WjQexFFkxxyFa0yfZ4W/Esa1C5L/v+IB5
 DuVjumjOi9aLVwBS6OA45c3p5w8L/ZxlRSYvVG7qsFdpPmx0bTEilu4ORmMu5Jsg5/D7
 is+MGKw1DK/TDkztRPLXOtpb/PGUC309TdK4B6GIYnZrX57egRMFGoTpTnYj8nFjW9VB
 KhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S/1SHTKhae5UFSgHvAVB/gIrFoCZj+VkeA/hnfH1kC4=;
 b=2wEvmKzkbs80yE8tP87ZHhQ558w89xqwrPaitrHbctnt1sahEEwSNrzI7J1wimyGBK
 W+c2eqbdVHRoIKUUSt0nne9+TT5WCRrWFbZZwmVAB3BJaOyOkUBrCPOpjTYNDCimq4RT
 7JIAWUuAg5yEDHyrL9Gts3HNK28m0h8MayK27wy7iXwIFbsOlFAdLWmXoMFbUXKEWBD3
 iw78McXie/N4bJlAPpEpl7j8IcV6UqYafX8AXcQIQ63zjzzpzkpstYSUyYV//PKhik71
 6OXdnRc3QJGpNDamxEnv0N8NHwtu5Lwb+86o45QshakukF2LzsRN6Tx2Yj1f3aY3VsyR
 TsOw==
X-Gm-Message-State: AOAM531q3lk8T763U1TfyotHFaY/r2LzOcKNSTcnPLlGr4PLBEiAu86F
 rLfM1WuaOXYUcuaJf4RAkaMKhSoXtyE=
X-Google-Smtp-Source: ABdhPJygngu3KKFRLTkWx9De+0cfsKa3U2SCyKtDkPRXkXt+ct6fABlU804VHW8rm2EjQ1bsKFAnyQ==
X-Received: by 2002:a17:903:120a:b0:153:4723:bb27 with SMTP id
 l10-20020a170903120a00b001534723bb27mr13478551plh.48.1647289667745; 
 Mon, 14 Mar 2022 13:27:47 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p27-20020a056a000a1b00b004f3f63e3cf2sm23023027pfh.58.2022.03.14.13.27.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Mar 2022 13:27:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: Volunteer to maintain Darwin-based hosts support
Date: Mon, 14 Mar 2022 21:27:38 +0100
Message-Id: <20220314202738.33142-1-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: 23
X-Spam_score: 2.3
X-Spam_bar: ++
X-Spam_report: (2.3 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

While I am not an experienced Darwin OS user, I now have to
use a macOS based workstation and alike CI, meaning I should
easily spot regressions and test fixes. I therefore volunteer
to collect Darwin related patches and keep QEMU in good state
on macOS, and to some extent iOS.

Cc: Joelle van Dyne <j@getutm.app>
Cc: Alexander Graf <agraf@csgraf.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Cameron Esfahani <dirty@apple.com>
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: Roman Bolshakov <r.bolshakov@yadro.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>
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


