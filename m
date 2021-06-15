Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F6F3A8988
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 21:32:32 +0200 (CEST)
Received: from localhost ([::1]:34902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltEnX-00085W-Su
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 15:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3f__IYAcKCq4jSbhifSUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--venture.bounces.google.com>)
 id 1ltEkE-00038e-Ej
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 15:29:06 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:35529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3f__IYAcKCq4jSbhifSUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--venture.bounces.google.com>)
 id 1ltEkC-0003NO-Te
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 15:29:06 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 u48-20020a25ab330000b029053982019c2dso21338848ybi.2
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 12:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=jvJ1zmax6UoNYSGCjdqDE/V2WMvx/8URVYLNZNLwIJs=;
 b=hKM/JzoCGUYVUzLCCQnZ87uVknQenRkounJ40+q3+zusq8ke85HLUqI+Sv+7bzLiI0
 K/GPBNrVTwPaOrsu6RilfZlniHz6IgJp2yUL1R/vKg8bLQ8Q7ekLrNpYdhm9w690RrQi
 WIue5iibvwPeEO+/esgxVjM+Yrhzjk24FNgfljl7gHW9MRXJYUATqHXpqEBdqStQqpus
 5UqV0UHsCJ9Afv1XDn2aTErvVaQNC8tAd0c0vPCww00F7nTZ2BWrBcR+JMtYhuDnHXLf
 yh0tFh/irSeXUr2vVDfiD7ajMBRcNQBI03FdKk5yvoXMh0xOorlq7H+ri9I8Y4vCaKYl
 gxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=jvJ1zmax6UoNYSGCjdqDE/V2WMvx/8URVYLNZNLwIJs=;
 b=Z3zREuVe8pNz/XnctytBk4qdN2/kyVeXBwllKl/Kclt6YDFbp2KuushealKkGvZwzO
 iJW3gTYiqeQ683zQttrqFuKMSFQ+J+npTPdq7s9GSZGMuFb/+q8zdI7aXmNQYh8uJ2HA
 kSGS+VbV5f664NFsGWvveI/79lXQeWfchms6Ez1fSBN/l3FgCw2L9JeaOWy9goPBgLL3
 sZIt4O+q9Tl5TCu2wYpRuEJCcA9MPgpHpiwsfhn8TSmFXJzS7zfH2gxOHiJj0KS7F/Rp
 ZDR2useDDGG0+w+kHt44YJbeFJrJr817rUeInr0gkzaGU7bgvJyhUtzq9cnJ9OcLoJjn
 w7IQ==
X-Gm-Message-State: AOAM532wCuvadwdHTeCKGZEJgY99chc72tyU8QuxQ8TLqaVseEhkW57p
 S+3QdXE2mXtPo8Gxj37iFRReh4pMG1Zi
X-Google-Smtp-Source: ABdhPJzvqA/15Ix6R0rKF0JcHkmQcoFSF20jFaK/qBvSzekHpv8P/xDeQNS6wQCpW/u6ISeVqpHPPMXA3vfg
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:abe8:110a:b827:ef39])
 (user=venture job=sendgmr) by 2002:a25:b199:: with SMTP id
 h25mr1162383ybj.58.1623785343325; Tue, 15 Jun 2021 12:29:03 -0700 (PDT)
Date: Tue, 15 Jun 2021 12:28:48 -0700
In-Reply-To: <20210615192848.1065297-1-venture@google.com>
Message-Id: <20210615192848.1065297-3-venture@google.com>
Mime-Version: 1.0
References: <20210615192848.1065297-1-venture@google.com>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
Subject: [PATCH 2/2] docs/system/arm: Add quanta-gbs-bmc reference
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, peter.maydell@linaro.org, 
 clg@kaod.org, andrew@aj.id.au, joel@jms.id.au
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3f__IYAcKCq4jSbhifSUccUZS.QcaeSai-RSjSZbcbUbi.cfU@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

Add line item reference to quanta-gbs-bmc machine.

Signed-off-by: Patrick Venture <venture@google.com>
---
 docs/system/arm/nuvoton.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index ca011bd479..197d149f66 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -1,4 +1,4 @@
-Nuvoton iBMC boards (``npcm750-evb``, ``quanta-gsj``)
+Nuvoton iBMC boards (``*-bmc``, ``npcm750-evb``, ``quanta-gsj``)
 =====================================================
 
 The `Nuvoton iBMC`_ chips (NPCM7xx) are a family of ARM-based SoCs that are
@@ -18,6 +18,7 @@ segment. The following machines are based on this chip :
 The NPCM730 SoC has two Cortex-A9 cores and is targeted for Data Center and
 Hyperscale applications. The following machines are based on this chip :
 
+- ``quanta-gbs-bmc``    Quanta GBS server BMC
 - ``quanta-gsj``        Quanta GSJ server BMC
 
 There are also two more SoCs, NPCM710 and NPCM705, which are single-core
-- 
2.32.0.272.g935e593368-goog


