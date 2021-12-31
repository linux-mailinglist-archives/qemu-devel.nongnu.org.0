Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 378D8482407
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 13:52:55 +0100 (CET)
Received: from localhost ([::1]:46508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3HOw-0000KR-1d
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 07:52:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HKL-0005pg-I1
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:48:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HKJ-0000hD-S3
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:48:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640954887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w+4sOFVvGeEBA7BnPdfDCmGmrSKk6Q3SFRcpoINpXLs=;
 b=WjT3nnVcpn996B/KLPepHl0FNciZIifax+7FLZwoKdqnnefLx6y4JgHxHXRnTmLtB8WS4+
 PLEm7cMjQsg6LsnV0/I5omnBaUXXEBZSQsN8VOowXZFFPPqKf2soXjVhyEh9jS3PfJsn/w
 jZB4ic3AE/5JnSlp7gbH8XkmO3U2S00=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-ctXIyOY6OYWUzzQSfYaDwA-1; Fri, 31 Dec 2021 07:48:06 -0500
X-MC-Unique: ctXIyOY6OYWUzzQSfYaDwA-1
Received: by mail-wm1-f70.google.com with SMTP id
 b20-20020a05600c4e1400b003457da1c91eso7459758wmq.4
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 04:48:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w+4sOFVvGeEBA7BnPdfDCmGmrSKk6Q3SFRcpoINpXLs=;
 b=HX82ryBHU88b+XNI1UVPpKv2sWHkxTWsVvQHLX6Ve5GYqfmisoXvVdNJPoF2Btisya
 LqpjnvOXcz+3GpuGcb0TUodHDfCdPb1s94eaSO4di4GiCJSWRQWp8wq8/yFyvA/ACRYC
 6ikDQ7kCr4OQcfYMKXbqxvzf3nALCl9bSjLM3L6ZhIShlrH92y2tD6i0yRQX25M5i4qq
 n/kgthS/EF7fq+sziQYnfRQVA5FbOSFEb9XY2E0t7jLOOSvj8qJFJOb/H2CR3uJvZnPt
 uyZqc43STx/JjDvYwl6iN5xtyuSaLOFQDuTFBLtblGmECfvmyVhbKXRCRKObV90TEKS7
 bd5g==
X-Gm-Message-State: AOAM532U1Vu+kUBMdM5hKkoY4T6z5NSJyW0ikMci+ZUne18NMa2B3VPF
 XCm7RPhhpeDOm2OrROTiHJLfKuv1axDNMRU1aoRC1T+r2YRayae1ErWNOqrguRkox2mEe4IeFil
 +JCnBzIkQdH5BULInmu8VtL4lRxEyVP9QKiTqr/PSN7OUKhi9dSs/9L45s/1tRH2V
X-Received: by 2002:a5d:5552:: with SMTP id g18mr29566589wrw.488.1640954884905; 
 Fri, 31 Dec 2021 04:48:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLVTENjJV+R2FLSYKqDJYJt9nlJEAyU3i2Iu97NnYhrmRKk/KTo07di/XWcmiH/9jMF9bLIg==
X-Received: by 2002:a5d:5552:: with SMTP id g18mr29566569wrw.488.1640954884653; 
 Fri, 31 Dec 2021 04:48:04 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id r7sm25915338wrt.77.2021.12.31.04.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 04:48:04 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/20] hw/qdev: Correct qdev_init_gpio_out_named() documentation
Date: Fri, 31 Dec 2021 13:47:36 +0100
Message-Id: <20211231124754.1005747-3-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231124754.1005747-1-philmd@redhat.com>
References: <20211231124754.1005747-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

qdev_init_gpio_out_named() is described as qdev_init_gpio_out(),
and referring to itself in an endless loop, which is confusing. Fix.

Reported-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Message-Id: <20211218130437.1516929-3-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/qdev-core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 59a822ffceb..dcf20c69b89 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -621,7 +621,7 @@ void qdev_init_gpio_in(DeviceState *dev, qemu_irq_handler handler, int n);
 void qdev_init_gpio_out(DeviceState *dev, qemu_irq *pins, int n);
 
 /**
- * qdev_init_gpio_out: create an array of named output GPIO lines
+ * qdev_init_gpio_out_named: create an array of named output GPIO lines
  * @dev: Device to create output GPIOs for
  * @pins: Pointer to qemu_irq or qemu_irq array for the GPIO lines
  * @name: Name to give this array of GPIO lines
-- 
2.33.1


