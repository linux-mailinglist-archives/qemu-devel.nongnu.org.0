Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC683BBAAC
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:00:19 +0200 (CEST)
Received: from localhost ([::1]:50822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0LOk-0003P6-Lu
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:00:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0LKZ-0003m8-Jx
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:55:59 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0LKW-0003uo-Fb
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 05:55:59 -0400
Received: by mail-wr1-x436.google.com with SMTP id t6so11418329wrm.9
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 02:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zySggBg96qNGp/shnSC7LwoZqTXVtS7UlGAR1urO8bg=;
 b=JXN2qjQwd/e5NOyCQLna4ukkHA5/LL9JCKVkQGAPdzoeRkDQENIJyQT6AF8NvjBT3Y
 iT6JHfPfzv4KXHWr5c6va0q9Wge7DbLIECbNmWSJDakCwJMj210urx9dhlvjQrinR3fP
 Wh9/f/rhdApXEiFJ/72xab8s/6bq8+9vf97q2lF+hAq7vVAHqPPCY4tht0vHDq3EXBYM
 1mTLEjzLX4sm027UoID7XZRRfrDp2aQeJJ+L5bUj+ZFU9z2Q2mM0F8qN5sl9cKFVZBV2
 9QZUNvRb6zhvlaUUQiI8kCVDo1K9eW7U8eoHBXSbaQOyVrM+PyZWfxDbofKZ2EdkReEm
 9llA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zySggBg96qNGp/shnSC7LwoZqTXVtS7UlGAR1urO8bg=;
 b=STWNuVgX9MbROp+4hHxb21iyVIzxUwYG7ah65HmbOMV7yUFKOBNFvlMAwIKQ699ztz
 jyxsYzrbd0C25A1PHXopmLKaw9N2zBH4+yA8gJojMQ+pLslhZhi0M6xDg28mL5GGNmIl
 SYk0wsUlrIxQCnUZMNEnre8s5aaAzHSCRv+kMyjYzQvCj+SeLDLfW3yiASxhb7GcKJhi
 J4+87gbOSMo4khuhk2e0JyoGvjOh7aXeBe5rcnVesrnzfzvYB3Nab3vkGQvlnQKrAOZk
 di4yP4Qy4Rm6KuHsVkmTnRJ6jTXUpq5OhPseYgNRW8l0aSd6Ajy96+db27yIyRciKAa0
 BfFg==
X-Gm-Message-State: AOAM530Af5/5BT6k9Ufi0SvxO0IqIUS0foQ+Jf5WhDVCG5vj9jX4EDcY
 Xp+InvAenQ6ucbNH5+Pir8j1wewJtPU3TRj9
X-Google-Smtp-Source: ABdhPJzRJ2LYKjHHzW8J3ucDMQS/VSWLp4hFPk/odDCGvQrTfr4oDNQjKOBfRbkhqXpzo4UhKXrKuw==
X-Received: by 2002:adf:a404:: with SMTP id d4mr14893728wra.156.1625478955194; 
 Mon, 05 Jul 2021 02:55:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i5sm12528727wrr.4.2021.07.05.02.55.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 02:55:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] docs: Add QEMU version information to HTML footer
Date: Mon,  5 Jul 2021 10:55:47 +0100
Message-Id: <20210705095547.15790-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210705095547.15790-1-peter.maydell@linaro.org>
References: <20210705095547.15790-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

Add a line to the HTML document footer mentioning the QEMU version.
The version information is already provided in very faint text below
the QEMU logo in the sidebar, but that is rather inconspicious, so
repeating it in the footer seems useful.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/_templates/footer.html | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/docs/_templates/footer.html b/docs/_templates/footer.html
index 4c15e17d2a8..977053b5415 100644
--- a/docs/_templates/footer.html
+++ b/docs/_templates/footer.html
@@ -4,6 +4,8 @@
 <!-- Empty para to force a blank line after "Built with Sphinx ..." -->
 <p></p>
 
+<p>This documentation is for QEMU version {{ version }}.</p>
+
 {% trans path=pathto('about/license') %}
 <p><a href="{{ path }}">QEMU and this manual are released under the
 GNU General Public License, version 2.</a></p>
-- 
2.20.1


