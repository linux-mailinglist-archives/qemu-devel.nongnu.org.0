Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 515C1479AF7
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 14:13:22 +0100 (CET)
Received: from localhost ([::1]:46934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myZWb-0008Bw-FJ
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 08:13:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myZOV-0005LS-D1; Sat, 18 Dec 2021 08:05:00 -0500
Received: from [2a00:1450:4864:20::434] (port=37600
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myZOS-0003A0-3V; Sat, 18 Dec 2021 08:04:58 -0500
Received: by mail-wr1-x434.google.com with SMTP id t26so9397281wrb.4;
 Sat, 18 Dec 2021 05:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JR83GSnIQSf/gotcsojhbGa6MQnVjlAzL2fPx52q0GE=;
 b=XCRRY13YbQg7C7Jfke5MOtxJbewc82LW1pEWww3XqG9HgHyD9jQL+YG0psdUNHHIqO
 0fOWlllFRWQLefRdli8QPet+y2VSYcxJQWv9WIgesIleWdwgQTeAEQGa+m4RnZ4uZvcT
 SxX5h59doT3u77naosGpKbu2TnywB0W6Qo2pRWj5TTZ/+1I00YXCZt2OYgR/4jK2QxS9
 GMYmokIL8i4rIokNnximxChKMpZf/UHmkVbEzBB07K7/YYxWThYE49R4S3Fu9I1+qo4o
 VPAc5VHRpyBVQOYFT9lrfcLM/f8hgBo8iz1Pkt5TkQiEHkuf4h1f9Z5aGxC+VKG/fbgS
 uyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JR83GSnIQSf/gotcsojhbGa6MQnVjlAzL2fPx52q0GE=;
 b=WJIjMyRA6Lczn4gENx/DhIG1H1eL0tQYk/GM2bIiqyrkE9kON3ceMPqpJdxAfMwe79
 3BaUqzLQXDtK8xoc1xmt4mUg7KtzIWOdnHwEYcI4zDmwsQC07LpvfwL1J3eizc4SPrUh
 +VqctUo7GEYT2/268BDvM1fmrSkI750Jha9Qc5Ft5G7B0QhPJ9sagoAtB2B06B4SvB/n
 p2wwdELKKVVTVTbmycZBqMb8FgrH/a0x7IvBGGC9lR8upRCRM88+OiZ9lhtdN5UJfXmi
 xeN4OQw2Is3jNcuAkNTV1hBiLHDG/8JRmwXE6dFi7d0FXbgt5WmM4NXnI25VYeqHzGjQ
 quHQ==
X-Gm-Message-State: AOAM533UqEy6JmjgzmYyjo77aEugUQTOkj/RyqjG8KU2Zx5WRpSW6gNQ
 gaL1DhGuYsas5rmJQ5VWqFpmeLs1qhE=
X-Google-Smtp-Source: ABdhPJwqVcjYRet+XNFh+OWmWl9Xh/+qfKR/gI2eAXg628WJxfVrFxDET7oVLvBWHjjelDa28cu4jw==
X-Received: by 2002:adf:eb05:: with SMTP id s5mr5956723wrn.448.1639832689087; 
 Sat, 18 Dec 2021 05:04:49 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id h1sm10276981wrf.33.2021.12.18.05.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 05:04:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/5] hw/qdev: Correct qdev_init_gpio_out_named()
 documentation
Date: Sat, 18 Dec 2021 14:04:34 +0100
Message-Id: <20211218130437.1516929-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211218130437.1516929-1-f4bug@amsat.org>
References: <20211218130437.1516929-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qdev_init_gpio_out_named() is described as qdev_init_gpio_out(),
and referring to itself in an endless loop, which is confusing. Fix.

Reported-by: Yanan Wang <wangyanan55@huawei.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


