Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E55D3347AFC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 15:44:46 +0100 (CET)
Received: from localhost ([::1]:55108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP4kX-0005Xd-M8
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 10:44:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4f0-0008VN-NQ
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:39:02 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lP4ex-0003NB-L9
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 10:39:02 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so1340092wml.2
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 07:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+kUQYhzIpYJedPSa1pUwupzboguGi6iQwNCx5cgFBSM=;
 b=XYKWiFiMwOe/P4IPvxODhvJWe394eaNO0TGMcfeofKmHnI7PSl+vaT7qdJ5UDQR5D8
 IYXDD3qdLwUHv0ZLv8Z4cAftRF74BUUo6/NLy3SNouIKD2jhFxaeDlQSJ1h2Ctj+SrSS
 UVZcEV1Z4iITU/VCqoeU1M6MukF4ZouUAdxc/Srj5SYNov/7i1qlPfdqJz86St4crLBT
 Nlr/LrNxr3Vg+f05c9IOHnyRJqgjewcTOSh4sp6akVzeUCAe/WsjPm+ZfrnQsofV+vVS
 GSlIkXps6YMdWI/S5SEXVlLiMi5kyu693grHsgsyTqs+eA+IwizEZ3OnHTvE1Uv4ezOu
 NlDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+kUQYhzIpYJedPSa1pUwupzboguGi6iQwNCx5cgFBSM=;
 b=eYv6HelVD22VwFu6tXdR3KS09d1Yabw03O5qt1SYZ49P20ghWeAGuqKHPS5F3Vjpmv
 Nhda006eajd/1EX+k9H4yVPWh1LK710XQ6G7nXgWeU7OiC5GUeYLHl1hPC9vnxUx1cDY
 fRMNpwqZoJ8u13yT07OpDm4NVkY3p9/K4lDsq9A9GdfMxTDuWbNVtYvhISeMFFEGQfGp
 7b8bg6K3lrDpiJyThkdHTCNPIdZETdlLIy6EBSJsuml67OQvMJuHHWs52oi8uGmIbDQ8
 WS0usF3jmKssIFhyi/4kCAccsS1FJxEZc6oafMqyJ8QMjSZtaif9aGg6w+bY9kQSAwfg
 X1Hw==
X-Gm-Message-State: AOAM531TtLHfggaki0fBwOkoMKbOhwhpmusVk3/HEw7uKOozkZZsZU/Y
 hLY27saLTV0Qp63RTUElPHJXHg==
X-Google-Smtp-Source: ABdhPJwYpCddi91wNbvn0q3wyqvwPS243Zb/duKTgPlRJinQm/iB6+ZqqDJwLjlQ+tSuSIq1AQqbXA==
X-Received: by 2002:a05:600c:b57:: with SMTP id
 k23mr3167995wmr.145.1616596738220; 
 Wed, 24 Mar 2021 07:38:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a8sm2534265wmm.46.2021.03.24.07.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 07:38:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B0CB31FFA9;
 Wed, 24 Mar 2021 14:30:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 20/22] iotests: test m68k with the virt machine
Date: Wed, 24 Mar 2021 14:30:19 +0000
Message-Id: <20210324143021.8560-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210324143021.8560-1-alex.bennee@linaro.org>
References: <20210324143021.8560-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <laurent@vivier.eu>

This allows to cover the virtio tests with a 32bit big-endian
virtio-mmio machine.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20210319202335.2397060-6-laurent@vivier.eu>
Message-Id: <20210323165308.15244-21-alex.bennee@linaro.org>

diff --git a/tests/qemu-iotests/testenv.py b/tests/qemu-iotests/testenv.py
index 1fbec854c1..6d27712617 100644
--- a/tests/qemu-iotests/testenv.py
+++ b/tests/qemu-iotests/testenv.py
@@ -208,6 +208,7 @@ def __init__(self, imgfmt: str, imgproto: str, aiomode: str,
             ('arm', 'virt'),
             ('aarch64', 'virt'),
             ('avr', 'mega2560'),
+            ('m68k', 'virt'),
             ('rx', 'gdbsim-r5f562n8'),
             ('tricore', 'tricore_testboard')
         )
-- 
2.20.1


