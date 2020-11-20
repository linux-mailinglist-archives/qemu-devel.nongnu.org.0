Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE82F2BAF44
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 16:51:36 +0100 (CET)
Received: from localhost ([::1]:59708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg8hD-00045J-W8
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 10:51:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8bz-0006Vy-9U; Fri, 20 Nov 2020 10:46:11 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8bx-0002sR-NE; Fri, 20 Nov 2020 10:46:10 -0500
Received: by mail-wm1-x32c.google.com with SMTP id a186so7968422wme.1;
 Fri, 20 Nov 2020 07:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gSRkkpOtYYp4MRO7peWoeBoT3gfSt4WCyUlggZt4xqI=;
 b=INWZ+k2NBrzR8+p60tRSc6EsmfJGTrtMgQVktFeTagPMefeGI05UHDOFYGxKaCO7q0
 Ws7XKlFYq0Vs2/3s/K77PHVn90JHc9Jhd2MPIlMUiXg7G3APqKQSmGZJ39Iy1c2kIrTb
 maKv0t7FvnfmSQlx157YqcBJnluJtlg7kYLVodfuxvIBXWSLL1bNYGb4NE8s/eTbJZhq
 MgiHifsisssuFUO0HrmLDO2I72oyPYf6boDbVBnhHE9aHwUcoSIrOOg+C+YpKKZvqesK
 B1BFE0cYxwvi0qTK7XJcr3LrH/htyF5X2WcjWgc5xMkpgr0SQ1wbf2eLNNgWaPQyzoyP
 zLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gSRkkpOtYYp4MRO7peWoeBoT3gfSt4WCyUlggZt4xqI=;
 b=CwVq75LA0CeLWaaohDS55sZ0C+vx1NvA80j0VSAkrsxGKdNVi57SdmiydDnpC7ovXb
 6DcJOE6ILxww/te+Y2vi8pbHcrbicV0YDuynOF6buk5wkktkkneS3UT6Zmmhd5F0zp/C
 R00xyrpmjRjNqBv9sBSs/vJY9ANTeetVQqFWj/UAxa6cy2q9WqxMs3QLH4W8Qxj7M55E
 eeTUxgC7N8+eW8VkN12+8uJcVfBJj0Qjekgqb7eBFUDsRhx4GBHY1/1DYz4lTm2ZOJHe
 WPC7WNcI9votHY4hWHsNbrUpve2NqGYuAgWwlxiwIl0jYzON7vCzWJYAwjtIg3p2BGj3
 bWyA==
X-Gm-Message-State: AOAM531WvEtRkFqGooy/Tw0V0ULQ3Wsp77jHL9Rbxplor+C6+ajJH7ZP
 Yvou15KJBDOQjL1/oQ+I+5DVmXnf7pA=
X-Google-Smtp-Source: ABdhPJzd+P5DNRBXwAXI69dDD/hnoLZDq7+06WU6/b405iYgUyXA1dO/mCJVxNd0o4DmRgRNsx+HUA==
X-Received: by 2002:a7b:cc94:: with SMTP id p20mr11042286wma.100.1605887167826; 
 Fri, 20 Nov 2020 07:46:07 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id g186sm38402553wma.1.2020.11.20.07.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 07:46:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 4/6] MAINTAINERS: Fix system/arm/orangepi.rst path
Date: Fri, 20 Nov 2020 16:45:43 +0100
Message-Id: <20201120154545.2504625-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120154545.2504625-1-f4bug@amsat.org>
References: <20201120154545.2504625-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes: 0553ef42571 ("docs: add Orange Pi PC document")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2623cf85f66..311a55317ce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -559,7 +559,7 @@ S: Maintained
 F: hw/*/allwinner-h3*
 F: include/hw/*/allwinner-h3*
 F: hw/arm/orangepi.c
-F: docs/system/orangepi.rst
+F: docs/system/arm/orangepi.rst
 
 ARM PrimeCell and CMSDK devices
 M: Peter Maydell <peter.maydell@linaro.org>
-- 
2.26.2


