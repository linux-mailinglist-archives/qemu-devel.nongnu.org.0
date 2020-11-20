Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F422BAF43
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 16:51:29 +0100 (CET)
Received: from localhost ([::1]:59362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg8h6-0003ur-30
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 10:51:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8bq-0006Me-B3; Fri, 20 Nov 2020 10:46:03 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:36245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8bl-0002lG-3d; Fri, 20 Nov 2020 10:46:01 -0500
Received: by mail-wm1-x331.google.com with SMTP id a65so10208170wme.1;
 Fri, 20 Nov 2020 07:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=emCLnc/OuqxeNdsEYCGX+2nYKHJ2SF/H7wX2h0SEpds=;
 b=pG7PWRKHJfRfImJnvBjuVULSdBfELwegiQEzvPGjI7Ey6oS/+dZB6Ox4oyJuDtVIhq
 vagPZKWCuPTQ0t3wHWv/+gBZi1+zOZJ7HG5sqnHSTXmPzuZN5D9LVuncUGp4YMSF2jk7
 v2W/xYIAhntDVY/UUw3NxsGQP/sM2rZ/KAeiPGpQPkjGXJO5Zhj1k1CS2jCQjdMmQ8ZZ
 eCyHce7P7zZde8L0o1iXZesl0LgaTQJxczTw0UGlNaKCqDlLIpc8iij1SxiwIWKLHMnr
 pYU6i7a7QszhshRr5zOV6Ac24ykMTo0bD4luwNzlTAWxTMJKEAkGK1gDfmuQqC0ufMbg
 9SyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=emCLnc/OuqxeNdsEYCGX+2nYKHJ2SF/H7wX2h0SEpds=;
 b=XRBsIg3oPDHX4EXXTxha2c4kNl3WbTp2uieBMzW2RyuPUdmQr2PfmXtqH6JblC3z4D
 sPcz+IgTztmJoczxrIkn9Q7uzEb5/jzjnyjIZn0BTi9PGnz5+Przt+4kHATmk8b7/mkc
 s4bj01xuOsIUe5HlPCMH88L8+OVGMZPbtG6GtdO/3iaifgnwaXRdwcYBwM1EPWNmoW8t
 Ks9zA+vaDEDP7+WgE4qeLK3CH8XOgEWpPEKPtcNzIsIcFOXvwDB0gDYkPtvyhocWdxYE
 0jAduYbRmWNlrYkaVRIRvRCARPKFvRj1zZWS5Va2qjOLxqWyEsOkPIsvpZp7d5Y/leVj
 TjIg==
X-Gm-Message-State: AOAM533FJmkIFJp5wEBTLYTUl+x9ZvYvamKfQWsN1wwic8c/tfHBg1VZ
 6QDIFUhJNzVX1IwCr+DktHYkhnjnPVc=
X-Google-Smtp-Source: ABdhPJxC0ueqzDgBXTZXRttwbVH+SQ7sWJdlRDHjacMT35VjXrqI1unNy7HAP3TQREy5PNZ4scCprw==
X-Received: by 2002:a7b:ce05:: with SMTP id m5mr11513752wmc.16.1605887152561; 
 Fri, 20 Nov 2020 07:45:52 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id w11sm4942109wmg.36.2020.11.20.07.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 07:45:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 1/6] MAINTAINERS: Cover system/arm/cpu-features.rst
 with ARM TCG CPUs
Date: Fri, 20 Nov 2020 16:45:40 +0100
Message-Id: <20201120154545.2504625-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120154545.2504625-1-f4bug@amsat.org>
References: <20201120154545.2504625-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1ae9fc9649b..8d7a6026b91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -158,6 +158,7 @@ F: disas/arm.c
 F: disas/arm-a64.cc
 F: disas/libvixl/
 F: docs/system/target-arm.rst
+F: docs/system/arm/cpu-features.rst
 
 ARM SMMU
 M: Eric Auger <eric.auger@redhat.com>
-- 
2.26.2


