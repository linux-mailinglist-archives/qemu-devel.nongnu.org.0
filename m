Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD142C0507
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:57:05 +0100 (CET)
Received: from localhost ([::1]:32954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khASt-0006WO-9T
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:57:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAG1-00052v-2D
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:45 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:39641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFz-0002nh-Jj
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:44 -0500
Received: by mail-wr1-x429.google.com with SMTP id e7so745034wrv.6
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jRw7V/aJ86x3YsAvTQ4Pws7EotVTih6UAbh0dRymz/E=;
 b=Qmon3wHFOZQkQwFVDpR0lwc+H2jJTVxg/cXpkgRXS1Gry4sa3v40yFNJ2lKue9w/6f
 Z+xw+tbRjreb9kUpyVeMVyJol4unoqad4jQKfusP6ilvp5lZWcpGdR1KxKa+rJj6oJVE
 JYNScCqoQH7cc2w5+4tinUAFYUjyVsxAcmG1D7YER2L7NtcHXwcl1Fxfe4LH78axl0+V
 YBeonc2ANndvaXY6KQB19imYvmPXh5FdSCQaDYcjo0Cak6OE+fEnbNQWJDzSefS2rUyy
 a9ghYz3rudK27hr27OCqM0575suoyRRZS1aKOcm1KqJmPrgD8sLFIbeocebQ1wnM5LEa
 v4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jRw7V/aJ86x3YsAvTQ4Pws7EotVTih6UAbh0dRymz/E=;
 b=MwYuWMoI6BxrRWLTH8ThQLj/8xkNBqCOzduwj3iSPoOtcMGppD2RkugAoG7eHV1zAR
 7gewlP4taDt9QTAFpCSbSANAQVNGuNOA2b1iNr1FoemQ5HEsrNyk3IbKfNg/mq3XJSgX
 CPAZozDH9mzqRYIypPuYrnoD+mlCZrImLFfxsMEVsIKABHzcGkXvkZQ4RTMuwJR6q+6E
 TR1oVXg907b0VXn8R1PixI7pcg6Xj5RRtDXOseAFen2Cd7Eul1c0bpxHlXCL37vc8mSc
 fCDJbLOz+maYhX2sMzxgYgbgMJc5SHlerwmIaGOMYChMaYWA/5IYN/O7jizFyGWgv7/V
 8hkQ==
X-Gm-Message-State: AOAM532vC7GYZR36tJDQtCqWpsRh75ZTTWh2sadx85BU5jspWk4GAM/3
 bD32muD6GJZnwxhHsn0p5gfjlCILJQ6JdQ==
X-Google-Smtp-Source: ABdhPJwx2OPcxGRL29L8cevZtiRDHproRFBDg1wck1JVmig5TsP5pgRb6Wm2SnrhnNuXykVIlcHBHA==
X-Received: by 2002:a5d:5482:: with SMTP id h2mr31008400wrv.18.1606131822181; 
 Mon, 23 Nov 2020 03:43:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g186sm50836495wma.1.2020.11.23.03.43.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:43:41 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/24] docs: Move pr-manager.rst into the system manual
Date: Mon, 23 Nov 2020 11:43:13 +0000
Message-Id: <20201123114315.13372-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123114315.13372-1-peter.maydell@linaro.org>
References: <20201123114315.13372-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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

Move the pr-manager documentation into the system manual.
Some of it (the documentation of the pr-manager-helper tool)
should be in tools, but we will split it up after moving it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/system/index.rst            | 1 +
 docs/{ => system}/pr-manager.rst | 0
 2 files changed, 1 insertion(+)
 rename docs/{ => system}/pr-manager.rst (100%)

diff --git a/docs/system/index.rst b/docs/system/index.rst
index 2a5155c67dc..e5a35817a24 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -31,6 +31,7 @@ Contents:
    managed-startup
    cpu-hotplug
    virtio-pmem
+   pr-manager
    targets
    security
    deprecated
diff --git a/docs/pr-manager.rst b/docs/system/pr-manager.rst
similarity index 100%
rename from docs/pr-manager.rst
rename to docs/system/pr-manager.rst
-- 
2.20.1


