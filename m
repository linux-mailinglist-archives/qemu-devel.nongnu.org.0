Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2406D458FB2
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 14:48:45 +0100 (CET)
Received: from localhost ([::1]:56938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp9ga-0001SJ-9Z
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 08:48:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mp9bo-0005ui-SQ
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:43:48 -0500
Received: from [2a00:1450:4864:20::42f] (port=46040
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mp9bm-0002y8-Re
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 08:43:48 -0500
Received: by mail-wr1-x42f.google.com with SMTP id w29so32770373wra.12
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 05:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sr81fW7ERw6VtGKTPeDDpVFRUwFuSpORVJtwsrPJMm4=;
 b=wLWWYDHwMfLC45aIUqjAYVEArM7qcwZffPy3had9mkcauz+45+7DiSMz0GvN3Tlifv
 pDsRxrckZ413qbBjc8JBlJBLUp246hGnBctg+EERgRF7N1bBDti1Tb2qHiw1/gG+3dFd
 lsREWbU3JxJFMdal6yap2iANrQeCzDibRgB5sbC0lCOxBu7Nrn9RIhIhxPqxjCLJfJU8
 ADgxop3IPrUx3Q40j/yxkkYgaBQhDvc4GJxEoHMP7Ppj7qjlk8HNxp7cwwRJVUXY2I6C
 7GKp1lEbdo2XhEWRqykmEpJ8//oyuPcyC7FXfJHj0wMxwDpherKUwl61rsSgFJrkjGjW
 EyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sr81fW7ERw6VtGKTPeDDpVFRUwFuSpORVJtwsrPJMm4=;
 b=kuzBBRsWDLWy2xPD8Xzbp9i371o5hoYtJRlqqqXpYO4Ezl70ipbigyyExMLiIdJgcR
 TzuyS1IAVQ8PuTh4Qu/QojADZoGg3tiyxH664h3h4dreQlyddrUqbXw4Il94stDWMWEB
 GoB9L+nfeMa5HJ+JXMyb5zuQgj00Kx3LXQpY8ntRmbHIJ50Xh8TJSgD7PGJKn8wGwHtE
 E1DoBnGeiiFU97Zj7D8DLAZo4tHamQSIN5bfSl3Y+DZWTSPehVeBsBa9h9wqz4T8LQ5u
 tBGAJXAa2BlUSDNnk35MgrKvw+/K/XoFiK4878wsm+cUtVO81NugHu5xaTCZcTMGOLxb
 K3sA==
X-Gm-Message-State: AOAM531DD8cczuriYqZSPe6SBL+2z8kSZwi1s8ZdgdsCg5YaAZC3F2O3
 C6X+q6H5hC6pbZaufTnq5RfMbHNdUpV84Q==
X-Google-Smtp-Source: ABdhPJwW3t584Lri79F+gBLwhEXsCIjJbZtBx9N/juHa+ehxqmw/ea6RqjHDsc5d75a0uMpCBpRYWg==
X-Received: by 2002:a5d:6c63:: with SMTP id r3mr37027502wrz.213.1637588624519; 
 Mon, 22 Nov 2021 05:43:44 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id t11sm8931474wrz.97.2021.11.22.05.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 05:43:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] target-arm queue
Date: Mon, 22 Nov 2021 13:43:41 +0000
Message-Id: <20211122134342.660953-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Just one patch for rc2, a revert.

-- PMM

The following changes since commit 49aaac3548bc5a4632a14de939d5312b28dc1ba2:

  Merge tag 'linux-user-for-6.2-pull-request' of git://github.com/vivier/qemu into staging (2021-11-22 10:33:13 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20211122

for you to fetch changes up to 4825eaae4fdd56fba0febdfbdd7bf9684ae3ee0d:

  Revert "arm: tcg: Adhere to SMCCC 1.3 section 5.2" (2021-11-22 13:41:48 +0000)

----------------------------------------------------------------
target-arm queue:
 * revert SMCCC/PSCI change, as it regresses some usecases for some boards

----------------------------------------------------------------
Peter Maydell (1):
      Revert "arm: tcg: Adhere to SMCCC 1.3 section 5.2"

 target/arm/psci.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

