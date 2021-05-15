Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EDC381A44
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 19:46:04 +0200 (CEST)
Received: from localhost ([::1]:51904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhyMV-0007JB-Dk
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 13:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEa-0000l0-KE
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:37:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEY-0006Hy-Et
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:37:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S7IAZU3SpuyZA/TPUu84zMTCi1tlnlEn7V9DtnfwMAo=;
 b=B3z2HrsqL4MtbWBL2rOOPbL1zwBGfnOoi1Ojqn5HIkRv31tPGhPdwD5Gm2makLYa7T0E4D
 ijCgtysa6xAJcpjPvdJSG6P7zH3Mcbn2Cj9ucfyovlhhLYh/ylOzFN4HkvBb11THYZwMUA
 L5ITM5BgJTFdhdn9hFGQrT/qnuVOlrA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-r6ZfrD9ePeqP-lsoz92YJQ-1; Sat, 15 May 2021 13:37:44 -0400
X-MC-Unique: r6ZfrD9ePeqP-lsoz92YJQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 2-20020adf94020000b0290110481f75ddso1387521wrq.21
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 10:37:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S7IAZU3SpuyZA/TPUu84zMTCi1tlnlEn7V9DtnfwMAo=;
 b=j7Q8supg7u84oMxwgwnfBon+L46ILtgIx+Df1jLZo6VsxJGkqaXN+zo70K1nvaON9f
 K+vSESaWcW/QfudoHD/Bfla0daL4rCS5va1rG/VStFt5Sob3q//RZ6j2gNGxkbnssqdX
 DsgR9rDd2a2FLlBD7C50mSvOKJECEvODWlkMo3W21PTlVrk9ipy6KVGV+Rmhyd8rAmwi
 35prlLnAATxHs141vqZr4LmVY2mhCw+D/7ar09PFJz1jjnZEuFwpdoRxaZvDJ84jY7jf
 PheuROCgMJ85HAM14JmC1M44CQYpvL9eEsr7oa0cZuV/qwO8Pg+lkLINk0t18PBR/jIf
 dozQ==
X-Gm-Message-State: AOAM533hvP6kZ7HJxwhMxMh0CsoIkhBwo3zk4j4iN9OEsfYGWA2VrXTp
 JdNMuInJc+EkaEVz5FEKrZqiy0+3n2ecxk5a17EffmrAaHmSgi8VWyj5wJb6biATrJGN3KvkFDp
 nNsAm257Qn9n/gUIw3x04MoQwdjSiYDzwXD0eCklaAbUQl7ubgyG7lAneaopTK9Dy
X-Received: by 2002:a7b:ce87:: with SMTP id q7mr17484735wmj.77.1621100262984; 
 Sat, 15 May 2021 10:37:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGVOh7pkMkDvwyl4op4hAAMWNNYbI6Usln0UJOegBSdd5y4Gs1f92XifVNt+WjkNOmwRwmog==
X-Received: by 2002:a7b:ce87:: with SMTP id q7mr17484711wmj.77.1621100262785; 
 Sat, 15 May 2021 10:37:42 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id 61sm11021853wrm.52.2021.05.15.10.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:37:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/12] hw/arm/Kconfig: Add missing SDHCI symbol to FSL_IMX25
Date: Sat, 15 May 2021 19:37:09 +0200
Message-Id: <20210515173716.358295-6-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210515173716.358295-1-philmd@redhat.com>
References: <20210515173716.358295-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit bfae1772c43 ("hw/arm/fsl-imx25: Wire up eSDHC controllers")
added a dependency on the TYPE_IMX_USDHC model, but forgot to add
the Kconfig selector. Fix that to solve when built stand-alone:

  $ qemu-system-arm -M imx25-pdk
  qemu-system-arm: missing object type 'imx-usdhc'
  Aborted (core dumped)

Fixes: bfae1772c43 ("hw/arm/fsl-imx25: Wire up eSDHC controllers")
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Guenter Roeck <linux@roeck-us.net>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 5827c092b28..6bb34926bb5 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -386,6 +386,7 @@ config FSL_IMX25
     select IMX_FEC
     select IMX_I2C
     select WDT_IMX2
+    select SDHCI
 
 config FSL_IMX31
     bool
-- 
2.26.3


