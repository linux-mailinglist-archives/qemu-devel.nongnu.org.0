Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB43135B36
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 15:20:58 +0100 (CET)
Received: from localhost ([::1]:32982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipYgC-0002NA-Rt
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 09:20:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58900)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1ipYeP-000112-Dz
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 09:19:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1ipYeO-0005Vl-2S
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 09:19:05 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:34206)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1ipYeN-0005Qk-Nb
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 09:19:03 -0500
Received: by mail-wm1-x32b.google.com with SMTP id w5so2160959wmi.1
 for <qemu-devel@nongnu.org>; Thu, 09 Jan 2020 06:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3k7gte9WREY18cEOUU7XwV2AOEIeoNTewUOHfyj7Npw=;
 b=uzJiTLoXKQ1OA9e9KQbGAA9Pgcz7Mu4Ae9h7741IdXM3hHUdZu11pf+qVV7Cz4YJq5
 qXv9hpUMd3tGIA021LR3GaJaVhn7QRbK520lbZkv6cLHVqu/yqbvpc/P7JKAzFIFI0Wd
 e/7uyJh/q83ueI0Y9rxPDc7vTOkAuAJF02fgd7h9xHvcxfR8FxMXHRp4qNdCiid6/T7O
 xQMoPBerqHofsrPBg/FzwCQBceIb+WOWCqhAzNj3b99O6E0irjcDTuQ+LMyhxXF4iviG
 HuGv7doxlQ2Gjhydaqoxd7cmLW3IWglJxuThrVWVjvKKPkO4EqfRsY2mld5wxJ1yA88i
 o3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3k7gte9WREY18cEOUU7XwV2AOEIeoNTewUOHfyj7Npw=;
 b=N6N/w5InttTPii5hKr9ly6Dpfn1u3wqpK6yKF+6c/UDTZfuWANOAcqRPUUJr2u3n7K
 KyD2l4hfunPoS0F3DmVH2Zs2jExJG7w33/VG0HkxAwYMVN57zzkRu+jyaumw7goYWaMG
 d1lW1AqiD7+kz8nlvbCsWbLUPrjG+3e1nSc4kIy9FqkPN0jKPZjaWDsuZ7rDq4O6tWoL
 jxdINpoDZpPH/mqbgqf+XIMgWHrG9o9V2/OAFUsIZoTMLZP+/IEnZ6BiYZeG30NJ9RC1
 mIzWeeHngCIsq1aMSEW5CzRK3/4cJJ3PshGJc6FSuv4MyFPmxfUsvJGBTkYJNazVflsC
 21jA==
X-Gm-Message-State: APjAAAWkN1jdujE9l/v1ntefCGp7ciq+6qYOyA/XWO9yN91TOGVmnOIH
 HAwMy8JYpAQ3GOGZve+up1WdPA==
X-Google-Smtp-Source: APXvYqwDguHVDQKFsOBV8BYxmTTrNUGRkHvLELLQGi5Cn5L9bDPOlku1OEvLVunSAjeSPGYhYvrKDg==
X-Received: by 2002:a7b:cf39:: with SMTP id m25mr5329169wmg.146.1578579542651; 
 Thu, 09 Jan 2020 06:19:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f1sm8200403wru.6.2020.01.09.06.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2020 06:18:59 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 21F561FF8F;
 Thu,  9 Jan 2020 14:18:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 02/14] tests/vm: update openbsd to release 6.6
Date: Thu,  9 Jan 2020 14:18:46 +0000
Message-Id: <20200109141858.14376-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200109141858.14376-1-alex.bennee@linaro.org>
References: <20200109141858.14376-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32b
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20191018102443.26469-1-kraxel@redhat.com>

diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index 6df5162dbf4..d6173506f78 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):
     name = "openbsd"
     arch = "x86_64"
 
-    link = "https://cdn.openbsd.org/pub/OpenBSD/6.5/amd64/install65.iso"
-    csum = "38d1f8cadd502f1c27bf05c5abde6cc505dd28f3f34f8a941048ff9a54f9f608"
+    link = "https://cdn.openbsd.org/pub/OpenBSD/6.6/amd64/install66.iso"
+    csum = "b22e63df56e6266de6bbeed8e9be0fbe9ee2291551c5bc03f3cc2e4ab9436ee3"
     size = "20G"
     pkgs = [
         # tools
-- 
2.20.1


