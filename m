Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF902C04E1
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:49:53 +0100 (CET)
Received: from localhost ([::1]:36126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khALv-0004V9-9P
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:49:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFz-0004yG-9W
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:43 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFx-0002nR-Kw
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:43 -0500
Received: by mail-wr1-x434.google.com with SMTP id s8so18237470wrw.10
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UgYNIfqy+vUoUN0CjnlR/j55R+Sj3jYUN6rQ/u8c6Mw=;
 b=BiBjj6Hp2eWcFo2vEyv2eYQOoLRFOJnsKwYTaCawQFjyaK1R6y5DJNma6WKPQ98jRU
 cwe5MaXuNlAM3ovgF37W11KRdiYZETuJfCj/VwhTgqkg8KgqqCeex/2MDwI9JqcriWqQ
 cgTS0E1ck1z2nDSiyCARiZokeGpqgXylR/m/nMCrHfHFsXbPAHeP75pITIcc2IK6PdCo
 o205NmPgchmsTwEQmeDIGC4I+ZwwTozoWVEa8WNuarDQ+/l2vGgorBEakFb10sOquTCk
 YvwH8cHYUZbodK61T2nVqPTLlpUle6OzybbUydtwCcL1kpuzBuC0Cg+S+IQFkqWsTeJD
 /JUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UgYNIfqy+vUoUN0CjnlR/j55R+Sj3jYUN6rQ/u8c6Mw=;
 b=l7T2JFlNCZ0riAgE+a67mSZXA30HNpib+8UQcGx3ajpPIsx+t2wQesFZuzlmZXYU23
 wPNZ7GtVkHcghSd3AuSIO/wNoAc07lhtiybfM54zoHT5d8lxMCEfaMqS0gg8so4FUGMS
 2Vzr5To9W+zW/KBqgPkcuaR9uz8ldaTiNEFJsIB6CbZmnzCRwjsbhgjDdF2Nw/+SctU4
 lBNut3BhzLrWcy/GhlF02u/lzKqVr/bgUkMZ12yPaj478lXHPaJsscEFGiYYcf56ONBm
 q5dJSuV3r405kHhmGIqBcn26vTyjxF9RvIHKDd5Cc1/OEcXOwbVu2BUv+jgGpIWtTyAR
 m2lA==
X-Gm-Message-State: AOAM531cxkCi2wkvzarx/JCmLB7uxzJjZDdIyshHncsEjWlF/9+TYUOA
 gGmCLi8cWp7Yd/uzDNT6ZyCV1XBhqsVpOg==
X-Google-Smtp-Source: ABdhPJyplMLZThMGU0u4ekHBb7sAzPaIJnkt4qEvfLBlB+eAi6oCTRPf0fXfcM9O30AKX8Td2ntE7Q==
X-Received: by 2002:a5d:4d87:: with SMTP id b7mr31944310wru.115.1606131820108; 
 Mon, 23 Nov 2020 03:43:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g186sm50836495wma.1.2020.11.23.03.43.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:43:38 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 20/24] docs: Split out 'pc' machine model docs into their own
 file
Date: Mon, 23 Nov 2020 11:43:11 +0000
Message-Id: <20201123114315.13372-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123114315.13372-1-peter.maydell@linaro.org>
References: <20201123114315.13372-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

Currently target-i386.rst includes the documentation of the 'pc'
machine model inline. Split it out into its own file, in a
similar way to target-i386.rst; this gives us a place to put
documentation of other i386 machine models, such as 'microvm'.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/system/i386/pc.rst     |  7 +++++++
 docs/system/target-i386.rst | 18 +++++++++++++-----
 2 files changed, 20 insertions(+), 5 deletions(-)
 create mode 100644 docs/system/i386/pc.rst

diff --git a/docs/system/i386/pc.rst b/docs/system/i386/pc.rst
new file mode 100644
index 00000000000..d543c11a5cd
--- /dev/null
+++ b/docs/system/i386/pc.rst
@@ -0,0 +1,7 @@
+i440fx PC (``pc-i440fx``, ``pc``)
+=================================
+
+Peripherals
+~~~~~~~~~~~
+
+.. include:: ../target-i386-desc.rst.inc
diff --git a/docs/system/target-i386.rst b/docs/system/target-i386.rst
index 51be03d881f..1612ddba907 100644
--- a/docs/system/target-i386.rst
+++ b/docs/system/target-i386.rst
@@ -1,14 +1,22 @@
 .. _QEMU-PC-System-emulator:
 
-x86 (PC) System emulator
-------------------------
+x86 System emulator
+-------------------
 
 .. _pcsys_005fdevices:
 
-Peripherals
-~~~~~~~~~~~
+Board-specific documentation
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-.. include:: target-i386-desc.rst.inc
+..
+   This table of contents should be kept sorted alphabetically
+   by the title text of each file, which isn't the same ordering
+   as an alphabetical sort by filename.
+
+.. toctree::
+   :maxdepth: 1
+
+   i386/pc
 
 .. include:: cpu-models-x86.rst.inc
 
-- 
2.20.1


