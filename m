Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BE3320D71
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 21:11:28 +0100 (CET)
Received: from localhost ([::1]:38742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDv4h-0002nz-2P
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 15:11:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDux8-0004JJ-IO; Sun, 21 Feb 2021 15:03:38 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDux7-00089Y-3w; Sun, 21 Feb 2021 15:03:38 -0500
Received: by mail-wr1-x436.google.com with SMTP id l12so16925865wry.2;
 Sun, 21 Feb 2021 12:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5dFD5muUoIl7eho1/C8LkdWekpYEZwtQ05983iGULtA=;
 b=mVmbhbr1xYur0nIwUcE0Vbawb/QHEBZvwvm4IkWQZKmSOlGYGmC1GgUbf6/HZ8mkTW
 Vq5ABewHUNrVGZr9dYkhrwALYVIww7LtcEoZhjNw69rho2Ip3/I6NmNGkHfGVtxrGD+K
 6t/cNBMqyQEGWOa2ObMnB619tk2HH79zdrCk5rRcCLWR6iasCemZY0ruMBQYT4GwoE8k
 yN2boEKGs82Ja2Q3iE1f2adxpLvpowHworfj1PuS3KBfsnPp+o96GtiMp6Nn6h6Qasza
 3j86buJV6e6UtC+Ny0ohvzqKO2Oojst+eAFqONUW+7hGk6xFEB2aMBkOipy9p0IADx1u
 jASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5dFD5muUoIl7eho1/C8LkdWekpYEZwtQ05983iGULtA=;
 b=qXWm2qrzsszx6B+W1/xEnKpJ1/v1ejcz5GVyl2QpHqKlCUHNsIwEoS7pWslCyBmpb1
 8vt9c63sXziSqvNYyPpx+1iPP8MNWGFwuvMRcgWIr3n7rwgB7sGbLnVEJtvI+J0eZixA
 LDRVuozN9enRzuPq9Cx9/zmvMnmAQreNULrwIxtV9H+3Aw6s4mzlZfPZtYCIBmcLpse8
 MRtWlSGEibx29oYR3BPosaNMwfLSGo4uwT+hJN0LbRHCkRUQmH6AIfYk8QKsRSmUJflE
 3596E93Rn+cHDZRbymtfSl921PVllwc/ye+0TxG1APpfutjyoDuLHba2gJQ33L3gK/Bt
 WQEg==
X-Gm-Message-State: AOAM533FEc+oEgK7sI+o3BFp4c9uwq5eX3Khp7fym3WHXQQipRYlmiID
 JGMTWRpBF0w0wrqcY/OGcU35XmnVmuM=
X-Google-Smtp-Source: ABdhPJwUtCk/8mtIvHS2idP3GiYox9bcHsu+Rxuc5gcW4Hy6k3iQvHJT4o/46uyTk4BE7jfsQScHDQ==
X-Received: by 2002:a5d:4d85:: with SMTP id b5mr16408182wru.192.1613937815217; 
 Sun, 21 Feb 2021 12:03:35 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l15sm23208876wmh.21.2021.02.21.12.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 12:03:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/8] hw/sh4: Remove now unused CONFIG_SH4 from Kconfig
Date: Sun, 21 Feb 2021 21:02:49 +0100
Message-Id: <20210221200249.2536247-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221200249.2536247-1-f4bug@amsat.org>
References: <20210221200249.2536247-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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

As replaced the generic CONFIG_SH4 by more fine-grained
selectors, we can remove this now unused config variable.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/sh4/Kconfig | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/sh4/Kconfig b/hw/sh4/Kconfig
index b9f0538d57f..ab733a3f760 100644
--- a/hw/sh4/Kconfig
+++ b/hw/sh4/Kconfig
@@ -9,14 +9,12 @@ config R2D
     select USB_OHCI_PCI
     select PCI
     select SM501
-    select SH4
     select SH7750
     select SH_PCI
 
 config SHIX
     bool
     select SH7750
-    select SH4
     select TC58128
 
 config SH7750
@@ -24,6 +22,3 @@ config SH7750
     select SH_INTC
     select SH_SCI
     select SH_TIMER
-
-config SH4
-    bool
-- 
2.26.2


