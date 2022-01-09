Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 752334889D8
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 15:23:32 +0100 (CET)
Received: from localhost ([::1]:33754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6Z6Z-0003PA-IU
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 09:23:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsoref@gmail.com>) id 1n6RWb-00077S-OU
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 01:17:54 -0500
Received: from [2607:f8b0:4864:20::72c] (port=46025
 helo=mail-qk1-x72c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jsoref@gmail.com>) id 1n6RWT-0007Sx-Vk
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 01:17:47 -0500
Received: by mail-qk1-x72c.google.com with SMTP id e25so11266217qkl.12
 for <qemu-devel@nongnu.org>; Sat, 08 Jan 2022 22:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5lYuj55GGBoHJYNeCLZ17i504ag2RPhxp8WccscYgQU=;
 b=ghDO0EdvJa+HfM7Dty9tsMnMV9qSvhVRuvxbrgmm5CTIAPZ5OaEeK8V8crIqdrryI+
 QKnRW0pvT4LU25C3mG+fj0FHR2/71tnQ7IZBwmSXW56ed+6d30KsklnacshoszQpq6fB
 UJdSpZYGIk9gf9DbR0RbtXMtrBtaK1IZ88b2iuS8fwNVzg+cEp8ZodSN51DrHqDCQMXs
 0n5S23Ji7SWUx2XEgxmR62Uo5e/ETlp1c8iLbHuHM7qLBEhvOFOVnYaAviRNhIkRiXhl
 3hCmQrNv0bSYhgW5iiBQ3Zqhlr5MvgknwougEnMw7n7OMbYss6t0srkf28/Js/pQZ9pr
 LaMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5lYuj55GGBoHJYNeCLZ17i504ag2RPhxp8WccscYgQU=;
 b=5PXXraedfSAyqggRuoIOTq73Z6gxzFIlY5aHLFP0vGIyjE9TPBLX7swC7evZLQEb+6
 mZxVwlT65twT7Tdc9FPfmbF5uxSRuKU4A6FYvy0TPcG1Pc/tSU9SJVj4jKJg1K+2dx8c
 Rc0spxBxQvmAMWvkL/p6X/BoJLJbxoENJKcMXwA23x26MWrYIzWsHxeoUpIugUes40vz
 lt4ShPYIdqeaOY5HUAPcCDhMEcFrXCBGpcPVb+ptZSVXPcTJagnd6dUphhH531hyETfn
 x4LsNVJPvUgN6uJ/loMH5pepOHeQfYmdMSgFMspxlfVlrzrxMb2MQTbvT7zOvMaxl4zA
 GnTw==
X-Gm-Message-State: AOAM533B2wRFSIKokiWRoAR1rfb2fNvBCVh0mXYcZZqCqMlf91OGzNyw
 0S/pXzExhvAqqkSkANNgZZUEwhdMV+7hRT5C
X-Google-Smtp-Source: ABdhPJwUnyYNuP5Eb98MjbO+Inc8oYTPXR5cR87ixHjCg21NhpuJCILc18vqxDWt1cL7P6mXhT/1Mg==
X-Received: by 2002:a37:5f04:: with SMTP id t4mr49729657qkb.190.1641709064800; 
 Sat, 08 Jan 2022 22:17:44 -0800 (PST)
Received: from localhost.localdomain (199-255-11-35.static.celitofiber.net.
 [199.255.11.35])
 by smtp.gmail.com with ESMTPSA id w63sm2169705qkd.88.2022.01.08.22.17.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jan 2022 22:17:44 -0800 (PST)
From: Josh Soref <jsoref@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] Fix lockdown comment argument
Date: Sun,  9 Jan 2022 01:17:07 -0500
Message-Id: <20220109061708.21481-2-jsoref@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220109061708.21481-1-jsoref@gmail.com>
References: <20220109061708.21481-1-jsoref@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=jsoref@gmail.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 09 Jan 2022 09:21:14 -0500
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
Cc: Josh Soref <jsoref@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Josh Soref <jsoref@gmail.com>
---
 .github/workflows/lockdown.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.github/workflows/lockdown.yml b/.github/workflows/lockdown.yml
index ad8b8f7..37c6065 100644
--- a/.github/workflows/lockdown.yml
+++ b/.github/workflows/lockdown.yml
@@ -15,7 +15,7 @@ jobs:
     steps:
       - uses: dessant/repo-lockdown@v2
         with:
-          pull-comment: |
+          pr-comment: |
             Thank you for your interest in the QEMU project.
 
             This repository is a read-only mirror of the project's repostories hosted
-- 
2.32.0 (Apple Git-132)


