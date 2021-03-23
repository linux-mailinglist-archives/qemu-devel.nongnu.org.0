Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6F3346652
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:29:15 +0100 (CET)
Received: from localhost ([::1]:55734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkqA-00077s-EJ
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkN2-0007HS-HW
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:59:08 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:44817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lOkMt-0005zY-IQ
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:59:08 -0400
Received: by mail-ed1-x535.google.com with SMTP id j3so24233302edp.11
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2RQ+nQcwf7xx2lvmkjpYyMsPqik3t9vcywsUhJCTzI0=;
 b=GSf3oUfr0gEm/K5/+hSYB/THlBvuuWfY2s718ZWQMO3s/FrNW+UUgL8unYufLFGwZX
 iV1Wq5q2hwdy+O5HkS1m1bzvLDbv14d66noa3QhEYSnln6mkQCXzyKNBc7e6haQtJnA9
 T5Em6nB7hrwg9HAVgpuuMpeXOCtYJhhc3O+j0mKF3zX6UKUYCcGV78gw5k56Ez1cdBZi
 jeeiA+xO4y8D/XZ7I6sZyHmuviy9E11L4WcBGYk8ykfBCfpA1ZfgKczC1meBe2nyaRXa
 +8IKgugD1+riKWYM4YAofFFI6OnmwtrFD6t8WUs/pU6ABK+IhZcvHX3iWw3+k1sPkZwL
 /cBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2RQ+nQcwf7xx2lvmkjpYyMsPqik3t9vcywsUhJCTzI0=;
 b=PcxL1l1+KyreWviMAoQjijkFMF1NHoKXoJhBbcnurS9YWrxmNh2flR+R+0mOssNe/J
 iYVOidJaD4RL+5x1DXxNVTfGqS8WRcAHxSRcgHsjkaF9sAqplDNM0vkODveRaKILKxg8
 k+6VbTM640gahEQ5wD+Y0wOZIxoEj/M8M4Ksf9X5WXkVIoj38N3gvSrP4Ti2fgHpOLVX
 KUHu3GHY/MaEgDs70DVqb6ahM8TpemFpQRTh2z42I/mp0I/DZjUt2UkRhqZJzClThu7d
 ANAV5c0jeAEl3oQUKG9+FGKzDXnFeijthZ1YQJ0GHIqMX/x1q/uDJCxuIr+LsBhmNKvS
 6Y6A==
X-Gm-Message-State: AOAM5331Y59l6uw52v3seAqrKj5dLl4bhwyMzXyFf4+vdqTnEHh88cLD
 tTmF6PK/XQ5xoLT+5oD5vKwfgg==
X-Google-Smtp-Source: ABdhPJwEa7KNtu7TJQgB15Bg62tffIRQYO+xOu+RqbVjDYiTPa+1RAy6IDXPe1W/AY7dVcL26q7dJw==
X-Received: by 2002:a05:6402:c0f:: with SMTP id
 co15mr5430904edb.373.1616518737687; 
 Tue, 23 Mar 2021 09:58:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g25sm13077682edp.95.2021.03.23.09.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 09:58:56 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AF39B1FFA6;
 Tue, 23 Mar 2021 16:53:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 20/22] iotests: test m68k with the virt machine
Date: Tue, 23 Mar 2021 16:53:06 +0000
Message-Id: <20210323165308.15244-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210323165308.15244-1-alex.bennee@linaro.org>
References: <20210323165308.15244-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <laurent@vivier.eu>

This allows to cover the virtio tests with a 32bit big-endian
virtio-mmio machine.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <20210319202335.2397060-6-laurent@vivier.eu>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qemu-iotests/testenv.py | 1 +
 1 file changed, 1 insertion(+)

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


