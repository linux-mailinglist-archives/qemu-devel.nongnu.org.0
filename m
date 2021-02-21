Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA72F320D62
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 21:08:41 +0100 (CET)
Received: from localhost ([::1]:60054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDv20-0008FL-Rh
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 15:08:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDuwd-0003oi-AL; Sun, 21 Feb 2021 15:03:07 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37001)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDuwb-0007xt-Uq; Sun, 21 Feb 2021 15:03:07 -0500
Received: by mail-wr1-x42b.google.com with SMTP id v15so16926932wrx.4;
 Sun, 21 Feb 2021 12:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AIxQp5jGuiI1O3G9klEp4e9wkZDTM64R+LqmaT3yKjo=;
 b=jlYyckfKrOKoHGrvr4BBESf8rDqr8VIL6+gx1c/GUAZpDuhGzuINsLaDm+p1ZuPGio
 esCC5oJxKQWere1BlQRY3utt2yfSMylBkigUKG4vYF5K2DlePKWcMyD0G/UB5LcQPwdV
 VMsp4Wnk753Rs2VgPc7o3yuTRkawb9QGg5df3a9V/2s7wkzsXva3NBCOXfG6oPYv4wkm
 94uEEgtybAWTetpCBaTZDYsCRNt0cFI5a0tOSkt5QkLJlgYmhehL4Ck+TK0iWUAeEs2z
 7+Zv5VB+4+I9nkYLb+1nuicY0bcgkqwEaDyjvvZ9eMReGkb63ndNIVxpgTU87YNwT0xZ
 wO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AIxQp5jGuiI1O3G9klEp4e9wkZDTM64R+LqmaT3yKjo=;
 b=fws9Rnf6+9NRxan/Q/bzXlqYSBWRr2XfU9QklWFtD0Bn9lBhkkuMkGgJJG7CXxzVT2
 RP6sCBnnl89Mo/UlhzT5Iv66tp0kttjYo3VdKVUzjW7mM1AzvnmwlapXFPbnktCXSLlQ
 Ozyx9DszWd2Kz12lw47nW/dp221ZDv704qM3x7DBgD02sc7Clfav9eZTG8RsrgdGsXnb
 VtL7UJK1a21dUsrYIFbMbwuX9YIxW31qHEWKM/iUGlSSiMq0HUHZCSdTwcuvLe8eNl5c
 HSpHz3UNdv2qxDwr/jxE9H1UWGZlZ4NowK7O9EsqW/itEN0aLc07Nl5ZTq3+vxQG2VCo
 dRRw==
X-Gm-Message-State: AOAM532qhxnYkoldFtw7noxIsPr1Gn/RoN2zP7raU0U68I3/psz8Upyb
 Vu2YXD3wbV+LoX3Os0cKbj9S7BD3TgU=
X-Google-Smtp-Source: ABdhPJw7MT83vn5DHuTOmpqqZqnZkbfv4VKJHXanO8lg5Fmjv92ItHZn7+pm9hh7As17udah0ChGHw==
X-Received: by 2002:adf:fbce:: with SMTP id d14mr17612863wrs.44.1613937784111; 
 Sun, 21 Feb 2021 12:03:04 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y12sm13987764wrm.33.2021.02.21.12.03.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 12:03:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/8] hw/sh4: Add missing Kconfig dependency on SH7750 for
 the R2D board
Date: Sun, 21 Feb 2021 21:02:43 +0100
Message-Id: <20210221200249.2536247-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221200249.2536247-1-f4bug@amsat.org>
References: <20210221200249.2536247-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-block@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

r2d_init() calls sh7750_init() so depends on SH7750.Harmless
at the moment because nothing actually uses CONFIG_SH7750
(hw/sh4/meson.build always compiles sh7750.c and sh7750_regnames.c
unconditionally).

Fixes: 7ab58d4c841 ("sh4-softmmu.mak: express dependencies with Kconfig")
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sh4/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/sh4/Kconfig b/hw/sh4/Kconfig
index 4cbce3a0ed5..0452b4624ae 100644
--- a/hw/sh4/Kconfig
+++ b/hw/sh4/Kconfig
@@ -10,6 +10,7 @@ config R2D
     select PCI
     select SM501
     select SH4
+    select SH7750
 
 config SHIX
     bool
-- 
2.26.2


