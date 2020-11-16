Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3442B43B0
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:28:16 +0100 (CET)
Received: from localhost ([::1]:33376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kedcE-0005gW-51
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:28:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kedYl-0001oN-DH
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:24:39 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:38560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kedYj-0003B1-MK
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:24:39 -0500
Received: by mail-wm1-x332.google.com with SMTP id m125so12184261wmm.3
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 04:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/2liRrUwUK/XXyLL2k39bK5WwC6hOMXMLxY6QbrHJfg=;
 b=TGSxyuJroYeBgN20M1A9yZqN45c1gb85AebozfWmW+aCLT9YOx0Zaz+qLhD5pHApRW
 MAkTzxoGGmuf4znMwPIDjZ3xQ16UtFC2UAmFPjC+VdA7OCIIdZjRMIKTZG53EezyfbOU
 NOkJBPGQpCckVBJnYU3Hptvr8dLhPnpvQzq7gnSqsiqQ3xRvgsdPaRdXh0kCi3ziZY3b
 4EeXsy3tQmst6oyMD8A85vUlE+W9ojkH5+DSpNWat8bXwnbgS67pYVw6/maGYRgd9PBT
 NSUMwp4XQk4TkZxzuAeREzNcmsqXbjcC2glsZUmrufiuf0kp4pYjzkNDB0ovP154aF3b
 Cw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/2liRrUwUK/XXyLL2k39bK5WwC6hOMXMLxY6QbrHJfg=;
 b=q2lO53nlC5Y9wNPmnT+PvAC1IBzyk6qRiBwkMECRzeBKSUNeEbMxKl1RyX7EEuB5Bp
 or/qBQvKC2s8yNY/DUvtEKltqrCmicqVa3FGh08ujZw/MhHKJRMi1Y/UGVm1SFr7q1NO
 pBKVgdzbi1smPX+gqHKWXN3TuboshhRTBbkjmv218k73rgxtJsXoKXHvuA39WI/HXlwR
 eBtsm0HNfQ9W4CgGIssq191rGqplAIhA6JsrHzsMHJml5qeyF7o5u2wKeAJROHXZA7FX
 qnk510IKSj7iBHLQVzn/h2D2FgQhNLg0fEydIVRPcZTP/pjtKiSPoS1yjIftJrZY5HBn
 EYZw==
X-Gm-Message-State: AOAM530caLyAEjThpvBPGgsO7Ku2p1E6q7kmBemoEyO0jeaLshMoF2mP
 HzgHFSaFsdm7M9DHEFdDEXdkUw==
X-Google-Smtp-Source: ABdhPJx1E1G0J1VrnrHvywFD7YEQ6RNUvRvywroyxiH0X7Rxdu5BkMBvk/u04t/XorehEMZhgbZmiQ==
X-Received: by 2002:a1c:3d02:: with SMTP id k2mr15760536wma.183.1605529474027; 
 Mon, 16 Nov 2020 04:24:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s188sm19922233wmf.45.2020.11.16.04.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 04:24:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 598491FF92;
 Mon, 16 Nov 2020 12:24:18 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 6/9] accel/stubs: drop unused cpu.h include
Date: Mon, 16 Nov 2020 12:24:14 +0000
Message-Id: <20201116122417.28346-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116122417.28346-1-alex.bennee@linaro.org>
References: <20201116122417.28346-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, "open list:X86 HAXM CPUs" <haxm-team@intel.com>,
 Colin Xu <colin.xu@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wenchao Wang <wenchao.wang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201110192316.26397-7-alex.bennee@linaro.org>

diff --git a/accel/stubs/hax-stub.c b/accel/stubs/hax-stub.c
index 1a9da83185..49077f88e3 100644
--- a/accel/stubs/hax-stub.c
+++ b/accel/stubs/hax-stub.c
@@ -14,7 +14,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "cpu.h"
 #include "sysemu/hax.h"
 
 int hax_sync_vcpus(void)
-- 
2.20.1


