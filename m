Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A9051C545
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 18:42:58 +0200 (CEST)
Received: from localhost ([::1]:41292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmeZ6-0005Bn-UV
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 12:42:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nmeBV-00028E-LP; Thu, 05 May 2022 12:18:38 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:34412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nmeBT-0005lW-Vl; Thu, 05 May 2022 12:18:33 -0400
Received: by mail-ej1-x633.google.com with SMTP id g6so9714365ejw.1;
 Thu, 05 May 2022 09:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G1Ct2U+bQ3kGVUW9fsOA/lzpDAuaaKB4V0L6OSmysTo=;
 b=H1N+6wy7JPNGBxie9cnUCOtEstg0WknQv82ajmxWT+PTlRdtqB5ckykmKU9cEGs/sh
 /fWpAIvfPcXrp9g8Ftzw3oZhaRbh2UIbORe57nhGco1YNiLG2D7OXBIZOE9cTuzS0Le4
 396Dj0zVu3AlSf+SBFyoAytDHYKcEYigl9Y/kQdxcNXYdG2UEj0l1tHfNelffKkRaM7L
 ZHzzmBXtKOltIyaruir1EOIkABk1aFNQsuYoCxCrSeD+2zvSpmmyta1g42sgYjiX5d63
 FrKYG3J0e9NpwW7Op3HiBbKJ0UXrkIrYjPKW6OmEGltnbY/gvl70V0KzAQBvuzFEUwhQ
 gUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G1Ct2U+bQ3kGVUW9fsOA/lzpDAuaaKB4V0L6OSmysTo=;
 b=Xm/a3Zq/5PhUbjpOl+hZvNTzvDj7RG7ruBfku9bRka5X8eAf8eVd44NXekQKm/YMS3
 NoSdW7zY3Q7UKbx/UNL/Q6yTE7q22xFidUuJy/ZxFTsOUyV6UgUNML5BI8bw76cmYb8C
 sz96b1y7txA702ljA/ved2gC+7tIrOOBAXXuq+hbrCGcZraO6lXQGX5BcxG/AZdATTzn
 QNUgQlkS0tJkAMq/yd2ROGHwiLHiH8jFzv1pt5nMC13TKt1r5Yxk0JewGlBbINshsobB
 JlYe04NzZghW4MSIWu1ZkkuIK4NzY3yhWSrzHupRceuBb2HaDVVuNFqxz5Tzw+bu/jcv
 SnYQ==
X-Gm-Message-State: AOAM533lAcFb6kqTYRK1REF3MWRDP0fYcdC5S357NQz0vl7pV1EYoHBL
 Avp9cCX8l7lNA6LGJhaTlHJ0SKgu+ko=
X-Google-Smtp-Source: ABdhPJx8ON40EToetEO9Ws02IJUvTEPAtH10gYn/Qqm55eTLv/YNfSfsppNJihbXL2WR8tnPLuchpA==
X-Received: by 2002:a17:906:2991:b0:6cf:6b24:e92f with SMTP id
 x17-20020a170906299100b006cf6b24e92fmr27141434eje.748.1651767509913; 
 Thu, 05 May 2022 09:18:29 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-054-123-159.78.54.pool.telefonica.de. [78.54.123.159])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a17090685c600b006f3ef214dcfsm868542ejy.53.2022.05.05.09.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 09:18:29 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 qemu-stable@nongnu.org
Subject: [PATCH 11/11] docs/devel: Fix link to developer mailing lists
Date: Thu,  5 May 2022 18:18:05 +0200
Message-Id: <20220505161805.11116-12-shentey@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220505161805.11116-1-shentey@gmail.com>
References: <20220505161805.11116-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
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
2.36.0


