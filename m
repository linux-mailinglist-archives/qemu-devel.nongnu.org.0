Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E94552FA64
	for <lists+qemu-devel@lfdr.de>; Thu, 30 May 2019 12:39:11 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51192 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWISl-0003Pb-64
	for lists+qemu-devel@lfdr.de; Thu, 30 May 2019 06:39:11 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57078)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hWIFF-0001Ee-RR
	for qemu-devel@nongnu.org; Thu, 30 May 2019 06:25:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1hWIFD-0000IW-Lp
	for qemu-devel@nongnu.org; Thu, 30 May 2019 06:25:13 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:46629)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1hWIFD-00006h-AK
	for qemu-devel@nongnu.org; Thu, 30 May 2019 06:25:11 -0400
Received: by mail-wr1-x442.google.com with SMTP id r7so3808391wrr.13
	for <qemu-devel@nongnu.org>; Thu, 30 May 2019 03:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CpnAoS/0GcDEawDwz3KOhZJ7qTcVFE5i2TefLG4nXpc=;
	b=GK2VeXpKbHRBUYHZ7j7VMimnF5DLHkozn5ZPwW/6q3H97FNgcCI7K4F2fiRUIVEshy
	G8cf6CDAVzIG3dw4cZjUU0RaP/v5q72ZtmQPZU+BcZIAOvzk2lF+6L7hOoYuIjNxv/ww
	RAtkT3judKRtxA88y79MLUew2Fx/dfp9KcOJU+qj2wHvE/IOnJGevtUbyMo0Jnv0PxIf
	WBQ7Qi1UZEWA66dLCC0BKb0nm8AVot4UO133jMd9wLw/6cQ0EhO+XAmkRwu8/0bwDMiv
	Fii3C19vJ2cw7iOTtgRxTkxf/7h/gTK/JuXyx/91yUw1l67y0UeRw4VcP2AqCYOJTRFA
	CePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CpnAoS/0GcDEawDwz3KOhZJ7qTcVFE5i2TefLG4nXpc=;
	b=K8TnCsLYip2GtkVRB47LHv0FSWfZ7jhSGeaULfY1DQu1ZRfD/nwFe5cBXwKtCYNglk
	t9l5Wa8b2uiUS07OWbPPt6SxET7ymn6apLY4/4ELitZbu2Dpm8N0entVGfYOCF+JPp2l
	d0+B2NRMVZ5ZPFADcH+5GHlpzG4xDleSFvUN2lbBVSIalonj+HH05CZtyzzXcRsFgVhI
	fN5WOldbTcTQ2U/V00nWUGa7Mm+OKFIJwcgs0lrg6EJS4d6UzRdQAA4oQpEg32GWVpQX
	VP30PKpHnDThDDTmbJm0iRPMjHSNE9pQMhCl0P18x16vFzV++ihtre6Hn7UWdKwBg/jo
	iHYg==
X-Gm-Message-State: APjAAAWpUkOshhtA1fFQcFhP2Vy6IgHI2zkkmzsvndhDJHhfuq68WoeV
	34fScFBdGQ6nhCqf8xpH6R83jQ==
X-Google-Smtp-Source: APXvYqxV0pPYFLsJpTdZJyw5wtHVgYWzQCsqXtO6V94uUu7ujlit5hz+WG4kKW4DZqmtM2lCJWJZSQ==
X-Received: by 2002:a5d:4d46:: with SMTP id a6mr2176257wru.142.1559211904702; 
	Thu, 30 May 2019 03:25:04 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	p16sm4156798wrg.49.2019.05.30.03.25.01
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 30 May 2019 03:25:03 -0700 (PDT)
Received: from zen.linaroharston. (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 3E06B1FFB1;
	Thu, 30 May 2019 11:16:06 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 30 May 2019 11:16:03 +0100
Message-Id: <20190530101603.22254-27-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190530101603.22254-1-alex.bennee@linaro.org>
References: <20190530101603.22254-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH v1 26/26] tests/vm: ubuntu.i386: apt proxy setup
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
Cc: Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gerd Hoffmann <kraxel@redhat.com>

Configure apt proxy so package downloads
can be cached and can pass firewalls.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190520124716.30472-15-kraxel@redhat.com>
---
 tests/vm/ubuntu.i386 | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/vm/ubuntu.i386 b/tests/vm/ubuntu.i386
index a22d137e76d..b869afd212f 100755
--- a/tests/vm/ubuntu.i386
+++ b/tests/vm/ubuntu.i386
@@ -51,6 +51,10 @@ class UbuntuX86VM(basevm.BaseVM):
                           "    ssh-authorized-keys:\n",
                           "    - %s\n" % basevm.SSH_PUB_KEY,
                           "locale: en_US.UTF-8\n"])
+        proxy = os.environ.get("http_proxy")
+        if not proxy is None:
+            udata.writelines(["apt:\n",
+                              "  proxy: %s" % proxy])
         udata.close()
         subprocess.check_call(["genisoimage", "-output", "cloud-init.iso",
                                "-volid", "cidata", "-joliet", "-rock",
-- 
2.20.1


