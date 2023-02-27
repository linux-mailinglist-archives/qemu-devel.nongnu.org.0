Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C426A444A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:24:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeAw-0002Dp-3Z; Mon, 27 Feb 2023 09:08:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeAt-00024R-8z
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:08:19 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeAp-0000Od-1Y
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:08:16 -0500
Received: by mail-wr1-x429.google.com with SMTP id r7so6358499wrz.6
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QJ3BKCFcAXPLhAg+8B2nnFVcuypAiJT5mvyLP2qVcBI=;
 b=VA0DRsLi06sYDvJg8wAqDf+VYbENd1yjjJ3a3t4Ne/TP3jTKEASPL433P0BdrsJQBw
 gNG91KpCbfv0A1TVN2nrqEKBU9ZwI5pGuxIcmoyWA+8fSl+FPM1fHagWEpktLYV6CNfq
 /ybj2i9+ba5VkQS6D/AnJDIEitz1WcaHO6CuOdeqMU4wKKYhTl4N6SgFJ4I4Mh/8NJbv
 sBsmL+FQJXakjxNhv6jDFFfxE2syqQRREA5B4HkJTbA7SqV7xPweWeagvMy0+0srQdK7
 Kr1LjSNvt1wUhwnXBlq23DoYmE7iACtsm7wbsWIpasIgfEVuDuiaJ1SHb8WZrdTzs/jY
 D+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QJ3BKCFcAXPLhAg+8B2nnFVcuypAiJT5mvyLP2qVcBI=;
 b=nYkuNKQRhRN7BvF+fkGGLa/+kZ7IhUpn2Y6h9X7BxfcU1oHnCSdoVAfUWMsBQ5CRyE
 NSo5P0HudRhwJ47T2DQVkl1ILTPQ7aNM62uumfdsdRNGJ51qT41CykvsO8JMOSQ28740
 ql2C5uUWl46wzLY3fnoIU1CpEfG4/XysXNryaybKurhFbheNQQoNy/DNLpRnV9dlTysx
 crZgL4/Ve0aKKK2TOk0KdxHMQMsnUtfzZi8cz6dPJBtx91D+Haq+U8p7tDKlBPRPS6Z/
 6oUPshzf9hLv627NjtaaiCo0B0vE2YSBxhGxURRFLXAMkpLbITFMFniSIMVzYJZWrtPj
 nfbg==
X-Gm-Message-State: AO0yUKXJNQ5kh+1AfpaT4tI91neQrtGpVuZgc2oO2YfM1quiE9Ztnddy
 eonOz2+Agn/8cmHrugNTRqbmQLlYxvfq1Fcx
X-Google-Smtp-Source: AK7set+d5wLbNuGep5i5RIcThEBUcYKwINzZ2KDxiS6K2V5J1n6Cjilpa6agddr9FX09ta6di6sW2Q==
X-Received: by 2002:a5d:58d9:0:b0:2c6:e87f:30cc with SMTP id
 o25-20020a5d58d9000000b002c6e87f30ccmr19165699wrf.48.1677506893523; 
 Mon, 27 Feb 2023 06:08:13 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h8-20020adff188000000b002c54241b4fesm7118517wro.80.2023.02.27.06.08.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:08:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 075/126] hw/usb/dev-smartcard-reader: Avoid forward-declaring
 CCIDBus
Date: Mon, 27 Feb 2023 15:01:22 +0100
Message-Id: <20230227140213.35084-66-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

To avoid forward-declaring CCIDBus, declare CCID_BUS QOM
definitions before its use in the USBCCIDState structure.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230220150515.32549-2-philmd@linaro.org>
---
 hw/usb/dev-smartcard-reader.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/usb/dev-smartcard-reader.c b/hw/usb/dev-smartcard-reader.c
index 28164d89be..be0a4fc3bc 100644
--- a/hw/usb/dev-smartcard-reader.c
+++ b/hw/usb/dev-smartcard-reader.c
@@ -278,7 +278,9 @@ typedef struct BulkIn {
 struct CCIDBus {
     BusState qbus;
 };
-typedef struct CCIDBus CCIDBus;
+
+#define TYPE_CCID_BUS "ccid-bus"
+OBJECT_DECLARE_SIMPLE_TYPE(CCIDBus, CCID_BUS)
 
 /*
  * powered - defaults to true, changed by PowerOn/PowerOff messages
@@ -1174,9 +1176,6 @@ static Property ccid_props[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
-#define TYPE_CCID_BUS "ccid-bus"
-OBJECT_DECLARE_SIMPLE_TYPE(CCIDBus, CCID_BUS)
-
 static const TypeInfo ccid_bus_info = {
     .name = TYPE_CCID_BUS,
     .parent = TYPE_BUS,
-- 
2.38.1


