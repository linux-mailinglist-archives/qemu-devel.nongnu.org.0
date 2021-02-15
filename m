Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109E531B6B7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 10:51:33 +0100 (CET)
Received: from localhost ([::1]:41588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBaXT-0008Ot-2W
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 04:51:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaPE-0000An-QF
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:43:00 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBaPD-0004Q0-5u
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 04:43:00 -0500
Received: by mail-wr1-x433.google.com with SMTP id v7so8032080wrr.12
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 01:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v+pQQYBl5ztw5GJ13e1A6Kd/+Ryx35M4zW+3Xp77IHs=;
 b=i5mb4R7BLE/onmVQWHZHE5waYuFRBWkRF7gVU48CwNxCN5Q0ZTBRrXbx25A5G+9cZV
 1L5rnqt6V2biyvn3RAIFku5jYV2OWA4q+PNe1PCpSKyDm+FRHoiiPwRqc15LycpU9sRy
 KweLevimlnZdgrGWM9V+e6EIP9Je0jhqSVrCoEJMUeERHvSQl5LxY4Ul+23YD1PmzcWF
 iOFRAbxfqTz+kCkIn3s0auwt288Mm4+ZtesYZV9H1+tPjwmDQRQI3GVJdkRSkXwDxF4J
 EgcCSz5JxmzTqHkBapM5xVfi9A+WHzoWDjGq2elBV7przaiG2sBHsBE8xlQZtsoi+BUm
 5W1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v+pQQYBl5ztw5GJ13e1A6Kd/+Ryx35M4zW+3Xp77IHs=;
 b=q0T9V5KV9LluFp7CjQGgDbwtiY5HeF4P6VFUv08U4F1BZDhunYXGcq1iLZmD36SnuW
 VSGeN5MUyk/oka8hw3ZwUdCTbJBlse6C/5qaOiTi3GPZusfEGxcIeXmdGj1xa60OSxZk
 ijfHZSgX9CUr39uT0vpUj4oM2GgU6Nd/RPR+t64VJPx/nefsTZOOxR4SGSlnAm5DNeuM
 IcdzrheHfZDn1ENpC2+L/A+HhDbWOaJJNTO+I3JAELAwNYfPn4sPhLIMb1fBKwKvGOB5
 KD6wlAfX7B2QyKgR3I2vmjb3lPIhfXbAwEuiM2JtCRkB4j0ZWhd6GWheP3r+jid/bGqA
 m7nQ==
X-Gm-Message-State: AOAM530WedqcOulMXyYOrHKJiVXZauwa7aNg0PYSzMLzeAP8/FD8DmhU
 8hFhyM4xXAP4IVlBZtwfY9bHXg==
X-Google-Smtp-Source: ABdhPJzJOM33DbMSFUoiv//hSGysuqUhRSgPjVHtLLibBT56qf9Em5DYcWy1E8xjOAbsl57Lo/FhkQ==
X-Received: by 2002:a5d:4582:: with SMTP id p2mr17547205wrq.126.1613382177749; 
 Mon, 15 Feb 2021 01:42:57 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v5sm23431193wro.71.2021.02.15.01.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 01:42:52 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C798C1FF98;
 Mon, 15 Feb 2021 09:42:45 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 09/15] MAINTAINERS: Add gdbstub.h to the "GDB stub" section
Date: Mon, 15 Feb 2021 09:42:38 +0000
Message-Id: <20210215094244.12716-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215094244.12716-1-alex.bennee@linaro.org>
References: <20210215094244.12716-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The F: patterns in the "GDB stub" section forgot gdbstub.h; add it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210208113729.25170-1-peter.maydell@linaro.org>
Message-Id: <20210211122750.22645-10-alex.bennee@linaro.org>

diff --git a/MAINTAINERS b/MAINTAINERS
index 6295dfe781..8201f12271 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2340,6 +2340,7 @@ M: Alex Bennée <alex.bennee@linaro.org>
 R: Philippe Mathieu-Daudé <philmd@redhat.com>
 S: Maintained
 F: gdbstub*
+F: include/exec/gdbstub.h
 F: gdb-xml/
 F: tests/tcg/multiarch/gdbstub/
 
-- 
2.20.1


