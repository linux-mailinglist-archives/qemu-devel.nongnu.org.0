Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9DE1F99FD
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 16:20:52 +0200 (CEST)
Received: from localhost ([::1]:48348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkpyl-0003K6-4U
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 10:20:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jkpxR-0002O2-2M
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 10:19:29 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:35040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jkpxO-0004Vu-Jn
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 10:19:28 -0400
Received: by mail-wm1-x32c.google.com with SMTP id q25so15035030wmj.0
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 07:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UZ5ixQfd02IXGeoaRewvwjQWRmSklDNiNTrtxVN4dvQ=;
 b=dmfNXup6G5L7d7eY+CyQfRyHQKJfExuXTwbBWyKX2hE7Qgc1sO/1dcolTX4tD+4JMx
 S6lmgJjMkMCZ6AEdvN8URkv9HFdmRAvy6bgVAOF3OlICV7o9F/aEJLFLOqvZpr68YGWE
 TxqwNaxyGdOhr00XiYcG6T+s9r0JtJuzdQ/BvH0EEtbAN/aqwDyC1AlC9LuIwIAcRwO2
 RZOrOqsrGvFCteAylkJMKWw4augyqsfDqBHZGTNhGW+HIIX+l8fdomJL16b2RG0OZSjC
 CLh2XnHdBHfRfbIh3ZxkYbps/U+OWmedtkShLiQWMbyKb1owAnSTKO2kOfDDvMXCXIb0
 oIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UZ5ixQfd02IXGeoaRewvwjQWRmSklDNiNTrtxVN4dvQ=;
 b=C/qW3Klh3F6aKRGnfN0/+RWqGcdSgitSIsp7Q1/OjTYrd1SuvI+yTGOUaP3bHGBrHz
 oV9gulqTNqefmd6Szq1+mwMfnnPntLDrShqnDsO7A8MHxmCCgrj4bGSrU+odSb79RBe/
 lwiM4kmRzSJcQHLQyjlJBAaCCFmz0iYH89B+UpDq1S/gNbe5M7D6MbWIMlRu6t9GAJH5
 kPit7nSaCn5TjofGTFfOmVq9eZxF3BdGsjVojMKfndr1ft3JBeYK+T/V0BM0EcElX4gq
 caC8l+LYoyTNoAKKPKSAe+LERTJgEa2cT8gzGuwqL3hvA3frgMOFhfrYp4HcAIybJ1JG
 MWlA==
X-Gm-Message-State: AOAM533bKhRaND+mYwNcY/Co/KwusROqQu4Qxtsu+6AD/VarSnRhdcZ1
 0csYevvXfia9G5aVj14UXdbMiA==
X-Google-Smtp-Source: ABdhPJyiG14WMknLwiX9herDLQf8cPdiFi8Dc5R2YwOlHWaqe5IP3sOEO+ChfMinBwcztqlPsWSOTg==
X-Received: by 2002:a1c:7416:: with SMTP id p22mr13485528wmc.95.1592230764769; 
 Mon, 15 Jun 2020 07:19:24 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b18sm24036729wrn.88.2020.06.15.07.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 07:19:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C816F1FF7E;
 Mon, 15 Jun 2020 15:19:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 0/2] check-tcg fixes for --enable-plugins
Date: Mon, 15 Jun 2020 15:19:20 +0100
Message-Id: <20200615141922.18829-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 richard.henderson@linaro.org, f4bug@amsat.org, cota@braap.org,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Two minor fixes to deal with test failures with --enable-plugins
builds. I'll include them in tomorrows PR. Please review.

Alex Bennée (2):
  tests/tcg: build plugin list from contents of src directory
  tests/tcg: ensure -cpu max also used for plugin run

 tests/tcg/Makefile.target         | 11 ++++++-----
 tests/tcg/aarch64/Makefile.target |  5 +++--
 tests/tcg/arm/Makefile.target     |  2 +-
 tests/tcg/i386/Makefile.target    |  1 +
 4 files changed, 11 insertions(+), 8 deletions(-)

-- 
2.20.1


