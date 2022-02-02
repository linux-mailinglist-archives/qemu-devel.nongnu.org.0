Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADC64A7946
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 21:16:24 +0100 (CET)
Received: from localhost ([::1]:37418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFM3C-0001c1-UB
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 15:16:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFL3j-0000qu-1A
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 14:12:52 -0500
Received: from [2a00:1450:4864:20::42a] (port=37694
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nFL3f-00076J-3c
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 14:12:48 -0500
Received: by mail-wr1-x42a.google.com with SMTP id w11so465997wra.4
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 11:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hna1km3F73J/mmsLNZIDcAFMMdfTW3cJTX+N4R94RcA=;
 b=w140aEkQNgN1Wkm1+unEGSiSt0c6lob0AaS2KDyWHQ2bqVm3WcdiCNvc6o7sHEQRA1
 ICA+2tx0rl/p6FY/LB1O4zTy1naDNvt+g5SXQ6q1+wkFfFIqznFnTlDOnjzZ2ydJucxr
 YKsiPpuP17hnQPts1R2LBEwnQIoNbtHJ8PvRKSD6zQeFnqEvF51yqWym/8ue1O/XRn+p
 0Csq7CQLO9r5S1J5yXWtyuOzqGHuIB3g31JVtnafCN2jnA6tNO8u7iRTpL/BUuxp9wvv
 +02vG6FKigi5L/1r8SZQn715nSTfm9AZ07CEPRCfMsqMBgsp8DsdGnWcfzOdcB1dYG8w
 UyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Hna1km3F73J/mmsLNZIDcAFMMdfTW3cJTX+N4R94RcA=;
 b=XJ1rmbwUIstqrKfQBMzVY/mfWBatXL07gIJF4tLESoc4jKreou8r2hyfQcPQK/POG5
 f7ggyf1RRL+HvNuWetlhuC5BLd4BY3IPWxZOZZ3b+SwgQchFQrxPs9G+Q0h2yXPai6nv
 Io20cT1o/QXhQmByecrw7RAmT6OBWnWBOA0kf6sF3LeNnsYqmxSDa3Y3ywz38vphMbBi
 TvWd3RSDGHnTTr56mF/A0EKyuz/NeN6oynthQvDkMxqW2jnVbwTMghVpK2xdi1pDMy/y
 11xWrk4j0XOeuNM6CQ8NPHaJZ7vWRoJZ1RBmn495rJc8Fww8/aaYsk94ctjD0shjfJDP
 0lxQ==
X-Gm-Message-State: AOAM533drhfko2lqH3nwteKnB22qKZrxewzj8ONEkSdICCXGt9htXZ/Y
 dsehbdpUtCBQQBfzXIfbZaoTNA==
X-Google-Smtp-Source: ABdhPJz/bhZWyOlGlgHjDD+R50GQ+AadED4F+G/ClDPMC5SPy9LwRLKFk1S9HEDHHSNpCLWYBLyzGQ==
X-Received: by 2002:a5d:47a1:: with SMTP id 1mr24850408wrb.87.1643829165355;
 Wed, 02 Feb 2022 11:12:45 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y6sm12065715wrl.46.2022.02.02.11.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Feb 2022 11:12:43 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C22851FFB7;
 Wed,  2 Feb 2022 19:12:42 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [RFC PATCH  0/4] improve coverage of vector backend
Date: Wed,  2 Feb 2022 19:12:38 +0000
Message-Id: <20220202191242.652607-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

While reviewing the TCG vector clean-ups I tried to improve the
range of instructions we tested. I couldn't get the existing hacky
sha1 test to vectorise nicely so I snarfed the sha512 algorithm from
CCAN. The sha512 test is good because it is all purely integer so we
should be able to use native code on the backend. The test also has
the nice property of validating behaviour.

I did toy with the idea of incorporating CCAN as a submodule because
there is quite a lot of nice stuff in there we could use for further
tests. However for now witness the glory of a cut and paste job.

What do you think?


Alex Bennée (4):
  tests/tcg: cleanup sha1 source code
  tests/tcg: build sha1-vector for SVE and compare
  tests/tcg: add sha512 test
  tests/tcg: add vectorised sha512 versions

 tests/tcg/multiarch/sha1.c        |  67 +-
 tests/tcg/multiarch/sha512.c      | 990 ++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  23 +
 tests/tcg/i386/Makefile.target    |   6 +
 tests/tcg/ppc64le/Makefile.target |   5 +-
 tests/tcg/s390x/Makefile.target   |   9 +
 tests/tcg/x86_64/Makefile.target  |   7 +
 7 files changed, 1056 insertions(+), 51 deletions(-)
 create mode 100644 tests/tcg/multiarch/sha512.c

-- 
2.30.2


