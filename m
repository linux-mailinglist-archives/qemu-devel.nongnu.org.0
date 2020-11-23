Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAFE2C04C7
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:44:53 +0100 (CET)
Received: from localhost ([::1]:47472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khAH5-0005zm-8k
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:44:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFh-0004D3-4L
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:25 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFf-0002fZ-Jd
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:24 -0500
Received: by mail-wr1-x42d.google.com with SMTP id p8so18283135wrx.5
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KuHIyU8f2khKOlBunU6xp7yfHwltS3ZiqlOx+kwQe5U=;
 b=YoZy0wkWZjRQfIiEoAN5pB22ZSPIBUOkLfT+DZP4kHLNf65Q3Tevsm1zTZBqJgqvbv
 Zl+v6m3evBA5CTnl5rh2eYtmZpqPyagFT6ofF0536vgcE3fmeBEawqzxJpAv0sE+He9q
 aG5rnhEkpgWtkunJSzMo3fTxF78CQLRa4KVjhbVgiH/drQ5RQzA0e5j5rj8pp64bcw45
 67bUQnAwsNtjqPuwrIAYRB5jg2nz3rLQkbaHJa4G9/JtpNE4YimMOAwUiIVWVp5dyYh2
 0K045ztq8qf8F9ojVyNzK/4sZ5CJEMNyIUcYvd27nOqDjezwz5QZ70/2X6dvtnpqpaA1
 24Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KuHIyU8f2khKOlBunU6xp7yfHwltS3ZiqlOx+kwQe5U=;
 b=koTYXimLErTYQ6VffLHfVkU2OLvSV1YIyrQEPhOhQ/90aBoOhvdLvsG7FHSPV4ux1C
 B4579bqkGcducph3EBRieVTE6gIWpEVZlTjaAw46Woa6poh+aLwVGIgwWOD7UkOeE5rw
 wpWvEy4tBqHK7k+DdWn7blsQawLAhV07MWJOOKZSkrgvvaU8gpgwWV6TkdGgT4fNjCop
 A/YEL49OWqicWytzvkazV0SlOgWPuUcIcAI93TRcJoDwVnqBnfRTUKBJhBnXOln+qUGH
 GmrClMW0jIo93fUdU3mXpIz8IeSk8upC4NnhJp/z2Pt5TG1EyBDXoZMp+0K2hX5+S0nL
 wQRw==
X-Gm-Message-State: AOAM532K/esX5EReA0VrkF33a6ozHHsqqeY9kdEbgCUZENvew1vWb232
 wQVbCrHIswFeGJMrliqfsyV0xg89uIw9gw==
X-Google-Smtp-Source: ABdhPJxJkURvwk6Vjgn1K8eJ2v/f+63pFPrMlsvSaEBeYs8XDPg98uSFBQQf1ZeWUhHE+b/bIVfQyA==
X-Received: by 2002:adf:f547:: with SMTP id j7mr4243574wrp.296.1606131802074; 
 Mon, 23 Nov 2020 03:43:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g186sm50836495wma.1.2020.11.23.03.43.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:43:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/24] MAINTAINERS: Cover system/arm/cpu-features.rst with ARM
 TCG CPUs
Date: Mon, 23 Nov 2020 11:42:55 +0000
Message-Id: <20201123114315.13372-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123114315.13372-1-peter.maydell@linaro.org>
References: <20201123114315.13372-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20201120154545.2504625-2-f4bug@amsat.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2e018a0c1da..a9c74f9aab2 100644
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
2.20.1


