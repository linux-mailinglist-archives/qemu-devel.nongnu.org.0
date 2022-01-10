Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4160489EB4
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 18:55:41 +0100 (CET)
Received: from localhost ([::1]:53046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6ytQ-0002Ai-Lq
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 12:55:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n6yp9-0007JF-E0
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 12:51:18 -0500
Received: from [2a00:1450:4864:20::52c] (port=33365
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n6yp7-00066V-GR
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 12:51:15 -0500
Received: by mail-ed1-x52c.google.com with SMTP id b13so3407614edn.0
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 09:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P0EjTBLxg+IQMbBIqCClCApA0pdCty/zr/RkYisMT+4=;
 b=AtXl2beTnMBylekHv6y+53XOP7Vjh9MRBk3qXjtDvmNAiUXTh5Rmvo87yAE3qeHMqi
 blqvJWHtRr/28NUlEAroXgdSSxa/bk2DqadypKWnpwg5w1a9sB8rEDIvfXwXeVH3P+2Q
 9WDg9VAngHB5aKywL83qsyvABRjywv1CIeZB27CGK64Ydbk3k1A9oItSbnUZyH39xf34
 hk1vcEYP1jw3ypXUPLBQl4jB7lLuCWXesuhQ/N++ihFTPIGg71+R3gjmjKB5c8b408UY
 Dfg/v2u8izpVYsV6jwFnzKWXgQcbL+RqOefLxhZXSoXZ6HXTUdjj1V8RCr29+/8EQzAT
 yTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P0EjTBLxg+IQMbBIqCClCApA0pdCty/zr/RkYisMT+4=;
 b=a+h91aW6eSivTGGP21WN/OidkEYFKuN+MPf5iO+HjojwT2pX0O9/HUzIqeu1EutfQS
 O+55m6YE/jKbbo+LOn1m3h/k74tNb176/+F+Vs+UO+Jtnw0/GUd+ehYWPRpEInEjKDZa
 U55DhPA83viVlvgYPKX1xifxa7NUFIFDm9D+QQ6HRL8ofjnKdOrLnCR1UIzPakV3YU5k
 1vs7nQy5Xjjgzk9p90AIKh96DQoW0VX2/KcR77aRiMA2kcaUEAuuvz+uC/XKWCPb9fqE
 3qQiEsPOyetrhswhpd/CocGDoVCLYUb2tV4maLR9D7Zj2ZYiL397jZNVVLjWRiMv7n8w
 njJA==
X-Gm-Message-State: AOAM530xQ1LbCf+EOeogHlLs6AbEuIxxYNZHoQiz0+x5lOKzJpRb4O6w
 u+URaf5q25eqLXjg/AeqYtJMViMu7ITEpg==
X-Google-Smtp-Source: ABdhPJzLMYPmStamrcFJuNwVwm40Fb7e89kXHMZp2GAsS5GqxA2mKOF5VWjpfkCylGF4AnNSZuQeZw==
X-Received: by 2002:a17:906:9742:: with SMTP id
 o2mr631067ejy.741.1641837071732; 
 Mon, 10 Jan 2022 09:51:11 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 21sm2655615ejz.24.2022.01.10.09.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 09:51:08 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C80101FFBE;
 Mon, 10 Jan 2022 17:51:04 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH  6/6] docs/devel: add some clarifying text for aliases
Date: Mon, 10 Jan 2022 17:51:04 +0000
Message-Id: <20220110175104.2908956-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220110175104.2908956-1-alex.bennee@linaro.org>
References: <20220110175104.2908956-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We do mention the limitation of single parenthood for
memory_region_add_subregion but lets also make it clear how aliases
help solve that conundrum.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/memory.rst | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/docs/devel/memory.rst b/docs/devel/memory.rst
index 5dc8a12682..69c5e3f914 100644
--- a/docs/devel/memory.rst
+++ b/docs/devel/memory.rst
@@ -67,11 +67,15 @@ MemoryRegion):
 
   You initialize a pure container with memory_region_init().
 
-- alias: a subsection of another region.  Aliases allow a region to be
-  split apart into discontiguous regions.  Examples of uses are memory banks
-  used when the guest address space is smaller than the amount of RAM
-  addressed, or a memory controller that splits main memory to expose a "PCI
-  hole".  Aliases may point to any type of region, including other aliases,
+- alias: a subsection of another region. Aliases allow a region to be
+  split apart into discontiguous regions. Examples of uses are memory
+  banks used when the guest address space is smaller than the amount
+  of RAM addressed, or a memory controller that splits main memory to
+  expose a "PCI hole". You can also create aliases to avoid trying to
+  add the original region to multiple parents via
+  `memory_region_add_subregion`.
+
+  Aliases may point to any type of region, including other aliases,
   but an alias may not point back to itself, directly or indirectly.
   You initialize these with memory_region_init_alias().
 
-- 
2.30.2


