Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BDE30880B
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:05:10 +0100 (CET)
Received: from localhost ([::1]:43122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5RaP-0001HI-2j
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:05:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RW7-0004WN-9I
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:43 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:40609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RVr-0006zE-T2
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:42 -0500
Received: by mail-wr1-x431.google.com with SMTP id c12so8391564wrc.7
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vj7rZ69jTyQWeBFA+qT+x/s0CHWbrwOg1pCiOTgesBs=;
 b=JdwpUxM/pyCCA1vLBr5vkjKxDrQohLe9ektaVJSBUZz3Gaczp4G/CqzieovXsFEkJC
 b91IsjCf8/Z7dKAQGZKP4InG+rbX/E+aMfQf8VJpcJHLM7VKAQv/KdC86ycf8Y/75VbE
 gVrEhZvFlfTVWpAcb9InI9PCPtkYsGOBUBUnzzm05vdGYUla7xo4EMmwmS+iG/z7kjq4
 aWgXAgMzSrAbClHUFJATAXVH2ht1ZR+Pg5kFL9nh8DdOMsHT4eiJEMWM6mAlz/Knoq47
 gtc92lKQyauHpqcRuUGNDnnpMzBYXNy8KxcAA7IBpT9fnah4Ta0B4I737eUYZrPkWHQm
 fjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vj7rZ69jTyQWeBFA+qT+x/s0CHWbrwOg1pCiOTgesBs=;
 b=gYNFIfJm7uKVqr/SyEfbvxHMOGn8CdichqQbig+JGmUxV/U4O4xS7m4nvuysp6y5fg
 pPP5WUx1vst7uqpBIs8Zd/Q+fXLkSGOmdziUvw7gDfAx10fDOtVt/bZadPInGeOz60Hb
 /gEAhPj64Eg/pPm3T4zKNdDh+2P3O3Bo/KELmIJxAh63T70H6GhjlhGbZFB3SBAzCzEV
 a77BpFgLLU7deOSNRtjhNm9JDRmh0QcjVYiD3dokQqSGJXwFYhV9EP162cQ+5HalT+aJ
 EoyL4TE1CkCnBWHMrfqzN9vQ2XN5qnJo5ntrQ1J72vcELH84cBgB2BTEv0luXRzHKFx4
 CinA==
X-Gm-Message-State: AOAM533S3eGwbl+NCp7ZvR0SkaEuUn9BobTq6NIR5oU29w68TXGqrbcn
 kFfpAoIy9r5+VhGb8leJMCl9oaph8U9TXA==
X-Google-Smtp-Source: ABdhPJy1ATejZdRdv3D1jLSOzoQ0O5C81yBpp90t1Z5pPDSxjWCikFEpzseov7vN77+Su6ZPTi7ZDw==
X-Received: by 2002:adf:e807:: with SMTP id o7mr4079913wrm.308.1611918026068; 
 Fri, 29 Jan 2021 03:00:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/46] darwin: remove redundant dependency declaration
Date: Fri, 29 Jan 2021 10:59:38 +0000
Message-Id: <20210129110012.8660-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

From: Joelle van Dyne <j@getutm.app>

Meson will find CoreFoundation, IOKit, and Cocoa as needed.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Joelle van Dyne <j@getutm.app>
Message-id: 20210126012457.39046-7-j@getutm.app
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index 997d83a2ad5..cd44b21149e 100755
--- a/configure
+++ b/configure
@@ -780,7 +780,6 @@ Darwin)
   fi
   audio_drv_list="coreaudio try-sdl"
   audio_possible_drivers="coreaudio sdl"
-  QEMU_LDFLAGS="-framework CoreFoundation -framework IOKit $QEMU_LDFLAGS"
   # Disable attempts to use ObjectiveC features in os/object.h since they
   # won't work when we're compiling with gcc as a C compiler.
   QEMU_CFLAGS="-DOS_OBJECT_USE_OBJC=0 $QEMU_CFLAGS"
-- 
2.20.1


