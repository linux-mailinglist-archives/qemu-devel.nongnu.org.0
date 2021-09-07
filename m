Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9B8403094
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 23:58:54 +0200 (CEST)
Received: from localhost ([::1]:39054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNj7F-0005mV-LU
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 17:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2J-0005bM-Ea
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:53:47 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:40900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2F-0000hN-6J
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:53:47 -0400
Received: by mail-io1-xd30.google.com with SMTP id z1so455040ioh.7
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 14:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KMQsbMY5NaOGHicHu9VbpgyM/1xluEbSzTVfLIIvix4=;
 b=b2q/NpmzpNr32WJGHUK+038vXDhl8qe3ccjx0s+cCfda092jT1oOUzrZpa9+1c9Eyk
 LAowrOLxFxY83nl92ck5mPF6muJmU5eqPs4s13VxdDicLuXiStHAoknTTE0heK7hsYin
 UIvwgTUOPidoE1Cg1z12ql8N2GxwgTQV50VoawH0jBgIiyPwxxrv6nDvX0hn64J4zFpP
 FvDtkmtM7V2a01CnVXi1eXCdsDwySQu+/FH2fYi+d88Me/AKIZppZJmlth05I4XTfFhq
 1y5z/aL/k/pOWILaRTHoSyxF9vqdBQPIFP89EGf4qEA2LGKLMzsrJ2zB73Lc5Jbasagg
 DMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KMQsbMY5NaOGHicHu9VbpgyM/1xluEbSzTVfLIIvix4=;
 b=NahktRv4UUVwws8xfBsfrI001epohU0cysDK0T1JnyjqyCIJXHWFScmKowm1HmcL38
 +cdq+GgQgxPyoeHr3aStmNFES5sn+L3vifb3cmIquWmWhqAEuhKYk95zvkZYzHYY/jil
 rOJ1DlcoDuieqOGkxCuTO6r1Y9f8uHVwgmOMo/VbYWbFs8R55E5UrqrRws605Xl9iWdk
 fnul/pw4yIRYSm8rBDJksNxextF7KIYKP7B9bbh7QRskNNVECsbVXq/VMWmmuIw7q1RQ
 HLUvjQnvBzyqH8XrLLtTEO7usY7JSBZ2CLckcygC5PmfE9gW/4r/OKHkWIpynSSonvqX
 8m7w==
X-Gm-Message-State: AOAM531L5ofm81QdSl1Eysmb1HrXa2NzADzYAQ49jlocnQEBWSS+4OzV
 dq0illfLkWt3+nSV2ypu8AFXRXbYXBWekASvN3A=
X-Google-Smtp-Source: ABdhPJxEQo/INhRnMZm8oSuR38iQWT4oCzV2ROgV1Lhw7kugxOo6R9k6gqQ/semeYOIpoPfClkSEHw==
X-Received: by 2002:a05:6638:5aa:: with SMTP id
 b10mr472812jar.76.1631051620932; 
 Tue, 07 Sep 2021 14:53:40 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id t17sm192477iln.24.2021.09.07.14.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:53:40 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 03/42] bsd-user: Add Stacey's copyright to main.c
Date: Tue,  7 Sep 2021 15:52:53 -0600
Message-Id: <20210907215332.30737-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

Add Stacey's updated copyright to main.c

Signed-off-by: Warner Losh <imp@bsdimp.com>
Signed-off-by: Stacey Son <sson@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 38185da111..39c4a0f33c 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -1,7 +1,8 @@
 /*
- *  qemu user main
+ *  qemu bsd user main
  *
  *  Copyright (c) 2003-2008 Fabrice Bellard
+ *  Copyright (c) 2013-14 Stacey Son
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
-- 
2.32.0


