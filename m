Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A16449A44E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 03:09:11 +0100 (CET)
Received: from localhost ([::1]:59714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCBGg-0001lt-JS
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 21:09:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfN-0002Ix-Rk
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:47 -0500
Received: from [2607:f8b0:4864:20::d2c] (port=44724
 helo=mail-io1-xd2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAfJ-0001iR-PY
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:35 -0500
Received: by mail-io1-xd2c.google.com with SMTP id h23so21793540iol.11
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vBJhsJ5JDmPAbCw0pkCICn7DGftKZRdcsDaqxXoafK8=;
 b=K2FTHJPdwmrsdqIi5KBKsm8r1fxfV84ZkkaH9/33iCm+z8hbti0krUXKvx8KiMPcO8
 SDqj5mQEQc448n9bxXMjUyo2ItuH5ST7O10EubeXDht1pksG3RJ8VvXIZdtK67mKxUhp
 c4V40dSqypPShHzPTU+wykr64dutKjIRg50G6I7AUdBrCJeGZXzmAXhfZ3S0ESDpv5py
 NVb9f8BKdvELMWhnBcMTVWQA4UlU6Ffv8mX41yXM4EoLrTAbJjSnfRbn0UvNMlfab3p2
 2GLBUf58kd+PGmA3oJTdJfUrMTgStEU94EnoRNCt+Q6RUzXdAxXa5ZlR4WAKcr0QdS9k
 DyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vBJhsJ5JDmPAbCw0pkCICn7DGftKZRdcsDaqxXoafK8=;
 b=WQI35PxC/gM/nB4256g7SbveetiBScYH3NKArPgail8KVBDiysVRXpeG980Sd6Hk30
 6ktMXn+Y82h0F7rcdvctm6Ep37GY1/09ROC5OBZ6k5PE1D1VuGG51yt8g0L0/1dujbzt
 Cx4LyN++vNutcBzCMDb1FCIZnufpKAezwSjh8/X+y5c6PczSETGFtmm9C3ATpeN6wLG1
 qjQCmjOCmxwtPCDJVDa8Ub4cIUt82CgbC+6P6ePFWZ2Bmqm2T72iGweuJnv9uYnPmI+v
 Y6QYFFpuWAgy0Hu1XXhui/ZVCWC1XVngYp/hm8oOgpsfIcQsi60fZ74zQ/9UUh3AFqWx
 K0iw==
X-Gm-Message-State: AOAM53155qQWDXEU8nXQ7Qw7UvjZnZbnfiTYTfWTkBDlhO3ik+A6r1mg
 V/mz3A78ATf9CngjF2UbBEdGVcaScn9I8A==
X-Google-Smtp-Source: ABdhPJx55RVkwgngaC9lSEFCGzFIJ9Zfv4xueLYKMlm8mzAHH42DCjVXMeJb6YlckBh4ocoT9vcpqw==
X-Received: by 2002:a02:a101:: with SMTP id f1mr7618793jag.12.1643074231911;
 Mon, 24 Jan 2022 17:30:31 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:31 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 38/40] MAINTAINERS: Add tests/vm/*bsd to the list to get
 reviews on
Date: Mon, 24 Jan 2022 18:29:45 -0700
Message-Id: <20220125012947.14974-39-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2c
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

tests/vm/*bsd (especailly tests/vm/freebsd) are adjacent to the bsd-user
stuff and we're keen on keeping them working as well.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c98a61caeee..a2809761f65 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3101,6 +3101,7 @@ R: Kyle Evans <kevans@freebsd.org>
 S: Maintained
 F: bsd-user/
 F: configs/targets/*-bsd-user.mak
+F: tests/vm/*bsd
 T: git https://github.com/qemu-bsd-user/qemu-bsd-user bsd-user-rebase-3.1
 
 Linux user
-- 
2.33.1


