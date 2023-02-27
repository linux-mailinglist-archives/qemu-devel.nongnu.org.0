Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 384176A43F5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:14:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeDN-0007To-I1; Mon, 27 Feb 2023 09:10:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeCg-0006bE-FE
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:10:12 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeCe-0000sW-OS
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:10:10 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so3919450wmq.2
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Wgl0wKqznMofnpduh+UObOE7YnBmp/bW12ATTjBO0Yo=;
 b=nivZrbmdBgrlXn0rkRjf6Wva6lm23fq96YNMhHQ+R9hoRm8SezOfolEE5TJq5K5TYq
 5uorT1zv8n3MBD9ABg/Xqhnp3vjDBFgp+zhzKBEvF1FNo1zZArcsds6qwo6usQukSgZa
 t1uSMJNIdLo5dZp0Ht8vmY7Q/dvN24PhVPeMJa/m7cGaDmZipTa97w4pS9j2Vj6ePoui
 zX/GNkHncCVo520x171vOGcQ9hO6/caGypoLHkyPvF0o+lQfxdEWau2i1+B0Btt1tUJX
 GWPjOy9vKJDue+9Kryz/XkMxtNhfyx7V7CKvikN9hlN4mp83qW2oDtvmuVwT0eOM8ki1
 lZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wgl0wKqznMofnpduh+UObOE7YnBmp/bW12ATTjBO0Yo=;
 b=XalexFKZ7o/dbMBVa3zDYh5yvIIQgJxIRjZAHZ/iNwef3kWRoiBkUamSi1Nv7zIg2k
 sL35wKfu/Q7W1o37iSVccylhg/Z4dLKcq+tHmX0qjmde31ovhz2cji7tpYB+WzRkXCAw
 6QgBhSoeboA6mPc7ZHqKVgKdQEJ4hMGv8OPMLzzVQrS6G/PmLSG1I14ri4Oq2cSD3IEE
 funcZA2AgdT0sAcMRtjT2hQWvx4j2t+ZFehAYDGeTTdd1Ijl470qkD8gkKMFvabnL5Mv
 MejDJFfRd6YhIAKqNDoUAZ8KxJJ3zMUwz8QPov7Hq8dvSyo0QdIAeEKqg1FuEHeq6PXb
 hJOw==
X-Gm-Message-State: AO0yUKXWIWnzU+qC6BQDJqfcFWEiKoZI8P6632lTSpAts4SrUk/kE727
 4mhYbXwi/a1rBmIoPABKAgPlkpeJxajOC6YZ
X-Google-Smtp-Source: AK7set+CxCvNNt1JRqGSAYSwBkqpj71Kct3aiNEJwuVqRk6IBQecNo5qHCj2SuqLYMjFazcuqu2dsw==
X-Received: by 2002:a05:600c:4da4:b0:3ea:c100:f18d with SMTP id
 v36-20020a05600c4da400b003eac100f18dmr10777909wmp.9.1677507007057; 
 Mon, 27 Feb 2023 06:10:07 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a056000008d00b002c54f39d34csm7064865wrx.111.2023.02.27.06.10.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:10:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 096/126] MAINTAINERS: Mark IDE and Floppy as "Odd Fixes"
Date: Mon, 27 Feb 2023 15:01:43 +0100
Message-Id: <20230227140213.35084-87-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: John Snow <jsnow@redhat.com>

I have not been able to give these devices the love they need for a
while now. Update the maintainers file to reflect the truth of the
matter.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20230206182544.711117-1-jsnow@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d54e5c4fb9..38fbece92f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1797,7 +1797,7 @@ F: hw/misc/edu.c
 IDE
 M: John Snow <jsnow@redhat.com>
 L: qemu-block@nongnu.org
-S: Supported
+S: Odd Fixes
 F: include/hw/ide.h
 F: include/hw/ide/
 F: hw/ide/
@@ -1822,7 +1822,7 @@ T: git https://github.com/cminyard/qemu.git master-ipmi-rebase
 Floppy
 M: John Snow <jsnow@redhat.com>
 L: qemu-block@nongnu.org
-S: Supported
+S: Odd Fixes
 F: hw/block/fdc.c
 F: hw/block/fdc-internal.h
 F: hw/block/fdc-isa.c
-- 
2.38.1


