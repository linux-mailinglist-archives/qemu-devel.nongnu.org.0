Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C01243A936
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 02:27:24 +0200 (CEST)
Received: from localhost ([::1]:34094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfAJH-0004m9-Mi
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 20:27:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@chromium.org>) id 1mfAG1-0002YM-4F
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 20:24:01 -0400
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36]:45588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@chromium.org>) id 1mfAFw-0008O5-QQ
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 20:24:00 -0400
Received: by mail-oo1-xc36.google.com with SMTP id
 o26-20020a4abe9a000000b002b74bffdef0so4235337oop.12
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 17:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kMlC5BTTcEqI4zPA4Xepglue53WFz0S1SEhTBdcAgjc=;
 b=iYX2cjKm+J3NnixoeZhUu9+34V4RQ8ekCWN9QUZx6OK5qjFbzn3GBnLolrR8X0R9lV
 l5PReeWgddPIHYr3dwppddDOaQQyXvnnFAcOnXxDHE5s8JEHKY0S5iPW1VU4UekSuhWJ
 dTml9IX5Huhqxuvy2X/k7XgoCvaM8LtROGUiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kMlC5BTTcEqI4zPA4Xepglue53WFz0S1SEhTBdcAgjc=;
 b=P8w7+v8xlUhHyBEQH/G68RFVvlURk7YYv4KtQ5A9I0znNg9qlur2OgaJ+5uHmw+do/
 aro/P+INXDT1zsCt8YpfKisu3Xndg5xE5PCnu8cQsN3qza5M1HosLlERKNBPCh1kRQld
 vjg14q5Dhn6kzyHv7A0znO7ZcoaAIo0nqkjviYKS98ijN8Fk3c3nTj8WH6jyT9Rq3dnf
 khlDpL4WCThBTaHePOrDnLscvXDPAbukhtbJhKiTqdYnz/ki9GmuCQX2oCV+/tHFoBJ2
 MyIX3KobIImp9AuXxBdFEz9BShrMyskuv5aMVsYqg7sWDqOztWhSKS9Syf6G6IVW4tZq
 M50Q==
X-Gm-Message-State: AOAM532f92tgZWiBwXe9m2nb8EbATry4Esx6VTljvwcizp3URmHzThaH
 EkmXqqpFCE4OTkbyS05BNftfIg==
X-Google-Smtp-Source: ABdhPJwh7h1bDDhI3D7ZD6ioOaKBwuPWESoahgZRgwlhpQDVLhr5z9HbRuH2dB/zJXzRAdGqX2ftVw==
X-Received: by 2002:a05:6820:16a2:: with SMTP id
 bc34mr14874809oob.66.1635207835779; 
 Mon, 25 Oct 2021 17:23:55 -0700 (PDT)
Received: from kiwi.bld.corp.google.com (c-67-190-101-114.hsd1.co.comcast.net.
 [67.190.101.114])
 by smtp.gmail.com with ESMTPSA id v24sm3331926oou.45.2021.10.25.17.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 17:23:55 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Subject: [PATCH v5 03/26] arm: qemu: Mention -nographic in the docs
Date: Mon, 25 Oct 2021 18:23:21 -0600
Message-Id: <20211026002344.405160-4-sjg@chromium.org>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211026002344.405160-1-sjg@chromium.org>
References: <20211026002344.405160-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c36;
 envelope-from=sjg@chromium.org; helo=mail-oo1-xc36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Tom Rini <trini@konsulko.com>, Albert Aribaud <albert.u.boot@aribaud.net>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, qemu-devel@nongnu.org,
 Sean Anderson <seanga2@gmail.com>, Mark Kettenis <mark.kettenis@xs4all.nl>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without this option QEMU appears to hang. Add it to avoid confusion.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v1)

 doc/board/emulation/qemu-arm.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/doc/board/emulation/qemu-arm.rst b/doc/board/emulation/qemu-arm.rst
index 8d7fda10f15..97b6ec64905 100644
--- a/doc/board/emulation/qemu-arm.rst
+++ b/doc/board/emulation/qemu-arm.rst
@@ -41,14 +41,15 @@ The minimal QEMU command line to get U-Boot up and running is:
 
 - For ARM::
 
-    qemu-system-arm -machine virt -bios u-boot.bin
+    qemu-system-arm -machine virt -nographic -bios u-boot.bin
 
 - For AArch64::
 
-    qemu-system-aarch64 -machine virt -cpu cortex-a57 -bios u-boot.bin
+    qemu-system-aarch64 -machine virt -nographic -cpu cortex-a57 -bios u-boot.bin
 
 Note that for some odd reason qemu-system-aarch64 needs to be explicitly
-told to use a 64-bit CPU or it will boot in 32-bit mode.
+told to use a 64-bit CPU or it will boot in 32-bit mode. The -nographic argument
+ensures that output appears on the terminal. Use Ctrl-A X to quit.
 
 Additional persistent U-boot environment support can be added as follows:
 
-- 
2.33.0.1079.g6e70778dc9-goog


