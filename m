Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33242309CA8
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 15:23:36 +0100 (CET)
Received: from localhost ([::1]:43666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6DdT-00064y-U1
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 09:23:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6DYl-0001YM-AX
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 09:18:39 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6DYh-0007ir-Bf
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 09:18:36 -0500
Received: by mail-wr1-x42e.google.com with SMTP id 7so13775715wrz.0
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 06:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bpE49BEtsLvWxkhWr13s7VhmI0D2sTc2+XCVF2CidCI=;
 b=uB/QGQwWtY9HopBuQfnKGc8IoPYcwdRiDY8JENXg7F5rHTduc/rXPl2X15wehao8fc
 clzsOH0l3BXkgtEsAvCcm0CmbqL4PYIdJV3nlV795c7Sn+Toknlt8PmMR9jaLcjgjoSN
 rxxhu3m0m/nb4UG3X/c18DCJktzOfcvXA+PE/VOi5MbKI6oU99oH8H6Dpmn8RdhMPew1
 esmKhjtI0o8eULRI2f+rYDI0iN95yB3B9A0te+uZ27ixRpnuKjvurD+xDkSmgs9N3L5y
 vaChQQszCKo3Q7GHJYppWvxjO0AKCWKCdC/UXcAnKk6G9+SYEHLOoZkMv92Re0LtG537
 K/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=bpE49BEtsLvWxkhWr13s7VhmI0D2sTc2+XCVF2CidCI=;
 b=QOk/02kOOEV7bPoKKpXHqSENsbNCg2YjqT90i7x2qRvLLD7YiaWEFNXvlHDlxqTHVJ
 z8KfsMpTZouG483nD4GigicMf52Jm4HbZSoWJYD455BjMeJ+5hwl48aIR3NZN0kK4mxQ
 HeYpmrwyAs1GGPy1fH52yDbSFLbO03/4BHxtSg0Zzq19mGn9RhoKgIpDuAXVOhEs9WvN
 x1scXlK1poeZv7yH8iY/TMGzlQIJdw1cM3BQ4xC5O5EedJKlBo53zQoWZKQTQqoL5KNX
 cHKHkwBmk7T2/83zvmWNv4LkUWluCnGfhCMG1uyWkweOpMfwLXb0kx/mijKnwB13MQHF
 JSNA==
X-Gm-Message-State: AOAM533jrhNQ9453MthpHeLL6vgBGt0Qh4a7/0PE/5bMNlcygww3Mxhn
 Qg7gKDwQEnIte6kauFBsKGY=
X-Google-Smtp-Source: ABdhPJzBBMSzW943tZ4qLPuA4oOpVGF9ccuNzluW2ORJmII35xSc9H/h7zo0dFzJWsCEQT7NVhwseA==
X-Received: by 2002:a5d:4a4e:: with SMTP id v14mr13826806wrs.80.1612102713947; 
 Sun, 31 Jan 2021 06:18:33 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id f6sm17336054wmq.33.2021.01.31.06.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 06:18:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] hw/xen: Have Xen machines select 9pfs
Date: Sun, 31 Jan 2021 15:18:10 +0100
Message-Id: <20210131141810.293186-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131141810.293186-1-f4bug@amsat.org>
References: <20210131141810.293186-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

9pfs is not an accelerator feature but a machine one,
move the selection on the machine Kconfig (in hw/).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/Kconfig       | 1 -
 hw/i386/xen/Kconfig | 1 +
 hw/xen/Kconfig      | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/accel/Kconfig b/accel/Kconfig
index 461104c7715..b9e9a2d35b0 100644
--- a/accel/Kconfig
+++ b/accel/Kconfig
@@ -15,4 +15,3 @@ config KVM
 
 config XEN
     bool
-    select FSDEV_9P if VIRTFS
diff --git a/hw/i386/xen/Kconfig b/hw/i386/xen/Kconfig
index ad9d774b9ea..4affd842f28 100644
--- a/hw/i386/xen/Kconfig
+++ b/hw/i386/xen/Kconfig
@@ -3,3 +3,4 @@ config XEN_FV
     default y if XEN
     depends on XEN
     select I440FX
+    select FSDEV_9P if VIRTFS
diff --git a/hw/xen/Kconfig b/hw/xen/Kconfig
index 0b8427d6bd1..825277969fa 100644
--- a/hw/xen/Kconfig
+++ b/hw/xen/Kconfig
@@ -5,3 +5,4 @@ config XEN_PV
     select PCI
     select USB
     select IDE_PIIX
+    select FSDEV_9P if VIRTFS
-- 
2.26.2


