Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 095BF42B1C4
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 03:05:10 +0200 (CEST)
Received: from localhost ([::1]:47100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maShh-0004fc-4g
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 21:05:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@chromium.org>) id 1maSeD-0007sl-Dg
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 21:01:33 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:34714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@chromium.org>) id 1maSeB-00055X-TU
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 21:01:33 -0400
Received: by mail-oi1-x231.google.com with SMTP id z11so1650319oih.1
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 18:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u3mRe1SjnbN4eZ/xlikZ4lGZRr0bx5CMAJvP9b2L1LM=;
 b=Xa1tUKKw4kXBLRfsgySYj7ucRFjQ1LAN/1V6is6lTn+geg0H8d412sPcO+EaEc2h0R
 BkdOsrie9CBg3tzJWPwJXJU40RBUEXJnkCiAnM45Mq8Bg975/0fJNttAAIJxbxsUvHLm
 Tfg6hvYSaD15lvvx39/b9d19hViJuGLbu3ZPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u3mRe1SjnbN4eZ/xlikZ4lGZRr0bx5CMAJvP9b2L1LM=;
 b=DumqOza18ttYY2cgt13nDdBiWPQM4mfYwHWmcdUlXjNbYlk8sEVkgglKG2bilXyOIV
 6vgFG2qwX3toXw63jATrg5Shzi4wEqGXqZ80v6CHYw5Hdj3gmNWTFii+N0HJlkvnF3dB
 jjOd2EZWlyOAc2uTOiq0YrUgWMCU0xPCxdo6Bu1iXiDR0JUGOGK7hJOZlVEjg3Y30Ade
 TRoq5B770ltZQgOd5Y7v3FosjHpbxGSSlgI/dOVfa1xxhiDLqF/wb8s+YCLn0sDqkYi4
 JKQEqcJSl/PRe8yW3wWX0zM49aoNW1MLymuMCH75RH/AEPZ007ezaIjb4mwsNjb5/o1O
 xIgg==
X-Gm-Message-State: AOAM5317BK/Tjn/XpNCwhmrf+P2MXyxzn3ixDOGNA58EB2VcC9WrwSvM
 NDR5+ZKyIC4ttXWLQZ+WPn1iXw==
X-Google-Smtp-Source: ABdhPJwNJvQsq38wNKSMBixWGzaiGqTvMOJMBZw5K6AZXQR3QfWLJRlJeFezA8WWiUrvdRMyMYecRQ==
X-Received: by 2002:aca:a80c:: with SMTP id r12mr5968445oie.58.1634086890015; 
 Tue, 12 Oct 2021 18:01:30 -0700 (PDT)
Received: from kiwi.bld.corp.google.com (c-67-190-101-114.hsd1.co.comcast.net.
 [67.190.101.114])
 by smtp.gmail.com with ESMTPSA id a10sm238107otb.7.2021.10.12.18.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 18:01:29 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Subject: [PATCH 01/16] arm: qemu: Mention -nographic in the docs
Date: Tue, 12 Oct 2021 19:01:05 -0600
Message-Id: <20211013010120.96851-2-sjg@chromium.org>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
In-Reply-To: <20211013010120.96851-1-sjg@chromium.org>
References: <20211013010120.96851-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=sjg@chromium.org; helo=mail-oi1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, qemu-devel@nongnu.org,
 Albert Aribaud <albert.u.boot@aribaud.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without this option QEMU appears to hang. Add it to avoid confusion.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

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
2.33.0.882.g93a45727a2-goog


