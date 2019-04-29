Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0858DE891
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Apr 2019 19:14:37 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60764 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hL9rQ-00073a-4E
	for lists+qemu-devel@lfdr.de; Mon, 29 Apr 2019 13:14:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34286)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL9em-0004oY-Rj
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 13:01:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hL9ej-0006hs-Fm
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 13:01:30 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37625)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hL9ee-0006aF-G3
	for qemu-devel@nongnu.org; Mon, 29 Apr 2019 13:01:26 -0400
Received: by mail-wm1-x329.google.com with SMTP id y5so181206wma.2
	for <qemu-devel@nongnu.org>; Mon, 29 Apr 2019 10:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=luU30WIV4J70vMiJWjUk2cVkk2BUzHZfTmZdJYfZNRI=;
	b=APVdDphlXN56H1vcwX09xSQeXPcdxeoQ+qrfEaW4qiONKp9xA6n96xTXKkOm8O5WyD
	gOsrctD4pl+Nu10OmNh4iQDuWAF7RJIljMse31kn8PeqLy9qjJuZYII1uWGBdQtTsIqI
	rMRGKP0+4FbfDL/y6NygX5PdP4xCjYo8VHovqyJ7IncttJVzcjARWxhskBq4UzDX2nK7
	0gTOUVYDIS0fYOMOuH5Uh/WL0dVhEYZvQZ1DPr3SAZXGhqoonA/j78vR6umy3tvD7ibY
	XLkGnjDTic7YS7uD24XvenK7EqFbQ5gDxQ5ul62m3sJpGgQU4BFKOExByPRKCVlcgcJp
	XfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=luU30WIV4J70vMiJWjUk2cVkk2BUzHZfTmZdJYfZNRI=;
	b=ahtwe9Kqdzd8SMZlwCBhAk5BvWzq3dDYL5/JIhpfWmP9VXztWydv3WlPgdB5YjFM62
	bV56EXMZ4ct2oCleTEBc6NNJ/bYhJrYF6YmJk75yKpjcsf0Lg0LAkTQ2zylf29AWegdp
	if9fmOibD2hYC/11SGsImMO5SRO3SoSeWn1S97SnP99esELnKkQ8vIlvYWrED5FQE4xp
	MKzrZRZvZZyXep3l+5aHGhiz/MjBK84+t2P+IN6m3InuUwCZ+Zlrmq76M4rxKOB4vsHL
	klRwpsSguhUFNYHolyzlMqIqOYWS5T6CSe9bU1Jyz9lpcFWR3kJwIfqb27DXaRE0Mrpz
	e2mQ==
X-Gm-Message-State: APjAAAXSCzqG1OTi8ctTjM8tQpjQ2A/kcv9VhMxte/w+Ciipeh4zLqeQ
	0I91e9q13uQ1xgPC2Y8O3YwDQisIYkI=
X-Google-Smtp-Source: APXvYqwnc2FzJkeC+BzdiaFIKDMdHCBEKzW671Q1QNVQyS21VmH3dbxgLG0BcOJ4AVCalFQb5XSL5g==
X-Received: by 2002:a7b:ce06:: with SMTP id m6mr53541wmc.62.1556557271360;
	Mon, 29 Apr 2019 10:01:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id a13sm36896wmj.39.2019.04.29.10.01.10
	for <qemu-devel@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Apr 2019 10:01:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 29 Apr 2019 18:00:18 +0100
Message-Id: <20190429170030.11323-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190429170030.11323-1-peter.maydell@linaro.org>
References: <20190429170030.11323-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::329
Subject: [Qemu-devel] [PULL 30/42] hw/dma: Compile the bcm2835_dma device as
 common object
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

This device is used by both ARM (BCM2836, for raspi2) and AArch64
(BCM2837, for raspi3) targets, and is not CPU-specific.
Move it to common object, so we build it once for all targets.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20190427133028.12874-1-philmd@redhat.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/dma/Makefile.objs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/dma/Makefile.objs b/hw/dma/Makefile.objs
index 79affecc390..8b39f9c6004 100644
--- a/hw/dma/Makefile.objs
+++ b/hw/dma/Makefile.objs
@@ -14,4 +14,4 @@ common-obj-$(CONFIG_XLNX_ZYNQMP_ARM) += xlnx-zdma.o
 
 obj-$(CONFIG_OMAP) += omap_dma.o soc_dma.o
 obj-$(CONFIG_PXA2XX) += pxa2xx_dma.o
-obj-$(CONFIG_RASPI) += bcm2835_dma.o
+common-obj-$(CONFIG_RASPI) += bcm2835_dma.o
-- 
2.20.1


