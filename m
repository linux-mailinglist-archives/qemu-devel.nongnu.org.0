Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF0B3B181E
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 12:31:47 +0200 (CEST)
Received: from localhost ([::1]:47430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw0Ac-0007Xe-Qn
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 06:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lw071-0001BK-76
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:28:03 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:40735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lw06x-0001Zi-7K
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:28:02 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 o33-20020a05600c5121b02901e360c98c08so1902801wms.5
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 03:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0pJwxe1sTnYAUahPYh5EFYXCVN5HiifnmV7lYYOOY90=;
 b=qKPu6R6ik+WnFrcMWRiBMVU7GdR0RYNcuTm/VRo4MYyTnBbWwaFQP2PR3J00GFNyVf
 CDEOXV38YR/NYuJ8IpWH0axKvpUokYpJMvjxG6HvNyqd7BbnY8x95pKofSLFjp9l42XA
 TwEweEjoGPAz8g+AJRyCDZg5wI4jPNCXQtWvQ2KsnWuuxMLhao42pOUsoBsFG95Ad8qq
 gLLudLGdbMDK64fSzSed+ZvpYjMejlGQIE9QBMiMBeU04kBCiWIRXnDUB3wxPKE5VG6G
 dc5U2JaYm0qIFaJuXk6R8uIKG/77dsw2kRlUg+SLvhSXhPC7TvIX0JVN0/LY4kBwXgE6
 PK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0pJwxe1sTnYAUahPYh5EFYXCVN5HiifnmV7lYYOOY90=;
 b=hURHjjYDIxjE1txfqjZ8Mn7lPsbhArUTPVlAsTUZPwJBWVUKe5MbOr9VjKpif8c6U7
 BGbrTGCgXgN2/inCOGtgPO9bmOLgLBk/w4hH8Tvcyd/XOYh41hzYZlO3dvAJWigkbQBF
 sA5UZf9Ym0aVpukSF/PJhHW1vXIw3Rd4zGZj3LRINYt28l8nlYiN2ui1HBkstwDZPHh+
 y8o4dSlLoAvL8Taa5ayzGUMwlpvL6AxQSbvq6xgUYZHMxSvEPcCziVSbnBJBbEcxHLwh
 SLvJ0YgCrZYr4FGst4UZr0r4g8hnGmsmUWisrDBYMphFfA2yFpZxoYV2n2+gmo8nsbbN
 9LqA==
X-Gm-Message-State: AOAM531/r9V0N6ipJWOwp7jQMxyANC9VLeKOJ6f8GL1JyAL8zCmGDg0f
 IyAUdL97SmlnHOKgga/WupUDYJaDJUuC2g==
X-Google-Smtp-Source: ABdhPJxO9UQQLEId1g87swFzohx/XvpB6ap/O7ffCxME7GXTzKR1W7e6rdFE46+ZLWUloNFFZ4rXCg==
X-Received: by 2002:a05:600c:4145:: with SMTP id
 h5mr9743153wmm.108.1624444077439; 
 Wed, 23 Jun 2021 03:27:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b11sm5287170wmj.25.2021.06.23.03.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 03:27:50 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D14D71FF8C;
 Wed, 23 Jun 2021 11:27:49 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/8] docs/devel: Add a single top-level header to MTTCG's
 doc
Date: Wed, 23 Jun 2021 11:27:43 +0100
Message-Id: <20210623102749.25686-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210623102749.25686-1-alex.bennee@linaro.org>
References: <20210623102749.25686-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Luis Pires <luis.pires@eldorado.org.br>

Without a single top-level header in the .rst file, the index ended
up linking to all of the top-level headers separately. Now the index
links to the top-level header at the beginning of the document and
any inner headers are correctly linked as sub-items in the index.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210528123526.144065-1-luis.pires@eldorado.org.br>
---
 docs/devel/multi-thread-tcg.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/devel/multi-thread-tcg.rst b/docs/devel/multi-thread-tcg.rst
index 92a9eba13c..5b446ee08b 100644
--- a/docs/devel/multi-thread-tcg.rst
+++ b/docs/devel/multi-thread-tcg.rst
@@ -4,8 +4,9 @@
   This work is licensed under the terms of the GNU GPL, version 2 or
   later. See the COPYING file in the top-level directory.
 
-Introduction
-============
+==================
+Multi-threaded TCG
+==================
 
 This document outlines the design for multi-threaded TCG (a.k.a MTTCG)
 system-mode emulation. user-mode emulation has always mirrored the
-- 
2.20.1


