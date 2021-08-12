Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 011453EA249
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 11:46:12 +0200 (CEST)
Received: from localhost ([::1]:36294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE7Hu-0005wQ-Ue
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 05:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76P-0005Xa-Pw
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:17 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:41531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76M-0007vh-4K
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:17 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 c129-20020a1c35870000b02902e6b6135279so2590118wma.0
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 02:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3PDN4mKTf0zYjcvH+MYD67g3sSoLMbW7iWecHpCgpiM=;
 b=VYTqU7ZkZXuCe43Udu+Fyb+3iKVd9q9QEo09fE9N/yzB6sW+sg1CWSV9sx0wmkz7hM
 ZNyY66vSBRomLi/oQod9ycz9wCqJFH0Vb8xHSf/7nFOafDEMxzsdnqSR28yjznQBt/vL
 SnBpENRhG/TS9kKtW3crz9so5zclaUFvFHu/row1IacNDbj5HLvrGyahLi4pLz59wXe0
 W9nlmlte6NCrogH7QUuADUmC8xByXBBkQ+gYxZhWvOg//ZqixonPwERhOqIkFhNCrWQ2
 7nVirjf0I8gD8t5je9sXtD3EHtu3HY7pXatD1Q2IxBsGn5MxpX1x3wq8U0kvmPf74czO
 kXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3PDN4mKTf0zYjcvH+MYD67g3sSoLMbW7iWecHpCgpiM=;
 b=remLd+OswaoAlkrFgaf29LXKhiMUOfYLeM+IL5cojd8+JdM5gvRYguEJqS4IGhCupA
 kb4HzuFqHRdU9cCp0Thr9fAWAfZ5LH52BCXB8SRG7U7lGIMTxYD4R+D+yID6DDpBuiym
 q8p9oSSX87HBZbu3am3K1L3CqVZQ4sxQg/53nRJFtTTSX6xPbJOTEsgDX7M79nKnbVza
 J4XxchZ0u91bTi03KFErKsMqXDV7jg/uBMBPZ/8IYlp1QLUROKHvZPyRAlf/JEvFcEij
 IdrFc46RweUB5jK73TUbaa5kkAIBMi/TxeekE/wsG1J2pl8q6z41hZVEjqZ1h+/Ra087
 MqGw==
X-Gm-Message-State: AOAM530+CRRNlnt0Uab33buMavtkNQvgMtc299HUOE1bMzBanaIqZ8Aw
 eIH0agcSv0DL2YnjGW/r2b0MKg==
X-Google-Smtp-Source: ABdhPJwc58xJC6YVwUHo7xD7O4pyMjootkyML13W6KY4F+m74Nqlp4QBjgt3Fo4jESijLGVM4ZvpHQ==
X-Received: by 2002:a7b:c309:: with SMTP id k9mr3104887wmj.48.1628760852323;
 Thu, 12 Aug 2021 02:34:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 14/25] hw/arm/stm32vldiscovery: Delete trailing blank
 line
Date: Thu, 12 Aug 2021 10:33:45 +0100
Message-Id: <20210812093356.1946-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Delete the trailing blank line at the end of the source file.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/stm32vldiscovery.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/stm32vldiscovery.c b/hw/arm/stm32vldiscovery.c
index 07e401a818d..9b79004703b 100644
--- a/hw/arm/stm32vldiscovery.c
+++ b/hw/arm/stm32vldiscovery.c
@@ -65,4 +65,3 @@ static void stm32vldiscovery_machine_init(MachineClass *mc)
 }
 
 DEFINE_MACHINE("stm32vldiscovery", stm32vldiscovery_machine_init)
-
-- 
2.20.1


