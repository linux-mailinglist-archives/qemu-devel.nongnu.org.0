Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D5552F277
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 20:17:55 +0200 (CEST)
Received: from localhost ([::1]:59128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns7CE-0002Xj-RS
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 14:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6wi-0004B2-Pv; Fri, 20 May 2022 14:01:52 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:35574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6wf-0004Ip-IA; Fri, 20 May 2022 14:01:52 -0400
Received: by mail-ed1-x536.google.com with SMTP id c10so11777311edr.2;
 Fri, 20 May 2022 11:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6rHOlZhcSAmUz+LYlTjXbwVj8AtLeaPWMpPlecCUMcU=;
 b=LQes4T2Q7dUXvDjqW8i9MNLsvvCQ+8+u1EnDaPEoFII0bgxb/6fsyijhfXNBBltmy2
 3oaPss/k9DIULOZ23bx6YKJpvGAloa1Q6L/iFZJMrQ/wWlmgKuijnPv8CRdPoMrO5f01
 G8QNNlxQZKTo9QD1+4bF7le6vuYlBvgmP+qsWFazy9uOkbBN9OHLlUNcNJcRpEez9iHY
 g1p3FqGvq8jSwnqYh+sqvAuGpjPeoGtl0mkB75CtB2f0zSdPSEcDOiNvbXSW1vIcdRnN
 dk1m39LUhs+njDzkF6rv+zcrdDS6df+tSiCKQjB7PqbrZMpiMeLSMFR4LyhfYPro136p
 ouTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6rHOlZhcSAmUz+LYlTjXbwVj8AtLeaPWMpPlecCUMcU=;
 b=lr/gW0IChGfouPuoZd2LlvbkDr8ENZtFcHrxkqMR4qmg+i4977PVa7K2XDLwEj3MbM
 FBqI+LSC0YKhqgXPFz/UAmPHckJXnBqSPyXiCfksnYSc76nB9Khy1Tr094BnCBMm/zP4
 3ixdD4RUXr781Dw1RCPmYOeb1BvpgKmCp9ut9SdgSrzI9h4EW/IoQX/6aIKlC6WHrIFQ
 zU8AibQO9/eAqrqHzNiLiMEuLRwk7U5MeuEIz1RyXjGfLcYKoTCcIiJi8L9MN0x55L6P
 +AIlrI9Pe0RweFXjZNY9uWaQqw437RVNchrEgPoFCEdOqKaQsWy/UAWWNc21pOPtpJ4h
 6cZA==
X-Gm-Message-State: AOAM531TIFnnRrZjzOU2/EMDyHdMOIV5zWznsKSwEM48bBcbIT0ILjoJ
 qFnPLYn75T1q+lK/NmLtkcLWAnYJOm8=
X-Google-Smtp-Source: ABdhPJypnHD85eZ7BXazWYqZQFaP0RQLw0JWBOoYkbtq0iRStoGLwOGnudbfIMHGVtvwqEli5XI8ww==
X-Received: by 2002:a05:6402:d0e:b0:413:3d99:f2d6 with SMTP id
 eb14-20020a0564020d0e00b004133d99f2d6mr12217907edb.189.1653069706358; 
 Fri, 20 May 2022 11:01:46 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-089-014-209-236.89.14.pool.telefonica.de. [89.14.209.236])
 by smtp.gmail.com with ESMTPSA id
 w5-20020aa7cb45000000b0042aa7e0f892sm4622029edt.15.2022.05.20.11.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 11:01:46 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 qemu-stable@nongnu.org
Subject: [PATCH v2 10/10] docs/devel: Fix link to developer mailing lists
Date: Fri, 20 May 2022 20:01:09 +0200
Message-Id: <20220520180109.8224-11-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220520180109.8224-1-shentey@gmail.com>
References: <20220520180109.8224-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ammends commit 9f73de8df0335c9387f4ee39e207a65a1615676f 'docs: rSTify
the "SubmitAPatch" wiki'.

Cc: qemu-stable@nongnu.org
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 docs/devel/submitting-a-patch.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/devel/submitting-a-patch.rst b/docs/devel/submitting-a-patch.rst
index e51259eb9c..21ed52bd82 100644
--- a/docs/devel/submitting-a-patch.rst
+++ b/docs/devel/submitting-a-patch.rst
@@ -18,9 +18,9 @@ one-shot fix, the bare minimum we ask is that:
    <http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/SubmittingPatches?id=f6f94e2ab1b33f0082ac22d71f66385a60d8157f#n297>`__
    policy.) ``git commit -s`` or ``git format-patch -s`` will add one.
 -  All contributions to QEMU must be **sent as patches** to the
-   qemu-devel `mailing list <MailingLists>`__. Patch contributions
-   should not be posted on the bug tracker, posted on forums, or
-   externally hosted and linked to. (We have other mailing lists too,
+   qemu-devel `mailing list <https://wiki.qemu.org/Contribute/MailingLists>`__.
+   Patch contributions should not be posted on the bug tracker, posted on
+   forums, or externally hosted and linked to. (We have other mailing lists too,
    but all patches must go to qemu-devel, possibly with a Cc: to another
    list.) ``git send-email`` (`step-by-step setup
    guide <https://git-send-email.io/>`__ and `hints and
-- 
2.36.1


