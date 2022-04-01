Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B77A4EF22C
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 17:02:56 +0200 (CEST)
Received: from localhost ([::1]:42972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naInf-0006g4-Df
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 11:02:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naIlz-0003ml-G9
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:01:11 -0400
Received: from [2a00:1450:4864:20::333] (port=53070
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naIlr-0005h1-1q
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:01:11 -0400
Received: by mail-wm1-x333.google.com with SMTP id r7so1862260wmq.2
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 08:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B7SjmzEeN4YYrnx9qZfjy/wwiYpvFyFbEfn/gpaHtd4=;
 b=hk/aeVVRMtSfy0Vh5ctajqM4erzuu1bzYCzw4wZU/9Jn84XjsMEZbLbXi47nhyRkHQ
 f2QdWAMs9D/QaCdF/+5N9Ckxt/CZZyzMgJr2JxT4ArZ/kZg8oBt8egp1LVjsdGO8p/h6
 zfzH61tLKPCcKJSZ0GU0ZMIutdHIWj/e2kaIcnYXpKF8Nwj2O7AV+D3ipCTjpScRjnLC
 O7GniDxM76hT9/aBLwiZsmPAQ1qNNvsariSkRTn18uFbV4dz567EdSD6v6lG1BjBMZwD
 bp/2WbimMpRSAggdTG5bSm0Rh/2927BW5bPrRk6UFuVQzmuG6xyvriNErfwUiPXafBib
 liaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B7SjmzEeN4YYrnx9qZfjy/wwiYpvFyFbEfn/gpaHtd4=;
 b=Um4S3WY68av5eVv5YPsiwYMlLs6EwE7+ecTrMjYah49Zc5I2Cv6nXBrXqPhtg8656J
 T0BpY3lkqM/0SkU8nPdzoxkUe0YdPFQEnRQzaZGHo4FFyZusnbpOSuMXXaNyWEbtj8WD
 rEydivJnpbSDDlaxWHus8GWfvM1KPcYaauJhzRw0S9Gc3jGBwpirkOAqUdbZbkSq6EBt
 nGBBJoNzDp/vrWsbdKDQ6B3ZCVSp/Z4MECZ4tg0Pkay0/y1BzUn93/erEmMggG65+Ow0
 D9BAEIwvprKRGXNNJW9bisJ+kFKChys0XqxUJOeWKRoHFHTkUwJZgEet0uXSVX8rMuZU
 h/Aw==
X-Gm-Message-State: AOAM532929luZfgoJ+KDx5WytQvyWiehJxrJtmA0cBqK+OVMPF7cUF8p
 YWhEwkmxvISrQz5DboNqpU3sinHWj4KHJw==
X-Google-Smtp-Source: ABdhPJxpInfr71ghktTO1xp13mnosgdTCCaBCU2Fik4n0jBCBsZwnKi0kAK1s205OHZGT/QtpPksUw==
X-Received: by 2002:a7b:c350:0:b0:38c:6d3c:6c8 with SMTP id
 l16-20020a7bc350000000b0038c6d3c06c8mr8952292wmj.45.1648825261484; 
 Fri, 01 Apr 2022 08:01:01 -0700 (PDT)
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 6-20020a05600c020600b0038cbb21fb00sm2084023wmi.39.2022.04.01.08.01.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 08:01:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 0/6] target-arm queue
Date: Fri,  1 Apr 2022 16:00:49 +0100
Message-Id: <20220401150055.421608-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Some small arm bug fixes for rc3.

-- PMM

The following changes since commit 9b617b1bb4056e60b39be4c33be20c10928a6a5c:

  Merge tag 'trivial-branch-for-7.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2022-04-01 10:23:27 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20220401

for you to fetch changes up to a5b1e1ab662aa6dc42d5a913080fccbb8bf82e9b:

  target/arm: Don't use DISAS_NORETURN in STXP !HAVE_CMPXCHG128 codegen (2022-04-01 15:35:49 +0100)

----------------------------------------------------------------
target-arm queue:
 * target/arm: Fix some bugs in secure EL2 handling
 * target/arm: Fix assert when !HAVE_CMPXCHG128
 * MAINTAINERS: change Fred Konrad's email address

----------------------------------------------------------------
Frederic Konrad (1):
      MAINTAINERS: change Fred Konrad's email address

Idan Horowitz (4):
      target/arm: Fix MTE access checks for disabled SEL2
      target/arm: Check VSTCR.SW when assigning the stage 2 output PA space
      target/arm: Take VSTCR.SW, VTCR.NSW into account in final stage 2 walk
      target/arm: Determine final stage 2 output PA space based on original IPA

Peter Maydell (1):
      target/arm: Don't use DISAS_NORETURN in STXP !HAVE_CMPXCHG128 codegen

 target/arm/internals.h     |  2 +-
 target/arm/helper.c        | 18 +++++++++++++++---
 target/arm/translate-a64.c |  7 ++++++-
 .mailmap                   |  3 ++-
 MAINTAINERS                |  2 +-
 5 files changed, 25 insertions(+), 7 deletions(-)

