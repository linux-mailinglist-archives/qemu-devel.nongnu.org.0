Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC378262DCD
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 13:29:24 +0200 (CEST)
Received: from localhost ([::1]:50510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFyHz-0001ZJ-Rs
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 07:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kFyGU-0008Q6-EH
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 07:27:50 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kFyGS-0006Wg-LI
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 07:27:50 -0400
Received: by mail-wm1-x343.google.com with SMTP id a65so1910806wme.5
 for <qemu-devel@nongnu.org>; Wed, 09 Sep 2020 04:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BRPNz1a1sR08C7hdTMgMEJxgHmTXfMUSkTnilwnfZ1E=;
 b=lQ87BerI/6IInv7C4UVMyrr/koYsPu7o6IJ/xepOPuhg6JsgkiQusgnYfIyKJOI81s
 UEWXUeXrTCDhIYWQQW4XhO/NyLub0eiAgHJ/UmLmsvuog9jtTqVcN8OS9E11GVL4mJHc
 Krj8HQip/EW7yTtor6oVQZcHu8eKtoH1oOLLN5r725Y2fL3HjD3V7MY3PjcgYi804PBo
 31ba175OH+a81gI2v8VG9shuW9TKV4jjg3uP3fRWYVuoercIia7TnvLk1JdV9B8gGvOW
 hk86M+iSgYVjhYrXZh44wIjVbGBp4dBNzZDaUlg+LcZduc4aIGYwzr4FL99VsTD3Y1If
 N1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BRPNz1a1sR08C7hdTMgMEJxgHmTXfMUSkTnilwnfZ1E=;
 b=uINBK+LaNoAr6LhxO8ziaZJOHq31HpH8GYxdob6ZqKDAMr8cmCJPVGXBG+zZpwZtKh
 QeQ5LMO5P8pFiFy/ExfD0g/atksjijMb5KGvJe0KiXn6Mp6Sh7bx3YvDt/Tf7rbzcdoY
 YrCibJlEo4/OzcP/6wnESCWYVkxzVbOrS+CTqQOHv5EnYafM/YTQ93d1MDfi7FyYCgLr
 dXom69MFwOPce1J/5VbnHgyAxI6Sm89l86LtdhB5Jx32UHqqxVThp3F++J4TcPiisam1
 pEtOFXeY0/N4ndDPeH7ZjnWomS8XkFKcpFPtm5bLnraEj5IP+2RWzqJjmBDzqCb0nSXc
 Ipsg==
X-Gm-Message-State: AOAM533JNtfXWoVU/iFm/efhtNwIyNvbI/ce7fel1lLz4aTxSBK4TaWa
 jUtmrupsUaioqp3ycJkRssqKog==
X-Google-Smtp-Source: ABdhPJyijx1br409kH0UsPZnqg1VVv+oB7z7qVREWnV9G8hKjh3Dgc/KhTrfCc7bRHYQFY1yn7D8Wg==
X-Received: by 2002:a1c:9697:: with SMTP id y145mr3052305wmd.174.1599650867099; 
 Wed, 09 Sep 2020 04:27:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d6sm3780191wrq.67.2020.09.09.04.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 04:27:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3CF3F1FF8C;
 Wed,  9 Sep 2020 12:27:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/10] usb-host: restrict workaround to new libusb versions
Date: Wed,  9 Sep 2020 12:27:33 +0100
Message-Id: <20200909112742.25730-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200909112742.25730-1-alex.bennee@linaro.org>
References: <20200909112742.25730-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>, cota@braap.org,
 Gerd Hoffmann <kraxel@redhat.com>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Fixes build failures with old kernels (USBDEVFS_GET_SPEED missing),
on the assumtion that distros with old kernels also have old libusb.

Reported-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200902081445.3291-1-kraxel@redhat.com>
Message-Id: <20200903112107.27367-5-alex.bennee@linaro.org>
---
 hw/usb/host-libusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index 08604f787fd..c5d38cb09c0 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -942,7 +942,7 @@ static int usb_host_open(USBHostDevice *s, libusb_device *dev, int hostfd)
     usb_host_ep_update(s);
 
     libusb_speed = libusb_get_device_speed(dev);
-#ifdef CONFIG_LINUX
+#if LIBUSB_API_VERSION >= 0x01000107 && defined(CONFIG_LINUX)
     if (hostfd && libusb_speed == 0) {
         /*
          * Workaround libusb bug: libusb_get_device_speed() does not
-- 
2.20.1


