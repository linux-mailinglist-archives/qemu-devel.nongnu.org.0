Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39215D617B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 13:39:16 +0200 (CEST)
Received: from localhost ([::1]:47966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJyh1-000284-1f
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 07:39:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46910)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iJyCF-0008C9-77
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 07:07:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iJyCA-0007ii-DP
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 07:07:27 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:37596)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iJyCA-0007he-6W
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 07:07:22 -0400
Received: by mail-wr1-x441.google.com with SMTP id p14so19204081wro.4
 for <qemu-devel@nongnu.org>; Mon, 14 Oct 2019 04:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+LPt3b3VuC6svudCo6yMH9K5JcQPfzp2HiF31OZ0ieU=;
 b=WzQLbqoqArxZufhYS7ArUwASH2OjhurVWNddGvFoApijftex9JZ/IwH0swe9EPc2jg
 Hq+3Uah+3jpZAuCN2x72IrYzt1nbq5czI4F/deGu7szXye7QNd47Q00/vQvkNVsPlarc
 OzGaYG9jSDe7cSXcr07bsKgt4mrS6M2OXfED97MHlfzgpz+gYWgsS1DwcjQtU8Obtk7G
 hyyLS9DmiyTWg9bHJLlcQYRqv4zC+ObFRVj8GKVViqfb6T9Ya7x0o/TJZJrt7u5Cdupy
 PHjnBhwcIOxIQ00ZJlm++we0UpvGoTIVP/tsNK6sIl/N9WoCp4dSG/CTLFImDDps1Z3J
 AqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+LPt3b3VuC6svudCo6yMH9K5JcQPfzp2HiF31OZ0ieU=;
 b=lUWHdREO8d4LEdKm6B/CUAnHUpAnc0vMYoAgGg29WdZAr+IN9WLXlYeUMFg0EYidWM
 87aQZvz8GkAsz9yc62/2MKqUPot9y1pHUuZXmSwkBLBuNSrOrRhMkTlJbQxSi7TPBzd0
 u4eqdTZ2JOpVqP+MvtIm3oiktKYnP7QEb7aV81mL0QAJsfskJBeLMuCtegvBVISGmqZo
 Zbne4mlVVBU4YI9bgnGLFdL4+qWTNAvHR1bvNB1Sovhm2ubVmxFq0Rf5mLoEk00VaYdH
 vR83NrR9JoASa1Y85DrGPuDUcBx6yItVsL5THcxeHFz/MyJw+lPqZdLO8jGWDXkhclOz
 1tig==
X-Gm-Message-State: APjAAAWeP6gMBIIBjHJnB3o8fMlDyEaYHP+Q/jiQYXjFonj80IteLA1l
 aPETpAP4ZxSsEz/gj0Z8PceBv8+5kcU=
X-Google-Smtp-Source: APXvYqzSDZvHy+aTf51uIZFIlB4PBsXi01EUpUar/UQB/DxSFXU2OVdDbrATqawu2uIAddeC3YeZ0g==
X-Received: by 2002:a5d:4bc4:: with SMTP id l4mr26150521wrt.146.1571051241137; 
 Mon, 14 Oct 2019 04:07:21 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o18sm46201598wrw.90.2019.10.14.04.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 04:07:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 27AE21FFCB;
 Mon, 14 Oct 2019 11:49:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v5 41/55] tests/tcg: set QEMU_OPTS for all cris runs
Date: Mon, 14 Oct 2019 11:49:34 +0100
Message-Id: <20191014104948.4291-42-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191014104948.4291-1-alex.bennee@linaro.org>
References: <20191014104948.4291-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: robert.foley@futurewei.com, peter.puhov@futurewei.com,
 aaron@os.amperecomputing.com, cota@braap.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will important for ensuring the plugin test variants will also
work.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/cris/Makefile.target | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/cris/Makefile.target b/tests/tcg/cris/Makefile.target
index c1173ead42..24c7f2e761 100644
--- a/tests/tcg/cris/Makefile.target
+++ b/tests/tcg/cris/Makefile.target
@@ -47,7 +47,7 @@ CRT_FILES = crt.o sys.o
 	$(CC) $(ASFLAGS) $< -o $@ $(LDFLAGS) $(NOSTDFLAGS) $(CRT_FILES)
 
 # The default CPU breaks (possibly as it's max?) so force crisv17
-$(CRIS_RUNS): QEMU_OPTS=-cpu crisv17
+QEMU_OPTS=-cpu crisv17
 
 # Additional runners to run under GNU SIM
 CRIS_RUNS_ON_SIM=$(patsubst %, %-on-sim, $(CRIS_RUNS))
-- 
2.20.1


