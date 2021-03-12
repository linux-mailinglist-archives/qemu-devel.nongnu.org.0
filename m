Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2A7338F66
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:07:08 +0100 (CET)
Received: from localhost ([::1]:53334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiRX-00041t-8W
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:07:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiD4-00031M-5x
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:11 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:45468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCr-0001zR-Vu
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:09 -0500
Received: by mail-wr1-x442.google.com with SMTP id e10so4838203wro.12
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=AsL1PrBRpujejg0f+08oDSWEyJxouf/I64Oyg9m102M=;
 b=ghmlhG85L3Pxhzcc8vaNpsYwhU6cx2ZhdAC+dnEThfIfrWgCrY6iBeekx2g34MBCCh
 2w0b2OkRvPo256KtSkVLqFzbrlaFfrZswC4KzJt8A3jjP2Muw9q5bvuXmxL9q27gszyQ
 61rlBcrF2koTi3yi8DFQxSvkUYaYbROEk+P6Afnc49UxaUTFfqK6mRQXO9EuGQbUaj/o
 BoskcrQwYUniNVW8xfw+dc+0GnUoCa1jo+VlrnwGEPgakxKbXxFM4m9ixrMVbVAGfSyS
 dG0JsoZyS0mwI7LFjsQbghIcoCaPC1IQW8nkIcCruaFTQtJ6S6of999pjoLbdeKGdhv1
 tvzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AsL1PrBRpujejg0f+08oDSWEyJxouf/I64Oyg9m102M=;
 b=gaeb9l54qQTv2xyVr2MJF4s+voGPa0xZT/N7bPt+/1Kb2Tey1KOeElrPCOokD3fi0B
 B7/Fz/YzdQsOWf3dbP1r4ts5BBcp20AxOklkDqw+TTrzdU4bzEmIDtpE0WnKHsulzFay
 QQaNXsAmGvzHBATSzrg5kbQ6QIY+ek75ywf0UC4092euYJ9JcRZNzz5oz9BzY8XKD+8I
 KWtiT+SWqsDHxBnZSz0HmMP6eHBObSUdJs6uJ/UttQcEO/+pRrZ6zz+umLQtUr8DG0xG
 DSpo5OQDbbS8DKV+kRFqHre7vaiZFXxEIv+GvZWKLLahGSpd1EjlC+UWOXiqK2RDsk4+
 ibGw==
X-Gm-Message-State: AOAM532ptnDIuGeSe8krGkeW35QqIArLhAhlQlu3OkthhgeTWEUbGCry
 WN1YSEfI4p8WRZTgIM5OeK+/BYOzLqTXxkcf
X-Google-Smtp-Source: ABdhPJyjF2WmatySbsLgX0ZluIEJNLC+znxU7f4WtLby5UDIo4hARkphO+s0bvDlux4G8Z2Bi6NGbw==
X-Received: by 2002:a5d:684d:: with SMTP id o13mr14587147wrw.235.1615557116186; 
 Fri, 12 Mar 2021 05:51:56 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.51.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:51:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/39] tests/acceptance/boot_linux_console: change URL for
 test_arm_orangepi_bionic_20_08
Date: Fri, 12 Mar 2021 13:51:21 +0000
Message-Id: <20210312135140.1099-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
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

From: Niek Linnenbank <nieklinnenbank@gmail.com>

Update the download URL of the Armbian 20.08 Bionic image for
test_arm_orangepi_bionic_20_08 of the orangepi-pc machine.

The archive.armbian.com URL contains more images and should keep stable
for a longer period of time than dl.armbian.com.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-id: 20210310195820.21950-4-nieklinnenbank@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/acceptance/boot_linux_console.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 9fadea99586..4a7a6830ca9 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -816,7 +816,7 @@ def test_arm_orangepi_bionic_20_08(self):
         # to 1036 MiB, but the underlying filesystem is 1552 MiB...
         # As we expand it to 2 GiB we are safe.
 
-        image_url = ('https://dl.armbian.com/orangepipc/archive/'
+        image_url = ('https://archive.armbian.com/orangepipc/archive/'
                      'Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz')
         image_hash = ('b4d6775f5673486329e45a0586bf06b6'
                       'dbe792199fd182ac6b9c7bb6c7d3e6dd')
-- 
2.20.1


