Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D65C8298BAF
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 12:19:29 +0100 (CET)
Received: from localhost ([::1]:45200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX0XA-0001BS-RA
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 07:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kX0He-0008G6-65; Mon, 26 Oct 2020 07:03:26 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kX0Hc-0002d8-Lk; Mon, 26 Oct 2020 07:03:25 -0400
Received: by mail-wr1-x429.google.com with SMTP id x7so11935707wrl.3;
 Mon, 26 Oct 2020 04:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yrIfSe6YicHcmNa56yOajmgv3h3ly3b3aUGVmAig4lI=;
 b=kjc/4RFE5iK3HHoKlDbqjcnlyim9wIhQpf5LzbcLMfBew2cg/MEkszynKYCplZMMdv
 BiDNzy8oZbG3x72qf4q30ypL9xM81FvkUt7GdIBBHbTUjppYGBF6d2pCRdtMYO46yNCq
 HEOSAfbyaElweX2waulKR1jQ/BhIXv6gcw70mdaI/YDnz0UMxobvebs9O1fnM7aLdDMe
 bdvz2+qxuSVuK3h96seYoo7hxSj0p8bkTsqiqZgcE4MB3z5dMeAH6syRcrdrSp50E86h
 TOu6xmhVtsmnq1RqB8jV6NsJWSiPrndylItjmatwh41r48DbsM26tW4Bq6S49Ri4Igfl
 nRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yrIfSe6YicHcmNa56yOajmgv3h3ly3b3aUGVmAig4lI=;
 b=tfWpSG6tqXJARUmOqQssYrYRQRBoawxOPu777pkyZiVmpjLGhVaojgWPKXxA/Qj8Us
 v40M/4w66+X4rlyIZvOd9wgi/3FQEuasGCXPd805i9QmR+XzBAT+86jBVr2PUuXNpDcl
 v+40oHpoulGpOikCq/XU6bEor7xNLI3uIJt29gavv/vaP/+E8GtH34eMPGQ6RaFiNdrR
 4HETthl4gshpA3ZOKwlSL2liuG8O5vUGLdZOpVVItAJPuhtE8gbPQKtwBvXMmaEiE/Y5
 +/C2/yqMCG9eISOt2CnyleBePHqru2pgrgpOdnpQNEhkWmaH81tjQ/qmfdpJx0vHitLa
 fxKw==
X-Gm-Message-State: AOAM5313pDgLeFbAVquj60plTX5SLjPaA07T92Swk/uM3OTKQCc4JsMr
 ji/1XoRjP6cwJjeJ26CYmkStCqHoDF4=
X-Google-Smtp-Source: ABdhPJzCxwyFqVQw/x5Cl5hWncgMKCklk4TYvbavJ3Vxcq64FiMZgKkzI7R5qC1Rs8NKZbXH+2YLqQ==
X-Received: by 2002:adf:f44d:: with SMTP id f13mr16484159wrp.385.1603710202607; 
 Mon, 26 Oct 2020 04:03:22 -0700 (PDT)
Received: from localhost.localdomain (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id x64sm19263766wmg.33.2020.10.26.04.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 04:03:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] hw/sd/sdcard: Update the SDState documentation
Date: Mon, 26 Oct 2020 12:03:11 +0100
Message-Id: <20201026110315.4026183-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201026110315.4026183-1-f4bug@amsat.org>
References: <20201026110315.4026183-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add more descriptive comments to keep a clear separation
between static property vs runtime changeable.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20200630133912.9428-12-f4bug@amsat.org>
---
 hw/sd/sd.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index c3febed2434..9b53053527e 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -102,11 +102,14 @@ struct SDState {
     uint32_t card_status;
     uint8_t sd_status[64];
 
-    /* Configurable properties */
+    /* Static properties */
+
     uint8_t spec_version;
     BlockBackend *blk;
     bool spi;
 
+    /* Runtime changeables */
+
     uint32_t mode;    /* current card mode, one of SDCardModes */
     int32_t state;    /* current card state, one of SDCardStates */
     uint32_t vhs;
-- 
2.26.2


