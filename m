Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F563BBAAD
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:00:23 +0200 (CEST)
Received: from localhost ([::1]:51038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0LOo-0003Xc-1Q
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:00:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0LKW-0003bh-G4
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:55:56 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:37815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0LKT-0003sB-Km
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:55:56 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 r9-20020a7bc0890000b02901f347b31d55so10780345wmh.2
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 02:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VJsG6i3sAD5ocwjCsRNBLakGwMPgPlu9L1YBemdBFYU=;
 b=oqy5qH+BGrkkRRa9LSGRCxguT28brZL9FqmOXjFA38beUlKkhfS6fSf0+5Bk0hk4/M
 XPiSR3yHQmyhD+pyoL5ZxQcE3cQktS2FiLKOogt+dyyjP9MaIM2hbpA3mg6fESh0A9sH
 cASJ9rjALkyqQpphOmd8wZH37qLKOfGJ54u+LzQUqwZwny6iZ8yPFciJt+SUnAGvixej
 4mk3ACft9JxCXpmezRm5TuhtPvPT953H5I6TYYzxBEXzsQgk2y1Nx5k503MyoTDQG5Mc
 +xZc3GLG+uKb3Asfr3hrV21wfNix/wKE2w0/t8G8koMmLMm8r1vc2+OOzkpkjrD2xq/W
 T8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VJsG6i3sAD5ocwjCsRNBLakGwMPgPlu9L1YBemdBFYU=;
 b=fWMm/+B0PUlrobANQJG2KaQkPOSju8Gkxh5+WemtMZ15fGnLPlVgPvKg3uIH19M1El
 LerbvceuICrB0SwYDx3fy/REVor+qYPFlXd4pfLnXDWnpW5fW5k5IS7S9JoCtBx8zROa
 mkb+kWGO2WRhi0mljjl5+JX8SkwdPElluNAXMtc+xYPKZdKUXdKvVP/7IVsxOJ12DWTt
 ik7rPrSHJ6nsFShmYuIgkRuB4R6fVaQcv6g/lhqi4dAAmWmxhs4GjTG1SBccInGznMJZ
 10Lbuf1hsYEaBM81lN/R0WXvHt8eR10UvWxOTsH0oeKsWUCHSO5kQexa3IG09QypQDF1
 iFPQ==
X-Gm-Message-State: AOAM532IWIsCI2xq6N8jsn5Z5+Qr+94iF8V5kqiGh1QiIrmZZzDBefb9
 sZQMUNcQS8nHEVgDkivDvs7RSwWZL0lc/4ZK
X-Google-Smtp-Source: ABdhPJwohbbP5anvISmwEPGTZPOcwhBt4yCwOQV2q9cKfFgxZS0NNDO7fiL9fRkhyvlR9Y9wu4un2g==
X-Received: by 2002:a1c:7f4b:: with SMTP id a72mr14404765wmd.48.1625478952360; 
 Mon, 05 Jul 2021 02:55:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i5sm12528727wrr.4.2021.07.05.02.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 02:55:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/7] docs: Remove "Contents:" lines from top-level subsections
Date: Mon,  5 Jul 2021 10:55:43 +0100
Message-Id: <20210705095547.15790-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210705095547.15790-1-peter.maydell@linaro.org>
References: <20210705095547.15790-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since the top-level subsections aren't self-contained manuals
any more, the "Contents:" lines at the top of each of their
index pages look a bit odd; remove them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/devel/index.rst   | 2 --
 docs/interop/index.rst | 2 --
 docs/specs/index.rst   | 2 --
 docs/system/index.rst  | 2 --
 docs/tools/index.rst   | 2 --
 docs/user/index.rst    | 2 --
 6 files changed, 12 deletions(-)

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index e188f187a18..ff43ba78958 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -5,8 +5,6 @@ This section of the manual documents various parts of the internals of QEMU.
 You only need to read it if you are interested in reading or
 modifying QEMU's source code.
 
-Contents:
-
 .. toctree::
    :maxdepth: 2
    :includehidden:
diff --git a/docs/interop/index.rst b/docs/interop/index.rst
index 8b34da6f551..b1bab81e2ee 100644
--- a/docs/interop/index.rst
+++ b/docs/interop/index.rst
@@ -4,8 +4,6 @@ System Emulation Management and Interoperability
 This section of the manual contains documents and specifications that
 are useful for making QEMU interoperate with other software.
 
-Contents:
-
 .. toctree::
    :maxdepth: 2
 
diff --git a/docs/specs/index.rst b/docs/specs/index.rst
index 4c0d2a37cb8..b7b08ea30d7 100644
--- a/docs/specs/index.rst
+++ b/docs/specs/index.rst
@@ -4,8 +4,6 @@ System Emulation Guest Hardware Specifications
 This section of the manual contains specifications of
 guest hardware that is specific to QEMU.
 
-Contents:
-
 .. toctree::
    :maxdepth: 2
 
diff --git a/docs/system/index.rst b/docs/system/index.rst
index 2a9bd759807..058cabd36cc 100644
--- a/docs/system/index.rst
+++ b/docs/system/index.rst
@@ -6,8 +6,6 @@ for full system emulation (as opposed to user-mode emulation).
 This includes working with hypervisors such as KVM, Xen, Hax
 or Hypervisor.Framework.
 
-Contents:
-
 .. toctree::
    :maxdepth: 3
 
diff --git a/docs/tools/index.rst b/docs/tools/index.rst
index ffb14b9690b..ef6041a490f 100644
--- a/docs/tools/index.rst
+++ b/docs/tools/index.rst
@@ -4,8 +4,6 @@ Tools
 This section of the manual documents QEMU's "tools": its
 command line utilities and other standalone programs.
 
-Contents:
-
 .. toctree::
    :maxdepth: 2
 
diff --git a/docs/user/index.rst b/docs/user/index.rst
index 6ac2ac089fd..9faa4badd78 100644
--- a/docs/user/index.rst
+++ b/docs/user/index.rst
@@ -5,8 +5,6 @@ This section of the manual is the overall guide for users using QEMU
 for user-mode emulation.  In this mode, QEMU can launch
 processes compiled for one CPU on another CPU.
 
-Contents:
-
 .. toctree::
    :maxdepth: 2
 
-- 
2.20.1


