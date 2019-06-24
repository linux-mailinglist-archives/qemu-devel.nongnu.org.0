Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C130750D80
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 16:11:09 +0200 (CEST)
Received: from localhost ([::1]:51498 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfPga-000051-PJ
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 10:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43884)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hfPP4-00060e-Qw
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 09:53:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hfPP2-0001Cv-OV
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 09:53:02 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44304)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hfPP2-0001Ae-HD
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 09:53:00 -0400
Received: by mail-wr1-x42f.google.com with SMTP id r16so13983376wrl.11
 for <qemu-devel@nongnu.org>; Mon, 24 Jun 2019 06:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AuGWXO++XORyc/3VqRL/LyTlB90VYc261lGuzU8sLu8=;
 b=PBe2eunJi1FJ7i0Y3uk6JPnhhjoft5fr/USyTKYtpBJ7arsQ2vUwRr233li5+QaefU
 lIp7RUsyUwkas8qwVixCbZJ/D7SkxihTOWGx24q5EU+2q4Iis+ts6YB6NpuL6CvWyNdr
 hF7iSzXLaDlC3+GpLPzyYYEffBFq/M9JzL6FMWMXDOMcWIK2h5NJkRKWC32+m1+w5p/E
 oyvf/uk0JX2lo2AiWvSNignxdfRiyP9oxOhtsQ4zN5LoxvXvdtTEGGa6KM9KeKiNI4bk
 V68+fl13zcXgbRoG2LPTaIgo/0kXPEuNITLkpswCKX8zj2KQWDy/WpXA9JmUYcYGTzaN
 Gb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AuGWXO++XORyc/3VqRL/LyTlB90VYc261lGuzU8sLu8=;
 b=QNVNfV0KxfLeDAdaYK3WD+7o7xEeUUBENzzyWOVJmTNuHqrOK4wxVtqAF/qMXQx1er
 gM2qfttfKIwPBicVwLUwOSQyTX2DqgljFqVZOd3duy6GFeWUhUITLsV4BT2MuUkAZm7e
 sP88XGNG5ApsBwd/oROAGRpDb/ZRT9YkTImfTu6Nuc4LwjecWGBnNPa+cJQ0TFPhyPCk
 nCgMt7hPOmtJ2mvNIxcAzSzIj2ziVip5cznn1NWk2uFI5wMzyElqAk69QIS0CJBrThhQ
 fx8d6N6kml7LuBen7+kP8Xq9FRsTLg98quRqDPbCbDOS5WoJxv6zgixNk6p1W7wrDppq
 PIPQ==
X-Gm-Message-State: APjAAAV11cIrltQkHmEYG/aSVaYtwKKsXzph1Z+VxEoXWfu4AMS1UnCn
 TUKbdpdwTPsneZUs8lkl+djurg==
X-Google-Smtp-Source: APXvYqytidLDUCp91smjbqj4P76G8ebSTLjXBUpO2cMC/5wzjf8Cd9hYI1UESEUZueaewBK6IhFtZA==
X-Received: by 2002:adf:f7c8:: with SMTP id a8mr43492077wrq.246.1561384377841; 
 Mon, 24 Jun 2019 06:52:57 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id h84sm10583658wmf.43.2019.06.24.06.52.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 24 Jun 2019 06:52:56 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D95C31FF9F;
 Mon, 24 Jun 2019 14:43:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Date: Mon, 24 Jun 2019 14:43:34 +0100
Message-Id: <20190624134337.10532-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624134337.10532-1-alex.bennee@linaro.org>
References: <20190624134337.10532-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42f
Subject: [Qemu-devel] [PULL 16/19] .travis.yml: default the --disable-system
 build to --static
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's fairly common to build qemu-user binaries with --static linking
so the binary can be copied around without libraries. Enable --static
in the default qemu-user build to cover this.

There are other qemu-user builds that use dynamic linking so they
should catch any problems there.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

diff --git a/.travis.yml b/.travis.yml
index aeb9b211cd..9750dc905c 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -80,7 +80,7 @@ script:
 matrix:
   include:
     - env:
-        - CONFIG="--disable-system"
+        - CONFIG="--disable-system --static"
 
 
     # we split the system builds as it takes a while to build them all
-- 
2.20.1


