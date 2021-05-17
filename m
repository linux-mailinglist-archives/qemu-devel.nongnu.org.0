Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD27D382C0C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:26:48 +0200 (CEST)
Received: from localhost ([::1]:54360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1licKd-0007QT-SK
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libqg-0003fU-3a
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:55:50 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:39855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1libqe-0002pk-Ej
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:55:49 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso4993133wmh.4
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1UcPExstjBATEDHDrm3TI5/PEt/ztF/FbFjk6Eg9jrc=;
 b=iNLFibzZQ/IwWJ5YSa4+GEAct8/5VwMAsUDndVCrv2WeDAQajbGesFcHBv/uXIDnFH
 MwIRzVxYSBVTaxkpy7O0Wjhota91XVOt6W3nzmkbazARFg17n7g/StGvstJsdkKOpiGg
 zp8O+Yl6HM8+SoLI0jl2uEd5sw6teaZ4EAmO7WEB6pRTthHPzI9zqDAuj7nkqNe/D6k2
 6cGWAEvL/vJRE4svj5dWSmKxpOJN5WtvrrIQKGGx7ZJiZKlKoqJEwP2zDUUvKaVVRM7w
 qRTmLn1Kd878PgB/4glwhScGrWlptdJ+Gay1kYNFqzNHolrPdwFTCh4/VZQmETfpSL5c
 z2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1UcPExstjBATEDHDrm3TI5/PEt/ztF/FbFjk6Eg9jrc=;
 b=G2cSJR/K4ewLo9LJ2JIwz4hxDS53g7prej21txeebnYwt9mDzX+pBedIfBGlA41tdk
 2WTAaOY7F4EZX+Nz9uKEcMJ2rnAWT/8C+Nqe21R5b5qVkEjmzIAC+9fOGRpXEK1LbIEo
 EZ0I7wANpzxP5JFN5MU+2rGP91IIq6Td2LzotmEw8i7VIQ0qRFYCDBxILqW12m4m83JN
 7COxmzfIX4I93uxVnL3Rskfy8YgCfyi7zJvG4D1zir12HnAp2ZE+OFGgar6e1Mo98PLu
 HyVafh5MDfRTDxdzV6Ja0jb3ANC3t047kJcxPAEY7KyXv9QdLH/aA04Dysj3OJFnotje
 2L0A==
X-Gm-Message-State: AOAM530TVIzhsctrKoutPxLFaQguIaFm3AmZk21yx2hF2G2Mfw0dN55b
 qRV8MqI+OTtlWzK+S/Yv0NBhUjirXizX2g==
X-Google-Smtp-Source: ABdhPJyx2gr86MIh73Vvdncfm4PVk3txntVki9/J1wBLwEfunfEZKyxJyr4r3FzM58h49Zva39DpJQ==
X-Received: by 2002:a05:600c:4fd6:: with SMTP id
 o22mr41220589wmq.83.1621252546946; 
 Mon, 17 May 2021 04:55:46 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id m11sm17009007wri.44.2021.05.17.04.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:55:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 04/15] accel: Only use TCG when building user-mode
 emulation
Date: Mon, 17 May 2021 13:55:14 +0200
Message-Id: <20210517115525.1088693-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517115525.1088693-1-f4bug@amsat.org>
References: <20210517115525.1088693-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/meson.build | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/accel/meson.build b/accel/meson.build
index b44ba30c864..0e296911aea 100644
--- a/accel/meson.build
+++ b/accel/meson.build
@@ -2,11 +2,13 @@
 softmmu_ss.add(files('accel-softmmu.c'))
 user_ss.add(files('accel-user.c'))
 
-subdir('qtest')
-subdir('kvm')
 subdir('tcg')
-subdir('xen')
-subdir('stubs')
+if have_system
+  subdir('kvm')
+  subdir('qtest')
+  subdir('stubs')
+  subdir('xen')
+endif
 
 dummy_ss = ss.source_set()
 dummy_ss.add(files(
-- 
2.26.3


