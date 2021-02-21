Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A82320E25
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 23:05:48 +0100 (CET)
Received: from localhost ([::1]:43076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDwrL-0006LS-Vk
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 17:05:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDwlo-000187-Jt; Sun, 21 Feb 2021 17:00:05 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDwlm-0000xy-SI; Sun, 21 Feb 2021 17:00:04 -0500
Received: by mail-wr1-x429.google.com with SMTP id n4so17119885wrx.1;
 Sun, 21 Feb 2021 14:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9ZV5S5F2neJfYXLNqhFnjIwvv5gWALmpaBVemsuVGEY=;
 b=k5kyBff+11ezJ1iKl0tj45LC7qYPEHNwkMxzgmx4TQmaT5zKhE4g00zr1pVsN7amxN
 HnrQIEnU9oUcofAGKuct5UaGdEIr/6yqAmz2cMrPnvTQZdZY+Nt8kCX9IuKoBdI0+Mvv
 9Rr4N0/6C7hWp9SB0hDNqZrdy5A20ISOMX089ROazopicVF/hkLmiYBqiAnbWXH/MTkF
 3ZbIvbvfWDBZ+T6hioETvzaA+BL77tbyFpyLk9ncX4e6suMnBWkbWfuZ4lsSM9HtdwDE
 ss711Z40dv7H9Hoz2SE7r03XiEOcFRMYVhD334Gi/+VPbFdKW4AOXAUg6JFnHA6csugs
 H3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9ZV5S5F2neJfYXLNqhFnjIwvv5gWALmpaBVemsuVGEY=;
 b=t5nCn4r7bwxId+zThJjV+Zw0DJ2LNf99PAf/CrKVMNFH7RGi0leQjJ7EEuy35xUj1t
 4QfTtBEuFGMnRPuzAmwqRREJnehiQ8AfmqYkRALk0oC+UmPv4uQpFsxiF/Hmml3C/Qc6
 zSqamtaPP/GQSxRTl7hyZ8GEBfn0Pz8Yq8tP4CMLCz7rQ+NnrJm2gt1pnoJbDOpR/OpP
 2d+G3fwyLpoEkBvBDUM5Zjys+wpoetAAq24jXu7EbxzyJan2P7BemTNwCteYbI5oCRzI
 tNMXDbrrcGp6jbgZtJVQtjPJ1YxWlDL/RVCfN/53stV3cadFL3hTE2BoRIDLMVVCe9GZ
 xTZw==
X-Gm-Message-State: AOAM531zSuUYHQK0OtAFFZEtst83wh/Wt7+EHNvxGzc+CPL010YZxWm6
 OoNfenQR8JYh0ANPnoKNCj15K3KrWbY=
X-Google-Smtp-Source: ABdhPJxEvIz5wtWRhW9r/ihIo/4YilzKgBMhA/SSBfhhTmHgg+e/srtm1AVVVCBMsWT7dx3y1ODJ+A==
X-Received: by 2002:a05:6000:1373:: with SMTP id
 q19mr18302861wrz.371.1613944800140; 
 Sun, 21 Feb 2021 14:00:00 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id t15sm23546900wmi.48.2021.02.21.13.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Feb 2021 13:59:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 8/8] hw/sh4: Remove now unused CONFIG_SH4 from Kconfig
Date: Sun, 21 Feb 2021 22:59:15 +0100
Message-Id: <20210221215915.2568943-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210221215915.2568943-1-f4bug@amsat.org>
References: <20210221215915.2568943-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
 qemu-block@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


